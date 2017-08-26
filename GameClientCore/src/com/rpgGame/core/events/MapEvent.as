package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 地图加载，初始化相关事件
	 * @author carver
	 *
	 */
	public class MapEvent
	{
		/** 地图切换开始**/
		public static const MAP_SWITCH_START : int = UNIQUEID.NEXT;
		/** 地图切换完成 **/
		public static const MAP_SWITCH_COMPLETE : int = UNIQUEID.NEXT;
		/** 地图加载开始**/
		public static const MAP_LOAD_START : int = UNIQUEID.NEXT;
		/** 小地图加载完成 **/
		public static const MINI_MAP_COMPLETE : int = UNIQUEID.NEXT;
		/** 雷达地图加载完成 **/
		public static const RADAR_MAP_COMPLETE : int = UNIQUEID.NEXT;

		/** 地图单元数据更新 参数：EnumMapUnitType**/
		public static const UPDATE_MAP_UNIT_DATA : int = UNIQUEID.NEXT;
		/** 清除地图单元数据**/
		public static const CLEAR_MAP_UNIT_DATA : int = UNIQUEID.NEXT;
		/** 地图怪物或玩家添加 参数：SceneRole**/
		public static const UPDATE_MAP_ROLE_ADD : int = UNIQUEID.NEXT;
		/** 地图怪物或玩家移动 参数：SceneRole**/
		public static const UPDATE_MAP_ROLE_MOVE : int = UNIQUEID.NEXT;
		/** 地图怪物或玩家被删除 参数：id**/
		public static const UPDATE_MAP_ROLE_REMOVE : int = UNIQUEID.NEXT;
		
		/** 角色死亡**/
		public static const ROLE_DIE : int = UNIQUEID.NEXT;
		
		/** 地图区域触发事件**/
		public static const AREA_TRIGGER : int = UNIQUEID.NEXT;
		
		/** 跳跃完成 **/
		public static const MAP_JUMP_COMPLETE : int = UNIQUEID.NEXT;
		/** 飞鞋完成 **/
		public static const MAP_FLY_COMPLETE : int = UNIQUEID.NEXT;
		
	}
}

