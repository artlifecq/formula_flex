package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *
	 * 场景角色类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午11:12:28
	 *
	 */
	public class SceneCharType
	{
		/**
		 * 虚拟体
		 * 此类型只参与渲染 0
		 */
		public static const DUMMY : String = rEnum.ENUM_START(0).toString();
		/** 玩家 1 **/
		public static const PLAYER : String = rEnum.next.toString();
		/** 怪物  2 **/
		public static const MONSTER : String = rEnum.next.toString();
		/** NPC3 **/
		public static const NPC : String = rEnum.next.toString();
		/** 坐骑  4 **/
		public static const MOUNT : String = rEnum.next.toString();
		/** 掉落物 5 **/
		public static const DROP_GOODS : String = rEnum.next.toString();
		/** 传送门 6 **/
		public static const TRANS : String = rEnum.next.toString();
		/** 场景特效 7 **/
		public static const SCENE_EFFECT : String = rEnum.next.toString();
		/** 粮仓 8 **/
		public static const LIANG_CANG : String = rEnum.next.toString();
        /** 陷阱9 **/
        public static const TRAP : String = rEnum.next.toString();
		/** 场景飞行技能 10 **/
		public static const SCENE_FLY_SPELL : String = rEnum.next.toString();
		/** 场景受击特效 11 **/
		public static const SCENE_HURT_EFFECT : String = rEnum.next.toString();
		/** 刀光特效 12 **/
		public static const KNIFE_LIGHT_EFFECT : String = rEnum.next.toString();
		/** 场景自身特效 13 **/
		public static const SCENE_SELF_EFFECT : String = rEnum.next.toString();
		/** 场景目标特效 14 **/
		public static const SCENE_DEST_EFFECT : String = rEnum.next.toString();
		/** 场景摄像机镜头前特效 15 **/
		public static const SCENE_CAMERA_LENS_EFFECT : String = rEnum.next.toString();
		/** 鼠标点击特效 16 **/
		public static const MOUSE_CLICK_EFFECT : String = rEnum.next.toString();
		/** 采集物 17 **/
		public static const COLLECT : String = rEnum.next.toString();
		/** 镖车 18 **/
		public static const BIAO_CHE : String = rEnum.next.toString();
		/** 保护NPC 19 **/
		public static const PROTECT_NPC : String = rEnum.next.toString();
		/** 摊位 20 **/
		public static const STALL : String = rEnum.next.toString();
		/** 战车 21 */
		public static const ZHAN_CHE : String = rEnum.next.toString();
		/** 客户端NPC 22 */
		public static const CLIENT_NPC : String = rEnum.next.toString();

		public static const FIGHT_SOUL : String = rEnum.next.toString();
		
		public static const BORN_EFFECT:String = rEnum.next.toString();
		
		public static const FAMILY_WAR_FLAG:String = rEnum.next.toString();
		
		public static const SCENE_RIBBON_SPELL:String = rEnum.next.toString();
		
		/**美人**/
		public static const GIRL_PET:String=rEnum.next.toString();
		public static const SPRITE_EFFECT:String=rEnum.next.toString();
		/**雕塑**/
		public static const SCULPTURE:String = rEnum.next.toString();
		/**场景跳跃点29*/
		public static const SCENE_JUMP:String=rEnum.next.toString();
		/**传送门名字*/
		public static const SCENE_TRANS_NAME:String=rEnum.next.toString();
		
		//		/** 召唤怪  3 **/
//		public static const SUMMON_MONSTER:String = rEnum.next.toString();
//		/** 宝袋（精英怪或BOSS死后出现） 4 **/
//		public static const BAO_DAI_MONSTER:String = rEnum.next.toString();
//		/** 场景掉落物 5 **/	
//		public static const BAG:String = rEnum.next.toString();
//		/** 场景效果 (火墙) 7 **/	
//		public static const EFFECT:String = rEnum.next.toString();

//		/** 跟随者精灵 9 **/	
//		public static const FOLLOWER:String = rEnum.next.toString();
//		/** 传送门 10 **/	
//		public static const TRANSPORT:String = rEnum.next.toString();
//		/** 采集物 11 **/	
//		public static const COLLECT:String = rEnum.next.toString();
//		/** 鹰 12 **/		
//		public static const EAGLE:String = rEnum.next.toString();
//		/** 假的打坐角色 13 **/		
//		public static const SIT_CHAR:String = rEnum.next.toString();
//		/** 分层剧情中的npc 14 **/
//		public static const STORY_NPC:String = rEnum.next.toString();
//		/** 分层剧情中的可攻击的npc 15 */
//		public static const STORY_ACTOR:String = rEnum.next.toString();
//
//		/** 场景巡逻对象 22 **/
//		public static const PATROL:String = rEnum.next.toString();
//
//		//------
//		public static const ALL_TYPE_CNT:uint = rEnum.next;

		/**
		 * @private
		 * 默认深度
		 */
//		private static const defautDepthArr:Array = [
//			[BAG, 	  	 	 -int.MAX_VALUE + 1],
//			[TRANSPORT, 	   -int.MAX_VALUE],
//			[EAGLE, int.MAX_VALUE]
//		];
//		/**
//		 * 取得默认深度
//		 * @param $type
//		 * @return
//		 */	
//		public static function getDefaultDepth($type:int):int
//		{
//			var arr:Array;
//			for each(arr in defautDepthArr)
//			{
//				if(arr[0]==$type)
//				{
//					return arr[1];
//				}
//			}
//			return 0;
//		}
//		
//		/**
//		 * @private
//		 * 默认加载优先级
//		 */	
//		private static const defautLoadPriority:Array = [
//			[DUMMY, 1],
//			[BAG, 5],
//			[PLAYER, 8],
//			[EFFECT, 6],
//			[MONSTER, 2],
//			[NPC, 3],
//			[TRANSPORT, 4],
//			[EAGLE,0]
//		];
//		/**
//		 * 取得默认加载优先级
//		 * @param $type
//		 * @return
//		 */	
//		public static function getDefaultLoadPriority($type:int):int
//		{
//			var arr:Array;
//			for each(arr in defautLoadPriority)
//			{
//				if(arr[0]==$type)
//				{
//					return arr[1];
//				}
//			}
//			return 0;
//		}
//		
		public static function get serverType() : Array
		{
			return [PLAYER, NPC, DROP_GOODS, MONSTER, BIAO_CHE,PROTECT_NPC,COLLECT, TRAP, LIANG_CANG, ZHAN_CHE,GIRL_PET,FIGHT_SOUL]; //,FOLLOWER,BAG,SUMMON_MONSTER,BAO_DAI_MONSTER,STORY_ACTOR
		}
	}
}
