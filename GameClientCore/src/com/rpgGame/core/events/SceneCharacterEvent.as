package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	/**
	 * 场景对象事件
	 * @author 
	 * 
	 */	
	public class SceneCharacterEvent 
	{
		/** 场景对象离开了视野 **/
		public static const LEAVE_EYE:int = UNIQUEID.NEXT;
		/** NPC离开了视野 **/
		public static const NPC_LEAVE_EYE:int = UNIQUEID.NEXT;
		/** 场景角色死亡，携带死亡者的BaseCharacterInfo和攻击者SceneChar **/
		public static const SCENE_CHAR_DEATH:int = UNIQUEID.NEXT;
		/** 场景角色血量或血量最大值变化或者蓝量变化,携带SceneChar对象r **/
		public static const SCENE_CHAR_DATA_UPDATE:int = UNIQUEID.NEXT;
		/** 场景对象进入了视野 **/
		public static const ENTER_EYE:int = UNIQUEID.NEXT;
		/** 世界Boss进入了视野,携带SceneChar对象 **/
		public static const ENTER_EYE_OF_WORLD_BOSS:int = UNIQUEID.NEXT;
		/** 精英怪进入了视野,携带SceneChar对象 **/
		public static const ENTER_EYE_OF_ELITE:int = UNIQUEID.NEXT;
		/** 世界Boss离开了视野,携带SceneChar对象 **/
		public static const LEAVE_EYE_OF_WORLD_BOSS:int = UNIQUEID.NEXT;
		/** 精英怪离开了视野,携带SceneChar对象 **/
		public static const LEAVE_EYE_OF_ELITE:int = UNIQUEID.NEXT;
		/** 场景里其他英雄升级了 **/
		public static const OTHER_HERO_LEVEL_UP:int = UNIQUEID.NEXT;
	}
}