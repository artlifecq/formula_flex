package com.client.process
{
	import com.client.ClientGlobal;
	import com.client.cmdlistener.LoginCmdListener;
	import com.client.sender.LoginSender;
	import com.client.ui.alert.GameAlert;
	import com.client.utils.ClientUrlManager;
	import com.client.view.PkTipsView;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.process.BaseProcess;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.gameClient.log.GameLog;
	import com.rpgGame.netData.login.message.ResErrorMessage;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.System;
	import flash.utils.ByteArray;
	
	import away3d.loaders.multi.MultiLoadData;
	
	import feathers.themes.ThemeLoader;

	/**
	 *
	 * 创建角色
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午7:30:13
	 *
	 */
	public class CreateChar extends BaseProcess
	{
		private var _themeLoader : ThemeLoader;
		private var _createRoleLoader : Loader;
		private var _needShowPkTipsView : Boolean;
		private var _pkTipsView : PkTipsView;
		private var _onCreateHeroFail : Function;

		private var _sex : int;
		private var _nickName : String;
		private var _job : int;

		public function CreateChar()
		{
			super();
		}

		override public function getState() : String
		{
			return ProcessState.STATE_CREATE_CHAR;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			if (ClientGlobal.hasHero)
			{
				GameLog.addShow("已有角色，继续进入游戏");
				toPercent = 0.2;
				completeProcess();
			}
			else
			{
				GameLog.addShow("还未创建角色，进入创建角色");

				_needShowPkTipsView = ClientGlobal.isBanShu;
				ResLoadingView.instance.show();
				ResLoadingView.instance.title = "加载创建角色资源...";

				_themeLoader = new ThemeLoader();
				_themeLoader.load(ClientGlobal.getLoginuiResUrl(), onResLoaded, onProgress, onResError);
			}
		}

		private function onResLoaded(loader : ThemeLoader) : void
		{
			GameLog.addShow("加载创建角色资源完成...");
			var url : String = ClientUrlManager.getLoginURL();
			var urlLoader : URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, showCreateChar);
			urlLoader.addEventListener(ProgressEvent.PROGRESS, onCreateCharProgress);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onCreateCharError);
			urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			urlLoader.load(new URLRequest(url));
		}

		private function onProgress(progress:Number) : void
		{
			//			var currPercent : Number = e.bytesLoaded / e.bytesTotal;
			setProcessPercent(progress);
		}

		private function onResError(ld : MultiLoadData, e : Event) : void
		{
			ResLoadingView.instance.title = "创建角色资源加载错误：" + ClientGlobal.getLoginuiResUrl();
			GameLog.addShow("创建角色资源加载错误：" + ClientGlobal.getLoginuiResUrl());
		}

		override public function processHandler(percent : Number) : void
		{
			ResLoadingView.instance.percent = percent;
		}

		private function showCreateChar(e : Event) : void
		{
			var urlLoader : URLLoader = e.currentTarget as URLLoader;
			urlLoader.removeEventListener(Event.COMPLETE, showCreateChar);
			var bytes : ByteArray = urlLoader.data;
			if (ClientGlobal.decodeFun != null)
			{
				bytes = ClientGlobal.decodeFun(bytes);
			}
			//
			_createRoleLoader = new Loader();
			_createRoleLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			_createRoleLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			var loaderContext : LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			if (loaderContext.hasOwnProperty("allowCodeImport"))
			{
				loaderContext["allowCodeImport"] = true;
			}
			_createRoleLoader.loadBytes(bytes, loaderContext);
		}

		private function onLoaderComplete(event : Event) : void
		{
			GameLog.addShow("解析创建角色程序完成...");
			_createRoleLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoaderComplete);
			_createRoleLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIoError);
            _createRoleLoader.content["baseDir"] = ClientGlobal.baseDir;
			var setConfigFun : Function = _createRoleLoader.content["setConfig"];
			setConfigFun(ClientGlobal.maskWorldDic);
			ClientGlobal.stage.addChild(_createRoleLoader.content);

			_onCreateHeroFail = _createRoleLoader.content["onCreateHeroFail"];
			_createRoleLoader.content["sendRegisterRole"] = onCreateRoleComplete;
			_createRoleLoader.content["showInfoAlert"] = onShowInfoAlert;
			setProcessPercent(1);
			ResLoadingView.instance.hide();
		}

		private function onCreateCharProgress(event : ProgressEvent) : void
		{
			var currPercent : Number = 0.8 + (event.bytesLoaded / event.bytesTotal) * 0.2;
			setProcessPercent(currPercent);
		}

		private function onCreateCharError(event : IOErrorEvent) : void
		{
			ResLoadingView.instance.title = "创建角色程序加载错误：" + ClientUrlManager.getLoginURL();
			GameLog.addShow("创建角色程序加载错误：" + ClientUrlManager.getLoginURL());
		}

		private function onIoError(event : IOErrorEvent) : void
		{
			ResLoadingView.instance.title = "创建角色程序解析错误：" + event.text;
			GameLog.addShow("创建角色程序解析错误：" + event.text);
		}

		private function onCreateRoleComplete(sex : int, nickName : String, job : int) : void
		{
			_sex = sex;
			_nickName = nickName;
			_job = job;
			if (_needShowPkTipsView)
			{
				if (!_pkTipsView)
				{
					_pkTipsView = new PkTipsView(Stage3DLayerManager.starlingLayer.getLayer("alert"), doCreateRole, onExitGame);
				}
				_pkTipsView.show();
			}
			else
			{
				doCreateRole();
			}
		}

		private function doCreateRole() : void
		{
			LoginCmdListener.onCreateCharSuccessHandler = onCreateCharSuccessHandler;
			LoginCmdListener.onCreateCharFailHandler = onCreateCharFailHandler;
			if (ClientGlobal.isSingle)
			{
				ClientGlobal.loginData = new MyPlayerInfo();
				ClientGlobal.loginData.name = _nickName;
				onCreateCharSuccessHandler();
				return;
			}
			//onCreateCharFailHandler("正在请求创建角色，请稍等...");
			GameLog.addShow("请求服务器创建新角色");
			LoginSender.register(_sex, _nickName, _job);
		}

		private function onExitGame() : void
		{
			doCreateRole();//暂时不管退出
			return;
			
			if (ExternalInterface.available)
			{
				ExternalInterface.call("close");
			}
			else
			{
				System.exit(0);
			}
		}

		private function onShowInfoAlert(info : String) : void
		{
			GameAlert.show(info, "提示");
		}

		private function onCreateCharSuccessHandler() : void
		{
			GameLog.addShow("创建新角色完成...");
			completeProcess();
		}

		private function onCreateCharFailHandler(msg : ResErrorMessage) : void
		{
			if (_onCreateHeroFail != null)
			{
				_onCreateHeroFail(msg);
			}
		}

		override public function completeProcess() : void
		{
			super.completeProcess();
			var isHangUp : Boolean = ProcessStateMachine.getInstance().preProcessIsHangUp(ProcessState.STATE_LOAD_DLL);
			if (isHangUp)
			{
				ResLoadingView.instance.show();
				ResLoadingView.instance.title = "加载程序...";
			}
		}

		override public function dispose() : void
		{
			if (_createRoleLoader)
			{
				_createRoleLoader.content["destroy"]();
				_createRoleLoader = null;
			}
			if (_themeLoader)
			{
				_themeLoader.dispose();
				_themeLoader = null;
			}
			if (_pkTipsView)
			{
				_pkTipsView.destroy();
				_pkTipsView = null;
			}
			_onCreateHeroFail = null;
			_needShowPkTipsView = false;
			super.dispose();
		}
	}
}
