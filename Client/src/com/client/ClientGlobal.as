package com.client
{
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.IME;
	import flash.text.TextField;
	import flash.utils.Dictionary;

	/**
	 *
	 * 客户端全局
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午4:01:25
	 *
	 */
	public class ClientGlobal
	{
		private static var _stage : Stage;
		public static var urlParmar : Object;
		public static var loginIP : String;
		public static var loginPort : uint = 0;
        public static var loginAreaId : uint = 1;
        public static var loginTime : uint = 0;
		public static var policyPort : uint = 8002; //9374;
        public static var agent : String = "";

		/**
		 * 是否是发布版本
		 */
		public static var isRelease : Boolean = false;
		/**
		 * 是否使用版本
		 */
		public static var useVersion : Boolean = false;
		/**
		 * 单机版本
		 */
		public static var isSingle : Boolean = false;
		/**
		 * 使用BPG格式
		 */
		public static var useBpgFormat : Boolean = false;
		/**
		 * UI是否压缩
		 */
		public static var uiCompressed : Boolean = false;

		/**要登录的用户名，内网开发测试的时候可以在这里修改，外网将会通过网页参数传进来*/
		public static var loginName : String;
		public static var loginKey : String;
		public static var debugConfig : String;
		/**
		 * 发布版本会加密
		 */
		public static var decodeFun : Function;

		public static var useWorker : Boolean = true;

		public static var maskWorldDic : Dictionary;
		public static var loginData : MyPlayerInfo;
		/** 资源根目录*/
		public static var baseDir : String = "../";
		public static var resURL : String = "res/";
		//public static var auth : String;
		//public static var sign : String;
		public static var version : String;
		public static var versionInfo : String;
		/** 登陆方式，0-内部 1-web 2-微端*/
		public static var loginType : int;

		public static var userID : Number;
		public static var hasHero : Boolean;
		public static var isWeiDuan : Boolean = false;
		public static var isBanShu : Boolean = false;
		public static var isStable : Boolean = false;

		public static var mainEntry : Object = null;
		public static var root : Sprite;
		/**
		 * 微端桥接
		 */
		public static var GlobalBridge : Class;

		public function ClientGlobal()
		{
		}

		public static function get stage() : Stage
		{
			return _stage;
		}

		public static function setup(root : Sprite) : void
		{
			ClientGlobal.root = root;
			_stage = root.stage;

			//将黄色焦点框隐藏掉
			_stage.stageFocusRect = false;
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			_stage.align = StageAlign.TOP_LEFT;
			_stage.quality = StageQuality.LOW;
			_stage.frameRate = 60;
			_stage.addEventListener(MouseEvent.RIGHT_CLICK, onRightMosClick);
			//IME状态切换写这里了，噜噜噜！@L.L.M.Sunny 
			_stage.focus = _stage;

			IME.enabled = false;
			_stage.addEventListener(MouseEvent.MOUSE_DOWN, onDisabledIME);
			_stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onDisabledIME);
			//
			//_stage.addEventListener(Event.RESIZE,onStageResize);
		}
		
		protected static function onStageResize(event:Event):void
		{
			// TODO Auto-generated method stub
			trace("resize");
		}
		
		private static function onDisabledIME(event : MouseEvent) : void
		{
			if (IME.isSupported)
			{
				if (event.target is TextField)
				{
					IME.enabled = true;
				}
				else
				{
					IME.enabled = false;
				}
			}
		}

		private static function onRightMosClick(e : MouseEvent) : void
		{
		}

		public static function getVersionPath(resUrl : String, isVersion : Boolean = true, isRandom : Boolean = false) : String
		{
			var url : String = resURL + resUrl;
			if (isVersion)
			{
				url = VersionUtils.getVersionPath(url);
			}
			else if (isRandom)
			{
				url = url + "?" + Math.random();
			}
			return baseDir + url;
		}

		public static function getLoadingResUrl() : String
		{
			var url : String = "loading/loading.png";
			return baseDir + resURL + (ClientGlobal.uiCompressed ? (url + ".bpg") : (url + ".atf"));
		}

		public static function getSignInResUrl() : String
		{
			var url : String = "loading/signIn.png";
			return baseDir + resURL + (ClientGlobal.uiCompressed ? (url + ".bpg") : (url + ".atf"));
		}

		public static function getLoginuiResUrl() : String
		{
			var url : String = "login/loginui.png";
			return baseDir + resURL + (ClientGlobal.uiCompressed ? (url + ".bpg") : (url + ".bpg")); //需要获取位图数据，都用bpg。@L.L.M.Sunny
		}

		public static function getLangUrl() : String
		{
			var url : String = "config/lang/cn/lang.data";
			return getVersionPath(url);
		}

		public static function getSound($name : String) : String
		{
			var path : String = "sound/" + $name + ".mp3";
			return getVersionPath(path);
		}
	}
}
