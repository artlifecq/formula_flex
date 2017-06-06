package com.client.process
{
	import com.client.events.VerEvent;
	import com.client.loader.ListStreamLoader;
	import com.client.manager.BGMManager;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TextEvent;

	/**
	 *
	 * 加载代码库
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午8:00:08
	 *
	 */
	public class LoadDll extends BaseProcess
	{
		private var _listLoader : ListStreamLoader;

		public function LoadDll()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_LOAD_DLL;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			BGMManager.playMusic("Music/music_start2");
			loadDLL();
		}

		//--------------------------------------------------------------
		// 加载DLL
		//--------------------------------------------------------------
		private function loadDLL() : void
		{
			var urlList : Vector.<String> = new Vector.<String>;
			var url : String = "entry/GameClientDll.swf";
			if (ClientConfig.isRelease && ClientConfig.decodeFun != null)
				url = url.replace(".swf", ".ml");
			if (ClientConfig.useVersion)
				url = url.replace("entry", "version" + ClientConfig.version);

			urlList.push(url);
			_listLoader = new ListStreamLoader(ClientConfig.stage);
			_listLoader.addEventListener(Event.OPEN, onDLLOpen);
			_listLoader.addEventListener(ProgressEvent.PROGRESS, onLoadingProgress);
			_listLoader.addEventListener(Event.COMPLETE, onDLLComplete);
			_listLoader.doLoad(ClientConfig.baseDir, urlList, ClientConfig.useVersion, ClientConfig.decodeFun != null);
			//
			GameLog.addShow("加载代码库 : " + ClientConfig.baseDir);
		}

		private function onDLLOpen(e : TextEvent) : void
		{
		}

		private function onDLLComplete(e : Event) : void
		{
			GameLog.addShow("加载代码库完成...");
			completeProcess();
		}

		private function onLoadingProgress(e : ProgressEvent) : void
		{
			if (e.bytesTotal == 0 || isNaN(e.bytesTotal))
			{
				return;
			}
			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(currPercent);
		}

		override public function processHandler(percent : Number) : void
		{
			var isHangUp : Boolean = ProcessStateMachine.getInstance().preProcessIsHangUp(ProcessState.STATE_LOAD_DLL);
			if (!isHangUp)
			{
				ResLoadingView.instance.percent = percent;
			}
		}

		private function onVerSizeError(e : VerEvent) : void
		{
			execErrorVersionProc();
		}

		private function execErrorVersionProc() : void
		{
			//			SO.addSOver();
		}

		override public function dispose() : void
		{
			if (_listLoader)
			{
				_listLoader.removeEventListener(Event.OPEN, onDLLOpen);
				_listLoader.removeEventListener(VerEvent.SIZE_ERROR, onVerSizeError);
				_listLoader.removeEventListener(ProgressEvent.PROGRESS, onLoadingProgress);
				_listLoader.removeEventListener(Event.COMPLETE, onDLLComplete);
				_listLoader = null;
			}
			super.dispose();
		}
	}
}
