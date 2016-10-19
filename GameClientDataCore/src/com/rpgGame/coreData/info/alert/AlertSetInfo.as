package com.rpgGame.coreData.info.alert
{
	import com.rpgGame.coreData.cfg.LanguageConfig;

	public class AlertSetInfo
	{
		public function AlertSetInfo(key=null,...args)
		{
			setAlertInfo.apply(null,[key].concat(args));
		}
		/**
		 * LangAlertInfo 
		 */		
		public var key : String;
		/**
		 * 是否显示下次不再提示勾选 
		 */		
		public var isShowCBox : Boolean = false;
		/**
		 * 自动关闭时间 
		 */		
		public var autoCloseTime : Number;
		/**
		 * 是否点击任何按钮之后都自动关闭 
		 */		
		public var isClickHide : Boolean = true;
		/**
		 * 配置的设置属性 
		 */		
		private var _alertInfo : AlertInfo;
		private var arr : Array
		public function setAlertInfo(key,...args):void
		{
			this.key = key;
			_alertInfo = LanguageConfig.getAlertLanguage.apply(null,[key].concat(args));
		}
		
		public function setKey(key:String):void
		{
			this.key = key;
			_alertInfo = LanguageConfig.getAlertLanguage(key);
		}
		
		public function get alertInfo():AlertInfo
		{
			return _alertInfo;
		}
	}
}