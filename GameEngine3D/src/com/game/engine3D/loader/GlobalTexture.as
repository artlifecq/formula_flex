package com.game.engine3D.loader
{
	import com.game.engine3D.utils.CallBackUtil;
	import com.game.engine3D.vo.CallBackData;
	
	import flash.utils.Dictionary;
	
	import away3d.Away3D;
	import away3d.events.AssetEvent;
	import away3d.events.Event;
	import away3d.events.LoaderEvent;
	import away3d.library.assets.AssetType;
	import away3d.textures.AsyncTexture2D;
	import away3d.tools.utils.TextureUtils;
	import away3d.utils.GCObject;
	
	/**
	 *
	 * 全局贴图
	 * @author L.L.M.Sunny
	 * 创建时间：2015-10-09 下午4:05:12
	 *
	 */
	public class GlobalTexture extends GCObject
	{
		private static var globalTextureByUrl : Dictionary = new Dictionary();
		
		public static function addTexture(url : String, priority : int = 0, onComplete : Function = null, ... onCompleteArgs) : void
		{
			var globalTexture : GlobalTexture = globalTextureByUrl[url];
			if (globalTexture)
			{
				if (onComplete != null)
				{
					if (globalTexture.isLoaded)
						onComplete.apply(null, onCompleteArgs.concat(globalTexture));
					else
						globalTexture.setLoadCompleteCallBack(onComplete, onCompleteArgs);
				}
			}
			else
			{
				globalTexture = new GlobalTexture();
				globalTextureByUrl[url] = globalTexture;
				if (onComplete != null)
				{
					globalTexture.setLoadCompleteCallBack(onComplete, onCompleteArgs);
				}
				globalTexture.load(url, priority);
			}
		}
		
		public static function removeTextureCallBack(url : String, onComplete : Function) : void
		{
			var globalTexture : GlobalTexture = globalTextureByUrl[url];
			if (globalTexture)
				globalTexture.removeLoadCompleteCallBack(onComplete);
		}
		
		private var _url : String;
		private var _isLoaded : Boolean;
		private var _texture : AsyncTexture2D;
		private var _loadCompleteCallBackList : Vector.<CallBackData>;
		
		public function GlobalTexture()
		{
			_loadCompleteCallBackList = new Vector.<CallBackData>();
		}
		
		public function load(url : String, priority : int = 0) : void
		{
			if (_url == url)
				return;
			_url = url;
			
			_texture = new AsyncTexture2D(TextureUtils.checkHasAlphaFromUrl(url));
			_texture.addEventListener(away3d.events.Event.COMPLETE, onResourceComplete);
			_texture.load(Away3D.USE_ATF_FOR_TEXTURES ? (_url + ".atf") : _url, priority);
		}
		
		public function get isLoaded() : Boolean
		{
			return _isLoaded;
		}
		
		private function onTextureAssetComplete(e : AssetEvent) : void
		{
			if (e.asset.assetType == AssetType.TEXTURE)
				_texture = e.asset as AsyncTexture2D;
		}
		
		private function onResourceComplete(e : away3d.events.Event) : void
		{
			removeLoaderEvents();
			onLoadComplete();
		}
		
		private function removeLoaderEvents() : void
		{
			if (!_texture)
				return;
			_texture.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
		}
		
		public function unload() : void
		{
			removeLoaderEvents();
			if (_texture)
			{
				_texture.dispose();
				_texture = null;
			}
			_isLoaded = false;
			_url = null;
			_loadCompleteCallBackList.length = 0;
		}
		
		public function get texture() : AsyncTexture2D
		{
			return _texture;
		}
		
		public function get url() : String
		{
			return _url;
		}
		
		public function setLoadCompleteCallBack(value : Function, args : Array) : void
		{
			CallBackUtil.addCallBackData(_loadCompleteCallBackList, value, args);
		}
		
		public function removeLoadCompleteCallBack(value : Function) : void
		{
			CallBackUtil.removeCallBackData(_loadCompleteCallBackList, value);
		}
		
		private function onLoadComplete() : void
		{
			_isLoaded = true;
			CallBackUtil.exceteCallBackData(this, _loadCompleteCallBackList);
			_loadCompleteCallBackList.length = 0;
		}
		
		public function dispose() : void
		{
			unload();
		}
	}
}
