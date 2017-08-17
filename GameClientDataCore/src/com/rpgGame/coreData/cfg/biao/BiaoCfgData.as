package com.rpgGame.coreData.cfg.biao
{
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	import com.rpgGame.coreData.utils.ProtoParseToInfo;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 镖车静态数据 
	 * @author wewell@163.com
	 * 
	 */	
	public class BiaoCfgData
	{
		/** 个人镖车数据 **/
		private static var personDataMap:HashMap;
		/** 镖车杂数据 **/
		private static var _miscData:BiaoMiscData;
		/** 托运NPC **/
		private static var _countryTuoYunNpc : int;
		/** 接镖npc **/
		private static var _acceptBiaoNpc:int;
		/** 接无敌镖npc **/
		private static var _acceptInvincibleBiaoNpc:int;
		/** 军需官1---刷新镖车（或者验镖1） **/
		private static var _refleshWangNpc:int;
		/** 军需官2---刷新镖车（或者验镖2） **/
		private static var _refleshYangNpc:int;
		/** 交镖NPC **/
		private static var _completeNpc:int;
		/** 普通镖车奖励 **/
		public static var normalBiaoPrize:Vector.<PrizeInfo>;
		/** 破损镖车奖励 **/
		public static var brokenBiaoPrize:Vector.<PrizeInfo>;
		/** 无敌镖车奖励 **/
		public static var invicinbleBiaoPrize:Vector.<PrizeInfo>;
		
		public function BiaoCfgData()
		{
		}
		
		/**
		 * 设置配置数据 
		 * @param config
		 * 
		 */		
//		public static function setConfig(config:BiaoConfig):void
//		{
//			if(!config)
//				return;
//			
//			personDataMap = new HashMap();
//			var arr:Array = config.personalDatas.data;
//			for each (var personData:PersonalDataProto in arr) 
//			{
//				addCfgData(personData);
//			}
//			
//			_miscData = new BiaoMiscData();
//			var misc:PersonalBiaoMiscDataProto = config.personalMisc;
//			_miscData.biao_expire_duration = misc.biaoExpireDuration.toNumber();
//			_miscData.can_acess_per_day = misc.canAcessPerDay;
//			_miscData.can_add_biao_times_per_day = misc.canAddBiaoTimesPerDay;
//			_miscData.destroy_accum_max_times = misc.destroyAccumMaxTimes;
//			_miscData.destroy_add_exp_percent = misc.destroyAddExpPercent;
//			_miscData.per_npc_max_can_refresh_times = misc.perNpcMaxCanRefreshTimes;
//			_miscData.npc_refreh_duration = misc.npcRefrehDuration.toNumber();
//			_miscData.guo_yun_duration = misc.guoYunDuration.toNumber();
//			_miscData.guo_yun_start_max_hour = misc.guoYunStartMaxHour;
//			_miscData.guo_yun_start_min_hour = misc.guoYunStartMinHour;
//			_miscData.guo_yun_exp_additional = misc.guoYunExpAdditional;
//			_miscData.guo_yun_weak_protect_time = misc.guoYunWeakProtectTime.toNumber();
//			_miscData.up_to_biao_max_distance = config.miscData ? config.miscData.upToBiaoMaxDistance : 0;
//			_miscData.check_biao_npcs = misc.checkBiaoNpcs;
//		}
		
		/**
		 * 设置个人镖车数据 
		 * @param data
		 * 
		 */		
//		private static function addCfgData(data:PersonalDataProto):void
//		{
//			var d:BiaoPersonData = new BiaoPersonData();
//			d.add_biao_acess_cost = data.addBiaoAcessCost;
//			d.broken_biao_prize = data.brokenBiaoPrize;
//			d.invicinble_biao_acess_cost = data.invicinbleBiaoAcessCost;
//			d.invicinble_biao_prize = data.invicinbleBiaoPrize;
//			d.level = data.level;
//			d.normal_acess_cost = data.normalAcessCost;
//			d.normal_biao_prize = data.normalBiaoPrize;
//			d.normal_biao_res = data.normalBiaoRes;
//			d.broken_biao_res = data.brokenBiaoRes;
//			personDataMap.add(data.level, d);
//		}
		
		/**
		 * 获取适合当前等级的镖车配置
		 * @param level 玩家等级
		 * @return 
		 * 
		 */		
		public static function getPersonalDataAtLevel(level:int):BiaoPersonData
		{
			var levels:Array = personDataMap.keys();
			levels.sort(Array.NUMERIC);
			var len:int = levels.length;
			for(var i:int=0; i<len; i++)
			{
				if(i >= len-1 || levels[i] == level)
				{
					return personDataMap.getValue(levels[i]);
				}
				if(levels[i] < level && level < levels[i+1])
				{
					return personDataMap.getValue(levels[i]); 
				}
			}
			return null;
		}
		
		/**
		 *　接镖消耗 
		 * @param level 角色等级
		 * @param useAcess 使用增镖令
		 * @param invincible 无敌镖
		 * @return 
		 * 
		 */		
//		public static function getUpgradeInfo(level:int, useAcess:Boolean=false, invincible:Boolean=false):UpgradeProtoInfo
//		{
//			var d:BiaoPersonData = getPersonalDataAtLevel(level);
//			var upgradeProto:UpgradeProto;
//			var upgradeProtoInfo:UpgradeProtoInfo = new UpgradeProtoInfo();
//			if(invincible)
//			{
//				upgradeProto = d.invicinble_biao_acess_cost;
//			}else if(useAcess)
//			{
//				upgradeProto = d.add_biao_acess_cost;
//			}else{
//				upgradeProto = d.normal_acess_cost;
//			}
//			upgradeProtoInfo.setProto( upgradeProto );
//			return upgradeProtoInfo;
//		}
		
		/**
		 * 获取增镖令物品id 
		 * @return 
		 * 
		 */		
//		public static function getAddBiaoItemID(level:int):int
//		{
//			var personData:BiaoPersonData = getPersonalDataAtLevel(level);
//			if( personData == null )
//				return null;
//			
//			var upgradeProtoInfo:UpgradeProtoInfo = new UpgradeProtoInfo();
//			var upgradeProto:UpgradeProto = personData.add_biao_acess_cost;
//			upgradeProtoInfo.setProto( upgradeProto );
//			return upgradeProtoInfo.getFristItemCfgid();
//		}
		
		/**
		 * 获取增镖令物品id 
		 * @return 
		 * 
		 */		
//		public static function getAddBiaoItemName(level:int):String
//		{
//			var personData:BiaoPersonData = getPersonalDataAtLevel(level);
//			if( personData == null )
//				return null;
//			
//			var upgradeProtoInfo:UpgradeProtoInfo = new UpgradeProtoInfo();
//			var upgradeProto:UpgradeProto = personData.add_biao_acess_cost;
//			upgradeProtoInfo.setProto( upgradeProto );
//			return upgradeProtoInfo.getFristItemName();
//		}
		
		/**
		 * 正常镖车的奖励，配置格式为 白色奖励;绿色奖励;蓝色奖励;紫色奖励;橙色奖励 
		 * @param level 玩家等级
		 * 
		 */		
//		public static function getNormalBiaoPrize( level:int ):Vector.<PrizeInfo>
//		{
//			var d:BiaoPersonData = getPersonalDataAtLevel(level);
//			normalBiaoPrize = new Vector.<PrizeInfo>();
//			//普通镖车奖励
//			var normalPrizelen:int = d.normal_biao_prize.prize.length;
//			for( var idx:int = 0; idx < normalPrizelen; idx ++)
//			{
//				var prizeInfo:PrizeInfo = ProtoParseToInfo.decodePrizeProto( d.normal_biao_prize.prize[idx] );
//				normalBiaoPrize.push( prizeInfo );
//			}
//			return normalBiaoPrize;
//		}
		
		/**
		 * 破损镖车的奖励，配置格式为 白色奖励;绿色奖励;蓝色奖励;紫色奖励;橙色奖励 
		 * @param level 玩家等级
		 * 
		 */		
//		public static function getBrokenBiaoPrize( level:int ):Vector.<PrizeInfo>
//		{
//			var d:BiaoPersonData = getPersonalDataAtLevel(level);
//			brokenBiaoPrize = new Vector.<PrizeInfo>();
//			//破损镖车奖励
//			var brokenPrizeArr:Array = d.broken_biao_prize.prize;
//			for( var idx:int = 0; idx < brokenPrizeArr.length; idx ++)
//			{
//				var prizeInfo:PrizeInfo = ProtoParseToInfo.decodePrizeProto( brokenPrizeArr[idx] );
//				brokenBiaoPrize.push( prizeInfo );
//			}
//			return brokenBiaoPrize;
//		}
		
		/**
		 * 无敌镖车的奖励，配置格式为 白色奖励;绿色奖励;蓝色奖励;紫色奖励;橙色奖励 
		 * @param level 玩家等级
		 * 
		 */		
//		public static function getInvicinbleBiaoPrize( level:int ):Vector.<PrizeInfo>
//		{
//			var d:BiaoPersonData = getPersonalDataAtLevel(level);
//			invicinbleBiaoPrize = new Vector.<PrizeInfo>();
//			//无敌镖车奖励
//			var invicinbleBiaoPrizeArr:Array = d.invicinble_biao_prize.prize;
//			for( var idx:int = 0; idx < invicinbleBiaoPrizeArr.length; idx ++)
//			{
//				var prizeInfo:PrizeInfo = ProtoParseToInfo.decodePrizeProto( invicinbleBiaoPrizeArr[idx] );
//				invicinbleBiaoPrize.push( prizeInfo );
//			}
//			return invicinbleBiaoPrize;
//		}
		
		//-----------------------------------------  以下是一些get、set方法  -----------------------------------------------------

		/** 配置数据 **/
		public static function get miscData():BiaoMiscData
		{
			return _miscData;
		}

		/** 接镖npc **/
		public static function get acceptBiaoNpc():int
		{
			return _acceptBiaoNpc;
		}

		/**
		 * @private
		 */
		public static function set acceptBiaoNpc(value:int):void
		{
			_acceptBiaoNpc = value;
		}

		/** 王镖头npc---刷新镖车 **/
		public static function get refleshWangNpc():int
		{
			return _refleshWangNpc;
		}

		/**
		 * @private
		 */
		public static function set refleshWangNpc(value:int):void
		{
			_refleshWangNpc = value;
		}

		/** 李镖头npc---刷新镖车 **/
		public static function get refleshYangNpc():int
		{
			return _refleshYangNpc;
		}

		/**
		 * @private
		 */
		public static function set refleshYangNpc(value:int):void
		{
			_refleshYangNpc = value;
		}

		/** 交镖NPC **/
		public static function get completeNpc():int
		{
			return _completeNpc;
		}

		/**
		 * @private
		 */
		public static function set completeNpc(value:int):void
		{
			_completeNpc = value;
		}

		/** 接无敌镖npc **/
		public static function get acceptInvincibleBiaoNpc():int
		{
			return _acceptInvincibleBiaoNpc;
		}

		/**
		 * @private
		 */
		public static function set acceptInvincibleBiaoNpc(value:int):void
		{
			_acceptInvincibleBiaoNpc = value;
		}

		/**
		 * 托运NPC 
		 */
		public static function get countryTuoYunNpc():int
		{
			return _countryTuoYunNpc;
		}

		/**
		 * @private
		 */
		public static function set countryTuoYunNpc(value:int):void
		{
			_countryTuoYunNpc = value;
		}

		
	}
}