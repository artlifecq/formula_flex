
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
		
		//-------------------------请使用以下的色值，以下都是UI正式的色，以下没有的请让UI补
		/**米黄文字 1 (默认)**/		
		public static const COLOR_CODE_1:uint = 0xF9F0CC;
		/**米黄色文字 2 **/		
		public static const COLOR_CODE_2:uint = 0xe9c099;
		/**米黄色 3**/ 
		public static const COLOR_CODE_3:uint = 0xd4c996;
		/**黄色 4**/		
		public static const COLOR_CODE_4:uint = 0xffe258;
		/**黄色 5**/		
		public static const COLOR_CODE_5:uint = 0xf4bd63;
		/**暗黄色 6**/		
		public static const COLOR_CODE_6:uint = 0x9c8049;
		/**暗黄色 7**/		
		public static const COLOR_CODE_7:uint = 0xbd9736;
		/**暗黄色文字标题 8**/		
		public static const COLOR_CODE_8:uint = 0xd69e66;
		/**暗黄色文字9**/
		public static const COLOR_CODE_9:uint = 0x98692d;
		/**橘色文字 10**/
		public static const COLOR_CODE_10:uint = 0xf17733;
		/**橘红色文字 11**/
		public static const COLOR_CODE_11:uint = 0xff4500;
		/**红色文字 12**/
		public static const COLOR_CODE_12 : uint = 0xff0000;
		/**红色文字 13**/		
		public static const COLOR_CODE_13:uint = 0xC21515;
		/**草绿色 14*/		
		public static const COLOR_CODE_14:uint = 0x808101;
		/**绿色 15*/		
		public static const COLOR_CODE_15:uint = 0x4efd6f;
		/**绿色 16*/		
		public static const COLOR_CODE_16:uint = 0x239D02;
		/**天蓝色 17*/		
		public static const COLOR_CODE_17:uint = 0x00e3fe;
		/**天蓝色 18*/		
		public static const COLOR_CODE_18:uint = 0x9fdced;
		/**蓝色 19*/		
		public static const COLOR_CODE_19:uint = 0x0066ff;
		/**粉色文字 20*/		
		public static const COLOR_CODE_20:uint = 0xcc99bb;
		/**粉色文字 21*/		
		public static const COLOR_CODE_21:uint = 0xe530ec;
		/**粉色文字 22*/		
		public static const COLOR_CODE_22:uint = 0xea63a6;
		/**灰色文字 23*/	
		public static const COLOR_CODE_23:uint = 0x4A4744; 
		/**灰色文字 24*/	
		public static const COLOR_CODE_24:uint = 0x453a2f; 
		/**橙色文字 25*/		
		public static const COLOR_CODE_25:uint =0xf09e01;
		/**棕色文字 26*/		
		public static const COLOR_CODE_26:uint = 0x6e3117;
		/**灰色文字 27 */		
		public static const COLOR_CODE_27:uint = 0x76726d;
		//上面是老的现在暂时保留
		
		/**
		 * 绿色
		 */
		public static const UI_GREEN:uint=0x55bd15;
		public static const UI_GREEN1:uint=0x6BCC08;
		/**
		 *黄 
		 */
		public static const UI_YELLOW:uint=0xe8c958;
		/**
		 *浅黄
		 */
		public static const UI_YELLOW1:uint=0xcfc6ae;
		/**
		 *黄色2
		 */
		public static const UI_YELLOW2:uint=0xc9b722;
		/**
		 *普通文本
		 */
		public static const UI_NORMAL:uint=0x8b8d7b;
		
		/**
		 *特殊文本蓝
		 */
		public static const UI_SPECIAL_BLUE:uint=0x2482b4;
		/**
		 *红1
		 */
		public static const UI_RED1:uint=0xD23735;
		/**
		 *特殊文本红
		 */
		public static const UI_SPECIAL_RED:uint=0xe1201c;
		
		/**
		 *紫色文本
		 */
		public static const UI_PURPLE:uint=0x9d4aa8;
		////////////////////////////////////上面的跟UI统一的色值不符，用下面的//////////////////////////////////////
		/**
		 * 白色 (面板UI白色系都用此色值)
		 *@param 描述内容使用此色值
		 * @return  
		 * */
		public static const A_UI_WHITE_TEXT:uint = 0xeeeeee;
		/**
		 * 绿(面板UI绿色系都用此色值)
		 *@param 连接文字、属性加成、特殊提示、安全状态、在线等使用此色值
		 * @return  
		 * */
		public static const A_UI_GREEN_TEXT:uint = 0x00ff0c;
		/**
		 * 黄(面板UI黄色系都用此色值)
		 *@param 提示用此色值
		 * @return  
		 * */
		public static const A_UI_YELLOW_TEXT:uint = 0xffea00;
		/**
		 * 米色(面板UI米色系都用此色值)
		 *@param 提示用此色值
		 * @return  
		 * */
		public static const A_UI_BEIGE_TEXT:uint = 0xeaeabc;
		/**
		 * 灰色(面板UI灰色系都用此色值)
		 *@param 普通文本使用此色值
		 * @return  
		 * */
		public static const A_UI_GRAY_TEXT:uint = 0xa3a594;
		/**
		 *蓝色(面板UI蓝色系都用此色值)
		 *@param 特殊使用此色值
		 * @return  
		 * */
		public static const A_UI_BLUE_TEXT:uint = 0x14a3f3;
		/**
		 * 红色(面板UI红色系都用此色值)
		 *@param 特殊使用此色值
		 * @return  
		 * */
		public static const A_UI_RED_TEXT:uint = 0xff0d0d;
		/**
		 * 橙色(面板UI橙色系都用此色值)
		 *@param 聊天等使用此色值
		 * @return  
		 * */
		public static const A_UI_OEANGE_TEXT:uint = 0xff9000;
		/**
		 * 玫瑰粉色(面板UI玫瑰粉色系都用此色值)
		 *@param 聊天等使用此色值
		 * @return  
		 * */
		public static const A_UI_ROSEPOWDER_TEXT:uint = 0xe58bff;
		/**
		 * 浅蓝色(面板UI浅蓝色系都用此色值)
		 *@param 聊天等使用此色值
		 * @return  
		 * */
		public static const A_UI_LIGHTBLUE_TEXT:uint = 0x00ecc8;
		/**
		 * 天蓝色(面板UI天蓝色系都用此色值)
		 *@param 聊天等使用此色值
		 * @return  
		 * */
		public static const A_UI_SKYBLUE_TEXT:uint = 0x27bbff;
		
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
		
		/**纯白色*/		
		public static const WHITE_PURE_COLOR:uint = 0xFFFFFF;
		
		//排行榜色值
		/**18号 红色文字*/
		public static const RANK_RED:uint = 0xd02525;
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