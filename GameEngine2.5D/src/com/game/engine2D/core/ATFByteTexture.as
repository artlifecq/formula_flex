package com.game.engine2D.core
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.display3D.textures.TextureBase;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import away3d.core.managers.Stage3DProxy;
	import away3d.textures.Texture2DBase;
	
	/**
	 * atf资源异步解析 
	 * @author guoqing.wen
	 * 
	 */
	public class ATFByteTexture extends Texture2DBase
	{
		private var _isReady:Boolean = false;
		private var _texture:TextureBase;
		private var _isDispose:Boolean = false;
		private var _isDisposeTexture:Boolean = false;
		private var _atfData:ATFByteData;
		private var _path:String;
		
		public function ATFByteTexture(byteArray:ByteArray, path:String, autoRecycleEnable:Boolean, isAsync:Boolean)
		{
			super();
			_path = path;
			var atfByteData:ATFByteData = new ATFByteData(byteArray);
			atfByteData.isAsync = isAsync;
			this.atfData = atfByteData;
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
				var stage3DProxy:Stage3DProxy = Stage3DLayerManager.stage3DProxy;
				//避免锁屏恢复刚好加载完资源创建createTexture
				if (stage3DProxy && stage3DProxy.driverInfo == "Disposed")
					return false;
				getTextureForStage3D(stage3DProxy);
			}
			return _isReady;
		}

		public function get atfData():ATFByteData
		{
			return _atfData;
		}
		
		public function set atfData(value:ATFByteData):void
		{
			_atfData = value;
			_compressed = _atfData.compressed;
			_hasAlpha = _atfData.hasAlpha;
			_hasMipmaps = false;
			this.textureData = _atfData;
		}
		
		override protected function createTexture(stage3DProxy:Stage3DProxy):TextureBase
		{
			_isDisposeTexture = _isReady = false;
			_texture = super.createTexture(stage3DProxy);
			if (_atfData.isAsync)
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
			}
		}
		
		override protected function uploadContent(texture:TextureBase):void
		{
			_isReady = !_atfData.isAsync;
			try
			{
				super.uploadContent(texture);
			}
			catch(e:Error)
			{
				trace("zatf贴图上传出错：",_path, e.message);
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