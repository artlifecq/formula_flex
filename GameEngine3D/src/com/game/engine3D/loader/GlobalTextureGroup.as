package com.game.engine3D.loader
{
	import com.game.engine3D.utils.CallBackUtil;
	import com.game.engine3D.vo.CallBackData;

	import flash.utils.Dictionary;

	import org.client.mainCore.utils.ArrayUtil;

	/**
	 *
	 * 全局贴图组
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-17 上午10:05:12
	 *
	 */
	public class GlobalTextureGroup
	{
		private static var globalTextureGroupByUrls : Dictionary = new Dictionary();

		public static function addTextureGroup(urls : Array, onComplete : Function, ... onCompleteArgs) : void
		{
			var groupUrls : String = urls.join("_");
			var globalTextureGroup : GlobalTextureGroup = globalTextureGroupByUrls[groupUrls];
			if (globalTextureGroup)
			{
				if (globalTextureGroup.isLoaded)
					onComplete.apply(null, onCompleteArgs.concat(globalTextureGroup));
				else
					globalTextureGroup.setLoadCompleteCallBack(onComplete, onCompleteArgs);
			}
			else
			{
				globalTextureGroup = new GlobalTextureGroup();
				globalTextureGroupByUrls[groupUrls] = globalTextureGroup;
				globalTextureGroup.setLoadCompleteCallBack(onComplete, onCompleteArgs);
				globalTextureGroup.load(urls);
			}
		}

		public static function removeGroupTextureCallBack(urls : Array, onComplete : Function) : void
		{
			var groupUrls : String = urls.join("_");
			var globalTextureGroup : GlobalTextureGroup = globalTextureGroupByUrls[groupUrls];
			if (globalTextureGroup)
				globalTextureGroup.removeLoadCompleteCallBack(onComplete);
		}

		private var _isLoaded : Boolean;
		private var _textureByUrl : Dictionary;
		private var _urls : Array;
		private var _surplusUrls : Array;
		private var _loadCompleteCallBackList : Vector.<CallBackData>;

		public function GlobalTextureGroup()
		{
			_loadCompleteCallBackList = new Vector.<CallBackData>();
		}

		public function get isLoaded() : Boolean
		{
			return _isLoaded;
		}

		public function load(urls : Array, useAssetLoader : Boolean = true) : void
		{
			if (!urls)
			{
				return;
			}
			if (_urls && urls)
			{
				if (ArrayUtil.arraysAreEqual(_urls, urls))
					return;
			}
			_urls = urls;
			_textureByUrl = new Dictionary(true);
			_surplusUrls = _urls.slice();
			for each (var url : String in _urls)
			{
				GlobalTexture.addTexture(url, onTextureComplete);
			}
		}

		private function onTextureComplete(globalTexture : GlobalTexture) : void
		{
			GlobalTexture.removeTextureCallBack(globalTexture.url, onTextureComplete);
			var index : int = _surplusUrls.indexOf(globalTexture.url);
			if (index > -1)
			{
				_surplusUrls.splice(index, 1);
			}
			_textureByUrl[globalTexture.url] = globalTexture;
			if (_surplusUrls.length == 0)
			{
				onLoadComplete();
			}
		}

		public function unload() : void
		{
			_isLoaded = false;
			if (_urls)
			{
				for each (var url : String in _urls)
				{
					GlobalTexture.removeTextureCallBack(url, onTextureComplete);
				}
				_urls.length = 0;
				_urls = null;
			}
			if (_surplusUrls)
			{
				_surplusUrls.length = 0;
				_surplusUrls = null;
			}
			_textureByUrl = null;
			_loadCompleteCallBackList.length = 0;
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

		public function getTexture(url : String) : GlobalTexture
		{
			if (_textureByUrl)
			{
				return _textureByUrl[url];
			}
			return null;
		}

		public function dispose() : void
		{
			unload();
		}
	}
}
