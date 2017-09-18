package com.rpgGame.coreData.cfg
{
	import com.gameClient.log.GameLog;
	
	/**
	 * 常用公用常量
	 * 
	 * 
	 */
	public class StaticValue
	{
		
		//////////////////////////////文本色///////////////////////////////////////////
		/**
		 *白色文本 
		 */
		public static const WHITE_TEXT:uint = 0xeeeeee;
		/**
		 * 绿色文本
		 */
		public static const GREEN_TEXT:uint = 0x00ff0c;
		/**
		 *黄色文本 
		 */
		public static const YELLOW_TEXT:uint = 0xffea00;
		/**
		 *黄色文本 2
		 */
		public static const YELLOW_TEXT1:uint = 0xeaeabc;
		/**
		 *米色文本 
		 */
		public static const BEIGE_TEXT:uint = 0xeaeabc;
		/**
		 *灰色文本 
		 */
		public static const GRAY_TEXT:uint = 0xb2b4a2;
		/**
		 *星期显示灰色文本 
		 */
		public static const GRAY_TEXT_WEEK:uint = 0xbbbdaa;
		/**
		 * 特殊蓝
		 */
		public static const BLUE_TEXT:uint = 0x14a3f3;
		/**
		 *特殊红 
		 */
		public static const RED_TEXT:uint = 0xff0d0d;
		/**
		 *橙色 
		 */
		public static const OEANGE_TEXT:uint = 0xff9000;
		/**
		 * 玫瑰粉色
		 */
		public static const ROSEPOWDER_TEXT:uint = 0xe58bff;
		/**
		 * 浅蓝色
		 */
		public static const LIGHTBLUE_TEXT:uint = 0x00ecc8;
		/**
		 * 天蓝色
		 */
		public static const SKYBLUE_TEXT:uint = 0x27bbff;
		/**
		 * 紫色字体
		 */
		public static const PURPLE_TEXT:uint = 0xee0699;
		/**
		 * 紫色字体
		 */
		public static const BROWN_TEXT:uint = 0xCFC6AE;
		
		//////////////////////////////品质色///////////////////////////////////////////
		/**品质白*/		
		public static const Q_WHITE:uint = 0xeeeeee;
		/**品质绿*/		
		public static const Q_GREEN:uint = 0x00ff33;
		/**品质蓝色*/		
		public static const Q_BLUE:uint = 0x00dfff;
		/**品质紫色*/		
		public static const Q_PURPLE:uint = 0xff00ff;
		/**品质橙色  */		
		public static const Q_YELLOW:uint = 0xffea00;
		/**品质红色  */		
		public static const Q_RED:uint = 0xff0036;
		
		//////////////////////////////聊天文字颜色///////////////////////////////////////////
		/**公告*/
		public static const CHAT_NOTICE_COLOR:uint = 0x3b860d;
		/**私聊*/
		public static const CHAT_SI_LIAO_COLOR:uint = 0xe58bff;
		/**当前*/
		public static const CHAT_PU_TONG_COLOR:uint = 0xb2b08a;
		/**队伍*/
		public static const CHAT_DUI_WU_COLOR:uint = 0x2dcfab;
		/**帮派*/
		public static const CHAT_BANG_PAI_COLOR:uint = 0x18b2cf;
		/**世界*/
		public static const CHAT_SHI_JIE_COLOR:uint = 0xdfb612;
		/**跨服*/
		public static const CHAT_KUA_FU_COLOR:uint = 0xd76e44;
		/**喇叭*/
		public static const CHAT_LA_BA_COLOR:uint = 0xcf2655;	
		/**系统*/
		public static const CHAT_SYSTEM_COLOR:uint = 0xcecece;	
		/**传闻*/
		public static const CHAT_HEARSAY_COLOR:uint = 0x8b9bef;	
		
		
		//////////////////////////////PK模式文字颜色///////////////////////////////////////////
		/** 和平模式 **/
		public static const PEACE:uint = 0xDFC8AF; 
		/** 国家模式 **/
		public static const COUNTRY:uint = 0x239D02; 
		/** 盟国模式 **/
		public static const ALLIANCE:uint = 0xEA63A6; 
		/** 全体模式 **/
		public static const ALL:uint = 0xC21515;
		/** 组队模式 **/
		public static const TEAM:uint = 0x00E3FE;
		/** 帮派模式 **/
		public static const GUILD:uint = 0xF6D621;	
		/** 家族模式 **/
		public static const FAMILY:uint = 0xFFFFFF;
		/** 善恶模式 **/
		public static const KIND_OR_EVIL:uint = 0xFB7C36; 
		/** 跨服模式 **/
		public static const DIFFERENT_SEVER:uint = 0x4EFD6F;
		
		/**
		 * 字符串颜色 转 16进制颜色
		 */	
		public static function tranStrTo16($strColor:String):uint
		{
			return parseInt($strColor.replace("#","0x"));
		}
		
		/**
		 * 16进制颜色 转 字符串颜色
		 */	
		public static function tran16ToStr($16Color:uint):String
		{
			return "#"+($16Color).toString(16);
		}
		
		public function StaticValue()
		{
			GameLog.throwError(new Error("无法初始化tools类"));
		}
	}
}