package com.rpgGame.coreData.cfg.country
{
	import com.netease.protobuf.Int64;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	import com.rpgGame.coreData.type.CountryWarMonsterType;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 国战配置数据
	 * @author GuoDong.Zhang
	 * 
	 */
	public class CountryWarCfgData
	{
		public static const SCORE_REFERENCE_VALUE:int = 100;	
		public static const MONSTER_NAME_ASSET_PREFIX:String = "ui/app/countryWar/text_";
		public static const MONSTER_NAME_ASSET_SUFFIX:String = ".png";
		public static const MONSTER_NAME_ASSET_NAMES:Array = ["bian_jin_","zhen_guan_","cheng_men_","jin_jia_"];
		public static const MONSTER_HOLY_NAME_ASSET_NAMES:Array = ["xuan_wu_","bai_hu_","zhu_que_","qing_long_"];
		public static const MONSTER_FINAL_NAME_ASSET_NAME:String = "shen_shou_";
		public static const ICON_PO_ASSET_NAME:String = "ui/app/countryWar/text_po.png";
		public static const ICON_ZHAN_SMALL_ASSET_NAME:String = "ui/app/countryWar/text_zhan_1.png";
		public static const ICON_ZHAN_BIG_ASSET_NAME:String = "ui/app/countryWar/text_zhan_2.png";
		/**玩家参加的最小等级*/
		public static const PLAYER_JOIN_MIN_LEVEL:int = 40;
		/**图标倒计时显示的时间，单位：毫秒*/
		public static const ICON_COUNT_DOWN_TIME:int = 1800000;
		/**国战开始时间*/
		public static var warTimeData:String;
		/**国战持续时长*/
		public static var warDuration:Number = 0;
		/**宣战所耗费的国库资金,单位：文*/
		public static var declareMoneyCost:int;
		/**在开服多久以后可以开启国战*/
		public static var startWarDurationWhenServerStart:Number = 0;
		/**防守方默认复活场景*/
		public static var defaultDefenceReliveScene:int;
		/**攻击方默认复活场景*/
		public static var defaultAttackReliveScene:int;
		/**参加国战所需消耗*/
		public static var joinCountryWarCostInfo:UpgradeProtoInfo;
		/**带复活点的怪物*/
		private static var _reliveMonsterProtoArr:Array;
		/**战车数据列表*/
		private static var _zhanCheProtoMap:HashMap;
		/**圣兽配置ID列表*/
		private static var _monsterHolyCfgIDs:Array;
		/**神兽配置ID*/
		public static var monsterFinalCfgID:int;
		/**胜利国奖励*/
		public static var winnerPrizeInfo:PrizeInfo;
		/**失败国奖励*/
		public static var failerPrizeInfo:PrizeInfo;
		/**连续杀人广播*/
		public static var continueKillHeroTimes:Array;
		/**中断连续杀人广播*/
		public static var beenKilledContinueKillHeroTimes:Array;
		/**能够在每天的什么时间参拜, 开始时间*/
		public static var canAdmireStartTime:Number;
		/**能够在每天的什么时间参拜, 结束时间*/
		public static var canAdmireEndTime:Number;
		/**变换观战位置的CD*/
		public static var changePosCd:int;
		
		public function CountryWarCfgData()
		{
		}

		/**
		 * 设置国战配置数据
		 * @param countryWarData
		 *
		 */
//		public static function setConfig(cfg:CountryWarConfig):void
//		{
//			if(cfg == null)
//			{
//				return;
//			}
//			var len:int;
//			var i:int;
//			var value:Int64;
//			if(cfg.miscData)
//			{
//				warTimeData = cfg.miscData.warTimeData;
//				warDuration = cfg.miscData.warDuration.toNumber();
//				declareMoneyCost = cfg.miscData.declareMoneyCost;
//				startWarDurationWhenServerStart = cfg.miscData.startWarDurationWhenServerStart.toNumber();
//				defaultAttackReliveScene = cfg.miscData.defaultAttackerReliveSceneId;
//				defaultDefenceReliveScene = cfg.miscData.defaultDefencerReliveSceneId;
//				joinCountryWarCostInfo = new UpgradeProtoInfo();
//				joinCountryWarCostInfo.setProto(cfg.miscData.joinCountryWarCost);
//				winnerPrizeInfo = new PrizeInfo();
//				winnerPrizeInfo.converData(cfg.miscData.winnerCountryPrize);
//				failerPrizeInfo = new PrizeInfo();
//				failerPrizeInfo.converData(cfg.miscData.failerCountryPrize);
//				if(cfg.miscData.continueKillHeroTimes)
//				{
//					continueKillHeroTimes = [];
//					len = cfg.miscData.continueKillHeroTimes.length;
//					for(i = 0; i < len; i++)
//					{
//						value = cfg.miscData.continueKillHeroTimes[i];
//						continueKillHeroTimes.push(value.toNumber());
//					}
//					continueKillHeroTimes.sort(Array.NUMERIC);
//				}
//				if(cfg.miscData.beenKilledContinueKillHeroTimes)
//				{
//					beenKilledContinueKillHeroTimes = [];
//					len = cfg.miscData.beenKilledContinueKillHeroTimes.length;
//					for(i = 0; i < len; i++)
//					{
//						value = cfg.miscData.beenKilledContinueKillHeroTimes[i];
//						beenKilledContinueKillHeroTimes.push(value.toNumber());
//					}
//					beenKilledContinueKillHeroTimes.sort(Array.NUMERIC);
//				}
//				canAdmireStartTime = cfg.miscData.canAdmireStartTime.toNumber();
//				canAdmireEndTime = cfg.miscData.canAdmireEndTime.toNumber();
//				changePosCd = cfg.miscData.changePosCd.toNumber();
//			}
//			if(cfg.reliveMonDatas)
//			{
//				if(cfg.reliveMonDatas.reliveMonData)
//				{
//					_reliveMonsterProtoArr = cfg.reliveMonDatas.reliveMonData.concat();
//					_reliveMonsterProtoArr.sortOn("relivePosPriority",Array.NUMERIC);
//				}
//				if(cfg.reliveMonDatas.shengShouConfigId)
//				{
//					_monsterHolyCfgIDs = cfg.reliveMonDatas.shengShouConfigId.concat();
//				}
//				monsterFinalCfgID = cfg.reliveMonDatas.qiLinConfigId;
//			}
//			if(cfg.zhanCheMonsterDatas)
//			{
//				if(cfg.zhanCheMonsterDatas.monsters)
//				{
//					_zhanCheProtoMap = new HashMap();
//					len = cfg.zhanCheMonsterDatas.monsters.length;
//					for(i = 0; i < len; i++)
//					{
//						var zhanCheProto:ZhanCheMonsterDataProto = cfg.zhanCheMonsterDatas.monsters[i];
//						_zhanCheProtoMap.add(zhanCheProto.zhanCheId,zhanCheProto);
//					}
//				}
//			}
//		}

		/**
		 * 获取带复活点怪物的配置列表
		 * @return 
		 * 
		 */
		public static function getMonsterProtosWithRelive():Array
		{
			if(_reliveMonsterProtoArr)
			{
				return _reliveMonsterProtoArr.concat();
			}
			return null;
		}
		
		/**
		 * 获取怪物名称资源地址
		 * @param type 由CountryWarMonsterType枚举
		 * @param index 0,1,2,4
		 * @param color 1是绿色，2棕色
		 * @return 
		 * 
		 */
		public static function getMonsterAssetName(type:int,index:int = 0,color:int = 2):String
		{
			var nameStr:String = MONSTER_FINAL_NAME_ASSET_NAME;
			switch(type)
			{
				case CountryWarMonsterType.GENERAL_TYPE:
					nameStr = MONSTER_NAME_ASSET_NAMES[index];
					break;
				case CountryWarMonsterType.SHENSHOU_TYPE:
					nameStr = MONSTER_HOLY_NAME_ASSET_NAMES[index];
					break;
			}
			return MONSTER_NAME_ASSET_PREFIX + nameStr + color + MONSTER_NAME_ASSET_SUFFIX;
		}
		
		/**
		 * 获取指定怪物的复活点数据
		 * @param cfgID
		 * @return 
		 * 
		 */
//		public static function getReliveMonsterProto(cfgID:int):CountryWarReliveMonDataProto
//		{
//			if(_reliveMonsterProtoArr)
//			{
//				var len:int = _reliveMonsterProtoArr.length;
//				for(var i:int = 0; i < len; i++)
//				{
//					var data:CountryWarReliveMonDataProto = _reliveMonsterProtoArr[i];
//					if(data.monConfigId == cfgID)
//					{
//						return data;
//					}
//				}
//			}
//			return null;
//		}
		
		/**
		 * 根据战车配置ID获取对应怪物配置ID
		 * @param zhanCheCfgID
		 * @return 
		 * 
		 */
//		public static function getMonsterCfgIDOfZhanChe(zhanCheCfgID:int):int
//		{
//			var zhanCheProto:ZhanCheMonsterDataProto = _zhanCheProtoMap.getValue(zhanCheCfgID);
//			if(zhanCheProto)
//			{
//				return zhanCheProto.monsterId;
//			}
//			return 0;
//		}
		
		/**
		 * 根据战车配置ID获取技能列表
		 * @param zhanCheCfgID
		 * @return 
		 * 
		 */
//		public static function getSpellsOfZhanChe(zhanCheCfgID:int):Array
//		{
//			var zhanCheProto:ZhanCheMonsterDataProto = _zhanCheProtoMap.getValue(zhanCheCfgID);
//			if(zhanCheProto)
//			{
//				return zhanCheProto.spells;
//			}
//			return null;
//		}
		
		/**
		 * 是否是守将
		 * @param cfgID
		 * @return 
		 * 
		 */
//		public static function isMonsterWithRelive(cfgID:int):Boolean
//		{
//			if(_reliveMonsterProtoArr)
//			{
//				var len:int = _reliveMonsterProtoArr.length;
//				for(var i:int = 0; i < len; i++)
//				{
//					var data:CountryWarReliveMonDataProto = _reliveMonsterProtoArr[i];
//					if(data.monConfigId == cfgID)
//					{
//						return true;
//					}
//				}
//			}
//			return false;
//		}
		
		/**
		 * 是否是圣兽
		 * @param cfgID
		 * @return 
		 * 
		 */
		public static function isMonsterHoly(cfgID:int):Boolean
		{
			if(_monsterHolyCfgIDs)
			{
				return (_monsterHolyCfgIDs.indexOf(cfgID) >= 0);
			}
			return false;
		}
		
		/**
		 * 是否是神兽
		 * @param cfgID
		 * @return 
		 * 
		 */
		public static function isMonsterFinal(cfgID:int):Boolean
		{
			return (cfgID == monsterFinalCfgID);
		}
		
		/**
		 * 每次可参拜的时长
		 * @return 
		 * 
		 */
		public static function get worshipDuration():Number
		{
			return canAdmireEndTime - canAdmireStartTime;
		}
	}
}
