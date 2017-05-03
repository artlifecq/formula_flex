package starling.styles
{
	import starling.rendering.MeshEffect;
	import starling.rendering.RenderState;
	import starling.utils.Color;

	public class ColorMatrixMeshStyle extends MeshStyle
	{
		private static const IDENTITY:Array = [1,0,0,0,0,  0,1,0,0,0,  0,0,1,0,0,  0,0,0,1,0];
		private static const LUMA_R:Number = 0.299;
		private static const LUMA_G:Number = 0.587;
		private static const LUMA_B:Number = 0.114;
		
		private static var sMatrix:Vector.<Number> = new <Number>[];
		private static var tMatrix:Vector.<Number> = new <Number>[];
		
		protected var _userMatrix:Vector.<Number>;   // offset in range 0-255
		protected var _shaderMatrix:Vector.<Number>; // offset in range 0-1, changed order
		
		public function ColorMatrixMeshStyle()
		{
			super();
			_userMatrix   = new <Number>[];
			_shaderMatrix = new Vector.<Number>(20, true);
			reset();
		}
		
		override public function createEffect():MeshEffect
		{
			return new ColorMatrixEffect();
		}
		
		override public function copyFrom(meshStyle:MeshStyle):void
		{
			super.copyFrom(meshStyle);
			var cme:ColorMatrixMeshStyle = meshStyle as ColorMatrixMeshStyle;
			if(cme)
			{
				this.matrix = cme.matrix;
			}
		}
		
		override public function canBatchWith(meshStyle:MeshStyle):Boolean
		{
			return super.canBatchWith(meshStyle) && compareMatrix(_shaderMatrix, ColorMatrixMeshStyle(meshStyle)._shaderMatrix);
		}
		
		override public function updateEffect(effect:MeshEffect, state:RenderState):void
		{
			super.updateEffect(effect, state);
			if (effect is ColorMatrixEffect)
				ColorMatrixEffect(effect)._shaderMatrix = _shaderMatrix;
		}
		
		// color manipulation
		/** Inverts the colors of the filtered object. */
		public function invert():void
		{
			concatValues(-1,  0,  0,  0, 255,
				0, -1,  0,  0, 255,
				0,  0, -1,  0, 255,
				0,  0,  0,  1,   0);
		}
		
		/** Changes the saturation. Typical values are in the range (-1, 1).
		 *  Values above zero will raise, values below zero will reduce the saturation.
		 *  '-1' will produce a grayscale image. */
		public function adjustSaturation(sat:Number):void
		{
			sat += 1;
			
			var invSat:Number  = 1 - sat;
			var invLumR:Number = invSat * LUMA_R;
			var invLumG:Number = invSat * LUMA_G;
			var invLumB:Number = invSat * LUMA_B;
			
			concatValues((invLumR + sat), invLumG,  invLumB, 0, 0,
				invLumR, (invLumG + sat), invLumB, 0, 0,
				invLumR, invLumG, (invLumB + sat), 0, 0,
				0, 0, 0, 1, 0);
		}
		
		/** Changes the contrast. Typical values are in the range (-1, 1).
		 *  Values above zero will raise, values below zero will reduce the contrast. */
		public function adjustContrast(value:Number):void
		{
			var s:Number = value + 1;
			var o:Number = 128 * (1 - s);
			
			concatValues(s, 0, 0, 0, o,
				0, s, 0, 0, o,
				0, 0, s, 0, o,
				0, 0, 0, 1, 0);
		}
		
		/** Changes the brightness. Typical values are in the range (-1, 1).
		 *  Values above zero will make the image brighter, values below zero will make it darker.*/
		public function adjustBrightness(value:Number):void
		{
			value *= 255;
			
			concatValues(1, 0, 0, 0, value,
				0, 1, 0, 0, value,
				0, 0, 1, 0, value,
				0, 0, 0, 1, 0);
		}
		
		/** Changes the hue of the image. Typical values are in the range (-1, 1). */
		public function adjustHue(value:Number):void
		{
			value *= Math.PI;
			
			var cos:Number = Math.cos(value);
			var sin:Number = Math.sin(value);
			
			concatValues(
				((LUMA_R + (cos * (1 - LUMA_R))) + (sin * -(LUMA_R))), ((LUMA_G + (cos * -(LUMA_G))) + (sin * -(LUMA_G))), ((LUMA_B + (cos * -(LUMA_B))) + (sin * (1 - LUMA_B))), 0, 0,
				((LUMA_R + (cos * -(LUMA_R))) + (sin * 0.143)), ((LUMA_G + (cos * (1 - LUMA_G))) + (sin * 0.14)), ((LUMA_B + (cos * -(LUMA_B))) + (sin * -0.283)), 0, 0,
				((LUMA_R + (cos * -(LUMA_R))) + (sin * -((1 - LUMA_R)))), ((LUMA_G + (cos * -(LUMA_G))) + (sin * LUMA_G)), ((LUMA_B + (cos * (1 - LUMA_B))) + (sin * LUMA_B)), 0, 0,
				0, 0, 0, 1, 0);
		}
		
		/** Changes the image gray scale**/
		public function adjustGray(value:Number=0.33):void
		{
			var v:Number = value;
			concatValues(v, v, v, 0, 0,
				v, v, v, 0, 0,
				v, v, v, 0, 0,
				0, 0, 0, 1, 0);
		}
		
		/** Tints the image in a certain color, analog to what can be done in Adobe Animate.
		 *
		 *  @param color   the RGB color with which the image should be tinted.
		 *  @param amount  the intensity with which tinting should be applied. Range (0, 1).
		 */
		public function tint(color:uint, amount:Number=1.0):void
		{
			var r:Number = Color.getRed(color)   / 255.0;
			var g:Number = Color.getGreen(color) / 255.0;
			var b:Number = Color.getBlue(color)  / 255.0;
			var q:Number = 1 - amount;
			
			var rA:Number = amount * r;
			var gA:Number = amount * g;
			var bA:Number = amount * b;
			
			concatValues(
				q + rA * LUMA_R, rA * LUMA_G, rA * LUMA_B, 0, 0,
				gA * LUMA_R, q + gA * LUMA_G, gA * LUMA_B, 0, 0,
				bA * LUMA_R, bA * LUMA_G, q + bA * LUMA_B, 0, 0,
				0, 0, 0, 1, 0);
		}
		
		
		// matrix manipulation
		
		/** Changes the filter matrix back to the identity matrix. */
		public function reset():void
		{
			matrix = null;
		}
		
		public function concat(matrix:Vector.<Number>):void
		{
			var i:int = 0;
			
			for (var y:int=0; y<4; ++y)
			{
				for (var x:int=0; x<5; ++x)
				{
					tMatrix[i+x] = matrix[i    ] * _userMatrix[x     ] +
						matrix[i + 1] * _userMatrix[x +  5] +
						matrix[i + 2] * _userMatrix[x + 10] +
						matrix[i + 3] * _userMatrix[x + 15] +
						(x == 4 ? matrix[i + 4] : 0);
				}
				
				i += 5;
			}
			
			copyMatrix(tMatrix, _userMatrix);
			updateShaderMatrix();
		}
		
		/** Concatenates the current matrix with another one, passing its contents directly. */
		public function concatValues(m0:Number, m1:Number, m2:Number, m3:Number, m4:Number,
									 m5:Number, m6:Number, m7:Number, m8:Number, m9:Number,
									 m10:Number, m11:Number, m12:Number, m13:Number, m14:Number,
									 m15:Number, m16:Number, m17:Number, m18:Number, m19:Number):void
		{
			sMatrix.length = 0;
			sMatrix.push(m0, m1, m2, m3, m4, m5, m6, m7, m8, m9,
				m10, m11, m12, m13, m14, m15, m16, m17, m18, m19);
			
			concat(sMatrix);
		}
		
		public function get matrix():Vector.<Number> { return _userMatrix; }
		public function set matrix(value:Vector.<Number>):void
		{
			if (value && value.length != 20)
				throw new ArgumentError("Invalid matrix length: must be 20");
			
			if (value == null)
			{
				_userMatrix.length = 0;
				_userMatrix.push.apply(_userMatrix, IDENTITY);
			}
			else
			{
				copyMatrix(value, _userMatrix);
			}
			
			updateShaderMatrix();
		}
		
		private function copyMatrix(from:Vector.<Number>, to:Vector.<Number>):void
		{
			for (var i:int=0; i<20; ++i)
				to[i] = from[i];
		}
		
		private static function compareMatrix(src:Vector.<Number>, dst:Vector.<Number>):Boolean
		{
			for (var i:int=0; i<20; ++i)
				if(src[i] != dst[i])
					return false;
			return true;
		}
		
		private function updateShaderMatrix():void
		{
			// the shader needs the matrix components in a different order,
			// and it needs the offsets in the range 0-1.
			
			_shaderMatrix[0] = _userMatrix[0];
			_shaderMatrix[1] = _userMatrix[1];
			_shaderMatrix[2] = _userMatrix[2];
			_shaderMatrix[3] = _userMatrix[3];
			
			_shaderMatrix[4] = _userMatrix[5];
			_shaderMatrix[5] = _userMatrix[6];
			_shaderMatrix[6] = _userMatrix[7];
			_shaderMatrix[7] = _userMatrix[8];
			
			_shaderMatrix[8] = _userMatrix[10];
			_shaderMatrix[9] = _userMatrix[11];
			_shaderMatrix[10] = _userMatrix[12];
			_shaderMatrix[11] = _userMatrix[13];
			
			_shaderMatrix[12] = _userMatrix[15];
			_shaderMatrix[13] = _userMatrix[16];
			_shaderMatrix[14] = _userMatrix[17];
			_shaderMatrix[15] = _userMatrix[18];
			
			_shaderMatrix[16] = _userMatrix[4] / 255.0;
			_shaderMatrix[17] = _userMatrix[9] / 255.0;
			_shaderMatrix[18] = _userMatrix[14] / 255.0;
			_shaderMatrix[19] = _userMatrix[19] / 255.0;
			setRequiresRedraw();
		}
	}
}



