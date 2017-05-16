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
    import flash.geom.Point;
    
    import starling.rendering.FilterEffect;
    import starling.rendering.Painter;
    import starling.textures.IStarlingTexture;
    import starling.textures.TextureHelper;

    /** The CompositeFilter class allows to combine several layers of textures into one texture.
     *  It's mainly used as a building block for more complex filters; e.g. the DropShadowFilter
     *  uses this class to draw the shadow (the result of a BlurFilter) behind an object.
     */
    public class CompositeFilter extends FragmentFilter
    {
        /** Creates a new instance. */
        public function CompositeFilter()
        { }

        /** Combines up to four input textures into one new texture,
         *  adhering to the properties of each layer. */
        override public function process(painter:Painter, helper:FilterHelper,
                                         input0:IStarlingTexture = null, input1:IStarlingTexture = null,
                                         input2:IStarlingTexture = null, input3:IStarlingTexture = null):IStarlingTexture
        {
            compositeEffect.texture = input0;
            compositeEffect.getLayerAt(1).texture = input1;
            compositeEffect.getLayerAt(2).texture = input2;
            compositeEffect.getLayerAt(3).texture = input3;

            if (input1) TextureHelper.setupTextureCoordinates(input1,vertexData, 0, "texCoords1");
            if (input2) TextureHelper.setupTextureCoordinates(input2,vertexData, 0, "texCoords2");
            if (input3) TextureHelper.setupTextureCoordinates(input3,vertexData, 0, "texCoords3");

            return super.process(painter, helper, input0, input1, input2, input3);
        }

        /** @private */
        override protected function createEffect():FilterEffect
        {
            return new CompositeEffect();
        }

        /** Returns the position (in points) at which a certain layer will be drawn. */
        public function getOffsetAt(layerID:int, out:Point=null):Point
        {
            if (out == null) out = new Point();

            out.x = compositeEffect.getLayerAt(layerID).x;
            out.y = compositeEffect.getLayerAt(layerID).y;

            return out;
        }

        /** Indicates the position (in points) at which a certain layer will be drawn. */
        public function setOffsetAt(layerID:int, x:Number, y:Number):void
        {
            compositeEffect.getLayerAt(layerID).x = x;
            compositeEffect.getLayerAt(layerID).y = y;
        }

        /** Returns the RGB color with which a layer is tinted when it is being drawn.
         *  @default 0xffffff */
        public function getColorAt(layerID:int):uint
        {
            return compositeEffect.getLayerAt(layerID).color;
        }

        /** Adjusts the RGB color with which a layer is tinted when it is being drawn.
         *  If <code>replace</code> is enabled, the pixels are not tinted, but instead
         *  the RGB channels will replace the texture's color entirely.
         */
        public function setColorAt(layerID:int, color:uint, replace:Boolean=false):void
        {
            compositeEffect.getLayerAt(layerID).color = color;
            compositeEffect.getLayerAt(layerID).replaceColor = replace;
        }

        /** Indicates the alpha value with which the layer is drawn.
         *  @default 1.0 */
        public function getAlphaAt(layerID:int):Number
        {
            return compositeEffect.getLayerAt(layerID).alpha;
        }

        /** Adjusts the alpha value with which the layer is drawn. */
        public function setAlphaAt(layerID:int, alpha:Number):void
        {
            compositeEffect.getLayerAt(layerID).alpha = alpha;
        }

        private function get compositeEffect():CompositeEffect
        {
            return this.effect as CompositeEffect;
        }
    }
}

import flash.display3D.Context3DProgramType;

import away3d.arcane;
import away3d.core.data.ShaderCache;
import away3d.core.managers.AGALProgram3DCache;
import away3d.core.managers.Stage3DProxy;

import starling.rendering.FilterEffect;
import starling.rendering.ProgramNameID;
import starling.rendering.VertexDataFormat;
import starling.textures.IStarlingTexture;
import starling.utils.Color;
import starling.utils.RenderUtil;
import starling.utils.StringUtil;

use namespace arcane;


class CompositeEffect extends FilterEffect
{
    public static const VERTEX_FORMAT:VertexDataFormat =
        FilterEffect.VERTEX_FORMAT.extend(
            "texCoords1:float2, texCoords2:float2, texCoords3:float2");

    private var _layers:Vector.<CompositeLayer>;

    private static var sLayers:Array = [];
    private static var sOffset:Vector.<Number> = new <Number>[0, 0, 0, 0];
    private static var sColor:Vector.<Number>  = new <Number>[0, 0, 0, 0];

    public function CompositeEffect(numLayers:int=4)
    {
        if (numLayers < 1 || numLayers > 4)
            throw new ArgumentError("number of layers must be between 1 and 4");

        _layers = new Vector.<CompositeLayer>(numLayers, true);

        for (var i:int=0; i<numLayers; ++i)
            _layers[i] = new CompositeLayer();
    }

    public function getLayerAt(layerID:int):CompositeLayer
    {
        return _layers[layerID];
    }

    private function getUsedLayers(out:Array=null):Array
    {
        if (out == null) out = [];
        else out.length = 0;

        for each (var layer:CompositeLayer in _layers)
            if (layer.texture) out[out.length] = layer;

        return out;
    }

	override protected function get programVariantName():uint
	{
		var bits:uint;
		var totalBits:uint = 0;
		var layer:CompositeLayer;
		var layers:Array = getUsedLayers(sLayers);	
		var numLayers:int = layers.length;		
		
		for (var i:int=0; i<numLayers; ++i)		
		{		
			layer = layers[i];		
			bits = RenderUtil.getTextureVariantBits(layer.texture) | (int(layer.replaceColor) << 3);		
			totalBits |= bits << (i * 4);		
		}		
		
		return totalBits;
	}
	
