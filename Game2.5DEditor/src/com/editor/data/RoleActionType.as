package com.editor.data
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
		public static const IDLE : String = "100";
		/** 个性待机状态 **/
		public static const SPECIFIC_IDLE : String = "110";
		/** 行走 **/
		public static const WALK : String = "120";
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
		public static const DIE : String = "500";
		/** 受击 **/
		public static const HIT : String = "400";
		/** 击倒 **/
		public static const FALL : String = "410";
		/** 起身 **/
		public static const GETUP : String = "420";

		public static function get actionList() : Array
		{
			return [ //
				{type: IDLE, name: "待机"}, //
				{type: SPECIFIC_IDLE, name: "个性待机"}, //
				{type: WALK, name: "行走"}, //
				{type: RUN, name: "跑步"}, //
				{type: JUMP, name: "跳跃"}, //
				{type: SECOND_JUMP, name: "二级跳跃"}, //
				{type: COLLECT_START, name: "采集开始"}, //
				{type: COLLECT, name: "采集中"}, //
				{type: COLLECT_END, name: "采集结束"}, //
				{type: BLINK, name: "冲锋"}, //
				{type: DIE, name: "死亡"}, //
				{type: HIT, name: "受击"}, //
				{type: FALL, name: "击倒"}, //
				{type: GETUP, name: "起身"}, //
				{type: PREWAR, name: "战斗待机"} //
				];
		}

		public static function getActionType(type : String, onMount : Boolean = false) : String
		{
			if (!type)
				return null;
			var actionHead : String = type.substr(0, type.length - 1);
			return onMount ? (actionHead + "5") : (actionHead + "0");
		}

		public static function isMountActionType(type : String) : Boolean
		{
			if (!type)
				return false;
			var actionTail : String = type.substr(type.length - 1);
			return actionTail == "5";
		}
	}
}
