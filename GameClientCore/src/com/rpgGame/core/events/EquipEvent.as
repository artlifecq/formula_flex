package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class EquipEvent
	{
		public function EquipEvent()
		{
		}
		/**
		 * 每次接收到这个消息的时候都刷新当时正在展示的面板 
		 */		
		public static const EQUIP_PANEL_UPDATE : uint = UNIQUEID.NEXT;
		/**
		 * 装备打造成功
		 * 
		 * equipInfo 
		 */		
		public static const EQUIP_MAKE_COMPLETE : uint = UNIQUEID.NEXT;
		/**
		 * 合成 
		 */		
		public static const EQUIP_COMBINE_COMBPLETE : uint = UNIQUEID.NEXT;
		/**强化**/
		public static const EQUIP_REFINE_COMPLETE : uint = UNIQUEID.NEXT;
		/**
		 * 拆解 
		 * [iteminfo]
		 */		
		public static const EQUIP_DESTORY_COMPLETE : uint = UNIQUEID.NEXT;
		/**
		 * 装备改造 
		 */		
		public static const EQUIP_GENERAL_CHANGE : uint = UNIQUEID.NEXT;
		/**重新拉取绑定状态**/
		public static const EQUIP_SILVER_BIND_CHANGE : uint = UNIQUEID.NEXT;
	}
}