	override protected function get programBaseName():uint 
	{ 
		return ProgramNameID.COMPOSITE_FILTER;
	}
	
	override arcane function getVertexCode():String
	{
		var layers:Array = getUsedLayers(sLayers);
		var numLayers:int = layers.length;
		var i:int;
		
		if (numLayers)
		{
			var vertexCode:Array = ["m44 op, va0, vc0"]; // transform position to clip-space
			
			for (i=0; i<numLayers; ++i) // v0-4 -> texture coords
				vertexCode.push(
					StringUtil.format("add v{0}, va{1}, vc{2}", i, i + 1, i + 4) // add offset
				);
			
			return vertexCode.join("\n");
		}
		else
		{
			return super.getVertexCode();
		}
	}
	
	override arcane function getFragmentCode():String
	{
		var layers:Array = getUsedLayers(sLayers);
		var numLayers:int = layers.length;
		var i:int;
		
		if (numLayers)
		{
			var layer:CompositeLayer = _layers[0];
			
			var fragmentCode:Array = [
				"seq ft5, v0, v0" // ft5 -> 1, 1, 1, 1
			];
			
			for (i=0; i<numLayers; ++i)
			{
				var fti:String = "ft" + i;
				var fci:String = "fc" + i;
				var vi:String  = "v"  + i;
				
				layer = _layers[i];
				
				fragmentCode.push(
					tex(fti, vi, i, layers[i].texture)  // fti => texture i color
				);
				
				if (layer.replaceColor)
					fragmentCode.push(
						"mul " + fti + ".w,   " + fti + ".w,   " + fci + ".w",
						"sat " + fti + ".w,   " + fti + ".w    ", // make sure alpha <= 1.0
						"mul " + fti + ".xyz, " + fci + ".xyz, " + fti + ".www"
					);
				else
					fragmentCode.push(
						"mul " + fti + ", " + fti + ", " + fci // fti *= color
					);
				
				if (i != 0)
				{
					// "normal" blending: src × ONE + dst × ONE_MINUS_SOURCE_ALPHA
					fragmentCode.push(
						"sub ft4, ft5, " + fti + ".wwww", // ft4 => 1 - src.alpha
						"mul ft0, ft0, ft4",              // ft0 => dst * (1 - src.alpha)
						"add ft0, ft0, " + fti            // ft0 => src + (dst * 1 - src.alpha)
					);
				}
			}
			
			fragmentCode.push("mov oc, ft0"); // done! :)
			
			return fragmentCode.join("\n");
		}
		else
		{
			return super.getFragmentCode();
		}
	}

    /** vc0-vc3  — MVP matrix
     *  vc4-vc7  — layer offsets
     *  fs0-fs3  — input textures
     *  fc0-fc3  — input colors (RGBA+pma)
     *  va0      — vertex position (xy)
     *  va1-va4  — texture coordinates (without offset)
     *  v0-v3    — texture coordinates (with offset)
     */
    override protected function beforeDraw(stage3DProxy:Stage3DProxy):void
    {
        var layers:Array = getUsedLayers(sLayers);
        var numLayers:int = layers.length;

        if (numLayers)
        {
            for (var i:int=0; i<numLayers; ++i)
            {
                var layer:CompositeLayer = layers[i];
                var texture:IStarlingTexture = layer.texture;
                var alphaFactor:Number = layer.replaceColor ? 1.0 : layer.alpha;

                sOffset[0] = -layer.x / texture.root.width;
                sOffset[1] = -layer.y / texture.root.height;
                sColor[0] = Color.getRed(layer.color)   * alphaFactor / 255.0;
                sColor[1] = Color.getGreen(layer.color) * alphaFactor / 255.0;
                sColor[2] = Color.getBlue(layer.color)  * alphaFactor / 255.0;
                sColor[3] = layer.alpha;

				stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.VERTEX, i + 4, sOffset);
				stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, i, sColor);
				stage3DProxy.setTextureAt(i,texture.root);
            }

            for (i=1; i<numLayers; ++i)
                vertexFormat.setVertexBufferAt(stage3DProxy, i + 1, vertexBuffer, "texCoords" + i);
        }
		
		
        super.beforeDraw(stage3DProxy);
    }

    override protected function afterDraw(stage3DProxy:Stage3DProxy):void
    {
        var layers:Array = getUsedLayers(sLayers);
        var numLayers:int = layers.length;

        for (var i:int=0; i<numLayers; ++i)
        {
			stage3DProxy.setTextureAt(i, null);
			stage3DProxy.setVertexBufferAt(i + 1, null);
        }

        super.afterDraw(stage3DProxy);
    }

    override public function get vertexFormat():VertexDataFormat
    {
        return VERTEX_FORMAT;
    }

    // properties

    public function get numLayers():int { return _layers.length; }

    override public function set texture(value:IStarlingTexture):void
    {
        _layers[0].texture = value;
        super.texture = value;
    }
}

class CompositeLayer
{
    public var texture:IStarlingTexture;
    public var x:Number;
    public var y:Number;
    public var color:uint;
    public var alpha:Number;
	public var replaceColor:Boolean;

    public function CompositeLayer()
    {
        x = y = 0;
        alpha = 1.0;
        color = 0xffffff;
    }

}