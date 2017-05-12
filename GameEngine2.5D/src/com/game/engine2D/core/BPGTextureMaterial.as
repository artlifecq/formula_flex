package com.game.engine2D.core
{
	import com.game.engine2D.utils.MaterialUtils;
	
	import flash.geom.ColorTransform;
	
	import away3d.events.Event;
	import away3d.materials.MaterialBase;
	import away3d.materials.TextureMaterial;
	
	/**
	 * Bpg资源材质
	 * @author guoqing.wen
	 * 
	 */
	public class BPGTextureMaterial extends TextureMaterial implements ITextureMaterial
	{
		private var _bpgTexture:BPGByteTexture;
		
		/** bpg材质透明度 */
		private var _bpgAlpha:Number = 1.0;
		
		private var _bpgColorTransform:ColorTransform;
		
		/** 是否正在解析bpg */
		private var _bpgParsed:Boolean = false;
		private var _index:int;
		
		public function BPGTextureMaterial(texture:BPGByteTexture)
		{
			super(null);
			super.alpha = MaterialUtils.bpgTextureAlpha;//未解析bpg完成之前，使用0.1的透明贴图显示矩形
			_bpgParsed = true;
			_bpgTexture = texture;
			_bpgTexture.addEventListener(Event.COMPLETE, onParseCompelte); 
			this.colorTransform = new ColorTransform();
		}
		
		public function set index(value:int):void
		{
			_index = value;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get textureReady():Boolean
		{
			return !_bpgParsed;
		}
		
		override public function get isDefaultTexture():Boolean
		{
			return _bpgParsed;
		}
		
		public function uploadTexture():void
		{
		}
		
		public function get isTextureScale():Boolean
		{
			return _bpgTexture.isTextureScale;
		}
		
		public function get textureScale():Number
		{
			return _bpgTexture.textureScale;
		}
		
		protected function get bpgTexture():BPGByteTexture
		{
			return _bpgTexture;
		}
		
		protected function onParseCompelte(event:Event):void
		{
			_bpgTexture.removeEventListener(Event.COMPLETE, onParseCompelte); 
			_bpgParsed = false;
			super.alpha = _bpgAlpha;
			if (_bpgColorTransform){
				super.colorTransform = _bpgColorTransform;
			}
			if (this.texture != _bpgTexture){
				this.texture = _bpgTexture;
			}
			if (this.hasEventListener(Event.COMPLETE)){
				this.dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		public function get height():int
		{
			return _bpgTexture.height;
		}
		
		public function get width():int
		{
			return _bpgTexture.width;
		}
		
		override public function set alpha(value:Number):void
		{
			_bpgAlpha = value;
			if (!_bpgParsed){
				super.alpha = _bpgAlpha;
			}
		}
		
		override public function get colorTransform():ColorTransform
		{
			return _bpgColorTransform;
		}
		
		override public function set colorTransform(value:ColorTransform):void
		{
			_bpgColorTransform = value;
			if (!_bpgParsed){
				super.colorTransform = value;
			}
		}
		
		override public function dispose():void
		{
			if (_bpgTexture){
				_bpgTexture.removeEventListener(Event.COMPLETE, onParseCompelte);
			}
			_bpgTexture = null;
			_bpgColorTransform = null;
			super.dispose();
		}
		
		override public function copyFrom(material:MaterialBase):void
		{
			_bpgTexture = BPGTextureMaterial(material).bpgTexture;
			if (!_bpgTexture.isParseBgraData)
				onParseCompelte(null);
			else 
				_bpgTexture.addEventListener(Event.COMPLETE, onParseCompelte); 
			
			super.copyFrom(material);
		}
		
		public function clone():ITextureMaterial
		{
			var texture:BPGTextureMaterial = new BPGTextureMaterial(_bpgTexture);
			if (!_bpgTexture.isParseBgraData){
				texture.onParseCompelte(null);
			}
			texture.animateUVs = this.animateUVs;
			texture.writeDepth = this.writeDepth;
			texture.bothSides = this.bothSides;
			texture.blendMode = this.blendMode;
			texture.depthCompareMode = this.depthCompareMode;
			texture.alphaThreshold = this.alphaThreshold;
			texture.index = this.index;
			texture.name = this.name + "-copy";
			return texture;
		}
		
	}
}