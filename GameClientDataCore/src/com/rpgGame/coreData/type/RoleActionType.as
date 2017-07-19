package com.rpgGame.coreData.type
{

	/**
	 *
	 * 角色动作类型
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-8 上午10:03:17
	 *
	 */
	public class RoleActionType
	{
		/** 待机状态 **/
		public static const STAND : String = "stand";
		/** 个性待机状态 **/
		public static const IDLE : String = "stand";//暂时把个性待机动作调为stand，因为现在美术还没有做这个动作
		/** 展示状态1 **/
		public static const SHOW1 : String = "show_stand";
		/** 展示状态2 **/
		public static const SHOW2 : String = "show_idle";
		/** 行走 **/
		public static const WALK : String = "walk";
		/** 跑步 **/
		public static const RUN : String = "run";
		/** 跳跃 **/
		public static const JUMP : String = "jump";
		/** 二级跳跃 **/
		public static const SECOND_JUMP : String = "jump2";
		/** 采集开始 **/
		public static const COLLECT_START : String = "colletstart";
		/** 采集中 **/
		public static const COLLECT : String = "collect";
		/** 采集结束 **/
		public static const COLLECT_END : String = "collectend";
		/** 战斗待机 **/
		public static const PREWAR : String = "prewar";
		/** 冲锋 **/
		public static const BLINK : String = "blink";
		/** 死亡 **/
		public static const DIE : String = "die";
		/** 受击 **/
		public static const HIT : String = "hit";
		/** 击倒 **/
		public static const FALL : String = "fall";
		/** 起身 **/
		public static const GETUP : String = "getup";
		
		public static const FLY:String = "fly";
		public static const FLY_HIT:String = "flyhit";
		public static const DROPOUT:String = "dropout";
		public static const SHOW_IDLE:String = "show_idle";
		public static function getActionType(type : String, onMount : Boolean = false) : String
		{
			if (!type)
			{
				return null;
			}
			if(onMount)
			{
				if(type== "prewar")
					return "stand_on_mount";
				else
					return type + "_on_mount";
			}
			else
			{
				return type;
			}
			return null;
		}
	}
}
