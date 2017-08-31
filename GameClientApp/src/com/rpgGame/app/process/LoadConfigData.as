package com.rpgGame.app.process
{
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.data.ConfigManager;
	import com.rpgGame.app.ui.ResLoadingView;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.statistics.Statistics;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	/**
	 *
	 * 加载配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-3 下午2:38:35
	 *
	 */
	public class LoadConfigData extends BaseProcess
	{
		private var _stream : URLStream;

		public function LoadConfigData()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_LOAD_CONFIG_DATA;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			GameLog.addShow("开始加载配置文件..." + ClientConfig.getConfigDataUrl());
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "正在加载配置文件...";
			_stream = new URLStream();
			_stream.addEventListener(Event.COMPLETE, onLangTextComplete);
			_stream.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_stream.addEventListener(ProgressEvent.PROGRESS, onLoaderPorgress);
			_stream.load(new URLRequest(ClientConfig.getConfigDataUrl()));
		}

		private function onLangTextComplete(event : Event) : void
		{
			GameLog.addShow("加载配置文件完成...");
			var byteArray : ByteArray = new ByteArray();
			_stream.readBytes(byteArray);
			if (ClientConfig.decode != null)
			{
				byteArray = ClientConfig.decode(byteArray)
			}
			byteArray.uncompress();
			ConfigManager.recClientConfig(byteArray.readObject());
			_stream.close();
			_stream = null;
			Statistics.intance.pushNode(Statistics.STEP_LOAD_CONFIG,"加载游戏配置成功");
			completeProcess();
		}

		override public function processHandler(percent : Number) : void
		{
			ResLoadingView.instance.percent = percent;
		}

		private function onIoError(e : IOErrorEvent) : void
		{
			GameLog.addError(e.text);
		}

		private function onLoaderPorgress(e : ProgressEvent) : void
		{
			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(currPercent);
		}

		override public function dispose() : void
		{
			if (_stream)
			{
				_stream.close();
				_stream = null;
			}
			super.dispose();
		}
	}
}
