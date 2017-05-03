package starling.styles
{
	import flash.geom.ColorTransform;
	
	import starling.rendering.MeshEffect;
	import starling.rendering.RenderState;
	import starling.textures.IStarlingTexture;
	
	/**
	 *  MultiLayerMeshStyle
	 * @author guoqing.wen
	 * 
	 */
	public class MultiLayerMeshStyle extends ColorMatrixMeshStyle
	{
		public static const MASK_CHANNEL_R : String = MultiLayerMeshEffect.MASK_CHANNEL_R;
		public static const MASK_CHANNEL_G : String = MultiLayerMeshEffect.MASK_CHANNEL_G;
		public static const MASK_CHANNEL_B : String = MultiLayerMeshEffect.MASK_CHANNEL_B;
		public static const MASK_CHANNEL_A : String = MultiLayerMeshEffect.MASK_CHANNEL_A;
		
		public static const MUL : String = "mul";
		public static const ADD : String = "add";
		public static const MIN : String = "min";
		public static const OVERRIDE : String = "override";
		
		private var _options          : MultiLayerOptions = new MultiLayerOptions();
		private var _colorValue       : ColorTransform = new ColorTransform();
		private var _datas            : Vector.<Number> = new Vector.<Number>();
		private var _offsetU0 		  : Number = 0;
		private var _offsetV0 		  : Number = 0;
		private var _tileU0   		  : Number = 1.0;
		private var _tileV0   		  : Number = 1.0;
		private var _multiTexture0    : IStarlingTexture;
		private var _offsetU1 		  : Number = 0;
		private var _offsetV1 		  : Number = 0;
		private var _tileU1   		  : Number = 1.0;
		private var _tileV1   		  : Number = 1.0;
		private var _multiTexture1    : IStarlingTexture;
		private var _colorMulti0           : uint = 0xffffffff;
		private var _colorMulti1           : uint = 0xffffffff;
		private var _colorLevel0      : Number = 1.0;
		private var _colorLevel1      : Number = 1.0;
		
		public function MultiLayerMeshStyle()
		{
			super();
		}
		
		override public function createEffect():MeshEffect
		{
			return new MultiLayerMeshEffect();
		}
		
		override public function copyFrom(meshStyle:MeshStyle):void
		{
			super.copyFrom(meshStyle);
			var cme:MultiLayerMeshStyle = meshStyle as MultiLayerMeshStyle;
			if(cme)
			{
				this.offsetU0 = cme._offsetU0;
				this.offsetV0 = cme.offsetV0;
				this.tileU0 = cme.tileU0;
				this.tileV0 = cme.tileV0;
				this.alphaChannel0 = cme.alphaChannel0;
				this.alphaPass0 = cme.alphaPass0;
				this.invertAlpha0 = cme.invertAlpha0;
				this.colorMulti0 = cme.colorMulti0;
				this.colorLevel0 = cme.colorLevel0;
				
				this.offsetU1 = cme.offsetU1;
				this.offsetV1 = cme.offsetV1;
				this.tileU1 = cme.tileU1;
				this.tileV1 = cme.tileV1;
				this.alphaChannel1 = cme.alphaChannel1;
				this.alphaPass1 = cme.alphaPass1;
				this.invertAlpha1 = cme.invertAlpha1;
				this.colorMulti1 = cme.colorMulti1;
				this.colorLevel1 = cme.colorLevel1;
				
				this.diffuseBlendType = cme.diffuseBlendType;
				this.diffuseAlphaBlendType = cme.diffuseAlphaBlendType;
				this.textureBlendType = cme.textureBlendType;
				this.textureAlphaBlendType = cme.textureAlphaBlendType;
				
				this.multiTexture0 = cme.multiTexture0;
				this.multiTexture1 = cme.multiTexture1;
			}
		}
		
		override public function canBatchWith(meshStyle:MeshStyle):Boolean
		{
			var style:MultiLayerMeshStyle = (meshStyle as MultiLayerMeshStyle);
			return (this.multiTexture0 == style.multiTexture0) && (this.multiTexture1 == style.multiTexture1) && super.canBatchWith(meshStyle) && this._options.compare(style._options);
		}
		
		override public function updateEffect(effect:MeshEffect, state:RenderState):void
		{
			super.updateEffect(effect, state);
			if (effect is MultiLayerMeshEffect)
			{
				_datas[0] = _offsetU0;
				_datas[1] = _offsetV0;
				_datas[2] = _tileU0;
				_datas[3] = _tileV0;
				_datas[4] = _colorValue.redMultiplier;
				_datas[5] = _colorValue.greenMultiplier;
				_datas[6] = _colorValue.blueMultiplier;
				_datas[7] = _colorValue.alphaMultiplier;
				
				if (_multiTexture1) 
				{
					_datas[8] = _offsetU1;
					_datas[9] = _offsetV1;
					_datas[10] = _tileU1;
					_datas[11] = _tileV1;
					_datas[12] = _colorValue.redOffset;//r
					_datas[13] = _colorValue.greenOffset;//g
					_datas[14] = _colorValue.blueOffset;//b
					_datas[15] = _colorValue.alphaOffset;//a
					
					_datas[16] = 1;
					_datas[17] = 1;
					_datas[18] = 1;
					_datas[19] = 1;
				}
				else
				{
					_datas[8] = 1;
					_datas[9] = 1;
					_datas[10] = 1;
					_datas[11] = 1;
				}
				
				MultiLayerMeshEffect(effect)._shaderMatrix = _shaderMatrix;
				MultiLayerMeshEffect(effect)._datas = _datas;
				MultiLayerMeshEffect(effect)._multiTexture0 = _multiTexture0;
				MultiLayerMeshEffect(effect)._multiTexture1 = _multiTexture1;
				MultiLayerMeshEffect(effect)._options = _options;
			}
		}
		
		private function get multiOption():MultiLayerOptions 
		{
			return _options;
		}
		
		public function get multiTexture1():IStarlingTexture 
		{
			return _multiTexture1;
		}
		
		public function set multiTexture1(value:IStarlingTexture):void 
		{
			if (_multiTexture1 == value) {
				return;
			}
			_multiTexture1 = value;
			invalidateShaderProgram();
			/*if (!TextureUtils.shareShaderCode(value, _multiTexture1)) {
				invalidateShaderProgram();
			}*/
		}
		
		public function get invertAlpha1():Boolean 
		{
			return _options._invertAlpha1;
		}
		
		public function set invertAlpha1(value:Boolean):void 
		{
			if (_options._invertAlpha1 != value) {
				_options._invertAlpha1 = value;
				invalidateShaderProgram();
			}
		}
		
		public function get alphaChannel1():String 
		{
			return _options._alphaChannel1;
		}
		
		public function set alphaChannel1(value:String):void 
		{
			if (_options._alphaChannel1 != value) {
				_options._alphaChannel1 = value;
				invalidateShaderProgram();
			}
		}
		
		public function get tileV1():Number 
		{
			return _tileV1;
		}
		
		public function set tileV1(value:Number):void 
		{
			if (_tileV1 != value){
				_tileV1 = value;
				setRequiresRedraw();
			}
		}
		
		public function get tileU1():Number {
			return _tileU1;
		}
		
		public function set tileU1(value:Number):void 
		{
			if (_tileU1 != value){
				_tileU1 = value;
				setRequiresRedraw();
			}
		}
		
		public function get offsetV1():Number 
		{
			return _offsetV1;
		}
		
		public function set offsetV1(value:Number):void 
		{
			if (_offsetV1 != value){
				_offsetV1 = value;
				setRequiresRedraw();
			}
		}
		
		public function get offsetU1():Number 
		{
			return _offsetU1;
		}
		
		public function set offsetU1(value:Number):void 
		{
			if (_offsetU1 != value){
				_offsetU1 = value;
				setRequiresRedraw();
			}
		}
		
		public function get multiTexture0():IStarlingTexture 
		{
			return _multiTexture0;
		}
		
		public function set multiTexture0(value:IStarlingTexture):void 
		{
			if (_multiTexture0 != value) {
				_multiTexture0 = value;
				invalidateShaderProgram();
				/*if (!TextureUtils.shareShaderCode(value, _multiTexture0)) {
					invalidateShaderProgram();
				}*/
			}
		}
		
		public function get invertAlpha0():Boolean 
		{
			return _options._invertAlpha0;
		}
		
		public function set invertAlpha0(value:Boolean):void 
		{
			if (_options._invertAlpha0 != value) {
				_options._invertAlpha0 = value;
				invalidateShaderProgram();
			}
		}
		
		public function get alphaChannel0():String 
		{
			return _options._alphaChannel0;
		}
		
		public function set alphaChannel0(value:String):void 
		{
			if (_options._alphaChannel0 != value) {
				_options._alphaChannel0 = value;
				invalidateShaderProgram();
			}
		}
		
		public function get tileV0():Number 
		{
			return _tileV0;
		}
		
		public function set tileV0(value:Number):void 
		{
			if (_tileV0 != value){
				_tileV0 = value;
				setRequiresRedraw();
			}
		}
		
		public function get tileU0():Number 
		{
			return _tileU0;
		}
		
		public function set tileU0(value:Number):void 
		{
			if (_tileU0 != value){
				_tileU0 = value;
				setRequiresRedraw();
			}
		}
		
		public function get offsetV0():Number 
		{
			return _offsetV0;
		}
		
		public function set offsetV0(value:Number):void 
		{
			if (_offsetV0 != value){
				_offsetV0 = value;
				setRequiresRedraw();
			}
		}
		
		public function get offsetU0():Number 
		{
			return _offsetU0;
		}
		
		public function set offsetU0(value:Number):void 
		{
			if (_offsetU0 != value){
				_offsetU0 = value;
				setRequiresRedraw();
			}
		}
		
		public function get alphaPass0():Boolean
		{
			return _options._alphaPass0;
		}
		
		public function set alphaPass0(value:Boolean):void
		{
			if (_options._alphaPass0 != value) {
				_options._alphaPass0 = value;
				invalidateShaderProgram();
			}
		}
		
		public function get alphaPass1():Boolean
		{
			return _options._alphaPass1;
		}
		
		public function set alphaPass1(value:Boolean):void
		{
			if (_options._alphaPass1 != value) {
				_options._alphaPass1 = value;
				invalidateShaderProgram();
			}
		}
		
		/**与deffuseTexture混合，add multiply min*/
		public function get diffuseBlendType():String
		{
			return _options._diffuseBlendType;
		}
		
		public function set diffuseBlendType(value:String):void
		{
			if (_options._diffuseBlendType != value) {
				_options._diffuseBlendType = value;
				invalidateShaderProgram();
			}
		}
		
		/**两张贴图Texture混合，add multiply min*/
		public function get textureBlendType():String
		{
			return _options._textureBlendType;
		}
		
		public function set textureBlendType(value:String):void
		{
			if (_options._textureBlendType != value) {
				_options._textureBlendType = value;
				invalidateShaderProgram();
			}
		}
		
		public function get colorMulti0():uint
		{
			return _colorMulti0;
		}
		
		public function set colorMulti0(value:uint):void
		{
			if (_colorMulti0 != value){
				_colorMulti0 = value;
				setColorMulti0Value();
			}
		}
		
		private function setColorMulti0Value():void
		{
			_colorValue.redMultiplier = ((_colorMulti0>>16 & 0xff)*_colorLevel0)/255.0;//r
			_colorValue.greenMultiplier = ((_colorMulti0>>8 & 0xff)*_colorLevel0)/255.0;//g
			_colorValue.blueMultiplier = ((_colorMulti0>>0 & 0xff)*_colorLevel0)/255.0;//b
			_colorValue.alphaMultiplier = ((_colorMulti0>>24 & 0xff)*_colorLevel0)/255.0;//a
		}
		
		public function get colorMulti1():uint
		{
			return _colorMulti1;
		}
		
		public function set colorMulti1(value:uint):void
		{
			if (_colorMulti1 != value){
				_colorMulti1 = value;
				setColorMulti1Value();
			}
		}
		
		private function setColorMulti1Value():void
		{
			_colorValue.redOffset = ((_colorMulti1>>16 & 0xff)*_colorLevel1)/255.0;//r
			_colorValue.greenOffset = ((_colorMulti1>>8 & 0xff)*_colorLevel1)/255.0;//g
			_colorValue.blueOffset = ((_colorMulti1>>0 & 0xff)*_colorLevel1)/255.0;//b
			_colorValue.alphaOffset = ((_colorMulti1>>24 & 0xff)*_colorLevel1)/255.0;//a
		}
		
		public function get colorLevel0():Number
		{
			return _colorLevel0;
		}
		
		public function set colorLevel0(value:Number):void
		{
			if (_colorLevel0 != value){
				_colorLevel0 = value;
				setColorMulti0Value();
			}
		}
		
		public function get colorLevel1():Number
		{
			return _colorLevel1;
		}
		
		public function set colorLevel1(value:Number):void
		{
			if (_colorLevel1 != value){
				_colorLevel1 = value;
				setColorMulti1Value();
			}
		}
		
		public function get diffuseAlphaBlendType():String
		{
			return _options._diffuseAlphaBlendType;
		}
		
		public function set diffuseAlphaBlendType(value:String):void
		{
			if (_options._diffuseAlphaBlendType != value) {
				_options._diffuseAlphaBlendType = value;
				invalidateShaderProgram();
			}
		}
		
		public function get textureAlphaBlendType():String
		{
			return _options._textureAlphaBlendType;
		}
		
		public function set textureAlphaBlendType(value:String):void
		{
			if (_options._textureAlphaBlendType != value) {
				_options._textureAlphaBlendType = value;
				invalidateShaderProgram();
			}
		}
		
		private function invalidateShaderProgram():void
		{
			_options._invalidateShaderProgramed = true;
			this.setRequiresRedraw();
		}
	}
	
}
import flash.display3D.Context3DProgramType;

