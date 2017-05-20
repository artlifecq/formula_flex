package com.client.view
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class KernelAlert2D 
	{
		
		private static var _okFunc:Function;
		private static var _kernelAlert2D:MovieClip;
		
		
		public static function show(okFunc:Function):void
		{
			var skinCls:Class = null;
			_okFunc = okFunc;
			if (!_kernelAlert2D)
			{
				skinCls = (TipsInfoView2D.getDefinitionByName("KernelAlert2DSkin") as Class);
				_kernelAlert2D = new skinCls();
			}
			SimpleButton(_kernelAlert2D.btnClose).addEventListener("click", onOkClick);
			SimpleButton(_kernelAlert2D.btnDownload).addEventListener("click", onDownloadClick);
			Stage3DLayerManager.stage.addChild(_kernelAlert2D);
			Stage3DLayerManager.stage.addEventListener("resize", onResize);
			onResize();
		}
		
		private static function onResize(e:Event=null):void
		{
			if (_kernelAlert2D && _kernelAlert2D.stage)
			{
				_kernelAlert2D.x = (_kernelAlert2D.stage.stageWidth - _kernelAlert2D.width) * 0.5;
				_kernelAlert2D.y = (_kernelAlert2D.stage.stageHeight - _kernelAlert2D.height) * 0.5;
			}
		}
		
		private static function onOkClick(e:MouseEvent):void
		{
			hide();
			if (_okFunc != null)
			{
				_okFunc();
			}
		}
		
		private static function onDownloadClick(e:MouseEvent):void
		{
			if (ClientConfig.miniDownloadUrl)
			{
				navigateToURL(new URLRequest(ClientConfig.miniDownloadUrl), "_blank");
			}
		}
		
		private static function hide():void
		{
			Stage3DLayerManager.stage.removeEventListener("resize", onResize);
			if (_kernelAlert2D)
			{
				SimpleButton(_kernelAlert2D.btnClose).removeEventListener("click", onOkClick);
				SimpleButton(_kernelAlert2D.btnDownload).removeEventListener("click", onDownloadClick);
				if (_kernelAlert2D.parent)
				{
					_kernelAlert2D.parent.removeChild(_kernelAlert2D);
				}
			}
		}	
	}
}