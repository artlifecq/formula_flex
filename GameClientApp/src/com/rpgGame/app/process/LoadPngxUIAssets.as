package com.rpgGame.app.process
{
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.ui.ResLoadingView;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;

	/**
	 *
	 * 加载游戏公共UI资源
	 * @author wewell@163.com
	 *
	 */
	public class LoadPngxUIAssets extends BaseProcess
	{
		private static const UI_ASSETS : String = "pngx";

		private var _url : String;

		public function LoadPngxUIAssets()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_LOAD_PNGX_UI_ASSETS;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			_url = ClientConfig.getUI(UI_ASSETS + ".png.bpg"); //需要获取位图数据，都用bpg。@L.L.M.Sunny
			GameLog.addShow("开始加载公共UI素材...", _url);
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "正在加载公共UI素材...";

			var loader : ThemeLoader = new ThemeLoader();
			loader.load(_url, onFinish, onProgress, onResError);
		}

		private function onProgress(progress:Number) : void
		{
			//			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(progress);
		}

		private function onResError(ld : MultiLoadData, e : Event) : void
		{
			ResLoadingView.instance.title = "公共UI素材加载错误：" + _url;
			GameLog.addShow("公共UI素材加载错误：" + _url);
		}

		override public function processHandler(percent : Number) : void
		{
			ResLoadingView.instance.percent = percent;
		}

		private function onFinish(loader : ThemeLoader) : void
		{
			GameLog.addShow("公共UI素材加载完成...");
			completeProcess();
		}

		override public function dispose() : void
		{
			_url = null;
			super.dispose();
		}
	}
}
