package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.fight.skill.ActiveSpellList;
	import com.rpgGame.coreData.info.mount.MountModuleObjClientData;
	import com.rpgGame.coreData.info.team.TeamUnit;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.type.SpellTargetType;
	import com.rpgGame.netData.map.bean.PlayerInfo;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	
	import flash.geom.Point;
	
	import app.message.ActiveSpellProto;
	import app.message.BiaoModuleObjProto;
	import app.message.CountryModuleObjProto;
	import app.message.MountModuleObjClientProto;
	import app.message.OtherHeroProto;
	import app.message.SpellProto;
	
	/**
	 *
	 * 英雄数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class HeroData extends RoleData
	{
		/** 地图ID */
		public var mapID : int;
		/** 职业 **/
		public var job : int;
		/** vip等级 **/
		public var vipLv : int;
		/** PK模式 **/
		public var pkMode : int;
		/** pk值 **/
		public var pkAmount : int;
		/** 下次pk值减小时间 **/
		public var pkAmountLeftTime : Number;
		/** 各种钱消耗  参考： AmountType**/
		public var amountInfo : AmountInfo;
		/** 角色穿戴的装备信息**/
		public var equipInfo : RoleEquipInfo;
		/** 角色当前经验 **/
		public var curExp : Number;
		/** 角色当前增加的经验 **/
		public var upgradeExp : Number;
		public var canStorageExp : Number;
		/**场景是哪个国家的   副本、中立时是 0，是无效值**/
		public var sceneSequence : int;
		/**几线**/
		public var line : int;
		/**帮派**/
		public var societyName : String = "";
		/** 英雄国家模块数据 **/
		//		public var countryModuleData : CountryModuleData;
		/**镖车**/
		public var biaoCheData : BiaoCheData;
		/** 英雄坐骑模块数据 **/
		public var mounModuletData : MountModuleObjClientData;
		/**复活等级系数**/
		public var relive_coeff : int;
		/** 是否小队跟随中 **/
		private var _isFollowing : Boolean;
		/**心情(好友系统)**/
		public var mood : String = "";
		/**帮派名**/
		public var guildName : String = "";
		/**今天接了几次镖车任务**/
		public var biaoTimes : int;
		/**
		 * 角色阶段---每个阶段对应的骨骼不一样，动作有所升级 
		 * @return 
		 * 
		 */	
		public var body:int;
		
		public var cloths:int;
		
		public var mount:int;
		
		public var pkType:int;
		
		public var weapon:int;
		
		public var deputyWeapon:int;
		
		public var sex:int;
		
		
		private var _customMount : int = 0;
		public var trailMount : String = null;
		public var trailMountAnimat : String = null;
		
		public function HeroData()
		{
			super(RoleType.TYPE_HERO);
			spellList = new ActiveSpellList();
			amountInfo = new AmountInfo();
			equipInfo = new RoleEquipInfo();
			mounModuletData = new MountModuleObjClientData();
		}
		
		public static var spellArrs:Array = [];
		public static function setUserSingleInfo(info : HeroData, nick : String = null) : void
		{
			info.id = 2;
			info.name = nick;
			info.mapID = 1;
			info.totalStat.level = 100;
			info.totalStat.hp = 1000;
			info.totalStat.life = 10000;
			info.totalStat.moveSpeed = 800;
			info.x = 100;
			info.y = 100;
			
			/** 技能数据 **/ //临时的
			var activeSpell1 : ActiveSpellProto = new ActiveSpellProto();
			activeSpell1.spellId = 1;
			activeSpell1.isLockingSpell = false;
			activeSpell1.isReleaseAtMouse = true;
			activeSpell1.targetType = SpellTargetType.SELF;
			activeSpell1.spellType = 1;
			activeSpell1.cd = 50;
			activeSpell1.relateSpells = [activeSpell2];
			var spell1:SpellProto = new SpellProto();
			spell1.spellType = 1;
			spell1.activeSpell = activeSpell1;
			
			var activeSpell2 : ActiveSpellProto = new ActiveSpellProto();
			activeSpell2.spellId = 2;
			activeSpell2.isLockingSpell = false;
			activeSpell2.isReleaseAtMouse = true;
			activeSpell2.targetType = SpellTargetType.SELF;
			activeSpell2.spellType = 2;
			activeSpell2.cd = 50;
			var spell2:SpellProto = new SpellProto();
			spell2.spellType = 2;
			spell2.activeSpell = activeSpell2;
			
			var activeSpell3 : ActiveSpellProto = new ActiveSpellProto();
			activeSpell3.spellId = 3;
			activeSpell3.spellType = 3;
			activeSpell3.spellEffectId = 3;
			activeSpell3.cd = 50;
			var spell3:SpellProto = new SpellProto();
			spell3.spellType = 3;
			spell3.activeSpell = activeSpell3;
			
//			info.spellList.addSpell(spell1);
//			info.spellList.addSpell(spell2);
//			info.spellList.addSpell(spell3);
			spellArrs.push(spell1);
			spellArrs.push(spell2);
			spellArrs.push(spell3);
		}
		
		/**
		 * 设置英雄登录专用
		 * @param info
		 * @param heroProto
		 * @param nick
		 *
		 */
		public static function setUserLoginInfo(data : HeroData, heroInfo : MyPlayerInfo) : void
		{
			///角色基本信息
			data.serverID = heroInfo.personId;
			data.id = heroInfo.personId.ToGID();
			data.name = heroInfo.name;
			data.mapID = heroInfo.mapModelId;
			data.body = heroInfo.body;
			data.cloths = heroInfo.cloths;
			data.mount = 0;//heroInfo.mount;
			data.pkType = heroInfo.pkType;
			data.weapon = heroInfo.weapon;
			data.deputyWeapon = heroInfo.second_weapon;
			data.sex = heroInfo.sex;
			///角色属性信息
			data.totalStat.setData(heroInfo.attributes);
			
			//			data.buffList = new Vector.<BuffInfo>();
			/*while (msg.buff > 0)
			{
			var buffInfo : BuffInfo = new BuffInfo(data.id);
			buffInfo.cfgId = buffer.readVarint32();
			buffInfo.curtStackCount = buffer.readVarint32();
			buffInfo.disappearTime = buffer.readVarint64();
			data.buffList.push(buffInfo);
			}*/
			///角色位置信息
			RoleData.readGeneric(data, new Point(heroInfo.x,heroInfo.y));
		
		
			//			if (heroProto.heroMiscModuleObj)
			//			{
			//				info.amountInfo.setSomeType(AmountType.JINZI, heroProto.heroMiscModuleObj.jinzi ? heroProto.heroMiscModuleObj.jinzi.toNumber() : 0);
			//				info.amountInfo.setSomeType(AmountType.BAND_JINZI, heroProto.heroMiscModuleObj.bandJinzi ? heroProto.heroMiscModuleObj.bandJinzi.toNumber() : 0);
			//				info.amountInfo.setSomeType(AmountType.MONEY, heroProto.heroMiscModuleObj.money ? heroProto.heroMiscModuleObj.money.toNumber() : 0);
			//				info.amountInfo.setSomeType(AmountType.BAND_MONEY, heroProto.heroMiscModuleObj.bandMoney ? heroProto.heroMiscModuleObj.bandMoney.toNumber() : 0);
			//				info.amountInfo.setSomeType(AmountType.HONOR, heroProto.heroMiscModuleObj.honor ? heroProto.heroMiscModuleObj.honor.toNumber() : 0);
			//				info.amountInfo.setSomeType(AmountType.GONGXUN, heroProto.heroMiscModuleObj.gongXun ? heroProto.heroMiscModuleObj.gongXun.toNumber() : 0);
			//				info.amountInfo.setSomeType(AmountType.FAMILY_LILIAN, heroProto.familyModuleObj.familyLiLian ? heroProto.familyModuleObj.familyLiLian.toNumber() : 0);
			//			}
			//			info.equipInfo.setEquipsProto(heroProto.goodsContainerModuleObj.heroEquipment);
			//			info.setCountryModuleData(heroProto.countryModuleObj);
			//			info.setBiaoModuleObjProto(heroProto.biaoModuleObj);
			//			info.setMountData(heroProto.mountModuleObj);
			//			if (heroProto.achievementAndNicknameModuleObj)
			//			{
			//				//				info.setAchievementData(heroProto.achievementAndNicknameModuleObj.nicknameId);
			//			}
			//			if (heroProto.relationModuleObj)
			//				info.mood = heroProto.relationModuleObj.hasMood ? BytesUtil.bytes2UTF(heroProto.relationModuleObj.mood) : "";
			//			info.spellList.setHeroData(heroProto.spellModuleObj.learnRaceSpells);
		}
		
		/**
		 * 角色进入视野
		 * @param info
		 * @param by
		 *
		 */
		public static function setEnterEyeUserInfo(data : HeroData, info : PlayerInfo) : void
		{
			data.serverID = info.personId;
			data.id = info.personId.ToGID();
			data.name = info.name;
			
			//			data.countryId = buffer.readVarint32();
			//			data.societyName = buffer.readUTF();
			if(data.societyName != "")
			{
				//				data.guildName = info.guildName;
			}
			
			data.job = info.job; // 职业，按照原来的就可以了
			
			//			data.vipLv = info.viplevel; // vip等级
			
			//avatar相关
			data.body = info.body;
			data.cloths = info.cloths;
			data.mount = 0;//info.mount;
			data.pkType = info.pkType;
			data.weapon = info.weapon;
			data.deputyWeapon = info.second_weapon;
			
			data.totalStat.setData(info.attributes);
			
//			data.hp = info.hp;
//			data.totalStat.life = info.maxHp;
//			data.mp = info.mp;
//			data.totalStat.mana = info.maxMp;
//			
//			data.buffList = new Vector.<BuffInfo>();
//			while (msg.buff > 0)
//			{
//				var buffInfo : BuffInfo = new BuffInfo(data.id);
//				buffInfo.cfgId = buffer.readVarint32();
//				buffInfo.curtStackCount = buffer.readVarint32();
//				buffInfo.disappearTime = buffer.readVarint64();
//				data.buffList.push(buffInfo);
//			}
			
			RoleData.readGeneric(data, new Point(info.x,info.y));
		}
		
		/**
		 * 设置队伍成员数据
		 * @param teamRoleData
		 * @param teamUint
		 *
		 */
		public static function setTeamRoleData(teamRoleData : HeroData, teamUint : TeamUnit) : void
		{
			teamRoleData.id = teamUint.id;
			teamRoleData.name = teamUint.name;
			teamRoleData.totalStat.level = teamUint.level;
			teamRoleData.societyName = teamUint.guildName;
			teamRoleData.mapID = teamUint.sceneId;
			teamRoleData.countryId = teamUint.countryId;
			teamRoleData.x = teamUint.mx;
			teamRoleData.y = teamUint.my;
//			teamRoleData._resources = teamUint.resources;
		}
		
		/**
		 * 设置队伍成员数据
		 * @param teamRoleData
		 * @param teamUint
		 *
		 */
		public static function setOtherRoleData(heroData : HeroData, roleInfo : OtherHeroProto) : void
		{
//			if (roleInfo.hasHeroBasic)
//			{
//				heroData.id = roleInfo.heroBasic.id.toNumber();
//				heroData.countryId = roleInfo.heroBasic.country;
//				heroData.name = roleInfo.heroBasic.name;
//				heroData._resources = roleInfo.heroBasic.model.resources;
//			}
//			
//			if (roleInfo.hasFamilyModuleObj)
//			{
//				heroData.societyName = roleInfo.familyModuleObj.familyName;
//				heroData.guildName = roleInfo.familyModuleObj.guildName;
//			}
//			if (roleInfo.hasSceneModuleObj)
//			{
//				if (roleInfo.sceneModuleObj.pkStatus && roleInfo.sceneModuleObj.pkStatus.pkAmount)
//					heroData.pkAmount = roleInfo.sceneModuleObj.pkStatus.pkAmount;
//				heroData.hp = roleInfo.sceneModuleObj.life ? roleInfo.sceneModuleObj.life.toNumber() : 0;
//				heroData.mp = roleInfo.sceneModuleObj.mana ? roleInfo.sceneModuleObj.mana.toNumber() : 0;
//				if (roleInfo.sceneModuleObj.heroLevel)
//				{
//					heroData.level = roleInfo.sceneModuleObj.heroLevel.level;
//					heroData.curExp = roleInfo.sceneModuleObj.heroLevel.exp ? roleInfo.sceneModuleObj.heroLevel.exp.toNumber() : 0;
//					heroData.upgradeExp = roleInfo.sceneModuleObj.heroLevel.upgradeExp ? roleInfo.sceneModuleObj.heroLevel.upgradeExp.toNumber() : 0;
//				}
//				heroData.fightingAmount = roleInfo.sceneModuleObj.fightingAmount.toNumber();
//			}
//			
//			heroData.totalStat.setData(roleInfo.sceneModuleObj.totalStat);
//			heroData.equipInfo.setEquipsProto(roleInfo.goodsContainerModuleObj.heroEquipment);
//			heroData.mounModuletData.setConfig(roleInfo.mountModuleObj);
		}
		
		public function get jobName() : String
		{
			switch (job)
			{
				case JobEnum.ROLE_1_TYPE:
					return JobEnum.ROLE_1_NAME;
				case JobEnum.ROLE_2_TYPE:
					return JobEnum.ROLE_2_NAME;
				case JobEnum.ROLE_3_TYPE:
					return JobEnum.ROLE_3_NAME;
			}
			return "无";
		}
		
		private function setCountryModuleData(countryModuleObj : CountryModuleObjProto) : void
		{
			//			countryModuleData = new CountryModuleData();
			//			countryModuleData.setup(countryModuleObj);
		}
		
		/**
		 * 设置英雄镖车模块数据
		 * @param biaoModuleObjPro
		 *
		 */
		private function setBiaoModuleObjProto(biaoModuleObjPro : BiaoModuleObjProto) : void
		{
			if (biaoModuleObjPro.hasTodayAcessPersonalBiaoTimes)
				biaoTimes = biaoModuleObjPro.todayAcessPersonalBiaoTimes;
		}
		
		/**
		 * 克隆换装资源
		 * @param data
		 *
		 */
		public function cloneResourcesTo(data : HeroData) : void
		{
//			data._resources = _resources;
		}
		
		/**
		 * 设置英雄坐骑模块数据
		 * @param cmountModuleObj
		 *
		 */
		private function setMountData(mountModuleObj : MountModuleObjClientProto) : void
		{
			mounModuletData.setConfig(mountModuleObj);
		}
		
		//		/**
		//		 * 设置称号模块数据
		//		 * @param cmountModuleObj
		//		 *
		//		 */
		//		private function setAchievementData(achievement : AchievementInfoProto) : void
		//		{
		//			//todo..
		//		}
		
		/**
		 * 0: 白名
		 * 1: 绿名
		 * 2: 黄名
		 * 3: 灰名
		 * 4: 红名
		 * @return
		 *
		 */
		public function get nameColor() : int
		{
			//			return _pk_nameType.getValue(_resources);
			return 0;
		}
		
		/** 是否小队跟随中 **/
		public function get isFollowing() : Boolean
		{
			return _isFollowing;
		}
		
		/**
		 * @private
		 */
		public function set isFollowing(value : Boolean) : void
		{
			_isFollowing = value;
		}
		
		/**
		 *  自定义坐骑，仅给预览使用
		 */
		public function set customMount(value : int) : void
		{
			_customMount = value;
		}
	}
}
