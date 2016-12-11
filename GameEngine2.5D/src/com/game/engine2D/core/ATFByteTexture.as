package com.game.engine2D.core
{
	import flash.display3D.textures.TextureBase;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import away3d.core.managers.Stage3DProxy;
	import away3d.textures.ATFData;
	import away3d.textures.Texture2DBase;
	
	/**
	 * atf资源异步解析 
	 * @author guoqing.wen
	 * 
	 */
	public class ATFByteTexture extends Texture2DBase
	{
		private var _isReady:Boolean = false;
		private var _atfTexture:TextureBase;
		private var _isDispose:Boolean = false;
		private var _isDisposeTexture:Boolean = false;
		private var _atfData:ATFData;
		
		public function ATFByteTexture(byteArray:ByteArray)
		{
			super();
			this.atfData = new ATFByteData(byteArray);
			this.autoRecycleEnable = true;
			this.autoRecycleDataEnable = false;
		}
		
		public function get atfData():ATFData
		{
			return _atfData;
		}
		
		public function set atfData(value:ATFData):void
		{
			_atfData = value;
			_compressed = _atfData.compressed;
			_hasAlpha = _atfData.hasAlpha;
			_hasMipmaps = false;
			this.textureData = _atfData;
		}
		
		public function get isAsync():Boolean
		{
			if (atfData is ATFByteData)
				return ATFByteData(atfData).isAsync;
			return false;
		}
		
		override protected function createTexture(stage3DProxy:Stage3DProxy):TextureBase
		{
			if (isAsync)
			{
				_atfTexture = super.createTexture(stage3DProxy);
				_atfTexture.addEventListener(Event.TEXTURE_READY, onTextureReady);
				return _atfTexture;
			}
			return super.createTexture(stage3DProxy);
		}
		
		protected function onTextureReady(event:Event):void
		{
			if (_atfTexture)
			{
				_atfTexture.removeEventListener(Event.TEXTURE_READY, onTextureReady);
				_isReady = true;
				if (_isDispose)
				{
					super.dispose();
					_atfTexture = null;
				}
				else if (_isDisposeTexture)
				{
					super.invalidateContent();
					_atfTexture = null;
				}
			}
		}
		
		override protected function uploadContent(texture:TextureBase):void
		{
			_isReady = false;
			super.uploadContent(texture);
		}
		
		override public function invalidateContent():void
		{
			if (_atfTexture && isAsync) 
			{
				_isDisposeTexture = !_isReady;
				if (_isReady)
				{
					super.invalidateContent();
					_atfTexture = null;
				}
			}
			else
			{
				super.invalidateContent();
				_atfTexture = null;
			}
		}
		
		override public function dispose():void
		{
			_isDispose = true;
			if (_isReady){
				super.dispose();
				_atfTexture = null;
			}
			_atfData = null;
		}
	}
}