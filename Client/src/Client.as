package
{
	import com.client.ClientGlobal;
	import com.client.EngineSetting;
	import com.client.manager.BGMManager;
	import com.client.process.CreateChar;
	import com.client.process.EnterGame;
	import com.client.process.LoadDll;
	import com.client.process.LoadEmbedFonts;
	import com.client.process.LoadMaskWorld;
	import com.client.process.LoadPublicUIAssets;
	import com.client.process.LoginInput;
	import com.client.process.ProcessState;
	import com.client.process.SelectDeveloper;
	import com.client.process.ServerConnect;
	import com.client.utils.ClientUrlManager;
	import com.client.view.TipsInfoView2D;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.process.ProcessGroup;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.game.engine3D.utils.StatsUtil;
	import com.gameClient.alert.AlertPanel;
	import com.gameClient.alert.ReconnectionPanelExt;
	import com.gameClient.log.GameLog;
	import com.gameClient.log.GameLogView;
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.Capabilities;
	import flash.ui.ContextMenuItem;
	
	import away3d.Away3D;
	import away3d.loaders.parsers.Parsers;
	import away3d.log.Log;
	
	import gs.TweenLite;
	
	import utils.StringUtil;
	
	/**
	 *
	 * 程序文档类
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-2 上午10:15:32
	 *
	 */
	[SWF( backgroundColor = "0x000000", frameRate = "60", quality = "LOW")]
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
        public var areaId : uint = 1;
        public var agent : String = "37";
        public var loginName : String = "";
        public var loginKey : String = "";
        public var loginTime : uint = 0;
        
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
            ClientGlobal.urlParmar = urlParmar || loaderInfo.parameters;
			ClientGlobal.baseDir = baseDir;
			ClientGlobal.loginIP = server;
			ClientGlobal.loginPort = port;
			ClientGlobal.policyPort = policyPort > 0 ? policyPort : ClientGlobal.policyPort;
            ClientGlobal.loginAreaId = areaId;
            ClientGlobal.loginName = loginName;
            ClientGlobal.loginKey = loginKey;
            ClientGlobal.loginTime = loginTime;
            ClientGlobal.agent = agent;
			ClientGlobal.isRelease = isRelease;
			ClientGlobal.useBpgFormat = useBpgFormat;
			ClientGlobal.useVersion = useVersion;
			ClientGlobal.version = version;
			ClientGlobal.versionInfo = versionInfo;
			ClientGlobal.uiCompressed = uiCompressed;
			ClientGlobal.isBanShu = isBanShu;
			ClientGlobal.isStable = isStable;
			ClientGlobal.GlobalBridge = GlobalBridge;
            
            //初始化配置类
            ClientConfig.setup(ClientGlobal.urlParmar, 0, ClientGlobal.isRelease, ClientGlobal.uiCompressed);
            ClientConfig.decode = ClientGlobal.decodeFun;
            ClientConfig.baseDir = ClientGlobal.baseDir;
            ClientConfig.resURL = ClientGlobal.resURL;
            ClientConfig.isSingle = ClientGlobal.isSingle;
            ClientConfig.isBanShu = ClientGlobal.isBanShu;
            ClientConfig.isStable = ClientGlobal.isStable;
			
			GameLogView.init(this.stage, [189, 190, 191]);//-_	189  .>	190  /?	191
			AlertPanel.initStage(this.stage);
			ReconnectionPanelExt.initStage(this.stage);
			//
			//getWebParams();
			GameLog.addShow("版本号：" + version);
			GameLog.addShow("客户端版本：" + versionInfo);
			GameLog.addShow("Player Version:" + (Capabilities.isDebugger ? "Debug" : "Release") + " " + Capabilities.version);
			GameLog.addShow("OS:" + Capabilities.os);
			GameLog.addShow("是否发行版本：" + ClientGlobal.isRelease);
			GameLog.addShow("是否使用BPG：" + ClientGlobal.useBpgFormat);
			GameLog.addShow("UI是否压缩：" + ClientGlobal.uiCompressed);
			//
			ClientGlobal.setup(this);
			ClientUrlManager.setup(ClientGlobal.baseDir, version, ClientGlobal.decodeFun);
			VersionUtils.setup(versionMap, baseDir, (version && version.length > 0) ? version : Math.random().toFixed(5), ClientGlobal.useVersion);
			
			initProcess();
			//initMenu();
			BGMManager.setup();
			//引擎设置
			EngineSetting.init();
			
			GameLog.enableTrace = !ClientConfig.isRelease;
//			ErrorReporter.init();
			//			StarlingLayerManager.setup(root.stage, root.stage, stage3DLayerSetupComplete, 1, 10, CameraController.forceStopPanning);
			//Stage3DLayerManager.setup(this.stage, this.stage, stage3DLayerSetupComplete,null,null, 1, 10, null);
			
			try
			{
				if (ClientConfig.isDebug)
				{
					Stage3DLayerManager.errorChecking = true;
					Away3D.REQUEST_HIGHEST_PROFILE = false;
					Stage3DLayerManager.setup(this.stage, this.stage, stage3DLayerSetupComplete, stage3DLayerSetupError, stage3DLayerUserDisabledError, 1, 10, CameraController.forceStopPanning, onMemoryTooHighed, true,"standardConstrained");
				}
				else
				{
					Away3D.REQUEST_HIGHEST_PROFILE = true;
					Stage3DLayerManager.setup(this.stage, this.stage, stage3DLayerSetupComplete, stage3DLayerSetupError, stage3DLayerUserDisabledError, 1, 10, CameraController.forceStopPanning, onMemoryTooHighed);
				}
			}
			catch(error:Error)
			{
				stage3DLayerSetupError();
			}
		}
		
		private function stage3DLayerSetupComplete():void
		{
//			LogUtils.log3D(Stage3DLayerManager.stage3DProxy.profile, Stage3DLayerManager.stage3DProxy.stage3D, "ylzt_cc", null, true, stage);
			var _local1:String = Stage3DLayerManager.stage3DProxy.driverInfo.toLocaleLowerCase();
			if (_local1.indexOf("software") != -1)
			{
				Log.error("stage3DLayerSetupComplete：硬件加速开启失败，请更新系统显卡驱动程序，或是升级显卡。");
				if (ClientConfig.isWeiDuan || !ClientConfig.isRelease)
				{
					TipsInfoView2D.showAlert2D("硬件加速开启失败，请更新系统显卡驱动程序，或是升级显卡。");
				}
				else
				{
					TipsInfoView2D.showAlert2D("硬件加速开启失败，请更新系统显卡程序，或点击确定下载微端进入游戏。", onDownWeiDuan);
				}
			}
			else
			{
				if (Away3D.profileLevel < 3)
				{
					Log.error("stage3DLayerSetupComplete：系统显卡配置太低，请升级显卡。");
					if (ClientConfig.isWeiDuan || !ClientConfig.isRelease)
					{
						TipsInfoView2D.showAlert2D("系统显卡配置太低，请升级显卡。");
					}
					else
					{
						TipsInfoView2D.showAlert2D("系统显卡配置太低，请升级显卡，或点击确定下载微端进入游戏。", onDownWeiDuan);
					}
				}
				else
				{	
					GameLog.addShow("profile type：" + Stage3DLayerManager.stage3DProxy.profile);
					
					Parsers.enableAllBundled();
					Stage3DLayerManager.screenAntiAlias = 0;
					Stage3DLayerManager.viewAntiAlias = 0;
					Stage3DLayerManager.startRender();
					Stage3DLayerManager.starlingLayer.setLayer("alert", 9);
					Stage3DLayerManager.starlingLayer.setLayer("loading", 8);
					Stage3DLayerManager.starlingLayer.setLayer("login", 7);
					if (ClientConfig.isDebug)
					{
						StatsUtil.showAwayStats(Stage3DLayerManager.stage, Stage3DLayerManager.stage3DProxy);
					}
					showCheckInfo();
					runProcess();
				}
			}
		}
		
		private function stage3DLayerSetupError():void
		{
			Log.error("stage3DLayerSetupError：硬件加速开启失败，请更新系统显卡驱动程序，或是升级显卡。");
			if (Stage3DLayerManager.stage3DProxy)
			{
//				LogUtils.log3D(Stage3DLayerManager.stage3DProxy.profile, Stage3DLayerManager.stage3DProxy.stage3D, "ylzt_cc", null, true, stage);
			}
			GameLog.addShow("stage3DLayerSetupError");
			if (ClientConfig.isWeiDuan || !ClientConfig.isRelease)
			{
				TipsInfoView2D.showAlert2D("硬件加速开启失败，请更新系统显卡驱动程序，或是升级显卡。");
			}
			else
			{
				TipsInfoView2D.showAlert2D.showAlert("硬件加速开启失败，请更新系统显卡程序，或点击确定下载微端进入游戏。", onDownWeiDuan);
			}
		}
		
		private function onDownWeiDuan():void
		{
		}
		
		private function stage3DLayerUserDisabledError():void
		{
			GameLog.addShow("stage3DLayerUserDisabledError");
		}
		
		private function onMemoryTooHighed():void
		{
			TipsInfoView2D.showAlert2D("检测到您的浏览器内存碎掉了，请重启浏览器再进入游戏。");
		}
		
		private function showCheckInfo():void
		{
			var isShow:Boolean = showPlayerInfo();
			if (!isShow)
			{
				showKernelInfo();
			}
		}
		
		private function showPlayerInfo():Boolean
		{
			if (ClientConfig.isRelease && !ClientConfig.isDebug && Capabilities.isDebugger)
			{
				TipsInfoView2D.showAlert2D("您当前的Flash插件是debug版本，游戏性能较低，为了您能有更好的游戏体验，请安装release版本的插件。", onShowPlayerOkFunc);
				return true;
			}
			return false;
		}
		
		private function onShowPlayerOkFunc():void
		{
			TweenLite.delayedCall(0.2, showKernelInfo);
		}
		
		private function showKernelInfo():void
		{
		}
		
		private function showDriverInfo():void
		{
			var info:String = "";
			if (!ClientConfig.isWeiDuan && Stage3DLayerManager.isOpenGL && Stage3DLayerManager.isStandardConstrained)
			{
				info = "尊敬的用户，我们检测到当前游戏性能较低，为了您能有更好的游戏体验，建议您使用IE浏览器登录或是打开浏览器的【兼容模式】运行游戏，您也可以点击【下载微端】使用微端进入游戏。";
				TipsInfoView2D.showAlert2D(info);
			}
		}
		
		private function initProcess() : void
		{
            if (null == ClientGlobal.loginIP || 0 == StringUtil.trim(ClientGlobal.loginIP).length) {
                ProcessStateMachine.getInstance().pushProcess(new SelectDeveloper());
            }
			ProcessStateMachine.getInstance().pushProcess(new LoginInput());
			ProcessStateMachine.getInstance().pushProcess(new LoadMaskWorld());
			ProcessStateMachine.getInstance().pushProcess(new ServerConnect());
			ProcessStateMachine.getInstance().pushProcess(new CreateChar());
			ProcessStateMachine.getInstance().pushProcess(new LoadDll());
			//			ProcessStateMachine.getInstance().pushProcess(new GetMainPlayerInfo());
			ProcessStateMachine.getInstance().pushProcess(new EnterGame());
			ProcessStateMachine.getInstance().pushProcess(new LoadPublicUIAssets());
//			ProcessStateMachine.getInstance().pushProcess(new LoadMouseAssets());
			ProcessStateMachine.getInstance().pushProcess(new LoadEmbedFonts());
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
				//ClientGlobal.useWorker = ClientGlobal.urlParmar["useWorker"] == "true";
				ClientGlobal.baseDir = ClientGlobal.urlParmar["baseDir"] || "../";
				//ClientGlobal.debugConfig = ClientGlobal.urlParmar["debugConfig"];
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
			if (!ClientGlobal.loginIP)
			{
				ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_SELECT_DEVELOPER);
			}
			if (!ClientGlobal.loginName)
			{
				ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOGIN_INPUT);
			}
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOAD_MASK_WORLD, 0, 0.1);
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_SERVER_CONNECT, 0.1, 0.2);
//			var pg : ProcessGroup = new ProcessGroup();
//			pg.addPreProcess(ProcessState.STATE_CREATE_CHAR, 0.2);
//			pg.addPreProcess(ProcessState.STATE_LOAD_DLL, 0.2, 0.3);
//			ProcessStateMachine.getInstance().addPreGroup(pg);
			
			var pg:ProcessGroup = new ProcessGroup();
			pg.addPreProcess(ProcessState.STATE_CREATE_CHAR, 0.2);
			pg.addPreProcess(ProcessState.STATE_LOAD_DLL, 0.2, 0.3, true);
			pg.addPreProcess(ProcessState.STATE_LOAD_PUBLIC_UI_ASSETS, 0.3, 0.35, true);
//			pg.addPreProcess(ProcessState.STATE_LOAD_MOUSE_ASSETS, 0.35, 0.4, true);
			pg.addPreProcess(ProcessState.STATE_LOAD_FONTS, 0.35, 0.55, true);
			ProcessStateMachine.getInstance().addPreGroup(pg);
			
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_ENTER_GAME);
			ProcessStateMachine.getInstance().run();
			
			if (!ClientGlobal.isRelease)
			{
				//				MonsterDebugger.initialize(stage);
			}
		}
		
		private function onSelectClearHc(e : Event) : void
		{
			navigateToURL(new URLRequest("http://清理缓存小常识.html"), "_blank");
		}
	}
}