import flash.display3D.Context3DProgramType;

import away3d.core.managers.Stage3DProxy;

import starling.rendering.MeshEffect;
import starling.rendering.Program;

class ColorMatrixEffect extends MeshEffect
{
	
	public var _shaderMatrix:Vector.<Number>;
	private static const MIN_COLOR:Vector.<Number> = new <Number>[0, 0, 0, 0.0001];
	
	public function ColorMatrixEffect()
	{
	}
	
	override protected function beforeDraw(stage3DProxy:Stage3DProxy):void
	{
		super.beforeDraw(stage3DProxy);
		
		stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, _shaderMatrix);
		stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 5, MIN_COLOR);
	}
	
	
	override protected function createProgram():Program
	{
		var vertexShader:String, fragmentShader:String;
		
		if (texture)
		{
			
			vertexShader =
				"m44 op, va0, vc0 \n" + // 4x4 matrix transform to output clip-space
				"mov v0, va1      \n" + // pass texture coordinates to fragment program
				"mul v1, va2, vc4 \n";  // multiply alpha (vc4) with color (va2), pass to fp
			
			fragmentShader =
				tex("ft0", "v0", 0, texture) +
				"mul ft0, ft0, v1  \n" +  // multiply color with texel color
				"max ft0, ft0, fc5 \n" + // avoid division through zero in next step
				"div ft0.xyz, ft0.xyz, ft0.www \n" + // restore original (non-PMA) RGB values
				"m44 ft0, ft0, fc0 \n" + // multiply color with 4x4 matrix
				"add ft0, ft0, fc4 \n" + // add offset
				"mul ft0.xyz, ft0.xyz, ft0.www \n" + // multiply with alpha again (PMA)
				"mov oc, ft0 \n";  // copy to output
		}
		else
		{
			vertexShader =
				"m44 op, va0, vc0 \n" + // 4x4 matrix transform to output clipspace
				"mul v0, va2, vc4 \n";  // multiply alpha (vc4) with color (va2)
			
			fragmentShader =
				"max ft0, v0, fc5 \n" + // avoid division through zero in next step
				"div ft0.xyz, ft0.xyz, ft0.www \n" + // restore original (non-PMA) RGB values
				"m44 ft0, ft0, fc0 \n" + // multiply color with 4x4 matrix
				"add ft0, ft0, fc4 \n" + // add offset
				"mul ft0.xyz, ft0.xyz, ft0.www \n" + // multiply with alpha again (PMA)
				"mov oc, ft0 \n";  // copy to output
		}
		
		return Program.fromSource(vertexShader, fragmentShader);
	}
}