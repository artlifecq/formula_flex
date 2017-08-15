package com.game.engine3D.vo
{
	import com.game.engine3D.config.GlobalConfig;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display3D.Context3DTextureFormat;
	import flash.events.IOErrorEvent;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	import away3d.enum.LoadPriorityType;
	import away3d.events.Event;
	import away3d.loaders.multi.MultiLoadData;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.loaders.multi.MultiUrlLoader;
	import away3d.utils.GCObject;
	
	import starling.textures.ConcreteTexture;
	import starling.textures.IStarlingTexture;
	import starling.textures.SubTexture;
	import starling.textures.TextureFactory;

	/**
	 *
	 * 地图贴图加载器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-5-13 下午1:26:38
	 *
	 */
	public class MapTextureLoader extends GCObject
	{
		private var _url : String = null;
		private var _bitmapData : BitmapData = null;
		private var _loader : Loader = null;
		private var _concreteTexture : IStarlingTexture = null;
		private var _subTexture : IStarlingTexture = null;
		private var _textureRect : Rectangle = null;
		private var _completeFuncSet : Vector.<Function>;
		private var _errorFuncSet : Vector.<Function>;
		private var _isLoading : Boolean = false;
		private var _useBitmapData : Boolean = false;

		public function MapTextureLoader(useBitmapData : Boolean = false)
		{
			_useBitmapData = useBitmapData;
			_completeFuncSet = new Vector.<Function>();
			_errorFuncSet = new Vector.<Function>();
		}

		public function load(url : String, rect : Rectangle = null) : void
		{
			if (!url)
				return;
			_isLoading = true;
			_url = url;
			_textureRect = rect;
			if (_useBitmapData)
			{
				var ld : MultiLoadData = new MultiLoadData(_url, onComplete, null, onError, "", "", LoadPriorityType.LEVEL_NORMALMAP, MultiLoadData.URLLOADER_BINARY, GlobalConfig.decode);
				MultiUrlLoadManager.load(ld);
			}
			else
			{
				_concreteTexture = TextureFactory.fromUrl(_url, false, false, Context3DTextureFormat.COMPRESSED_ALPHA) as ConcreteTexture;
				_concreteTexture.addEventListener(away3d.events.Event.COMPLETE, onCompleteHandler);
			}
		}

		private function onComplete(ld : MultiLoadData, e : flash.events.Event) : void
		{
			var bytes : ByteArray = (e.target as MultiUrlLoader).data;
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoaderComplete);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoaderIOError);
			_loader.loadBytes(bytes);
		}

		private function onLoaderComplete(event : flash.events.Event) : void
		{
			_loader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, onLoaderComplete);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoaderIOError);

			_bitmapData = Bitmap(_loader.content).bitmapData;
			for each (var handler : Function in _completeFuncSet)
			{
				handler(this);
			}
			_completeFuncSet.length = 0;
			_errorFuncSet.length = 0;
			_isLoading = false;
		}

		private function onLoaderIOError(event : IOErrorEvent) : void
		{
			_loader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, onLoaderComplete);
			_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoaderIOError);
			onErrorHandler();
		}

		private function onError(ld : MultiLoadData, e : flash.events.Event) : void
		{
			onErrorHandler();
		}

		private function onCompleteHandler(e : away3d.events.Event) : void
		{
			_concreteTexture.removeEventListener(away3d.events.Event.COMPLETE, onCompleteHandler);
			if (_textureRect)
			{
				_subTexture = new SubTexture(_concreteTexture, _textureRect);

				for each (var handler : Function in _completeFuncSet)
				{
					handler(this);
				}
				_completeFuncSet.length = 0;
				_errorFuncSet.length = 0;
			}
			else
			{
				onErrorHandler();
			}
			_isLoading = false;
		}

		private function onErrorHandler() : void
		{
			for each (var handler : Function in _errorFuncSet)
			{
				handler(this);
			}
			_completeFuncSet.length = 0;
			_errorFuncSet.length = 0;
			_isLoading = false;
		}

		public function get isLoading() : Boolean
		{
			return _isLoading;
		}

		public function get isLoaded() : Boolean
		{
			return _bitmapData || _subTexture;
		}

		public function get subTexture() : IStarlingTexture
		{
			return _subTexture;
		}

		public function get bitmapData() : BitmapData
		{
			return _bitmapData;
		}

		public function addCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _completeFuncSet.indexOf(handler);
			if (index < 0)
			{
				_completeFuncSet.push(handler);
			}
		}

		public function removeCompleteHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _completeFuncSet.indexOf(handler);
			if (index > -1)
			{
				_completeFuncSet.splice(index, 1);
			}
		}

		public function addErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _errorFuncSet.indexOf(handler);
			if (index < 0)
			{
				_errorFuncSet.push(handler);
			}
		}

		public function removeErrorHandler(handler : Function) : void
		{
			if (handler == null)
				return;
			var index : int = _errorFuncSet.indexOf(handler);
			if (index > -1)
			{
				_errorFuncSet.splice(index, 1);
			}
		}

		private function unload() : void
		{
			if (_bitmapData)
			{
				_bitmapData.dispose();
				_bitmapData = null;
			}
			if (_subTexture)
			{
				_subTexture.dispose();
				_subTexture = null;
			}
			_textureRect = null;
			if (_concreteTexture)
			{
				_concreteTexture.removeEventListener(away3d.events.Event.COMPLETE, onCompleteHandler);
				_concreteTexture.dispose();
				_concreteTexture = null;
			}
			if (_url)
			{
				if (_useBitmapData)
				{
					MultiUrlLoadManager.cancelLoadByUrl(_url);
				}
				_url = null;
			}
			if (_loader)
			{
				_loader.contentLoaderInfo.removeEventListener(flash.events.Event.COMPLETE, onLoaderComplete);
				_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoaderIOError);
				_loader.unloadAndStop(false);
				_loader = null;
			}
			_completeFuncSet.length = 0;
			_errorFuncSet.length = 0;
			_isLoading = false;
		}

		public function destroy() : void
		{
			unload();
			_useBitmapData = false;
			_completeFuncSet = null;
			_errorFuncSet = null;
		}
	}
}
