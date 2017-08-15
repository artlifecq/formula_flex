package com.rpgGame.coreData.cfg
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.coreData.type.ClientReleaseType;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.system.IME;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	
	import away3d.Away3D;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 客户端路径配置
	 * @author carver
	 */
	public class ClientConfig
	{
		//////////////////////////////////////////登录相关//////////////////////////////////////////
		
		private static var _stage : Stage;
		public static var urlParmar : Object;
		public static var loginAreaId : uint = 1;
		public static var loginTime : uint = 0;
		public static var policyPort : uint = 8002; //9374;
		public static var agent : String = "";
        public static var browser : String = "";
        public static var gameName : String = "";
        public static var clientIp : String = "";
		
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
//		public static var isSingle : Boolean = false;
		/**
		 * 使用BPG格式
		 */
		public static var useBpgFormat : Boolean = false;
		public static var useAtfFormat:Boolean = false;
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
//		public static var baseDir : String = "../";
//		public static var resURL : String = "res/";
		//public static var auth : String;
		//public static var sign : String;
		public static var version : String;
		public static var versionInfo : String;
		/** 登陆方式，0-内部 1-web 2-微端*/
		public static var loginType : int;
		
		public static var userID : Number;
		public static var hasHero : Boolean;
//		public static var isWeiDuan : Boolean = false;
//		public static var isBanShu : Boolean = false;
//		public static var isStable : Boolean = false;
		
		public static var mainEntry : Object = null;
		public static var root : Sprite;
		/**
		 * 微端桥接
		 */
		public static var GlobalBridge : Class;
		
		public static function getLoginuiResUrl() : String
		{
			var url : String = "login/loginui.png";
			return baseDir + resURL + url + ".atf"; //需要获取位图数据，都用bpg。@L.L.M.Sunny
		}
		
		public static function getSignInResUrl() : String
		{
			var url : String = "loading/signIn.png";
			return baseDir + resURL + url + ".atf";
		}
		
		public static function getLoadingResUrl() : String
		{
			var url : String = "loading/loading.png";
			return baseDir + resURL + url + ".atf";
		}
		
		public static function getLangUrl() : String
		{
			var url : String = "config/lang/cn/lang.data";
			return getVersionPath(url);
		}
		
		public static function get stage() : Stage
		{
			return _stage;
		}
		
		public static function init(root : Sprite):void
		{
			ClientConfig.root = root;
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
		/////////////////////////////////////////////////////////////////////////////////////////
		
		private static const QUE : String = "?";

		public static var decode : Function;

		public static var loginIP : String = "168.168.1.18";
		public static var loginPort : int = 9527;
		private static var _isWeiDuan : Boolean = false;
		/** 资源根目录*/
		public static var baseDir : String = "../";
		public static var resURL : String = "res/";
		private static var _langURL : String;
		private static var _panelXmlURL : String;

		private static var _version : String;

		/**
		 * 版本类型 详情见 ClientReleaseType
		 */
		public static var releaseType : int = ClientReleaseType.UN_DECODE;
		private static var _entryResURL : String;
		private static var _urlParam : Object;
		private static var _xmlVersionMap : Object;

		public static function get eName_DATA() : String
		{
			return decode == null ? ".data" : ".res";
		}

		/**地图数据类型文件的扩展名*/
		public static function get eName_MAP_DAT() : String
		{
			return decode == null ? ".dat" : ".res";
		}

		/**XML类型文件的扩展名*/
		public static function get eName_XML() : String
		{
			return decode == null ? ".xml" : ".res";
		}

		/**SWF类型文件的扩展名*/
		public static function get eName_SWF() : String
		{
			return decode == null ? ".swf" : ".res";
		}

		/**ETF类型文件的扩展名*/
		public static function get eName_ETFX() : String
		{
			return decode == null ? ".etfx" : ".res";
		}

		/**JPG类型文件的扩展名*/
		public static function get eName_JPG() : String
		{
			return decode == null ? ".jpg" : ".res";
		}

		/**PNG类型文件的扩展名*/
		public static function get eName_PNG() : String
		{
			return decode == null ? ".png" : ".res";
		}

		/**PNGX类型文件的扩展名*/
		public static function get eName_PNGX() : String
		{
			return decode == null ? ".pngx" : ".res";
		}

		public static function get eName_AWD() : String
		{
			return decode == null ? ".awd" : ".res";
		}

		public static function get eName_FLV() : String
		{
			return decode == null ? ".flv" : ".res";
		}

		public static function get eName_MP4() : String
		{
			return decode == null ? ".mp4" : ".res";
		}
		
		public static function get eName_ATF():String
		{
			return decode == null ? ".jpg.atf" : ".res";
		}
		
		public static function get eName_BBPG():String{return decode==null?".jpg.bpg":".res";}
		public static function get eName_MAP_CFG():String{return decode==null?".cfg":".res";}

		private static var _lang : String = "cn";
		private static var _isRelease : Boolean;
		private static var _isDebug : Boolean;
		public static var miniDownloadUrl:String;
		/**
		 * 单机版本
		 */
		public static var isSingle : Boolean = false;
		public static var isBanShu : Boolean = false;
		/**
		 * 是否稳定版本
		 */
		public static var isStable : Boolean = false;

		private static var _kernelVersion : String;

		public static var isTipsShowCfgId : Boolean = false;

		/** 平台的用户名*/
		private static var _platformUserName : String = "";

		private static var _useWorker : Boolean = false;
		/**
		 * UI是否压缩
		 */
		private static var _uiCompressed : Boolean = false;

		public static function setup($urlParam : Object = null, serverVersion : uint = 0, $isRelease : Boolean = false, uiCompressed : Boolean = true, 
									 $isWeiDuan : Boolean = false, useWorker : Boolean = false) : void
		{
			_isRelease = $isRelease;
			_uiCompressed = uiCompressed;
			_useWorker = useWorker;
			_urlParam = $urlParam;
			//
			baseDir = (_urlParam && _urlParam["baseDir"]) ? _urlParam["baseDir"] : baseDir;
			_version = (_urlParam && _urlParam["version"]) ? _urlParam["version"] : "";

			_xmlVersionMap = new HashMap();
			var versionStr : String = (_urlParam && _urlParam["resversion"]) ? _urlParam["resversion"] : "";
			if (versionStr)
			{
				var versionData : Array = versionStr.split(",");
				for each (var str : String in versionData)
				{
					GameLog.add("version:", String(str.split(":")[0]), String(str.split(":")[1]));
					_xmlVersionMap.add(String(str.split(":")[0]), String(str.split(":")[1]));
				}
			}
			_isWeiDuan = $isWeiDuan;
			GameLog.addShow("是否是微端：" + isWeiDuan);

			_entryResURL = "entry" + _version + "/";
			loadPolicys();
			if (_urlParam && _urlParam.hasOwnProperty("username"))
			{
				_platformUserName = _urlParam["username"];
			}
		}

		private static function loadPolicys() : void
		{
		}

		//------------------------浏览器内核相关--------------------------
		/**是否是微端登陆*/
		public static function get isWeiDuan() : Boolean
		{
			return _isWeiDuan;
		}

		public static function set kernelVersion(value : String) : void
		{
			_kernelVersion = value;
		}

		public static function get kernelIsIE() : Boolean
		{
			return Boolean(_kernelVersion == "IE");
		}

		public static function get kernelIsChrome() : Boolean
		{
			return Boolean(_kernelVersion == "Chrome");
		}

		public static function get kernelIsFireFox() : Boolean
		{
			return Boolean(_kernelVersion == "Firefox");
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

		//--------------------------------------------------
		// map stage
		//--------------------------------------------------
		///////////////////////////map2d///////////////////////////////////////
		public static var isMapUseAtf:Boolean = true;
		public static var ATF_RES:String = ".zatf";
		public static function get ENAME_JPG_ATF():String
		{
			return decode == null ? ".jpg.atf" : ".res";
		}
		public static function getSmallMap(mapPackName:String):String
		{
			var path:String = baseDir + resURL+ "map/" + mapPackName +"_2d/mini";
			
			path += (ATF_RES == ".zatf")?ENAME_JPG_ATF:eName_BBPG;
			return path;
		}
		
		public static function getMapZoneDir(mapPackName:String):String
		{
			var url:String = "";
			if(isMapUseAtf)
			{
				url = baseDir + resURL + "map/" + mapPackName + "_2d/#" + eName_ATF;
			}
			else
			{
				url = baseDir + resURL + "map/" + mapPackName + "_2d/#" + eName_JPG;
			}
			return url;
		}
		
		public static function getMapDataConfig(mapPackName:String):String
		{
			if(mapPackName == null || mapPackName == "")return "";
			var url:String = baseDir + resURL + "map/" +mapPackName + "_2d/map" + eName_MAP_CFG;
			return url;
		}
		
		//////////////////////////////////////////////////////////////////////
		
		public static function getMap(mapName : String) : String
		{
			var url : String = "map/" + mapName;
			return baseDir + resURL + url;
		}

		public static function getMapName(mapRes : String) : String
		{
			return mapRes + eName_AWD;
		}

		public static function getMiniMapName(miniRes : String) : String
		{
			var resName : String;
			if (miniRes)
			{
				var dotIndex : int = miniRes.lastIndexOf(".");
				resName = miniRes.substring(0, dotIndex) + "_normal" + miniRes.substring(dotIndex);
			}
			else
			{
				resName = "mini_normal" + eName_PNG;
			}
			if (Away3D.USE_TEXTURES_BPG_FORMAT)
			{
				return resName + ".bpg";
			}
			return resName;
		}

		public static function getRadarMapName(radarRes : String) : String
		{
			var resName : String;
			if (radarRes)
			{
				var dotIndex : int = radarRes.lastIndexOf(".");
				resName = radarRes.substring(0, dotIndex) + "_normal" + radarRes.substring(dotIndex);
			}
			else
			{
				resName = "radar_normal" + eName_PNG;
			}
			if (Away3D.USE_TEXTURES_BPG_FORMAT)
			{
				return resName + ".bpg";
			}
			return resName;
		}

		public static function getMapDataName() : String
		{
			return "data" + eName_MAP_DAT;
		}

		public static function getUI(name : String, extFileName : String = ".atf") : String
		{
			var url : String;
			if (name.indexOf(".") != -1)
			{
				url = "app/" + name;
			}
			else
			{
				if (_uiCompressed)
				{
					url = "app/" + name + ".png.bpg";
				}
				else
				{
//					if (xxxx)
//						url = "app/" + name + ".png" + extFileName;
//					else
					url = "app/" + name + ".png.atf";
				}
			}
			return baseDir + resURL + url;
		}

		public static function getFont(name : String) : String
		{
			var url : String = "font/" + name;
			return getVersionPath(url);
		}

//		public static function getLoginXmlList():Vector.<Object>
//		{
//			var xmlList:XMLList = _gameXML.xmls;
//			var list:Vector.<Object> = new Vector.<Object>;
//			var xList:XMLList = xmlList[0].xml;
//			for each(var xml:XML in xList)
//			{
//				var name:String = xml.@key;
//				var xmlUrl:String = xml.@url + eName_XML;
//				var url:String = versionFun(xmlUrl);
//				list.push({name:name,url:url});
//			}
//			return list;
//		}

		/**
		 * 获取avatar资源路径
		 * @return
		 *
		 */
		public static function getAvatar(avatarName : String) : String
		{
			var url : String = "avatar/" + avatarName + eName_AWD;
			return baseDir + resURL + url;
		}

		public static function getAvatarTexture(textureName : String) : String
		{
			var url : String = "avatar/" + textureName;
			return baseDir + resURL + url;
		}
		
		public static function getFightSoul(avatarName : String) : String
		{
			var url : String = "avatar/pc/fightsoul/" + avatarName + eName_AWD;
			return baseDir + resURL + url;
		}
		
		/**
		 *获取战旗资源 
		 * @param res
		 * @return 
		 * 
		 */
		public static function getZhanqi(res:String):String
		{
			var url : String = "avatar/pc/flag/"+res+ eName_AWD;
			return baseDir + resURL + url;
		}
		
		/**
		 * 获取effect资源路径
		 * @return
		 *
		 */
		public static function getEffect(effectName : String) : String
		{
			var url : String = "effect/" + effectName + eName_AWD;
			return baseDir + resURL + url;
		}
		
		/**
		 * 获取effect资源路径
		 * @return
		 *
		 */
		public static function getDropItemQuatityEffect(quatity:int) : String
		{
			
			var url : String = "avatar/drop/q" + quatity + eName_AWD;
			return baseDir + resURL + url;
		}
		public static function getQualityBg(type : int, size : int) : String
		{
			var url : String = "ui/common/grid/quality/" + size + "_" + type + eName_PNG;
			return baseDir + resURL + url;
		}

		public static function getSelectBg(type : String) : String
		{
			var url : String = "ui/common/grid/select/" + type;
			return baseDir + resURL + url;
		}

		public static function getGridBg(type : String) : String
		{
			var url : String = "ui/common/grid/" + type + eName_PNG;
			return baseDir + resURL + url;
		}

		public static function getFaceBg(type : String) : String
		{
			var url : String = "ui/mainui/face/" + type + eName_PNG;
			return baseDir + resURL + url;
		}

		public static function getItemIcon(id : String, size : int = 40) : String
		{
			var url : String = "icon/item/" + size + "/" + id + eName_PNG;
			return baseDir + resURL + url;
		}

		public static function getItemTab(tab : int) : String
		{
			var url : String = "icon/tab_ico/" + tab + eName_PNG;
			return baseDir + resURL + url;
		}

		public static function getDynTexture(name : String) : String
		{
			var url : String = "dynTexture/" + name + eName_JPG;
			return baseDir + resURL + url;
		}

		public static function getConsoleDesk(name : String) : String
		{
			var url : String = "console/" + name + eName_SWF;
			return getVersionPath(url);
		}
		
		public static function getBtnSkin(name:String):String
		{
			return "org.mokylin.skin.component.button."+name;
		}
		
		/**
		 *获取面板icon 
		 * @param name
		 * @return 
		 * 
		 */
		public static function getPanelIcon(name:String):String
		{
			var url : String = "icon/panel/" + name + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 得到技能图标
		 * @param id
		 * @param size
		 * @return
		 *
		 */
		public static function getSkillIcon(id : String, size : int = 40) : String
		{
			var url : String = "icon/skill/" + size + "/" + id + eName_PNG;
			return baseDir + resURL + url;
		}
		public static function getCheatsIcon(id : int, size : int = 40) : String
		{
			var url : String = "icon/item/" + size + "/" +(id) + eName_PNG;
			return baseDir + resURL + url;
		}
		/**
		 *升阶技能图标 
		 * @param id
		 * @param size
		 * @return 
		 * 
		 */
		public static function getRiseSkillIcon(id : String, size : int = 40) : String
		{
			var url : String = "icon/skill/rise/" + size + "/" + id + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 获得Buff图标
		 * @param id
		 * @param size
		 * @return
		 *
		 */
		public static function getBuffIcon(id : String, size : int = 40) : String
		{
			var url : String = "icon/buff/" + size + "/" + id + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 技能背景
		 * @param id
		 * @return
		 *
		 */
		public static function getSpellBg(race : int, index : int) : String
		{
			var url : String = "icon/spell/bg/" + race + "_" + index + eName_JPG;
			return baseDir + resURL + url;
		}

		/**
		 * 技能属性
		 * @param id
		 * @return
		 *
		 */
		public static function getSpellInfo(race : int, index : int) : String
		{
			var url : String = "icon/spell/shuxing/" + race + "_" + index + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 技能属性图标
		 * @param id
		 * @return
		 *
		 */
		public static function getSpellInfoIco(stat : int) : String
		{
			var url : String = "icon/spell/ico/" + stat + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 根据职业id获取对应的职业文字描述
		 * @param race
		 *
		 */
		public static function getSpellChar(race : int) : String
		{
			var url : String = "icon/spell/raceChar/" + race + eName_PNG;
			return baseDir + resURL + url;
		}
		
		/**
		 * 根据技能类型 获取对应的技能类型文字描述（面板的图标显示用）
		 * @param type
		 *
		 */
		public static function getSpellCharTypeById( type:int ):String
		{
			var url : String = "icon/spell/charType/" + type + eName_PNG;
			return baseDir + resURL + url;
		}
		
		/**
		 * 根据技能类型 获取对应的技能类型文字描述（技能tips用）
		 * @param type
		 *
		 */
		public static function getSpellTipsCharTypeById( type:int ):String
		{
			var url : String = "icon/spell/tipsCharType/" + type + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 可以设置成自动释放技能的图标
		 * @return
		 *
		 */
		public static function getSpellAutoIco() : String
		{
			var url : String = "ui/common/icon/xiao_san_jiao.png";
			return baseDir + resURL + url;
		}

		/**
		 * 得到任务对话图标
		 * @param ico	TaskDiailogIcoType
		 * @return
		 *
		 */
		public static function getTaskDiailogIcon(ico : String) : String
		{
			var url : String = "icon/task/diailog/" + ico + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 得到任务图标
		 * @param type
		 * @return
		 *
		 */
		public static function getTaskIcon(type : int) : String
		{
			var url : String = "icon/task/" + type + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 得到地图上功能NPC图标
		 * @param type
		 * @return
		 *
		 */
		public static function getMapIcon(type : String) : String
		{
			var url : String = "icon/map/" + type + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 得到任务图标
		 * @param type
		 * @return
		 *
		 */
		public static function getTaskNPCIcon() : String
		{
			var url : String = "icon/task/task" + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 得到通用小图标
		 * @param type
		 * @return
		 *
		 */
		public static function getCommonIcon(type : String) : String
		{
			var url : String = "icon/common/" + type + eName_PNG;
			return baseDir + resURL + url;
		}

		/**
		 * 得到提示图标
		 * @param type
		 * @return
		 *
		 */
		public static function getPromptTabUrl(type : String) : String
		{
			return baseDir + resURL + "icon/tab_ico/" + type + ".png";
		}
		
		/**
		 * 根据排名获取数字图标（仅支持前三名）
		 * @param rankIndex
		 *
		 */
		public static function getRankChar(rankIndex : int) : String
		{
			var url : String = "ui/common/number/skin_rank/" + "rank_" + rankIndex + eName_PNG;
			return baseDir + resURL + url;
		}

		//------------------------------------------
		// 版本号控制
		//------------------------------------------
		public static function getFunctionMessageBarIcon(type : int) : String
		{
			var path : String = "pic/function_message_bar/" + type + eName_PNG;
			return baseDir + resURL + path;
		}

		public static function getLangText() : String
		{
			var path : String = "lang/cn/lang" + eName_DATA;
			return getVersionPath(path);
		}

		public static function getFlvVideo(videoName : String) : String
		{
			var url : String = "video/" + videoName + eName_SWF;
			url = getVersionPath(url);
			url = url.split("?")[0]; //视频不能带?号@L.L.M.Sunny 
			return url;
		}

		public static function getSwfVideo(videoName : String) : String
		{
			var url : String = "video/" + videoName + eName_SWF;
			url = getVersionPath(url);
			url = url.split("?")[0]; //视频不能带?号@L.L.M.Sunny 
			return url;
		}

		public static function getMp4Video(videoName : String) : String
		{
			var url : String = "video/" + videoName + eName_MP4;
			url = getVersionPath(url);
			url = url.split("?")[0]; //视频不能带?号@L.L.M.Sunny 
			return url;
		}

		/**
		 *  获得buff img
		 *
		 */
		public static function getBuffImageUrl(value : String, size : int = 24) : String
		{
			var path : String = "";
			if (size == 24)
			{
				path = "icon/buff/" + size + "/" + value + eName_PNG;
			}
			else
			{
				path = "icon/buff/" + size + "/" + value + eName_PNG;
			}
			return baseDir + resURL + path;
		}

		/**
		 * 获取我要变强名称地址
		 * @param id
		 * @return
		 *
		 */
		public static function getToStrongNameUrl(value : String) : String
		{
			var path : String = "pic/toStrong/" + value + eName_JPG;
			return baseDir + resURL + path;
		}

		public static function getToWorldBossNameUrl(value : String) : String
		{
			var path : String = "pic/world_boss/" + value + eName_JPG;
			return baseDir + resURL + path;
		}

		/**
		 * 获取场景标题地址
		 * @param value
		 * @return
		 *
		 */
		public static function getSceneTitleUrl(value : String) : String
		{
			var path : String = "swf/scene_title/" + value + eName_SWF;
			return baseDir + resURL + path;
		}

		public static function getConfigDataUrl() : String
		{
			var path : String = "config/data/config" + eName_DATA;
			return getVersionPath(path);
		}

		public static function getSound($name : String) : String
		{
			var path : String = "sound/" + $name + ".mp3";
			return getVersionPath(path);
		}

		/** 获取res/swf目录下的文件 */
		public static function getResSwfUrl(folder : String, name : String) : String
		{
			var path : String = "swf/" + folder + "/" + name + eName_SWF;
			return getVersionPath(path);
		}

		/**
		 * 根据坐骑物种id获取坐骑头像icon图标
		 * @param race
		 *
		 */
		public static function getMountIconByMountSpeciesId( speciesId:int ):String
		{
			var url:String = "icon/mount/icon/" + speciesId + eName_PNG;
			return baseDir + resURL + url;
		}
		
		public static function getDynAlphaTexture(name:String):String
		{
			var url : String = "icon/common/" + name + eName_PNG;
			return baseDir + resURL + url;
		}
		
		/**
		 * 判断当前版本是否是发行版本
		 */
//		public static function get isRelease() : Boolean
//		{
//			return _isRelease;
//		}
		
		public static function get isDebug():Boolean
		{
			return _isDebug;
		}

		/** 平台的用户名*/
		public static function get platformUserName() : String
		{
			return _platformUserName;
		}
	}
}
