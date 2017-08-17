package com.rpgGame.coreData.info.society
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangSociety;
	
	import org.game.netCore.net_protobuff.BytesUtil;

	/**
	 *
	 * 帮派成员数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-02 上午10:30:12
	 *
	 */
	public class SocietyMemberData
	{
		/** 帮派官职 **/
		public var societyPos : int;
		/** id **/
		public var id : Number;
		/** 名称 **/
		public var name : String;
		/** 等级 **/
		public var level : int;
		/** 是否在线 **/
		public var isOnline : Boolean;
		/** 所在场景 **/
		public var sceneId : int;
		/** 贡献 **/
		public var contribution : int;
		/** 战斗力 **/
		public var fightingAmount : Number;
		/** 离线时间 **/
		public var lastOfflineTime : Number;

		public function SocietyMemberData()
		{
		}

//		public function setConfig(pos : int, cfg : FamilyMemberProto) : void
//		{
//			societyPos = pos;
//			id = cfg.id.toNumber();
//			name = BytesUtil.bytes2UTF(cfg.name);
//			level = cfg.level;
//			isOnline = cfg.isOnline;
//			sceneId = cfg.sceneId;
//			contribution = cfg.contributionPoint ? cfg.contributionPoint.toNumber() : 0;
//			fightingAmount = cfg.fightingAmount ? cfg.fightingAmount.toNumber() : 0;
//			lastOfflineTime = cfg.lastOfflineTime ? cfg.lastOfflineTime.toNumber() : 0;
//		}
//
//		public function get isLeader() : Boolean
//		{
//			return societyPos == FamilyOfficerPos.LEADER;
//		}
//
//		public function get isViceLeader() : Boolean
//		{
//			return societyPos == FamilyOfficerPos.VICE_LEADER;
//		}

		/**
		 * 得到当前职位的中文
		 * @param type	FamilyOfficerPos
		 * @return
		 *
		 */
//		public static function getPosName(type : int) : String
//		{
//			switch (type)
//			{
//				case FamilyOfficerPos.LEADER:
//					return LanguageConfig.getText(LangSociety.LEADER_NAME);
//				case FamilyOfficerPos.VICE_LEADER:
//					return LanguageConfig.getText(LangSociety.VICE_LEADER_NAME);
//			}
//			return LanguageConfig.getText(LangSociety.MEMBER_NORMAL_NAME);
//		}
	}
}
