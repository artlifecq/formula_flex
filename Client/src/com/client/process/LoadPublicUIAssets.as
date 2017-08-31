package com.client.process
{
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.statistics.Statistics;
	
	import flash.events.Event;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeBatchLoader;

	/**
	 *
	 * 加载游戏公共UI资源
	 * @author wewell@163.com
	 *
	 */
	public class LoadPublicUIAssets extends BaseProcess
	{
		private static const UI_ASSETS : String = "theme";
		private static const UI_AlphaPng:String = "alphapng.png";
		private static const ART_TXT:String = "art_txt";

		private var _url : String;

		public function LoadPublicUIAssets()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_LOAD_PUBLIC_UI_ASSETS;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			_url = ClientConfig.getUI(UI_ASSETS);
			GameLog.addShow("开始加载公共UI素材...", _url);

//			var loader : ThemeLoader = new ThemeLoader();
//			loader.load(_url, loadAplahaPNg, onProgress, onResError);
			
			var loader:ThemeBatchLoader = new ThemeBatchLoader();
			loader.loadBatch([_url, ClientConfig.getUI(UI_AlphaPng),ClientConfig.getUI(ART_TXT)], onFinish, onProgress, onResError);
		}
		
		override public function switchMaster():void
		{
			super.switchMaster();
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "正在加载公共UI素材...";
		}
		
		private function onProgress(progress:Number) : void
		{
			//			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(progress);
		}

		override public function processHandler(percent : Number) : void
		{
			ResLoadingView.instance.percent = percent;
		}

		private function onFinish() : void
		{
			GameLog.addShow("公共UI素材加载完成...");
			completeProcess();
			Statistics.intance.pushNode(Statistics.STEP_PUBLIC_UI,"公共ui加载成功");
		}

		private function onResError(ld : MultiLoadData, e : Event) : void
		{
			ResLoadingView.instance.title = "公共UI素材加载错误：" + _url;
			GameLog.addShow("公共UI素材加载错误：" + _url);
		}

		override public function dispose() : void
		{
			_url = null;
			super.dispose();
		}
	}
}