import away3d.core.managers.Stage3DProxy;

import starling.core.Starling;
import starling.rendering.MeshEffect;
import starling.rendering.Painter;
import starling.rendering.Program;
import starling.textures.IStarlingTexture;

class MultiLayerMeshEffect extends MeshEffect
{
	public var _options:MultiLayerOptions;
	public var _shaderMatrix:Vector.<Number>;
	public var _datas:Vector.<Number>;
	public var _multiTexture0:IStarlingTexture;
	public var _multiTexture1:IStarlingTexture;
	
	private static const MIN_COLOR:Vector.<Number> = new <Number>[0, 0, 0, 0.0001];
	public static const MASK_CHANNEL_R : String = "red";
	public static const MASK_CHANNEL_G : String = "green";
	public static const MASK_CHANNEL_B : String = "blue";
	public static const MASK_CHANNEL_A : String = "alpha";
	
	public function MultiLayerMeshEffect()
	{
	}
	
	override protected function beforeDraw(stage3DProxy:Stage3DProxy):void
	{
		super.beforeDraw(stage3DProxy);
		stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, _shaderMatrix);
		stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 5, MIN_COLOR);
		stage3DProxy.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 6, _datas, _multiTexture1 ? 5 : 3);
		if (_multiTexture0)
			stage3DProxy.setTextureAt(1, _multiTexture0);
		if (_multiTexture1)
			stage3DProxy.setTextureAt(2, _multiTexture1);
	}
	
	override protected function afterDraw(stage3DProxy:Stage3DProxy):void
	{
		if (_multiTexture0)
			stage3DProxy.setTextureAt(1, null);
		if (_multiTexture1)
			stage3DProxy.setTextureAt(2, null);
		super.afterDraw(stage3DProxy);
	}
	
	
	override protected function get program():Program
	{
		var name:String = this.programName;
		var painter:Painter = Starling.painter;
		var program:Program = painter.getProgram(name);
		
		if (program == null || _options._invalidateShaderProgramed)
		{
			_options._invalidateShaderProgramed = false;
			program = createProgram();
			painter.registerProgram(name, program);
		}
		
		return program;
	}
	
	override protected function createProgram():Program
	{
		var vertexShader:String, fragmentShader:String;
		var code:String = "";
		
		if (texture)
		{
			vertexShader =
				"m44 op, va0, vc0 \n" + // 4x4 matrix transform to output clip-space
				"mov v0, va1      \n" + // pass texture coordinates to fragment program
				"mul v1, va2, vc4 \n";  // multiply alpha (vc4) with color (va2), pass to fp
			
			code = getMultiLayerCode();
			fragmentShader =
				tex("ft0", "v0", 0, texture) +
				"mul ft0, ft0, v1  \n" +  // multiply color with texel color
				"max ft0, ft0, fc5 \n" + // avoid division through zero in next step
				"div ft0.xyz, ft0.xyz, ft0.www \n" + // restore original (non-PMA) RGB values
				code + 
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
	
	private function getMultiLayerCode():String
	{
		var code:String = "";
		if (_multiTexture0)
		{
			var cbUV0:String = "fc6";
			var cc0:String = "fc7";
			var cbUV1:String = "fc8";
			var cc1:String = "fc9";
			var ft0:String = "ft0";
			var ft1:String = "ft1";
			var ft2:String = "ft2";
			var commons:String = "fc8";
			
			code += "mov "+ft1+", v0 \n";
			code += "mul "+ft1+".xyzw, " + cbUV0 + ".zw, " + ft1 + ".xy \n";
			code += "add "+ft1+".xy, " + cbUV0 + ".xy, " + ft1 + ".xy \n";
			code += tex(ft1, ft1, 1, _multiTexture0);
			
			code += "div "+ ft1 + ".xyz, "+ ft1 + ".xyz, "+ ft1 + ".www \n";// restore original (non-PMA) RGB values
			code += "mul " + ft1 + "," + cc0 + "," + ft1 + " \n";
			//code += "mul "+ ft1 + ".xyz, "+ ft1 + ".xyz, "+ ft1 + ".www \n"; // multiply with alpha again (PMA)
			code += "add " + ft0 + ".xyz, " + ft0 + ".xyz, " + ft1 + ".xyz \n";
			
			if (_multiTexture1) 
			{
				commons = "fc10";
				//tile,offset
				code += "mov " + ft2 + ",v0 \n";
				code += "mul " + ft2 + ".xy, " + cbUV1 + ".zw, " + ft2 + ".xy \n";
				code += "add " + ft2 + ".xy, " + cbUV1 + ".xy, " + ft2 + ".xy \n";
				code += tex(ft2, ft2, 2, _multiTexture0);
				
				//color multiply
				code += "div "+ ft2 + ".xyz, "+ ft2 + ".xyz, "+ ft2 + ".www \n";// restore original (non-PMA) RGB values
				code += "mul "+ ft2 + "," + cc1 + "," + ft2 + "\n";
				//code += "mul "+ ft2 + ".xyz, "+ ft2 + ".xyz, "+ ft2 + ".www \n";// multiply with alpha again (PMA)
				
				//texture blend
				code += _options._textureBlendType + " " + ft2 + ".xyz,"+ ft2 + ".xyz," + ft1 + ".xyz\n";
				
				//deffuse blend
				code += _options._diffuseBlendType+ " " + ft0 + ".xyz, " + ft0 + ".xyz, " + ft2 + ".xyz \n";
				
				//alpha
				if (_options._alphaPass0)
				{
					code += "mov " + ft2 + ".w, " + ft1 + "." + component(_options._alphaChannel0) + " \n";//R
					if (_options._invertAlpha0)//1-R
						code += "sub "+ ft2 + ".w," + commons + ".w," + ft2 + ".w\n";
				}
				else//==1
				{
					code += "mov "+ ft2 + ".w," + commons + ".w\n";
				}
				
				//alpha
				if (_options._alphaPass1)
				{
					code += "mov " + ft1 + ".w, " + ft2 + "." + component(_options._alphaChannel1) + " \n";//R
					if (_options._invertAlpha1)//1-R
						code += "sub "+ ft1 + ".w," + commons + ".w," + ft1 + ".w\n";
				}
				else//==1
				{
					code += "mov "+ ft1 + ".w," + commons + ".w\n";
				}
				//alpha blend
				code += _options._textureAlphaBlendType+ " " + ft2 + ".w, " + ft1 + ".w, " + ft2 + ".w \n";
			}
			else 
			{
				//deffuse blend
				code += _options._diffuseBlendType+ " " + ft0 + ".xyz, " + ft0 + ".xyz, " + ft1 + ".xyz \n";
				code += "add " + ft0 + ".xyz, " + ft0 + ".xyz, " + ft1 + ".xyz \n";
				//alpha
				if (_options._alphaPass0)
				{
					code += "mov " + ft2 + ".w, " + ft1 + "." + component(_options._alphaChannel0) + " \n";
					if (_options._invertAlpha0)//1-R
						code += "sub "+ ft2 + ".w," + commons + ".w," + ft2 + ".w\n";
				}
				else//==1
				{
					code += "mov "+ ft2 + ".w," + commons + ".w\n";
				}
			}
			if (_options._diffuseAlphaBlendType == "override")
				code += "mov " + ft0 + ".w, " + ft2 + ".w \n";
			else
				code += _options._diffuseAlphaBlendType+ " " + ft0 + ".w, " + ft0 + ".w, " + ft2 + ".w \n";
		}
		return code;
	}
	
	/**
	 * 根据通过获取寄存器对应的分量 
	 * @param channel @see MASK_CHANNEL_X
	 * @return x | y | z | w
	 * 
	 */		
	private function component(channel : String) : String 
	{
		switch(channel) {
			case MASK_CHANNEL_R:{
				return "x";
				break;
			}
			case MASK_CHANNEL_G:{
				return "y";
				break;
			}
			case MASK_CHANNEL_B:{
				return "z";
				break;
			}
			case MASK_CHANNEL_A:{
				return "w";
				break;
			}
			default:{
				return "x";
				break;
			}
		}
	}
	
	override public function dispose():void
	{
		this._datas = null;
		this._multiTexture0 = null;
		this._multiTexture1 = null;
		this._shaderMatrix = null;
		super.dispose();
	}
}

class MultiLayerOptions
{
	public var _invalidateShaderProgramed:Boolean;
	public var _alphaPass0: Boolean = false;//是否取消_alphaChannel0，值为1
	public var _alphaChannel0: String = "red";
	public var _invertAlpha0: Boolean = false;
	public var _alphaPass1: Boolean = false;//是否取消_alphaChannel1，值为1
	public var _alphaChannel1: String = "red";
	public var _invertAlpha1: Boolean = false;
	public var _diffuseAlphaBlendType : String = "mul";
	public var _textureAlphaBlendType : String = "mul";
	public var _diffuseBlendType      : String = "add";
	public var _textureBlendType      : String = "add";
	
	public function compare(options:MultiLayerOptions):Boolean
	{
		if (_alphaPass0 == options._alphaPass0 && _alphaPass1 == options._alphaPass1 && 
			_alphaChannel0 == options._alphaChannel0 && _alphaChannel1 == options._alphaChannel1 &&
			_invertAlpha0 == options._invertAlpha0 && _invertAlpha1 == options._invertAlpha1 && 
			_diffuseAlphaBlendType == options._diffuseAlphaBlendType && 
			_diffuseBlendType == options._diffuseBlendType && 
			_textureAlphaBlendType == options._textureAlphaBlendType && 
			_textureBlendType == options._textureBlendType)
			return true;
		return false;
	}
}