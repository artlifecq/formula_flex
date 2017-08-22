package com.client.process
{
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.RandomNick;
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 *
	 * 加载屏蔽字库
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午5:12:26
	 *
	 */
	public class LoadMaskWorld extends BaseProcess
	{
		private var _stream : URLStream;

		public function LoadMaskWorld()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_LOAD_MASK_WORLD;
		}

		/**
		 * 屏蔽字库需要提前加载,
		 * 创建角色的地方会用到
		 *
		 */
		override public function startProcess() : void
		{
			super.startProcess();
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "加载基础配置...";

			GameLog.addShow("加载屏蔽字库 : " + ClientConfig.getLangUrl());
			_stream = new URLStream();
			_stream.addEventListener(Event.COMPLETE, onLangTextComplete);
			_stream.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_stream.addEventListener(ProgressEvent.PROGRESS, onMaxkWorldResProgress);
			_stream.load(new URLRequest(ClientConfig.getLangUrl()));
		}

		protected function onLangTextComplete(event : Event) : void
		{
			GameLog.addShow("加载屏蔽字库完成...");
			var byteArray : ByteArray = new ByteArray();
			_stream.readBytes(byteArray);
			if (ClientConfig.isRelease && ClientConfig.decodeFun != null)
			{
				byteArray = ClientConfig.decodeFun(byteArray);
			}
			byteArray.uncompress();
			var config : Dictionary = byteArray.readObject();
			ClientConfig.maskWorldDic = config;
            LanguageConfig.parseData(config);
			var lang : Object = config["MASK_WORLD"];
			StringFilter.init(lang ? lang.value : "");
			_stream.close();
			_stream = null;
			
			//注册随机名信息
			lang = config["PLAYER_LAST_NAME"];
			var lastNameStr : String = lang ? lang.value : "";
			lang = config["SYMBOL_NAME"];
			var flagNameStr : String = lang ? lang.value : "";
			lang = config["MALE_NAME"];
			var maleNameStr : String = lang ? lang.value : "";
			lang = config["FEMALE_NAME"];
			var femaleNameStr : String = lang ? lang.value : "";
			
			RandomNick.setup(lastNameStr.split(","), flagNameStr.split(","), maleNameStr.split(","), femaleNameStr.split(","));

			completeProcess();
		}

		override public function processHandler(percent : Number) : void
		{
			ResLoadingView.instance.percent = percent;
		}

		private function onMaxkWorldResProgress(e : ProgressEvent) : void
		{
			if (e.bytesTotal == 0 || isNaN(e.bytesTotal))
			{
				return;
			}
			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(currPercent);
		}

		private function onIoError(e : IOErrorEvent) : void
		{
			ResLoadingView.instance.title = "屏蔽字库加载错误：" + ClientConfig.getLangUrl();
			GameLog.addShow("屏蔽字库加载错误：" + ClientConfig.getLangUrl());
		}

		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
