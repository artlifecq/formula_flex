package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.crown.CountryModuleData;
	import com.rpgGame.coreData.info.fight.skill.ActiveSpellList;
	import com.rpgGame.coreData.info.mount.MountModuleObjClientData;
	import com.rpgGame.coreData.info.team.TeamUnit;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.type.SpellBlinkType;
	import com.rpgGame.coreData.type.SpellTargetType;
	
	import flash.utils.ByteArray;
	
	import app.message.ActiveSpellProto;
	import app.message.AmountType;
	import app.message.AnimationProto;
	import app.message.BiaoModuleObjProto;
	import app.message.CountryModuleObjProto;
	import app.message.HeroProto;
	import app.message.ModelProto;
	import app.message.MountModuleObjClientProto;
	import app.message.OtherHeroProto;
	import app.message.SpellEffectProto;
	import app.message.SpellProto;
	
	import org.game.netCore.net.ByteBuffer;
	import org.game.netCore.net.BytesUtil;
	
	/**
	 *
	 * 英雄数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class HeroData extends RoleData
	{
		public static var spellArrs:Array = [];
		public static function setUserSingleInfo(info : HeroData, nick : String = null) : void
		{
			info.id = 2;
			info.name = nick;
			info.mapID = 6;
			info.level = 100;
			info.hp = 1000;
			info.totalStat.life = 10000;
			info.totalStat.moveSpeed = 800;
			info.x = 100;
			info.y = 100;
			
			/** 技能数据 **/ //临时的
			var singleAnimation : AnimationProto = new AnimationProto();
			singleAnimation.id = 1;
			singleAnimation.roleRes = "tx_suit_knife1_570_pugong";
			AnimationDataManager.addData(singleAnimation);
			
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
			
			var spellEffect : SpellEffectProto = new SpellEffectProto();
			spellEffect.id = 1;
			spellEffect.attackMotionId = 215;
			spellEffect.breakFrameTime = 100;
			spellEffect.castAnimation = 1;
			SpellEffectDataManager.addData(spellEffect);
			
			spellEffect = new SpellEffectProto();
			spellEffect.id = 2;
			spellEffect.attackMotionId = 215;
			spellEffect.caromStartFrameTime = 100;
			spellEffect.castAnimation = 1;
			SpellEffectDataManager.addData(spellEffect);
			
			spellEffect = new SpellEffectProto();
			spellEffect.id = 3;
			spellEffect.blinkType = SpellBlinkType.TIAO_PI;
			spellEffect.blinkSpeed = 200;
			spellEffect.blinkHeight = 1000;
			spellEffect.soarFrameTime = 200;
			spellEffect.attackMotionId = 220;
			SpellEffectDataManager.addData(spellEffect);
			
			info.spellList.addSpell(spell1);
			info.spellList.addSpell(spell2);
			info.spellList.addSpell(spell3);
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
		public static function setUserLoginInfo(info : HeroData, heroProto : HeroProto) : void
		{
			if (heroProto.heroBasic)
			{
				info.id = heroProto.heroBasic.id.toNumber();
				info.name = heroProto.heroBasic.name;
				info._resources = heroProto.heroBasic.model.resources;
				info.countryId = heroProto.heroBasic.country;
			}
			
			if (heroProto.addSpriteStatModuleObj)
			{
				info.spriteStat.setData(heroProto.addSpriteStatModuleObj.addStat);
				info.obtainSpriteStatPoint = heroProto.addSpriteStatModuleObj.obtainSpriteStatPoint;
				info.usedSpriteStatPoint = heroProto.addSpriteStatModuleObj.usedSpriteStatPoint;
			}
			//			info.totalStat.setData(heroProto.totalStat);
			//			info.spriteStat.setData(heroProto.heroSpriteStat.addStat);
			
			if (heroProto.sceneModuleObj)
			{
				info.totalStat.setData(heroProto.sceneModuleObj.totalStat);
				info.mapID = heroProto.sceneModuleObj.sceneId;
				if (heroProto.sceneModuleObj.heroLevel)
				{
					info.level = heroProto.sceneModuleObj.heroLevel.level;
					info.curExp = heroProto.sceneModuleObj.heroLevel.exp ? heroProto.sceneModuleObj.heroLevel.exp.toNumber() : 0;
					info.upgradeExp = heroProto.sceneModuleObj.heroLevel.upgradeExp.toNumber();
				}
				info.pkAmount = heroProto.sceneModuleObj.pkStatus.pkAmount;
				info.pkAmountLeftTime = heroProto.sceneModuleObj.pkStatus.nextReducePkAmountTime.toNumber();
			}
			
			if (heroProto.heroMiscModuleObj)
			{
				info.amountInfo.setSomeType(AmountType.JINZI, heroProto.heroMiscModuleObj.jinzi ? heroProto.heroMiscModuleObj.jinzi.toNumber() : 0);
				info.amountInfo.setSomeType(AmountType.BAND_JINZI, heroProto.heroMiscModuleObj.bandJinzi ? heroProto.heroMiscModuleObj.bandJinzi.toNumber() : 0);
				info.amountInfo.setSomeType(AmountType.MONEY, heroProto.heroMiscModuleObj.money ? heroProto.heroMiscModuleObj.money.toNumber() : 0);
				info.amountInfo.setSomeType(AmountType.BAND_MONEY, heroProto.heroMiscModuleObj.bandMoney ? heroProto.heroMiscModuleObj.bandMoney.toNumber() : 0);
				info.amountInfo.setSomeType(AmountType.HONOR, heroProto.heroMiscModuleObj.honor ? heroProto.heroMiscModuleObj.honor.toNumber() : 0);
				info.amountInfo.setSomeType(AmountType.GONGXUN, heroProto.heroMiscModuleObj.gongXun ? heroProto.heroMiscModuleObj.gongXun.toNumber() : 0);
				info.amountInfo.setSomeType(AmountType.FAMILY_LILIAN, heroProto.familyModuleObj.familyLiLian ? heroProto.familyModuleObj.familyLiLian.toNumber() : 0);
			}
			info.equipInfo.setEquipsProto(heroProto.goodsContainerModuleObj.heroEquipment);
			info.setCountryModuleData(heroProto.countryModuleObj);
			info.setBiaoModuleObjProto(heroProto.biaoModuleObj);
			info.setMountData(heroProto.mountModuleObj);
			if (heroProto.achievementAndNicknameModuleObj)
			{
				//				info.setAchievementData(heroProto.achievementAndNicknameModuleObj.nicknameId);
			}
			if (heroProto.relationModuleObj)
				info.mood = heroProto.relationModuleObj.hasMood ? BytesUtil.bytes2UTF(heroProto.relationModuleObj.mood) : "";
			info.spellList.setHeroData(heroProto.spellModuleObj.learnRaceSpells);
		}
		
		/**
		 * 角色进入视野
		 * @param info
		 * @param by
		 *
		 */
		public static function setEnterEyeUserInfo(info : HeroData, buffer : ByteBuffer) : void
		{
			info.id = buffer.readVarint64();
			info.countryId = buffer.readVarint32();
			info.name = buffer.readUTF();
			info.societyName = buffer.readUTF();
			//---------------------
			//获取到帮会名称后面的那个varint32，原来是表示职业和vip的，限制加上哈哈
			var result : uint = buffer.readVarint32();
			info.job = result & 7; // 职业，按照原来的就可以了
			//			var manager : int = (result >> 8) & 31;
			//			var countryPos : int = getCountryPos(manager); //得到官员的职位
			//			info.countryPos = countryPos;
			//			info.isGuildLeader = Boolean((manager & (1 << 2)) > 0); //是否是帮主
			//			var vipType : int = (result >> 13); // 平台vip类型
			//			//TODO: 这里可以读取到vip等级 by 康露 2014年12月9日
			//			info.isVip = ((result >>> 3) & 31) != 0; // true表示vip，按照原来的就可以了
			//			var cityMasterResult : uint = result >>> 8;
			info.vipLv = (result >> 3) & 31; // vip等级
			//			info.isWangCity = (cityMasterResult & 1) == 1; // true表示占领王城
			//			info.isHuangCity = ((cityMasterResult >>> 1) & 1) == 1; // true表示占领皇城
			//---------------------
			//info.setResources
			setResources(info, buffer);
			//info.curNickTitle = 
			buffer.readVarint32(); //当前使用称号
			info.level = buffer.readVarint32();
			RoleData.readGeneric(info, buffer);
			
			//			info.atkSpeed = 1; //100 / (100 + buffer.readVarint32());
			
			//			var buffList : Vector.<BuffInfo> = new Vector.<BuffInfo>;
			//			while (buffer.bytesAvailable)
			//			{
			//				var stateID : int = buffer.readVarint32();
			//				var currentStackCount : int = buffer.readVarint32();
			//				var disappearTime : Number = buffer.readVarint64();
			//				var buffVo : BuffInfo = new BuffInfo(stateID);
			//				buffVo.roleID = info.userID;
			//				buffVo.curtStackCount = currentStackCount;
			//				buffVo.disappearTime = disappearTime;
			//				buffList.push(buffVo);
			//			}
			//			info.buffList = buffList;
		}
		
		public static function setResources(info : HeroData, buffer : ByteBuffer) : void
		{
			var resourcesLen : int = buffer.readVarint32();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes, 0, resourcesLen);
			var proto : ModelProto = new ModelProto();
			proto.mergeFrom(bytes);
			info._resources = proto.resources;
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
			teamRoleData.level = teamUint.level;
			teamRoleData.societyName = teamUint.guildName;
			teamRoleData.mapID = teamUint.sceneId;
			teamRoleData.countryId = teamUint.countryId;
			teamRoleData.x = teamUint.mx;
			teamRoleData.y = teamUint.my;
			teamRoleData._resources = teamUint.resources;
		}
		
		/**
		 * 设置队伍成员数据
		 * @param teamRoleData
		 * @param teamUint
		 *
		 */
		public static function setOtherRoleData(heroData : HeroData, roleInfo : OtherHeroProto) : void
		{
			if (roleInfo.hasHeroBasic)
			{
				heroData.id = roleInfo.heroBasic.id.toNumber();
				heroData.countryId = roleInfo.heroBasic.country;
				heroData.name = roleInfo.heroBasic.name;
				heroData._resources = roleInfo.heroBasic.model.resources;
			}
			
			if (roleInfo.hasFamilyModuleObj)
			{
				heroData.societyName = roleInfo.familyModuleObj.familyName;
				heroData.guildName = roleInfo.familyModuleObj.guildName;
			}
			if (roleInfo.hasSceneModuleObj)
			{
				if (roleInfo.sceneModuleObj.pkStatus && roleInfo.sceneModuleObj.pkStatus.pkAmount)
					heroData.pkAmount = roleInfo.sceneModuleObj.pkStatus.pkAmount;
				heroData.hp = roleInfo.sceneModuleObj.life ? roleInfo.sceneModuleObj.life.toNumber() : 0;
				heroData.mp = roleInfo.sceneModuleObj.mana ? roleInfo.sceneModuleObj.mana.toNumber() : 0;
				if (roleInfo.sceneModuleObj.heroLevel)
				{
					heroData.level = roleInfo.sceneModuleObj.heroLevel.level;
					heroData.curExp = roleInfo.sceneModuleObj.heroLevel.exp ? roleInfo.sceneModuleObj.heroLevel.exp.toNumber() : 0;
					heroData.upgradeExp = roleInfo.sceneModuleObj.heroLevel.upgradeExp ? roleInfo.sceneModuleObj.heroLevel.upgradeExp.toNumber() : 0;
				}
				heroData.fightingAmount = roleInfo.sceneModuleObj.fightingAmount.toNumber();
			}
			
			heroData.totalStat.setData(roleInfo.sceneModuleObj.totalStat);
			heroData.equipInfo.setEquipsProto(roleInfo.goodsContainerModuleObj.heroEquipment);
			heroData.mounModuletData.setConfig(roleInfo.mountModuleObj);
		}
		
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
		public var countryModuleData : CountryModuleData;
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
		
		private var _resources : Array;
		
		public function set resources(value : Array) : void
		{
			_resources = value;
		}
		
		
		/** 性别，使用1个bit，前置换装是空，即使用字节数为[0-0] **/
		private var _sexType : ModelType = new ModelType(null, 1);
		/** 头像，使用4个bit，前置换装是性别，即使用字节数为[1-4] **/
		private var _headType : ModelType = new ModelType(_sexType, 4);
		/** 身体，使用2个bit，前置换装是性别，即使用字节数为[5-6] **/
		private var _bodyType : ModelType = new ModelType(_headType, 2);
		/** 职业，使用3个bit，前置换装是性别，即使用字节数为[7-9] **/
		private var _raceType : ModelType = new ModelType(_bodyType, 3);
		/** 武器，使用10个bit，前置换装是性别，即使用字节数为[10-19] **/
		private var _weaponType : ModelType = new ModelType(_raceType, 10);
		/** 副武器，使用8个bit，前置换装是性别，即使用字节数为[20-27] **/
		private var _second_weaponType : ModelType = new ModelType(_weaponType, 8);
		/** 衣服，使用8个bit，前置换装是性别，即使用字节数为[28-35] **/
		private var _armorType : ModelType = new ModelType(_second_weaponType, 8);
		/** 披风，使用8个bit，前置换装是性别，即使用字节数为[36-43] **/
		private var _cloakType : ModelType = new ModelType(_armorType, 8);
		/** pk的名字，黄名、红名、灰名、绿名，使用3个bit，前置换装是性别，即使用字节数为[44-46] 0: 白名，1: 绿名，2: 黄名，3: 灰名，4: 红名 **/
		private var _pk_nameType : ModelType = new ModelType(_cloakType, 3);
		/** 坐骑，使用8个bit，前置换装是性别，即使用字节数为[47-55] **/
		private var _mountType : ModelType = new ModelType(_pk_nameType, 8);
		
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
			countryModuleData = new CountryModuleData();
			countryModuleData.setup(countryModuleObj);
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
			data._resources = _resources;
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
		 * 武器所属职业，穿着不同的武器
		 * 0:当前没有职业
		 * 1:霸刀
		 * 2:其他
		 */
		public function get weaponRace() : int
		{
			return _raceType.getValue(_resources);
		}
		
		/**
		 * true:男
		 * false:女
		 * @return
		 *
		 */
		public function get sex() : Boolean
		{
			return _sexType.getValue(_resources);
		}
		
		public function get headFace() : int
		{
			return _headType.getValue(_resources);
		}
		
		public function get body() : int
		{
			return _bodyType.getValue(_resources);
		}
		
		public function get weapon() : int
		{
			return _weaponType.getValue(_resources);
		}
		
		public function get deputyWeapon() : int
		{
			return _second_weaponType.getValue(_resources);
		}
		
		public function get clothes() : int
		{
			return _armorType.getValue(_resources);
		}
		
		public function get mount() : int
		{
			if (_customMount > 0)
				return _customMount;
			return _mountType.getValue(_resources);
		}
		
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
			return _pk_nameType.getValue(_resources);
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
