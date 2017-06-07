package com.client.process
{
	import com.client.EngineSetting;
	import com.client.view.SelectDeveloperView;
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	/**
	 *
	 * 选择服务器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午3:45:32
	 *
	 */
	public class SelectDeveloper extends BaseProcess
	{
		private var _devView : SelectDeveloperView;
		private var _version:String;

		public function SelectDeveloper()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_SELECT_DEVELOPER;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			_devView = new SelectDeveloperView(onSelectDev);
			_devView.x = (ClientConfig.stage.stageWidth - _devView.width) * 0.5;
			_devView.y = (ClientConfig.stage.stageHeight - _devView.height) * 0.5;
			ClientConfig.stage.addChild(_devView);
		}

		private function onSelectDev(ip : String, port : String, version:String="") : void
		{
			ClientConfig.loginIP = ip;
			ClientConfig.loginPort = uint(port);

			//atf测试下
			ClientConfig.useBpgFormat = false;
			ClientConfig.useAtfFormat = true;
//			EngineSetting.initAway3D();
			
			completeProcess();
			
//			if (!ClientConfig.isRelease && version)
//			{
//				_version = version;
//				var versionUrl:String = "version" + _version + "/version.swf";
//				var urlStream:URLStream = new URLStream();
//				urlStream.addEventListener("complete", onVersionCmp);
//				urlStream.addEventListener("ioError", onVersionIoError);
//				versionUrl = ClientConfig.baseDir + versionUrl;
//				urlStream.load(new URLRequest(versionUrl));
//			}
//			else
//			{
//				completeProcess();
//			}
		}
		
		private function onVersionCmp(event:Event):void
		{
			var urlStream:URLStream = (event.currentTarget as URLStream);
			urlStream.removeEventListener("complete", onVersionCmp);
			urlStream.removeEventListener("ioError", onVersionIoError);
			var by:ByteArray = new ByteArray();
			urlStream.readBytes(by, 0, urlStream.bytesAvailable);
			by.uncompress();
			by.endian = "littleEndian";
			var vMap:Object = readVersionsFromBuf(by);
			ClientConfig.version = _version;
			ClientConfig.useBpgFormat = false;
			ClientConfig.useAtfFormat = true;
			EngineSetting.initAway3D();
			VersionUtils.setup(vMap, ClientConfig.baseDir, _version);
			completeProcess();
		}
		
		private function readVersionsFromBuf(buf:ByteArray):Object
		{
			var _local3:String = buf.readMultiByte(buf.bytesAvailable, "utf-8");
			return JSON.parse(_local3);
		}
		
		private function onVersionIoError(event:IOErrorEvent):void
		{
			GameLog.addShow("版本数据加载错误...");
		}

		override public function dispose() : void
		{
			if (_devView)
			{
				if (_devView.parent)
					_devView.parent.removeChild(_devView);
				_devView = null;
			}
			super.dispose();
		}
	}
}
