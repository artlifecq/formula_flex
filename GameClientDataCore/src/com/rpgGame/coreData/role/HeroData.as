package com.rpgGame.coreData.role
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.info.fight.skill.ActiveSpellList;
	import com.rpgGame.coreData.info.mount.MountModuleObjClientData;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
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
	 * @author L.L.M.Sunnyse
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
		/** 角色当前经验 **/
		public var curExp : Number;
		/** 最大经验 **/
		public var maxExp:Number;
		/** 最大经验 **/
		public var maxZhenqi:Number;
		
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
		/**伴侣**/
		public var loveName : String = "";
		/**今天接了几次镖车任务**/
		public var biaoTimes : int;
		/**
		 * 角色阶段---每个阶段对应的骨骼不一样，动作有所升级 
		 * @return 
		 * 
		 */	
		public var body:int;
		
		/**
		 *头发资源id 
		 */
		public var hair:int;
		
		/**
		 *衣服资源id 
		 */
		public var cloths:int;
		
		/**
		 *坐骑资源id 
		 */
		public var mount:int;
		
		public var pkType:int;
		
		/**
		 *武器资源id
		 */
		public var weapon:int;
		
		/**
		 *副武器资源 
		 */
		public var deputyWeapon:int;
		
		public var sex:int;
		
		public var junjieLv:int;
		
		
		private var _customMount : int = 0;
		public var trailMount : String = null;
		public var trailMountAnimat : String = null;
		
		/**
		 *战魂等级 
		 */
		public var fightSoulLevel:int = 0;
		
		public function HeroData()
		{
			super(RoleType.TYPE_HERO);
			spellList = new ActiveSpellList();
			amountInfo = new AmountInfo();
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
		 *当前真气 
		 * @return 
		 * 
		 */
		public function get curZhenqi():Number
		{
			return totalStat.getResData(CharAttributeType.RES_ZHENQI);
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
			data.hair = heroInfo.hair;
			data.mount = heroInfo.mount;
			data.pkMode = heroInfo.pkType;
			data.relation = heroInfo.relation;
			//data.pkType = heroInfo.pkType;
			data.weapon = heroInfo.weapon;
			data.deputyWeapon = heroInfo.second_weapon;
			data.sex = heroInfo.sex;
			data.job = heroInfo.job;
			
			data.maxExp=heroInfo.maxExp.fValue;
			data.maxZhenqi=heroInfo.maxZhenQi.fValue;
			data.curExp=heroInfo.exp.fValue;
			
			///角色属性信息
			data.totalStat.setData(heroInfo.attributes);
			data.totalStat.setResDatas(heroInfo.resourceData);
			
			for(var i:int=0;i<heroInfo.buffs.length;i++)
			{
				var buffData:BuffData = new BuffData(data.id);
				buffData.buffInfo = heroInfo.buffs[i];
				data.buffList.push(buffData);
			}
			///角色位置信息
			RoleData.readGeneric(data, new Point(heroInfo.position.x,heroInfo.position.y));
			
			
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
			GameLog.addShow("主角的服务器id为：  " + data.serverID.ToString());
		}
		
		public  function setSomeType(type:int,value:int):void
		{
			amountInfo.setSomeType(type,value);
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
			data.direction=info.dir;
			//			data.vipLv = info.viplevel; // vip等级
			
			//avatar相关
			data.body = info.body;
			data.hair = info.hair;
			data.cloths = info.cloths;
			data.mount = info.mount;
			data.pkMode = info.pkType;
			data.relation = info.relation;
			data.pkType = info.pkType;
			data.weapon = info.weapon;
			data.deputyWeapon = info.second_weapon;
			data.junjieLv=info.junJieId;
			
			data.totalStat.setData(info.attributes);
			
			//			data.hp = info.hp;
			//			data.totalStat.life = info.maxHp;
			//			data.mp = info.mp;
			//			data.totalStat.mana = info.maxMp;
			//			
			
			for(var i:int=0;i<info.buffs.length;i++)
			{
				var buffData:BuffData = new BuffData(data.id);
				buffData.buffInfo = info.buffs[i];
				data.buffList.push(buffData);
			}
			
			RoleData.readGeneric(data, new Point(info.position.x,info.position.y));
		}
		
		//		/**
		//		 * 设置队伍成员数据
		//		 * @param teamRoleData
		//		 * @param teamUint
		//		 *
		//		 */
		//		public static function setTeamRoleData(teamRoleData : HeroData, teamUint : TeamUnit) : void
		//		{
		//			teamRoleData.id = teamUint.id;
		//			teamRoleData.name = teamUint.name;
		//			teamRoleData.totalStat.level = teamUint.level;
		//			teamRoleData.societyName = teamUint.guildName;
		//			teamRoleData.mapID = teamUint.sceneId;
		//			teamRoleData.countryId = teamUint.countryId;
		//			teamRoleData.x = teamUint.mx;
		//			teamRoleData.y = teamUint.my;
		//			//			teamRoleData._resources = teamUint.resources;
		//		}
		
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
				case JobEnum.ROLE_3_TYPE:
					return JobEnum.ROLE_2_NAME;
				case JobEnum.ROLE_4_TYPE:
					return JobEnum.ROLE_3_NAME;
			}
			return "不存在的职业类型";
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
