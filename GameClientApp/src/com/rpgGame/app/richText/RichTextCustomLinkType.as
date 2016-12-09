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
		/** 文本类型物品	需要参数：data:cfgid,quality */
		public static const ITEM_SHOW_TYPE : String = "4";
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
	}
}
