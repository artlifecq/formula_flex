package com.rpgGame.core.events.mount
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 坐骑事件 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountEvent
	{
		/** 坐骑鉴定成功 **/
		public static const MOUNT_AUTHENTICATE_SUCCESS:int = UNIQUEID.NEXT;
		/** 坐骑转化成功 **/
		public static const MOUNT_TRANS_SUCCESS:int = UNIQUEID.NEXT;
		/** 坐骑数据信息变化 **/
		public static const MOUNT_INFO_UPDATE:int = UNIQUEID.NEXT;
		/** 坐骑饥饿度发生变化 **/
		public static const MOUNT_HUNGER_DEGREE_CHANGED:int = UNIQUEID.NEXT;
		/** 坐骑学习技能成功 **/
		public static const MOUNT_LEARN_SPELL_SUCCESS:int = UNIQUEID.NEXT;
		/** 坐骑经验变化 **/
		public static const MOUNT_ADD_EXP:int = UNIQUEID.NEXT;
		/** 选择坐骑槽,当前选择的是哪个坐骑槽的数据 **/
		public static const MOUNT_CHANGE_MOUNT_SLOT:int = UNIQUEID.NEXT;
		/** 使用了兽牌 **/
		public static const MOUNT_USE_CARD:int = UNIQUEID.NEXT;
		/** 切换坐骑槽，更新坐骑数据 **/
		public static const MOUNT_SLOMT_CHANGE:int = UNIQUEID.NEXT;
		/** 新增一个坐骑 **/
		public static const MOUNT_ADD_SLOT:int = UNIQUEID.NEXT;
		/** 移除一个坐骑 **/
		public static const MOUNT_REMOVE_SLOT:int = UNIQUEID.NEXT;
		/** 坐骑放生 **/
		public static const MOUNT_RELEASE:int = UNIQUEID.NEXT;
		/** 坐骑状态设置成功 **/
		public static const MOUNT_STATUE_SUCCEED:int = UNIQUEID.NEXT;
		/** 坐骑--上下马 **/
		public static const MOUNT_ISRIDE:int = UNIQUEID.NEXT;
		/** 坐骑--切换标签 **/
		public static const MOUNT_CHANGE_TAB:int = UNIQUEID.NEXT;
		/** 坐骑强化 **/
		public static const MOUNT_INTENSIFY:int = UNIQUEID.NEXT;
		/** 坐骑强化完后，强化的格子在兽栏置灰 **/
		public static const MOUNT_INTENSIFY_GRAY_FILTER:int = UNIQUEID.NEXT;
		/** 移除一个坐骑，清空左右坐骑槽的滤镜，仅强化的时候用 **/
		public static const MOUNT_CLEAR_MOUNT_ICON_ITEM_GROUP_FILTER:int = UNIQUEID.NEXT;
		/** 坐骑强化成功还是失败 **/
		public static const MOUNT_INTENSIFY_IS_SUCCESS:int = UNIQUEID.NEXT;
		/** 坐骑喂养成功 **/
		public static const MOUNT_FEED_SCCUES:int = UNIQUEID.NEXT;
		/**邀请繁育  同意按钮  事件**/
		public static const MOUNT_BREAD_INVENT_BTN_OK:int = UNIQUEID.NEXT;
		/**邀请繁育  拒绝按钮  事件**/
		public static const MOUNT_BREAD_INVENT_BTN_NO:int = UNIQUEID.NEXT;
		/**邀请繁育列表变化**/
		public static const MOUNT_BREAD_INVENT_JOIN_INFO_CHANGE:int = UNIQUEID.NEXT;
		/**坐骑自动脱落装备**/
		public static const MOUNT_AUTO_PEELING_EQUIPMENT:int = UNIQUEID.NEXT;
		/**邀请别人成功，等待别人回复**/
		public static const MOUNT_INVITE_BREED_SUCCESS:int = UNIQUEID.NEXT;
		/**坐骑锁定成功**/
		public static const MOUNT_BREED_LOCK_SUCCESS:int = UNIQUEID.NEXT;
		/**上线的时候发送当前的繁育信息**/
		public static const MOUNT_BREED_STATUE_WHEN_ONLINE:int = UNIQUEID.NEXT;
		/**繁育时长**/
		public static const MOUNT_BREED_TIME:int = UNIQUEID.NEXT;
		/**繁育信息更新，兽栏置灰用**/
		public static const MOUNT_BREED_UPDATE_INFO:int = UNIQUEID.NEXT;
		/**交给了npc**/
		public static const MOUNT_BREED_TO_NPC:int = UNIQUEID.NEXT;
		/**自己取消繁育成功**/
		public static const MOUNT_BREED_CANCEL_SELF:int = UNIQUEID.NEXT;
		/**收到别人取消繁育**/
		public static const MOUNT_BREED_CANCEL_OTHER:int = UNIQUEID.NEXT;
		/**被邀请的一方，将坐骑交给了npc**/
		public static const MOUNT_SENDER_MOUNT_BREED_TO_NPC_TARGET:int = UNIQUEID.NEXT;
		/**领取坐骑**/
		public static const MOUNT_GET_MOUNT:int = UNIQUEID.NEXT;
		/**取消选择的强化坐骑**/
		public static const MOUNT_CANCEL:int = UNIQUEID.NEXT;
		/**选择强化坐骑**/
		public static const MOUNT_SELECTE_MOUNT:int = UNIQUEID.NEXT;
		/**坐骑槽双击选择坐骑**/
		public static const MOUNT_DOUBLE_CLICK_FUNNCTION:int = UNIQUEID.NEXT;
		/**坐骑传承根骨经验成功（被传承的坐骑）**/
		public static const MOUNT_GENGU_INHERIT:int = UNIQUEID.NEXT;
		/**坐骑传承根骨经验成功（传承消耗坐骑）**/
		public static const MOUNT_GENGU_INHERIT_BASE_MOUNT:int = UNIQUEID.NEXT;
		/**坐骑传承技能成功（被传承的坐骑）**/
		public static const MOUNT_SPELL_INHERIT:int = UNIQUEID.NEXT;
		/**坐骑传承技能成功（传承消耗坐骑）**/
		public static const MOUNT_SPELL_INHERIT_BASE_MOUNT:int = UNIQUEID.NEXT;
		/**坐骑传承功（传承消耗兽牌）**/
		public static const MOUNT_BASE_MOUNT_BREAST_CARD_SUCCESS:int = UNIQUEID.NEXT;
		/**打开坐骑界面的喂养标签**/
		public static const MOUNT_OPEN_FEED_TAB:int = UNIQUEID.NEXT;
		/**打开坐骑界面的喂养标签---选中的iteminfo**/
		public static const MOUNT_OPEN_FEED_TAB_ITEMINFO:int = UNIQUEID.NEXT;
		/**打开坐骑界面的强化界面---选中的iteminfo**/
		public static const MOUNT_OPEN_INTENSIFY_TAB_ITEMINFO:int = UNIQUEID.NEXT;
		
		public function MountEvent()
		{
		}
	}
}