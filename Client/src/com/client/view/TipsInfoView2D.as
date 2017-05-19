package com.client.view
{
	import com.client.loader.ListStreamLoader;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import starling.display.Sprite;
	
	public class TipsInfoView2D 
	{
		
		private static var _listLoader:ListStreamLoader;
		private static var _loadingStream:URLStream;
		private static var _loader:Loader;
		private static var _isLoaded:Boolean = false;
		private static var _showAlert2DData:Object;
		private static var _showKernelAlert2DData:Object;
		private static var _url:String;
		
		
		private static function loadviewRes():void
		{
			if (_loadingStream)
			{
				return;
			}
			_url = ClientConfig.baseDir + ClientConfig.resURL + "view2D/TipsInfoView.swf";
			_url = VersionUtils.getVersionPath(_url);
			_loadingStream = new URLStream();
			_loadingStream.addEventListener("complete", onClientLoadCmp);
			_loadingStream.addEventListener("ioError", onClientIoError);
			_loadingStream.addEventListener("progress", onClientLoadingPrg);
			_loadingStream.load(new URLRequest(_url));
		}
		
		private static function onClientLoadCmp(event:Event):void
		{
			_loadingStream = (event.currentTarget as URLStream);
			_loadingStream.removeEventListener("complete", onClientLoadCmp);
			_loadingStream.removeEventListener("ioError", onClientIoError);
			_loadingStream.removeEventListener("progress", onClientLoadingPrg);
			var data:ByteArray = new ByteArray();
			_loadingStream.readBytes(data, 0, _loadingStream.bytesAvailable);
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener("complete", onClientLoaded);
			_loader.contentLoaderInfo.addEventListener("ioError", onIoError);
			var swfContext:LoaderContext = new LoaderContext();
			swfContext.allowCodeImport = true;
			_loader.loadBytes(data, swfContext);
			_loadingStream.close();
			_loadingStream = null;
		}
		
		private static function onClientLoadingPrg(event:ProgressEvent):void
		{
		}
		
		private static function onClientIoError(event:IOErrorEvent):void
		{
			trace("加载错误...", _url);
		}
		
		private static function onIoError(event:IOErrorEvent):void
		{
			trace("解析错误...");
		}
		
		private static function onClientLoaded(event:Event):void
		{
			var loadInfo:LoaderInfo = (event.currentTarget as LoaderInfo);
			loadInfo.removeEventListener("complete", onClientLoaded);
			loadInfo.removeEventListener("ioError", onIoError);
			_isLoaded = true;
			doShowView();
		}
		
		public static function getDefinitionByName(name:String):Object
		{
			return _loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
		}
		
		private static function doShowView():void
		{
			if (_showAlert2DData)
			{
				GameAlert2D.show(_showAlert2DData.info, onGameAlert2DOkFunc);
			}
			if (_showKernelAlert2DData)
			{
				KernelAlert2D.show(onKernelAlert2DOkFunc);
			}
			updateStarlingLayerState();
		}
		
		public static function showAlert2D(info:String, okFunc:Function=null):void
		{
			_showAlert2DData = {
				"info":info,
				"okFunc":okFunc
			}
			loadviewRes();
			if (_isLoaded)
			{
				GameAlert2D.show(_showAlert2DData.info, onGameAlert2DOkFunc);
				updateStarlingLayerState();
			}
		}
		
		private static function onGameAlert2DOkFunc():void
		{
			var okFunc:Function;
			if (_showAlert2DData)
			{
				okFunc = _showAlert2DData.okFunc;
				_showAlert2DData = null;
			}
			updateStarlingLayerState();
			if (okFunc != null)
			{
				okFunc();
				okFunc = null;
			}
		}
		
		public static function showKernelAlert2D():void
		{
			_showKernelAlert2DData = {};
			loadviewRes();
			if (_isLoaded)
			{
				KernelAlert2D.show(onKernelAlert2DOkFunc);
				updateStarlingLayerState();
			}
		}
		
		private static function onKernelAlert2DOkFunc():void
		{
			_showKernelAlert2DData = null;
			updateStarlingLayerState();
		}
		
		private static function updateStarlingLayerState():void
		{
			var loginPanel:Sprite = Stage3DLayerManager.starlingLayer ? Stage3DLayerManager.starlingLayer.getLayer("login") : null;
			if (!loginPanel)
			{
				return;
			}
			if (_showAlert2DData || _showKernelAlert2DData)
			{
				loginPanel.touchable = false;
			}
			else
			{
				loginPanel.touchable = true;
			}
		}	
	}
}