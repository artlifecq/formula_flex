package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 任务事件声明
	 * @author zgd
	 *
	 */
	public class TaskEvent
	{
		/**剧情任务添加了已完成的章节内容, 带参数   携带章节编号*/
		public static const TASK_STORY_COMPLETED_CHAPTER_INFO_ADDED : int = UNIQUEID.NEXT;
		/**剧情任务更新*/
		public static const TASK_UPDATE_NEW_TASK : int = UNIQUEID.NEXT;
		/**完成剧情任务  带参数 当前完成的任务ID taskId:int*/
		public static const TASK_STORY_COMPLETE_TASK : int = UNIQUEID.NEXT;
		/**任务目标进度更新,携带一个数组，元素依次为任务id，目标索引*/
		public static const TASK_TARGET_PROGRESS_UPDATED : int = UNIQUEID.NEXT;
		/**已完成所有剧情任务*/
		public static const TASK_STORY_ALL_CHAPTER_COMPLETED : int = UNIQUEID.NEXT;
		/**交接任务*/
		public static const TASK_ACCEPT_OR_FINISH : int = UNIQUEID.NEXT;
		/**打开边镜传送*/
		public static const TASK_SHOW_FRONTIER_TRANS : int = UNIQUEID.NEXT;
		/**打开有物品奖励的NPC对话面板*/
		public static const TASK_SHOW_ACTIVE_PRIZE : int = UNIQUEID.NEXT;
		/** 刷新密信失败 **/
		public static const MIXIN_REFRESH_FAIL : int = UNIQUEID.NEXT;
		/** 刷新密信成功 **/
		public static const MIXIN_REFRESH_SUCCES : int = UNIQUEID.NEXT;
		/** 交密信成功 **/
		public static const MIXIN_SUBMIT_SUCCES : int = UNIQUEID.NEXT;
		/** 放弃密信成功 **/
		public static const MIXIN_GIVEUP_SUCCES : int = UNIQUEID.NEXT;
		/** 完成密信成功 **/
		public static const MIXIN_COMPLETED_SUCCES : int = UNIQUEID.NEXT;
		/** 任务区域信息变化 **/
		public static const TASK_AREA_INFO_CHANGE : int = UNIQUEID.NEXT;
		/** 对话框文本内容更新 **/
		public static const TASK_PANEL_LAB_UPDATE_INFO : int = UNIQUEID.NEXT;
		/** 对话框文本内容更新---返回 **/
		public static const TASK_PANEL_LAB_UPDATE_INFO_RETURN : int = UNIQUEID.NEXT;
	}
}
