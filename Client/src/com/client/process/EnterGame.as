package com.client.process
{
	import com.client.ClientGlobal;
	import com.client.ui.alert.GameAlert;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.process.BaseProcess;
	import com.gameClient.log.GameLog;

	import flash.system.Capabilities;
	import flash.utils.getDefinitionByName;

	import gs.TweenLite;

	/**
	 *
	 * 进入游戏
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-7 上午10:30:12
	 *
	 */
	public class EnterGame extends BaseProcess
	{
		private static const MAINENTRY_PATH : String = "com.rpgGame.app.MainEntry";

		public function EnterGame()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_ENTER_GAME;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			completeProcess();
			initEntry();
		}

		private function initEntry() : void
		{
			GameLog.addShow("进入游戏");
			var userInfo : Object = {auth: ClientGlobal.auth, sign: ClientGlobal.sign};
			//由于登录和资源是异步的，所以需要登录成功并且资源全部加载好之后才可以进游戏，
			var entryClass : Class = getDefinitionByName(MAINENTRY_PATH) as Class;
			ClientGlobal.mainEntry = new entryClass();
			ClientGlobal.mainEntry.loadingActual = ResLoadingView;
			ClientGlobal.mainEntry.setup(ClientGlobal, userInfo);

			/*if (!ClientGlobal.isRelease)
			{
				tryShowDebugInfo();
			}*/
		}

		private function tryShowDebugInfo() : void
		{
			var isShow : Boolean = tryShowDebugPlayerInfo();
			if (!isShow)
			{
				tryShowDriverInfo();
			}
		}

		private function tryShowDebugPlayerInfo() : Boolean
		{
			if (Capabilities.isDebugger)
			{
				GameAlert.show("您当前的播放器是Debug版本，所有表现和数据不能用作性能参考！", "提示", onShowDebugPlayerFunc, onShowDebugPlayerFunc);
				return true;
			}
			return false;
		}

		private function tryShowDriverInfo() : void
		{
			if (Capabilities.os.indexOf("Windows") == 0 && Stage3DLayerManager.driverInfo.indexOf("OpenGL") == 0)
			{
				GameAlert.show("您当前正在使用windows操作系统的OpenGL驱动，环境性能不佳！");
			}
		}

		private function onShowDebugPlayerFunc() : void
		{
			TweenLite.delayedCall(0.2, tryShowDriverInfo);
		}

		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
