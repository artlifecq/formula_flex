package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class YunBiaoEvent
	{
		/**
		 * 同步镖车状态
		 * varint32 sceneId
		 * varint32 x
		 * varint32 y
		 * varint32 state 0：被攻击，1：跟随，2：远离
		 */
		public static const UPDATE_BIAO_CHE_STATE:int = UNIQUEID.NEXT;
		/**
		 * 同步帮会镖车状态
		 * varint32 sceneId
		 * varint32 x
		 * varint32 y
		 * varint32 state 0：被攻击，1：跟随，2：远离
		 */
		public static const UPDATE_GUILD_BIAO_CHE_STATE:int = UNIQUEID.NEXT;
		/** 同步运镖信息 **/
		public static const UPDATE_YUN_BIAO_INFO:int = UNIQUEID.NEXT;
		/** 同步帮会运镖人数 **/
		public static const UPDATE_GUILD_YUN_BIAO_PEOPLE_COUNT:int = UNIQUEID.NEXT;
		/** 更新镖车血量 **/
		public static const UPDATE_YUN_BIAO_LIFE:int = UNIQUEID.NEXT;
		/** 更新品质成功 **/
		public static const UPDATE_QUALITY_SUCCESS:int = UNIQUEID.NEXT;
		/** 更新镖车场景名字颜色 **/
		public static const UPDATE_BIAOCHE_NAME:int = UNIQUEID.NEXT;
		/** 检查镖车成功 **/
		public static const CHECK_YUN_BIAO_SUCCESS:int = UNIQUEID.NEXT;
		/** 刷新镖车成功---用于显示下一轮刷新镖车用 **/
		public static const REFRESH_YUN_BIAO_SUCCESS:int = UNIQUEID.NEXT;
		
		/** 更新帮会召集状态 **/
		public static const UPDATE_GUILD_CALL_UP:int = UNIQUEID.NEXT;
		
		/** 获得运镖奖励 **/
		public static const GET_AWARD:int = UNIQUEID.NEXT;
		
		/** 开启国运成功 **/
		public static const OPEN_GUO_YUN_SUCCEED:int = UNIQUEID.NEXT;
		
		/** 个人运镖求助信息发生变化 **/
		public static const UPDATE_GE_REN_YUN_BIAO_HELP:int = UNIQUEID.NEXT;
		
		/** 更新个人运镖奖励物品id **/
		public static const UPDATE_AWARD_GOODS_ID:int = UNIQUEID.NEXT;
		
		/**
		 * 同步国家镖车状态
		 * varint32 sceneId
		 * varint32 x
		 * varint32 y
		 * varint32 state 0：被攻击，1：跟随，2：远离
		 */
		public static const COUNTRY_UPDATE_BIAO_CHE_STATE:int = UNIQUEID.NEXT;
		/** 更新国家运镖奖励物品id **/
		public static const COUNTRY_UPDATE_AWARD_GOODS_ID:int = UNIQUEID.NEXT;
		/** 更新品质成功 **/
		public static const COUNTRY_UPDATE_QUALITY_SUCCESS:int = UNIQUEID.NEXT;
		/** 检测成功 **/
		public static const COUNTRY_CHECK_YUN_BIAO_SUCCESS:int = UNIQUEID.NEXT;
		
		/** 接受运镖 **/
		public static const ACCEPT_BIAO:int = UNIQUEID.NEXT;
		/** 接受无敌运镖 **/
		public static const ACCEPT_INVINCIBLE_BIAO:int = UNIQUEID.NEXT;
		/** 完成运镖 **/
		public static const COMPLETED_BIAO:int = UNIQUEID.NEXT;
		/** 上线检测运镖状态 **/
		public static const CHECK_ON_LOGIN_BIAO:int = UNIQUEID.NEXT;
		/** 镖车消失了 **/
		public static const BIAO_DISAPPER:int = UNIQUEID.NEXT;
		/** 视野中添加一台镖车 **/
		public static const ADD_BIAO:int = UNIQUEID.NEXT;
		/** 镖车被伤害了 **/
		public static const BIAO_LIFE_UPDATE:int = UNIQUEID.NEXT;
		/** 镖车没有被伤害 **/
		public static const BIAO_LIFE_UPDATE_NOT:int = UNIQUEID.NEXT;
		/** 镖车停止了 **/
		public static const BIAO_STOP:int = UNIQUEID.NEXT;
		/** 镖车所在位置 **/
		public static const BIAO_SCENE_POINT:int = UNIQUEID.NEXT;
		/** 更新验镖状态镖车 **/
		public static const BIAO_UPDATE_BIAO_STATE:int = UNIQUEID.NEXT;
	}
}
