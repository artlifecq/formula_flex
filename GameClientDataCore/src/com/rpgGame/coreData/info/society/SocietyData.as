package com.rpgGame.coreData.info.society
{
	import app.message.FamilyInListProto;

	import org.game.netCore.net.BytesUtil;

	/**
	 *
	 * 帮派数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-01-28 上午10:30:12
	 *
	 */
	public class SocietyData
	{
		/** 国家 **/
		public var country : int;
		/** 创建时间 **/
		public var createTime : Number;
		/** 帮派名 **/
		public var societyName : String;
		/** 帮主名 **/
		public var leaderName : String;
		/** 人数 **/
		public var peopleCount : int;
		/** 最大人数 **/
		public var maxPeopleCount : int;
		/** 活跃在线 **/
		public var onlineCount : int;
		/** 等级 **/
		public var level : int;
		/** 帮主或副帮主在线 **/
		public var isAnyLeaderOnline : Boolean;
		/** 自动接受入族申请 **/
		public var isAutoAcceptJoinRequest : Boolean;
		/** 入帮申请中 **/
		public var isJoinApplying : Boolean;

		public function SocietyData()
		{
			isJoinApplying = false;
		}

		public function setConfig(cfg : FamilyInListProto) : void
		{
			country = cfg.country;
			createTime = cfg.createTime ? cfg.createTime.toNumber() : 0;
			societyName = cfg.name ? BytesUtil.bytes2UTF(cfg.name) : "";
			leaderName = cfg.leaderName ? BytesUtil.bytes2UTF(cfg.leaderName) : "";
			peopleCount = cfg.heroCount;
			maxPeopleCount = cfg.maxHeroCount;
			onlineCount = cfg.onlineCount;
			level = cfg.level;
			isAutoAcceptJoinRequest = cfg.isAutoAcceptJoinRequest;
			isAnyLeaderOnline = cfg.isAnyLeaderOnline;
		}
	}
}
