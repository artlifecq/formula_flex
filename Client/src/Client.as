package
{
	import com.client.ClientGlobal;
	import com.client.EngineSetting;
	import com.client.manager.BGMManager;
	import com.client.process.CreateChar;
	import com.client.process.EnterGame;
	import com.client.process.LoadDll;
	import com.client.process.LoadMaskWorld;
	import com.client.process.LoginInput;
	import com.client.process.ProcessState;
	import com.client.process.SelectDeveloper;
	import com.client.process.ServerConnect;
	import com.client.utils.ClientUrlManager;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.process.ProcessGroup;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.gameClient.alert.AlertPanel;
	import com.gameClient.log.GameLog;
	import com.gameClient.log.GameLogView;
	import com.gameClient.utils.VersionUtils;
	
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	import flash.ui.ContextMenuItem;
	
	import away3d.loaders.parsers.Parsers;
	
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	/**
	 *
	 * 程序文档类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-2 上午10:15:32
	 *
	 */
	[SWF(width = "1600", height = "900", backgroundColor = "0x000000", frameRate = "60", quality = "LOW")]
	public class Client extends Sprite
	{
		public var versionMap : Object = null;
		public var versionInfo : String = "V1.5.39";
		public var version : String = null;
		public var urlParmar : Object = null;
		public var baseDir : String = "../";
		public var isRelease : Boolean = false;
		public var useVersion : Boolean = false;
		public var useBpgFormat : Boolean = false;
		public var uiCompressed : Boolean = false;
		public var server : String = "";
		public var port : uint = 0;
		public var policyPort : uint = 0;
		/**
		 * 微端桥接
		 */
		public var GlobalBridge : Class = null;
		/**
		 * 是否版署版本
		 */
		public var isBanShu : Boolean = false;
		/**
		 * 是否稳定版本
		 */
		public var isStable : Boolean = false;
		
		public function Client()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStg);
		}
		
		/**
		 * 添加舞台成功事件
		 * @param event
		 */
		protected function onAddToStg(event : Event) : void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStg);
			ClientGlobal.baseDir = baseDir;
			ClientGlobal.loginIP = server;
			ClientGlobal.loginPort = port;
			ClientGlobal.policyPort = policyPort > 0 ? policyPort : ClientGlobal.policyPort;
			ClientGlobal.isRelease = isRelease;
			ClientGlobal.useBpgFormat = useBpgFormat;
			ClientGlobal.useVersion = useVersion;
			ClientGlobal.version = version;
			ClientGlobal.versionInfo = versionInfo;
			ClientGlobal.uiCompressed = uiCompressed;
			ClientGlobal.isBanShu = isBanShu;
			ClientGlobal.isStable = isStable;
			ClientGlobal.GlobalBridge = GlobalBridge;
			
			GameLogView.init(this.stage, [188, 190, 191]);//-_	189  .>	190  /?	191
			AlertPanel.initStage(this.stage);
			//
			getWebParams();
			GameLog.addShow("版本号：" + version);
			GameLog.addShow("客户端版本：" + versionInfo);
			GameLog.addShow("Player Version:" + (Capabilities.isDebugger ? "Debug" : "Release") + " " + Capabilities.version);
			GameLog.addShow("OS:" + Capabilities.os);
			GameLog.addShow("是否发行版本：" + ClientGlobal.isRelease);
			GameLog.addShow("是否使用BPG：" + ClientGlobal.useBpgFormat);
			GameLog.addShow("UI是否压缩：" + ClientGlobal.uiCompressed);
			//
			ClientGlobal.setup(this);
			ClientGlobal.isSingle = true;
			ClientUrlManager.setup(ClientGlobal.baseDir, version, ClientGlobal.decodeFun);
			VersionUtils.setup(versionMap, baseDir, (version && version.length > 0) ? version : Math.random().toFixed(5), ClientGlobal.useVersion);
			initProcess();
			//initMenu();
			BGMManager.setup();
			//引擎设置
			EngineSetting.init();
			//			StarlingLayerManager.setup(root.stage, root.stage, stage3DLayerSetupComplete, 1, 10, CameraController.forceStopPanning);
			Stage3DLayerManager.setup(this.stage, this.stage, stage3DLayerSetupComplete, 1, 10, null);
		}
		
		private function stage3DLayerSetupComplete() : void
		{
			Parsers.enableAllBundled();
			Stage3DLayerManager.screenAntiAlias = 2;
			Stage3DLayerManager.viewAntiAlias = 2;
			Stage3DLayerManager.startRender();
			Stage3DLayerManager.starlingLayer.setLayer("alert", 9);
			Stage3DLayerManager.starlingLayer.setLayer("loading", 8);
			Stage3DLayerManager.starlingLayer.setLayer("login", 7);
			
			GameLog.addShow("profile type：" + Stage3DLayerManager.stage3DProxy.profile);
			//
			runProcess();
		}
		
		private function initProcess() : void
		{
			ProcessStateMachine.getInstance().pushProcess(new SelectDeveloper());
			ProcessStateMachine.getInstance().pushProcess(new LoginInput());
			ProcessStateMachine.getInstance().pushProcess(new LoadMaskWorld());
			ProcessStateMachine.getInstance().pushProcess(new ServerConnect());
			ProcessStateMachine.getInstance().pushProcess(new CreateChar());
			ProcessStateMachine.getInstance().pushProcess(new LoadDll());
			ProcessStateMachine.getInstance().pushProcess(new EnterGame());
		}
		
		private function getWebParams() : void
		{
			if (ExternalInterface.available)
			{
				ClientGlobal.urlParmar = urlParmar || loaderInfo.parameters;
				GameLog.addShow("++++++++++++++++++++");
				for (var key : String in ClientGlobal.urlParmar)
				{
					GameLog.addShow(key + ":" + ClientGlobal.urlParmar[key]);
				}
				GameLog.addShow("++++++++++++++++++++");
				ClientGlobal.loginName = ClientGlobal.urlParmar["auth"];
				ClientGlobal.loginKey = ClientGlobal.urlParmar["sign"];
				ClientGlobal.useWorker = ClientGlobal.urlParmar["useWorker"] == "true";
				ClientGlobal.baseDir = ClientGlobal.urlParmar["baseDir"] || "../";
				ClientGlobal.debugConfig = ClientGlobal.urlParmar["debugConfig"];
			}
		}
		
		private function initMenu() : void
		{
			var clearHcItem : ContextMenuItem = new ContextMenuItem("清空浏览器缓存");
			clearHcItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onSelectClearHc);
		}
		
		private function runProcess() : void
		{
			GameLog.addShow(ClientGlobal.loginIP, ClientGlobal.loginPort, ClientGlobal.loginName, ClientGlobal.loginKey, ClientGlobal.isRelease);
			//
			/*if (!ClientGlobal.loginIP)
			{
				ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_SELECT_DEVELOPER);
			}*/
			ClientGlobal.loginData = new ByteBuffer();
			ClientGlobal.loginData.writeUTF("测试");
			ClientGlobal.loginData.position = 0;
			if (!ClientGlobal.loginName)
			{
				ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOGIN_INPUT);
			}
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOAD_MASK_WORLD, 0, 0.1);
			//ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_SERVER_CONNECT, 0.1, 0.2);
			var pg : ProcessGroup = new ProcessGroup();
			//pg.addPreProcess(ProcessState.STATE_CREATE_CHAR, 0.2);
			pg.addPreProcess(ProcessState.STATE_LOAD_DLL, 0.2, 0.3);
			ProcessStateMachine.getInstance().addPreGroup(pg);
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_ENTER_GAME);
			ProcessStateMachine.getInstance().run();
		}
		
		private function onSelectClearHc(e : Event) : void
		{
			navigateToURL(new URLRequest("http://清理缓存小常识.html"), "_blank");
		}
	}
}