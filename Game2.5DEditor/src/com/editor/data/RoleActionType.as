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
		public static const STAND : String = "stand";
		/** 个性待机状态 **/
		public static const IDLE : String = "stand";//暂时把个性待机动作调为stand，因为现在美术还没有做这个动作
		/** 展示状态1 **/
		public static const SHOW1 : String = "show1";
		/** 展示状态2 **/
		public static const SHOW2 : String = "show2";
		/** 行走 **/
		public static const WALK : String = "walk";
		/** 跑步 **/
		public static const RUN : String = "run";
		/** 跳跃 **/
		public static const JUMP : String = "jump";
		/** 二级跳跃 **/
		public static const SECOND_JUMP : String = "jump2";
		/** 采集开始 **/
		public static const COLLECT_START : String = "show2";
		/** 采集中 **/
		public static const COLLECT : String = "jump";
		/** 采集结束 **/
		public static const COLLECT_END : String = "stand";
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
		
		public static function get actionList() : Array
		{
			return [ //
				{type: IDLE, name: "待机"}, //
//				{type: SPECIFIC_IDLE, name: "个性待机"}, //
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
			{
				return null;
			}
			if(onMount)
			{
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