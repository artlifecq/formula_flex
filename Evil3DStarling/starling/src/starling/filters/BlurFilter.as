// =================================================================================================
//
//	Starling Framework
//	Copyright Gamua GmbH. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.filters
{
    import starling.rendering.FilterEffect;
    import starling.rendering.Painter;
    import starling.textures.IStarlingTexture;

    /** The BlurFilter applies a Gaussian blur to an object. The strength of the blur can be
     *  set for x- and y-axis separately. */
    public class BlurFilter extends FragmentFilter
    {
        private var _blurX:Number;
        private var _blurY:Number;

        /** Create a new BlurFilter. For each blur direction, the number of required passes is
         *  <code>Math.ceil(blur)</code>.
         *
         *  <ul><li>blur = 0.5: 1 pass</li>
         *      <li>blur = 1.0: 1 pass</li>
         *      <li>blur = 1.5: 2 passes</li>
         *      <li>blur = 2.0: 2 passes</li>
         *      <li>etc.</li>
         *  </ul>
         */
		
		private var horizontalEffect:BlurEffect;
		private var verticalEffect:BlurEffect;
		
        public function BlurFilter(blurX:Number=1.0, blurY:Number=1.0, resolution:Number=1.0)
        {
            _blurX = blurX;
            _blurY = blurY;
            this.resolution = resolution;
			
			horizontalEffect = this.effect as BlurEffect;
			verticalEffect = createEffect() as BlurEffect;
			
			horizontalEffect.direction = BlurEffect.HORIZONTAL;
			verticalEffect.direction = BlurEffect.VERTICAL;
        }
		
		override public function dispose():void
		{
			if(horizontalEffect)
				horizontalEffect.dispose();
			if(verticalEffect)
				verticalEffect.dispose();
			horizontalEffect = verticalEffect = null;
			_effect = null;
		}

        /** @private */
        override public function process(painter:Painter, helper:FilterHelper,
                                         input0:IStarlingTexture = null, input1:IStarlingTexture = null,
                                         input2:IStarlingTexture = null, input3:IStarlingTexture = null):IStarlingTexture
        {
			_effect = horizontalEffect;
            if (_blurX == 0 && _blurY == 0)
            {
				horizontalEffect.strength = 0;
                return super.process(painter, helper, input0);
            }

            var blurX:Number = Math.abs(_blurX);
            var blurY:Number = Math.abs(_blurY);
            var outTexture:IStarlingTexture = input0;
            var inTexture:IStarlingTexture;

			horizontalEffect.direction = BlurEffect.HORIZONTAL;

            while (blurX > 0)
            {
				horizontalEffect.strength = Math.min(1.0, blurX);

                blurX -= horizontalEffect.strength;
                inTexture = outTexture;
                outTexture = super.process(painter, helper, inTexture);

                if (inTexture != input0) helper.putTexture(inTexture);
            }

			_effect = verticalEffect;

            while (blurY > 0)
            {
				verticalEffect.strength = Math.min(1.0, blurY);

                blurY -= verticalEffect.strength;
                inTexture = outTexture;
                outTexture = super.process(painter, helper, inTexture);

                if (inTexture != input0) helper.putTexture(inTexture);
            }

            return outTexture;
        }

        /** @private */
        override protected function createEffect():FilterEffect
        {
            return new BlurEffect();
        }

        /** @private */
        override public function set resolution(value:Number):void
        {
            super.resolution = value;
            updatePadding();
        }

        /** @private */
        override public function get numPasses():int
        {
            return (Math.ceil(_blurX) + Math.ceil(_blurY)) || 1;
        }

        private function updatePadding():void
        {
            var paddingX:Number = (_blurX ? Math.ceil(Math.abs(_blurX)) + 3 : 1) / resolution;
            var paddingY:Number = (_blurY ? Math.ceil(Math.abs(_blurY)) + 3 : 1) / resolution;

            padding.setTo(paddingX, paddingX, paddingY, paddingY);
        }

        /** The blur factor in x-direction.
         *  The number of required passes will be <code>Math.ceil(value)</code>. */
        public function get blurX():Number { return _blurX; }
        public function set blurX(value:Number):void
        {
            _blurX = value;
            updatePadding();
        }

        /** The blur factor in y-direction.
         *  The number of required passes will be <code>Math.ceil(value)</code>. */
        public function get blurY():Number { return _blurY; }
        public function set blurY(value:Number):void
        {
            _blurY = value;
            updatePadding();
        }
    }
}

import flash.display3D.Context3DProgramType;

import away3d.arcane;
import away3d.core.managers.Stage3DProxy;

import starling.rendering.FilterEffect;
import starling.rendering.ProgramNameID;
import starling.utils.MathUtil;

use namespace arcane;

class BlurEffect extends FilterEffect
{
    public static const HORIZONTAL:String = "horizontal";
    public static const VERTICAL:String = "vertical";

    private static const MAX_SIGMA:Number = 2.0;

    private var _strength:Number;
    private var _direction:String;

    private var _offsets:Vector.<Number> = new <Number>[0, 0, 0, 0];
    private var _weights:Vector.<Number> = new <Number>[0, 0, 0, 0];

    // helpers
    private var sTmpWeights:Vector.<Number> = new Vector.<Number>(5, true);

