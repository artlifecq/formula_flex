package com.rpgGame.app.richText
{

	/**
	 * 富文本中单元的链接类型
	 * @author GuoDong.Zhang
	 * 创建时间：2016-7-4 下午2:43:13
	 */
	public class RichTextCustomLinkType
	{
		/** 人物名字	需要参数：data:id */
		public static const ROLE_NAME_TYPE : String = "1";
		/** 文本类型坐标	需要参数：data:sceneID,x坐标,y坐标 */
		public static const POSITION_TYPE : String = "2";
		/** 聊天里发送的传送图标坐标	需要参数：data:sceneID,x坐标,y坐标,line,sceneCountry */
		public static const POSITION_FLY_TYPE : String = "3";
		/** 物品展示	需要参数：data:cfgid,quality */
		public static const ITEM_SHOW_TYPE : String = "4";
		/** 文本类型超链接（liaotianlan）*/
		public static const JINJIE_SHOW_TYPE : String = "5";
		/** 称号展示	需要参数：data:TitleTreeData */
		public static const TITLE_TYPE : String = "6";
		/** 坐骑展示	需要参数：坐骑数据id */
		public static const SHOW_MOUNT_TYPE : String = "7";
		/** 任务，到某个地方打开NPC对话面板	需要参数：data:NPCID */
		public static const TASK_NPC_NAME_TYPE : String = "100";
		/** 任务，到某个地方杀怪物	需要参数：data:monsterId */
		public static const TASK_KILL_MONSTER_TYPE : String = "101";
		/** 任务，到某个地方杀怪物收集某东西	需要参数：data:monsterId */
		public static const TASK_COLLECT_KILL_MONSTER_TYPE : String = "102";
		/** 任务，到某个地方采集某东西	需要参数：data:taskId,objectID,collectGoodsType,sceneID,posx,posy */
		public static const TASK_COLLECT_TYPE : String = "103";
		/** 任务，传送	    需要参数：data:taskId,targetIndex,type */
		public static const TASK_FLY_TYPE : String = "104";
		/** 任务，护送npc	需要参数：data:npcId */
		public static const TASK_FOLLOW_ESCORT_TYPE : String = "105";
		/** 任务，到某个场景的某个区域	需要参数：data:NPCID,sceneId,posX,posY */
		public static const TASK_TO_SCENE_POS_TYPE : String = "106";
		/** 走到某个场景的某个点	    需要参数：data:sceneId,posX,posY */
		public static const WALK_TO_SCENE_POS_TYPE : String = "107";
		/** 任务，对话npc  	需要参数：data:npcId 	*/
		public static const TASK_TO_NPC_DIAILOG_TYPE : String = "108";
		/** 任务，走向怪物 需要参数：data:npcId */
		public static const WALK_TO_SCENE_MONSTER_TYPE : String = "109";
		/**
		 *消耗道具飞到场景对应位置 
		 */
		public static const FLY_TO_SCENE_POS_TYPE : String = "110";
		/** 寻路到指定国家，指定场景，指定位置(国家,场景,x,y) */
		public static const FIND_TO_COUNTRY_SCENE_POS : String = "111";
		/** 显示一个面板，需要参数:AppConstant枚举*/
		public static const SHOW_APP_PANEL:String = "112";
		/** 打败敌国密探 ，需要参数：副本id,npcID */
		public static const TASK_KILL_ENEMY_SPY : String = "113";
		/** 显示家族神兽面板**/
		public static const SHOW_SOCIETY_BEAST_PANEL : String = "114";
		/** 任务目标引导：寻路到摊位区域*/
		public static const WALK_TO_TAN_WEI:String = "115";
		/** 任务目标引导：打开背包商店*/
		public static const OPEN_BACKPACK_SHOP:String = "116";
		/** 功能传送	    需要参数：功能类型 */
		public static const FUNCTION_FLY_TYPE : String = "117";
		/** 功能传送	    需要参数：功能类型 */
		public static const SELL_BUTTON_TYPE : String = "118";
		/**切换到环任务页签*/
		public static const SWITCH_TO_HUAN_TASK_TAB:String = "119";
		/**打开申请进队面板*/
		public static const OPEN_QUICK_TEAM_APPLY_PANEL:String = "120";
		/**打开一骑当千面板*/
		public static const OPEN_YI_JI_PANEL:String = "121";
		/**执行挖宝动作*/
		public static const DOINGA_ACITON_WABAO:String = "122";
		/**其他类型传送*/
		public static const OTHERTYPE_FLY:String = "123";
		/**求婚链接*/
		public static const QIUHUN:String = "124";
	}
}
