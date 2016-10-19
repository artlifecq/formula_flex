package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	/**
	 * 物品事件 ItemEvent
	 * @author 
	 * 
	 */	
	public class ItemEvent 
	{
		/** 添加物品 **/
		public static const ITEM_ADD:int = UNIQUEID.NEXT;
		/** 物品属性变化,如数理 **/
		public static const ITEM_CHANG:int = UNIQUEID.NEXT;
		/** 删除物品 **/
		public static const ITEM_DELETE:int = UNIQUEID.NEXT;
		/** 预拆分物品,弹窗输入 **/
		public static const ITEM_PRE_SPLITE:int = UNIQUEID.NEXT;
		/** 预移动物品,跟随鼠标 **/
		public static const ITEM_PRE_MOVE:int = UNIQUEID.NEXT;
		/** 拖动物品放下时 **/
		public static const ITEM_DROPED:int = UNIQUEID.NEXT;
		/** 移动物品失败 **/
		public static const ITEM_MOVE_FAIL:int = UNIQUEID.NEXT;
		/** 解锁格子 **/
		public static const ITEM_GRID_UNLOCK:int = UNIQUEID.NEXT;
		/** 刷新容器内所有物品 **/
		public static const ITEM_CONTAINER_REFLESH:int = UNIQUEID.NEXT;
		/** 刷新指定物品下标的所有物品（防止有些操作可能会使物品下标和实际下标不相同，那就刷新一下这些下标的物品）**/
		public static const ITEM_REFLESH_BY_ITEM_INDEX : int = UNIQUEID.NEXT;
		/** 整理倒计时 **/
		public static const ITEM_CONTAINER_REFLESH_CD:int =UNIQUEID.NEXT;
		/** 整理时报错 **/
		public static const ITEM_CONTAINER_REFLESH_FAIL:int =UNIQUEID.NEXT;
		/** 开放仓库 **/
		public static const ITEM_CONTAINER_OPEN_STORAGE:int =UNIQUEID.NEXT;
		/** 将物品发送到聊天框 **/
		public static const ITEM_MOVE_TO_CHAT:int = UNIQUEID.NEXT;
		/** 玩家升级冲刷装备 **/
		public static const USER_LEVEL_UP:int = UNIQUEID.NEXT;
		/** 物品闪烁 **/
		public static const ITEM_FLARE:int = UNIQUEID.NEXT;
		/** 刷新装备 **/
		public static const REFRESH_EQUIP:int = UNIQUEID.NEXT;
		/** 添加一个物品 **/
		public static const ITEM_GETED_NEW_ITEM:int =  UNIQUEID.NEXT;
		/** 放入快捷方式 **/
		public static const ITEM_INPUT_SHORTCUT:int =  UNIQUEID.NEXT;
		/**穿了人物装备，携带装备信息[ItemInfo,bagPos:int,rolePos:int]*/
		public static const ITEM_WEARED_PERSON_EQUIP:int = UNIQUEID.NEXT;
		/**脱了人物装备，携带装备信息[ItemInfo,bagPos:int,rolePos:int]*/
		public static const ITEM_TOOK_OFF_PERSON_EQUIP:int = UNIQUEID.NEXT;
		/**穿了坐骑装备，携带装备信息[ItemInfo,bagPos:int,rolePos:int]*/
		public static const ITEM_WEARED_MOUNT_EQUIP:int = UNIQUEID.NEXT;
		/**脱了坐骑装备，携带装备信息[ItemInfo,bagPos:int,rolePos:int]*/
		public static const ITEM_TOOK_OFF_MOUNT_EQUIP:int = UNIQUEID.NEXT;
		/**背包物品排序完成*/
		public static const ITEM_BAGITEM_SORT_SUCCESS:String = "item_bagItem_sort_Success";
		/** 无形碎片兑换 */
		public static const ITEM_WU_XING_EXCHANGE_SUCCESS:int = UNIQUEID.NEXT;
		/** 物品已经过期 */
		public static const ITEM_EXPIRE:int = UNIQUEID.NEXT;
		/** 增加回收资源 **/
		public static const ITEM_RECLAIM_ADD:int = UNIQUEID.NEXT;
		/** 取消资源回收 **/
		public static const ITEM_RECLAIM_CANCEL:int = UNIQUEID.NEXT;
	}
}