    /** Creates a new BlurEffect.
     *
     *  @param direction     horizontal or vertical
     *  @param strength      range 0-1
     */
    public function BlurEffect(direction:String="horizontal", strength:Number=1):void
    {
        this.strength  = strength;
        this.direction = direction;
    }

	override arcane function getVertexCode():String
	{
		if (_strength == 0)
			return super.getVertexCode();
		
		var vertexCode:String = [
			"m44 op, va0, vc0     ", // 4x4 matrix transform to output space
			"mov v0, va1          ", // pos:  0 |
			"sub v1, va1, vc4.zwxx", // pos: -2 |
			"sub v2, va1, vc4.xyxx", // pos: -1 | --> kernel positions
			"add v3, va1, vc4.xyxx", // pos: +1 |     (only 1st two values are relevant)
			"add v4, va1, vc4.zwxx"  // pos: +2 |
		].join("\n");
		
		return vertexCode;
	}
	
	override arcane function getFragmentCode():String
	{
		if (_strength == 0)
			return super.getFragmentCode();
		
		// v0-v4 - kernel position
		// fs0   - input texture
		// fc0   - weight data
		// ft0-4 - pixel color from texture
		// ft5   - output color
		var fragmentCode:String = [
			tex("ft0", "v0", 0, texture),    // read center pixel
			"mul ft5, ft0, fc0.xxxx       ", // multiply with center weight
			
			tex("ft1", "v1", 0, texture),    // read pixel -2
			"mul ft1, ft1, fc0.zzzz       ", // multiply with weight
			"add ft5, ft5, ft1            ", // add to output color
			
			tex("ft2", "v2", 0, texture),    // read pixel -1
			"mul ft2, ft2, fc0.yyyy       ", // multiply with weight
			"add ft5, ft5, ft2            ", // add to output color
			
			tex("ft3", "v3", 0, texture),    // read pixel +1
			"mul ft3, ft3, fc0.yyyy       ", // multiply with weight
			"add ft5, ft5, ft3            ", // add to output color
			
			tex("ft4", "v4", 0, texture),    // read pixel +2
			"mul ft4, ft4, fc0.zzzz       ", // multiply with weight
			"add  oc, ft5, ft4            "  // add to output color
		].join("\n");
		
		return fragmentCode;
	}
	
    override protected function beforeDraw(stage3DProxy:Stage3DProxy):void
    {
        super.beforeDraw(stage3DProxy);

        if (_strength)
        {
            updateParameters();

			stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.VERTEX,   4, _offsets);
			stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, _weights);
        }
    }

    private function updateParameters():void
    {
        // algorithm described here:
        // http://rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/
        //
        // To run in constrained mode, we can only make 5 texture look-ups in the fragment
        // shader. By making use of linear texture sampling, we can produce similar output
        // to what would be 9 look-ups.

        var sigma:Number;
        var pixelSize:Number;

        if (_direction == HORIZONTAL)
        {
            sigma = _strength * MAX_SIGMA;
            pixelSize = 1.0 / texture.root.width;
        }
        else
        {
            sigma = _strength * MAX_SIGMA;
            pixelSize = 1.0 / texture.root.height;
        }

        const twoSigmaSq:Number = 2 * sigma * sigma;
        const multiplier:Number = 1.0 / Math.sqrt(twoSigmaSq * Math.PI);

        // get weights on the exact pixels (sTmpWeights) and calculate sums (_weights)

        for (var i:int=0; i<5; ++i)
            sTmpWeights[i] = multiplier * Math.exp(-i*i / twoSigmaSq);

        _weights[0] = sTmpWeights[0];
        _weights[1] = sTmpWeights[1] + sTmpWeights[2];
        _weights[2] = sTmpWeights[3] + sTmpWeights[4];

        // normalize weights so that sum equals "1.0"

        var weightSum:Number = _weights[0] + 2*_weights[1] + 2*_weights[2];
        var invWeightSum:Number = 1.0 / weightSum;

        _weights[0] *= invWeightSum;
        _weights[1] *= invWeightSum;
        _weights[2] *= invWeightSum;

        // calculate intermediate offsets

        var offset1:Number = (  pixelSize * sTmpWeights[1] + 2*pixelSize * sTmpWeights[2]) / _weights[1];
        var offset2:Number = (3*pixelSize * sTmpWeights[3] + 4*pixelSize * sTmpWeights[4]) / _weights[2];

        // depending on pass, we move in x- or y-direction

        if (_direction == HORIZONTAL)
        {
            _offsets[0] = offset1;
            _offsets[1] = 0;
            _offsets[2] = offset2;
            _offsets[3] = 0;
        }
        else
        {
            _offsets[0] = 0;
            _offsets[1] = offset1;
            _offsets[2] = 0;
            _offsets[3] = offset2;
        }
    }

    public function get direction():String { return _direction; }
    public function set direction(value:String):void { _direction = value; }

    public function get strength():Number { return _strength; }
    public function set strength(value:Number):void
    {
        _strength = MathUtil.clamp(value, 0, 1);
    }
	
	override protected function get programVariantName():uint
	{
		return super.programVariantName | (_strength ? 1 << 4 : 0);
	}
	
	override protected function get programBaseName():uint 
	{ 
		return ProgramNameID.BLUR_EFFECT;
	}
}