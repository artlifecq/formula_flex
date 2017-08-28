package com.client.process
{
	import com.client.manager.BGMManager;
	import com.client.view.LoginInputView;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.process.BaseProcess;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.events.Event;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;

	/**
	 *
	 * 登录输入
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午4:40:31
	 *
	 */
	public class LoginInput extends BaseProcess
	{
		private var _themeLoader : ThemeLoader;
		private var _lgView : LoginInputView;

		public function LoginInput()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_LOGIN_INPUT;
		}

		override public function startProcess() : void
		{
			super.startProcess();

			GameLog.addShow("加载登录资源...");
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "加载登录资源...";

			_themeLoader = new ThemeLoader();
			_themeLoader.load(ClientConfig.getSignInResUrl(), onResLoaded, onProgress, onResError);
		}

		private function onResLoaded(loader : ThemeLoader) : void
		{
			GameLog.addShow("加载登录资源完成...");
			try
			{
				_lgView = new LoginInputView(Stage3DLayerManager.starlingLayer.getLayer("login"), onLogin, back);

				setProcessPercent(1);
				ResLoadingView.instance.hide();

//				BGMManager.playMusic("Music/music_start");
			}
			catch (e : Error)
			{
				GameLog.addShow("登录程序异常：" + e.message);
			}
		}

		private function onProgress(progress:Number) : void
		{
//			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(progress);
		}

		private function onResError(ld : MultiLoadData, e : Event) : void
		{
			ResLoadingView.instance.title = "登录资源加载错误：" + ClientConfig.getSignInResUrl();
			GameLog.addShow("登录资源加载错误：" + ClientConfig.getSignInResUrl());
		}

		override public function processHandler(percent : Number) : void
		{
			ResLoadingView.instance.percent = percent;
		}

		private function onLogin(acc : String, psw : String) : void
		{
			ClientConfig.loginName = acc;
			GameLog.addShow("开始登录服务器...");
			completeProcess();
		}

		private function back() : void
		{
			ProcessStateMachine.getInstance().rollback();
		}

		override public function dispose() : void
		{
			if (_lgView)
			{
				_lgView.destroy();
				_lgView = null;
			}
			if (_themeLoader)
			{
				_themeLoader.dispose();
				_themeLoader = null;
			}
			super.dispose();
		}
	}
}
