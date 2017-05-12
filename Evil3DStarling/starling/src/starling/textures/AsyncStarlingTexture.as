package starling.textures
{
	import flash.display3D.textures.TextureBase;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import away3d.core.managers.Stage3DProxy;
	import away3d.textures.ATFData;
	
	import starling.core.Starling;
	
	/**
	 * atf资源异步解析 
	 * @author guoqing.wen
	 * 
	 */
	public class AsyncStarlingTexture extends ConcreteTexture
	{
		private var _isReady:Boolean = false;
		private var _texture:TextureBase;
		private var _isDispose:Boolean = false;
		private var _isDisposeTexture:Boolean = false;
		private var _atfData:AsyncAtfData;
		
		public function AsyncStarlingTexture(byteArray:ByteArray, path:String, autoRecycleEnable:Boolean, isAsync:Boolean)
		{
			var asyncAtfData:AsyncAtfData = new AsyncAtfData(byteArray);
			super(false, false, asyncAtfData.hasAlpha, false);
			
			url = path;
			this.atfData = asyncAtfData;
			this.autoRecycleEnable = autoRecycleEnable;
			this.autoRecycleDataEnable = false;
		}
		
		public function get isDefaultTexture():Boolean
		{
			return !_isReady;
		}
		
		public function get isReady():Boolean
		{
			if (!_isReady && !_texture)
			{
				var stage3DProxy:Stage3DProxy = Starling.current.stage3DProxy;
				//避免锁屏恢复刚好加载完资源创建createTexture
				if (stage3DProxy && stage3DProxy.driverInfo == "Disposed")
					return false;
				getTextureForStage3D(stage3DProxy);
			}
			return _isReady;
		}
		
		override public function get atfData():ATFData
		{
			return _atfData;
		}
		
		public function set atfData(value:ATFData):void
		{
			_atfData = value as AsyncAtfData;
			_compressed = _atfData.compressed;
			_hasAlpha = _atfData.hasAlpha;
			_hasMipmaps = false;
			this.textureData = _atfData;
		}
		
		override protected function createTexture(stage3DProxy:Stage3DProxy):TextureBase
		{
			_isDisposeTexture = _isReady = false;
			_texture = super.createTexture(stage3DProxy);
			if (_atfData.async)
				_texture.addEventListener(Event.TEXTURE_READY, onTextureReady);
			else
				onTextureReady(null);
			return _texture;
		}
		
		protected function onTextureReady(event:Event):void
		{
			if (_texture)
			{
				if (event)
					_texture.removeEventListener(Event.TEXTURE_READY, onTextureReady);
				_isReady = true;
				if (_isDispose)
				{
					disposeTexture();
				}
				else if (_isDisposeTexture)
				{
					invalidateTexture();
				}
				dispatchEventWith(Event.TEXTURE_READY);
			}
		}
		
		override protected function uploadContent(texture:TextureBase):void
		{
			_isReady = !_atfData.async;
			try
			{
				super.uploadContent(texture);
			}
			catch(e:Error)
			{
				trace("zatf贴图上传出错：", url, e.message);
			}
		}
		
		override public function invalidateContent():void
		{
			if (_texture) 
			{
				_isDisposeTexture = !_isReady;
				if (_isReady)
				{
					invalidateTexture();
				}
			}
		}
		
		/** 仅释放显存  */
		private function invalidateTexture():void
		{
			super.invalidateContent();
			_texture = null;
			_isReady = false;
		}
		
		/** 释放Texture对象  */
		private function disposeTexture():void
		{
			super.dispose();
			_texture = null;
			_isReady = false;
		}
		
		override public function dispose():void
		{
			_isDispose = true;
			_isDisposeTexture = true;
			if (_isReady){
				disposeTexture();
			}
			_atfData = null;
		}
	}
}



