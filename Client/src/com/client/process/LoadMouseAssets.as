package com.client.process
{
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;
	
	public class LoadMouseAssets extends BaseProcess 
	{
		
		private static const MOUSE_ASSETS:String = "mouse";
		
		private var _url:String;
		
		
		override public function getState():String
		{
			return "STATE_LOAD_MOUSE_ASSETS";
		}
		
		override public function startProcess():void
		{
//			if (ClientConfig.debugParams == "process_stop_5")
//			{
//				return;
//			}
			super.startProcess();
//			LoginSender.loadProgress(21);
			_url = ClientConfig.getUI("mouse", "");
			GameLog.addShow("开始加载鼠标资源...", _url);
			var loader:ThemeLoader = new ThemeLoader();
			loader.load(_url, onFinish, onPorgress, onResError);
		}
		
		override public function switchMaster():void
		{
			super.switchMaster();
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "正在加载鼠标资源...";
		}
		
		private function onPorgress(currPercent:Number):void
		{
			setProcessPercent(currPercent);
		}
		
		override public function processHandler(percent:Number):void
		{
			ResLoadingView.instance.percent = percent;
		}
		
		private function onFinish(loader:ThemeLoader):void
		{
			GameLog.addShow("公共UI素材加载完成...");
//			LoginSender.loadProgress(22);
			completeProcess();
		}
		
		private function onResError(ld:MultiLoadData, e:Event):void
		{
			ResLoadingView.instance.title = "鼠标资源加载错误：" + _url;
			GameLog.addShow("鼠标资源加载错误：" + _url);
		}
		
		override public function dispose():void
		{
			_url = null;
			super.dispose();
		}
	}
}