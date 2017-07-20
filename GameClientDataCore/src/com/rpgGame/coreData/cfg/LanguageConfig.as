package com.rpgGame.coreData.cfg
{
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.coreData.enum.AlertTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertInfo;
	import com.rpgGame.coreData.lang.LangHyperlinksMenu;
	
	import flash.utils.Dictionary;
	
	public class LanguageConfig
	{
		private static var _textDic : Dictionary;
		private static var _alertDic : Dictionary;
		private static var _menus:Array;
		public function LanguageConfig()
		{
		}
		
		public static function parseData(dic : Dictionary) : void
		{
			_textDic = dic;
			_alertDic = new Dictionary();
			inithyperLinkMenu();
		}
		
		private static function inithyperLinkMenu():void
		{
			_menus=new Array();
			_menus=[LangHyperlinksMenu.WOYAOJIERUDUIWU,LangHyperlinksMenu.WOYAOJINJIEZHANQI,LangHyperlinksMenu.WOYAOJINJIEZUOQI,
				LangHyperlinksMenu.WOYAOQIANGHUA,LangHyperlinksMenu.WOYAORUBANG];
		}
		
		public static function get menus():Array
		{
			return _menus;
		}
		
		public static function getLanguage($key : *, ... args) : Object
		{
			args = getArrAgs(args);
			var language : Object = _textDic[$key];
			var words : String = language ? language.value : $key;
			var type : String = language ? language.type : "";
			var sceneType : int = language ? language.sceneType : 0;
			words = replaceStr(words, args);
			return {value: words, type: type, sceneType: sceneType};
		}
		
		public static function getText($key : *, ... args) : String
		{
			args = getArrAgs(args);
			var language : Object = _textDic[$key];
			var words : String = language ? language.value : $key;
			words = replaceStr(words, args);
			return words;
		}
		
		public static function getAlertLanguage($key:*,...args):AlertInfo
		{
			var alertInfo : AlertInfo
			if(_alertDic[$key])
			{
				alertInfo = _alertDic[$key];
			}
			else
			{
				alertInfo = new AlertInfo();
				_alertDic[$key] = alertInfo;
			}
			var language : Object = _textDic[$key];
			if( language == null )
				return null;
			var words : String = language ? language.value : $key;
			words = replaceStr.apply(null,[words].concat(args));
			alertInfo.key = $key;
			alertInfo.value = words;
			alertInfo.alertType = language&&language.alertType?language.alertType:AlertTypeEnum.ALERT_TYPE_OK_CANCEL;
			alertInfo.title = language&&language.title?language.title:"提 示";
			alertInfo.align = language&&language.align?language.align:"center";
			alertInfo.leftValue = language&&language.leftValue?language.leftValue:"确 认";
			alertInfo.rightValue = language&&language.rightValue?language.rightValue:"取 消";
			return alertInfo;
		}
		
		private static function getArrAgs(args : Array) : Array
		{
			if (args.length == 1 && args[0] is Array)
			{
				args = args[0];
			}
			return args;
		}
		
		public static function replaceStr(str : String, ... args) : String
		{
			args = getArrAgs(args);
			if (args != null && args.length > 0 && str != null)
			{
				var i : int;
				var len : int = args.length;
				if (str.indexOf("$")!=-1) //为了兼容老逻辑
				{
					for (i = 0; i < len; i++)
					{
						//					var reg : RegExp = new RegExp("\\$");
						str = str.replace("$", args[i]);
					}
				}
				else
				{
					for ( i = 0; i < len; i++ ) 
					{
						str = str.replace( "{" + i + "}", args[i] );
					}
				}
				
				
			}
			return str;
		}
		
		public static function replaceStr1(str : String, ... args) : String
		{
			args = getArrAgs(args);
			if (args != null && args.length > 0 && str != null)
			{
				var i : int;
				var len : int = args.length;
				for (i = 0; i < len; i++)
				{
					//					var reg : RegExp = new RegExp("\\$");
					str = str.replace("{"+i.toString()+"}", args[i]);
				}
			}
			return str;
		}		
		
		public static function replaceColor(str:String):String
		{
			
			//			str.replace(
			return "";
		}
		
	}
}
