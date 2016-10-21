package com.rpgGame.app
{
	import com.game.engine3D.process.ProcessStateMachine;
	import com.game.mainCore.core.controller.KeyController;
	import com.game.mainCore.core.manager.LayerManager;
	import com.game.mainCore.libCore.log.ZLog;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.cmdlistener.scene.SceneSwitchCmdListener;
	import com.rpgGame.app.manager.ReconnectManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.process.LoadConfigData;
	import com.rpgGame.app.process.LoadEmbedFonts;
	import com.rpgGame.app.process.LoadPngxUIAssets;
	import com.rpgGame.app.process.LoadPublicUIAssets;
	import com.rpgGame.app.process.LocalConfigData;
	import com.rpgGame.app.process.ProcessState;
	import com.rpgGame.app.process.StartGame;
	import com.rpgGame.app.ui.ResLoadingView;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.clientConfig.ConfigClassRegister;
	
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	
	import org.client.mainCore.manager.PopUpManager;
	import org.client.mainCore.manager.ProjectManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	import org.game.netCore.net.GameSocketDispatcher;

	/**
	 * 社区资源都加载完成后程序运行的主入口。
	 * @author carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-6-3 上午10:05:12
	 */
	public class MainEntry
	{
		private var _root : Sprite;
		public var loadingActual : Class = null;
		private var _isRelease : Boolean = false;

		/**
		 * 开启游戏
		 *
		 */
		public function setup(clientGlobal : Class, userLoginInfo : Object) : void
		{
			var decode : Function = clientGlobal.decodeFun;
			var param : Object = clientGlobal.urlParmar;
			_root = clientGlobal.root;
			_isRelease = clientGlobal.isRelease;
			//初始化配置类
			ClientConfig.setup(param, 0, _isRelease, clientGlobal.uiCompressed);
			LanguageConfig.parseData(clientGlobal.maskWorldDic);
			ClientConfig.decode = decode;
			ClientConfig.baseDir = clientGlobal.baseDir;
			ClientConfig.resURL = clientGlobal.resURL;
			ClientConfig.isSingle = clientGlobal.isSingle;
			ClientConfig.isBanShu = clientGlobal.isBanShu;
			ClientConfig.isStable = clientGlobal.isStable;
			LayerManager.setup(_root);
			ProjectManager.setup(_root, _root.stage);
			PopUpManager.container = LayerManager.topLevel;

			var loginData : ByteBuffer = clientGlobal.loginData;
			if (ClientConfig.isSingle)
				MainRoleManager.initSingleData(loginData);
			else
				MainRoleManager.setLoginData(loginData);
			//
			ResLoadingView.instance.setActual(loadingActual);

			initGame();
			initProcess();
			runProcess();
		}

		private function initGame() : void
		{
			ConfigClassRegister.setup();
			ReconnectManager.setup();
			//
			GameLog.enableTrace = true;
			ZLog.enableLog = false;
			ZLog.enableTrace = false;
			SocketConnection.print = false;
			GameSocketDispatcher.isPrint = true;
			KeyController.isPrint = false;
			StarlingLayerManager.setup();
			GameClientUI.setup();
			//
			if (ExternalInterface.available)
			{
				var kernelVersion : String = ExternalInterface.call("getKernelVersion");
				GameLog.addShow("浏览器内核为：" + kernelVersion);
				//
				ClientConfig.kernelVersion = kernelVersion;
			}
		}

		private function initProcess() : void
		{
			ProcessStateMachine.getInstance().pushProcess(new LoadPublicUIAssets());
			ProcessStateMachine.getInstance().pushProcess(new LoadPngxUIAssets());
			ProcessStateMachine.getInstance().pushProcess(new LoadEmbedFonts());
			ProcessStateMachine.getInstance().pushProcess(new LoadConfigData());
            if (ClientConfig.isSingle) {
                // 如果是单机 则造假数据
                ProcessStateMachine.getInstance().pushProcess(new LocalConfigData());
            }
			ProcessStateMachine.getInstance().pushProcess(new StartGame());
		}

		private function runProcess() : void
		{
			SceneSwitchCmdListener.fromPercent = 0.55;
			SceneSwitchCmdListener.toPercent = 1;
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOAD_PUBLIC_UI_ASSETS, 0.3, 0.35);
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOAD_PNGX_UI_ASSETS, 0.35, 0.4)
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOAD_FONTS, 0.4, 0.45);
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOAD_CONFIG_DATA, 0.45, 0.5);
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_LOCAL_CONFIG_DATA, 0.5, 0.55);
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_START_GAME, 0.55);
			ProcessStateMachine.getInstance().run();
		}

		public function reEnterGame() : void
		{
			GameLog.addShow("重新进入游戏...");
			SceneSwitchCmdListener.fromPercent = 0.5;
			SceneSwitchCmdListener.toPercent = 1;
			ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_START_GAME, 0.5);
			ProcessStateMachine.getInstance().run();
		}
	}
}
