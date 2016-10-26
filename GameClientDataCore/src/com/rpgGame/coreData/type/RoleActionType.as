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
		public static const IDLE : String = "stand";//"100";
		/** 个性待机状态 **/
		public static const SPECIFIC_IDLE : String = "110";
		/** 行走 **/
		public static const WALK : String = "walk";//"120";
		/** 跑步 **/
		public static const RUN : String = "130";
		/** 跳跃 **/
		public static const JUMP : String = "140";
		/** 二级跳跃 **/
		public static const SECOND_JUMP : String = "150";
		/** 采集开始 **/
		public static const COLLECT_START : String = "160";
		/** 采集中 **/
		public static const COLLECT : String = "170";
		/** 采集结束 **/
		public static const COLLECT_END : String = "180";
		/** 战斗待机 **/
		public static const PREWAR : String = "200";
		/** 冲锋 **/
		public static const BLINK : String = "220";
		/** 死亡 **/
		public static const DIE : String = "death";//"500";
		/** 受击 **/
		public static const HIT : String = "injured";//"400";
		/** 击倒 **/
		public static const FALL : String = "410";
		/** 起身 **/
		public static const GETUP : String = "420";

		public static function getActionType(type : String, onMount : Boolean = false) : String
		{
			if (!type)
				return null;
			var actionHead : String = type.substr(0, type.length - 1);
			return onMount ? (actionHead + "5") : type;//(actionHead + "0");
		}
	}
}
