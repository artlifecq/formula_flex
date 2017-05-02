package com.rpgGame.coreData.type
{

	/**
	 * 换装部件类型
	 * @author Carver
	 */
	public class RenderUnitType
	{
		/**主体(一般为衣服，也就是默认的换装类型，这是每个角色必备的换装)*/
		public static const BODY : String = "body";
		/**
		 * 身体特效 
		 */		
		public static const BODY_EFFECTS : String = "body_effects";

		/**头发*/
		public static const HAIR : String = "hair";

		/**武器*/
		public static const WEAPON : String = "weapon";

		/**副武器*/
		public static const DEPUTY_WEAPON : String = "deputy_weapon";

		/**武器特效*/
		public static const WEAPON_EFFECT : String = "weapon_effect";
		/**副武器特效 */
		public static const DEPUTY_WEAPON_EFFECT:String = "deputy_weapon_effect";

		/**身体特效*/
		public static const BODY_EFFECT : String = "body_effect";

		/**坐骑*/
		public static const MOUNT : String = "mount";
		/**特效*/
		public static const EFFECT : String = "effect";
		
		public static const BODY_METHOD_TYPE_EFFECT : String = "body_method_type_effect";

		/**刀光*/
		public static const KNIFE_LIGHT : String = "knight_light";
		/**技能自身效果*/
		public static const SPELL_SELF_EFFECT : String = "spell_self_effect";
		/**受击*/
		public static const HURT : String = "hurt";
		/**角色被选中光环特效*/
		public static const SELECTED_RING : String = "selected_ring";

		/**目标特效**/
		public static const TARGET_EFFECT : String = "target_effect";
		/**完成、接受任务**/
		public static const TASK : String = "task";
		/**升级**/
		public static const LEVEL : String = "level";
		/**偷经**/
		public static const SCRIPTURES : String = "scriptures";

		/**Buff特效*/
		public static const BUFF : String = "buff";
		/**嘲讽特效*/
		public static const TAUNT : String = "taunt";
		
		public static const BODY_HEAD_FLOWER_TEXT : String = "body_head_flower_text";
		
		/**战魂**/
		public static const FIGHTSOUL:String = "FightSoul";

		/**任务问号**/
		public static const TASKMARK : String = "taskMark";
        
        /**
        * 金针特效
         */
        public static const NEEDLEEFFECT : String = "needleEffect";
		
//		/**打坐特效*/
//		public static const SIT:String = "sit";
//		/**怪物光环*/
//		public static const MAGIC_MONSTER_RING:String = "magic_monster_ring";
//		
//		/**角色脚底光环特效(跟着影子跑)*/	
//		public static const MAGIC_RING_FOOT:String = "magic_ring_foot";
//		
//		/**魔法特效*/	
//		public static const MAGIC:String = "magic";
//		
//		/**气旋* */
//		public static const QIXUAN:String = "qixuan";
//		
//		/**魔法传递特效 */	
//		public static const MAGIC_PASS:String = "magic_pass";
//		
//		/**魔法传递特效(拖尾)*/	
//		public static const MAGIC_PASS_TAIL:String = "magic_pass_tail";
//		
//		/**多方向特效..只有站立动作*/	
//		public static const MULT_ANGLE_EFFECT:String = "mult_angle_effect";
//		
//		/**Buff上层特效*/	
//		public static const BUFF_OVER:String = "buff_over";
//		/**Buff底层特效*/
//		public static const BUFF_UNDER:String = "buff_under";
//		
//		//*********************************以下为马上换装**********************************************
//		/**马上主体*/	
//		public static const MOUNT_BODY:String = "mount_body";
//		
//		/**马头*/	
//		public static const MOUNT_HEAD:String = "mount_head";
//		
//		/**马上武器*/	
//		public static const MOUNT_WEAPON:String = "mount_weapon";
//		
//		/**弓箭*/	
//		public static const BOW:String = "bow";
//		
//		/**马上弓箭*/	
//		public static const MOUNT_BOW:String = "mount_bow";
//		
//		//************************************以下为其他唯一换装*******************************************
//		/**空白换装*/
//		public static const BLANK:String = "blank";
//		
//		/**影子换装*/
//		public static const SHADOW:String = "shadow";
//		
//		/**角色选中光环*/
//		public static const SELECTED:String = "selected";
//		
//		/** 进度条特效 */
//		public static const BAR_EFFECT:String = "bar_effect";

	/**
	 * @private
	 * 默认重复次数
	 */
//		private static const defautRepeatArr:Array = [
//			[MOUNT, 	    0	],
//			[BODY, 			0	],
//			[WEAPON, 		0	],
//			[BOW,	 		0	],
//			[MAGIC_SELECTED_RING, 	0	],
//			[MAGIC_PASS, 	0	],
//			[MAGIC, 		1	],
//			[BUFF_OVER, 	3	],
//			[MAGIC_RING_FOOT,  0],
//			[BUFF_UNDER, 	0	],
//			[BAR_EFFECT, 	0	]
//		];
//		/**
//		 * @private
//		 * 01267方向深度
//		 */	
//		private static const depth01267Arr:Array = [
//			[MAGIC_RING_FOOT,-200],
//			[BUFF_UNDER, 	-150],
//			[MOUNT, 	   -100	],
//			[BODY, 			0	],
//			[MOUNT_BODY, 	0	],
//			[MOUNT_HEAD, 	1	],
//			[MULT_ANGLE_EFFECT,-1],
//			[WEAPON, 		22	],
//			[MOUNT_WEAPON,  0	],
//			[BOW,	 		22	],
//			[MOUNT_BOW,	 	22	],
//			[MAGIC_SELECTED_RING, 	29	],
//			[MAGIC_PASS, 	30	],
//			[MAGIC, 		31	],
//			[BAR_EFFECT, 	32	],
//			[BUFF_OVER, 	33	]
//		];
//		/**
//		 * @private
//		 * 345方向深度
//		 */	
//		private static const depth345Arr:Array = [
//			[MAGIC_RING_FOOT,-200],
//			[BUFF_UNDER, 	-150],
//			[MOUNT, 	   -100	],
//			[BODY, 			0	],
//			[MOUNT_BODY, 	0	],
//			[MOUNT_HEAD, 	1	],
//			[MULT_ANGLE_EFFECT,2],
//			[WEAPON, 		22	],
//			[MOUNT_WEAPON, 	22	],
//			[BOW,	 		22	],
//			[MOUNT_BOW,	 	22	],
//			[MAGIC_SELECTED_RING, 	29	],
//			[MAGIC_PASS, 	30	],
//			[MAGIC, 		31	],
//			[BAR_EFFECT, 	32	],
//			[BUFF_OVER, 	33	]
//		];
//		/**
//		 * 取得默认重复次数
//		 * @param $type
//		 * @return
//		 */	
//		public static function getDefaultRepeat($type:String):int
//		{
//			var arr:Array;
//			for each(arr in defautRepeatArr)
//			{
//				if(arr[0]==$type)
//				{
//					return arr[1];
//				}
//			}
//			return 0;
//		}
//		/**
//		 * 取得默认深度
//		 * @param $type
//		 * @param $charLogicAngle 角色逻辑角度
//		 * @return
//		 */	
//		public static function getDefaultDepth($type:String, $charLogicAngle:int=0):int
//		{
//			var arr:Array;
//			var depthArr:Array;
//			if($charLogicAngle==3 || $charLogicAngle==4 || $charLogicAngle==5)//345
//			{
//				depthArr = depth345Arr;
//			}
//			else//01267
//			{
//				depthArr = depth01267Arr;
//			}
//			for each(arr in depthArr)
//			{
//				if(arr[0]==$type)
//				{
//					return arr[1];
//				}
//			}
//			return 0;
//		}
	}
}
