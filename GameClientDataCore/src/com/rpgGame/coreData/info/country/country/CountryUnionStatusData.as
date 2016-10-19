package com.rpgGame.coreData.info.country.country
{
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.cfg.crown.CountryUnionStatCfgData;
	
	import app.message.CountryUnionStatusProto;
	import app.message.OtherUnionStatusProto;
	import app.message.AllUnionStatusProto.UnionStatusProto;
	import app.message.AllUnionStatusProto.UnionStatusProto.UnionStatusType;

	/**
	 *
	 * 国家结盟信息数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryUnionStatusData
	{
		public var unionStatus : int;// 状态  UnionStatusType
		public var inviteCountry : int = 0; // 结盟邀请国家
		public var beenInviteCountry : int = 0; // 结盟被邀请国家
		public var unionAmount : int; // 外交值
		public var expireTime : Number;// 被邀请时的过期时间
		public var unionCd : Number;//结盟CD结束时间
		public var lastUnionCountry : int = 0;//上次结盟的国家
		public var lastUnionTime : Number = 0;//上次结盟的时间
		public var mineCountry : int;
		public function CountryUnionStatusData(sequence:int)
		{
			mineCountry = sequence;
			trace("本国ID "+mineCountry)
		}
		
		public function setSelfUnionStatus(cfg : UnionStatusProto):void
		{
			unionStatus = cfg.status;
			inviteCountry = cfg.invitorCountry;
			beenInviteCountry = cfg.beenInvitorCountry;
			unionAmount = cfg.unionAmount;
			expireTime = cfg.expireTime.toNumber();
		}
		/**
		 * 设置自己的国家状态 
		 * @param cfg
		 * 
		 */
		public function setSelfConfig(cfg : CountryUnionStatusProto) : void
		{
			unionCd = cfg.unionCd.toNumber();
			lastUnionCountry = cfg.lastUnionCountry;
			if(cfg.hasLastUnionTime)
				lastUnionTime = cfg.lastUnionTime.toNumber();
		}

		public function setOtherConfig(cfg : OtherUnionStatusProto) : void
		{
			unionCd = cfg.unionCd.toNumber();
		}
		
		public function clearUnion():void
		{
			unionStatus = 0;
			inviteCountry =0;
			beenInviteCountry =0;
			unionAmount = 0;
			expireTime = 0;
		}
		/**
		 * 获取结盟状态 
		 * @return 
		 * 
		 */		
		public function getUnionState():String
		{
			if(unionStatus==UnionStatusType.NONE)
				return "无";
			return CountryUnionStatCfgData.getUnionStat(unionStatus)+(unionStatus!=UnionStatusType.NONE?"--"+CountryNameCfgData.getCountryNameById(getUnionCountry()):"");
		}
		/**
		 *  
		 * @return 获取盟友，如果返回0就代表没有结盟
		 * 
		 */		
		public function getUnionCountry():int
		{
			if(unionStatus == UnionStatusType.NONE || unionStatus == UnionStatusType.WAIT_UNION)
				return 0;
			if(inviteCountry!=mineCountry && beenInviteCountry==mineCountry)
				return inviteCountry;
			if(beenInviteCountry!=mineCountry && inviteCountry==mineCountry)
				return beenInviteCountry;
			return 0;
		}
	}
}
