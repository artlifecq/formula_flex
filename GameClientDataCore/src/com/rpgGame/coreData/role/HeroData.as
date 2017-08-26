package com.rpgGame.coreData.role
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.info.fight.skill.ActiveSpellList;
	import com.rpgGame.coreData.info.mount.MountModuleObjClientData;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.map.bean.PlayerInfo;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	import com.rpgGame.netData.structs.IntKeyValue;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import org.game.netCore.data.long;
	
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
		/** 上一个地图ID */
		public var preMapID : int;
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
		/**帮会职位**/
		public var guildMemberType: int;
		/**帮会Id**/
		public var guildId:long;
		//帮会职位(统帅,1:是,0:不是)
		public var guildIsLeader: int;
		/**伴侣**/
		public var loveName : String = "";
		/**今天接了几次镖车任务**/
		public var biaoTimes : int;
		
		/**
		 *额外需要显示的参数 
		 */
		public var keyValueList:Vector.<IntKeyValue>;
		
		/**
		 * 角色阶段---每个阶段对应的骨骼不一样，动作有所升级 
		 * @return 
		 * 
		 */	
		public var body:int;
		
		private var _hair:int;
		private var _cloths:int;
		private var _weapon:int;
		private var _deputyWeapon:int;
		private var _trailMount : String = null;
		private var _trailMountAnimat : String = null;
		
		private var _mount:int;
		
		
		
		
		public var sex:int;
		
		
		/**军阶等级*/
		public var junjieLv:int;
		private var _zhanqiLv:int;
		/**宝物等级*/
		public var baowuLv:int;
		
		private var _customMount : int = 0;
		
		/**
		 *战魂等级 
		 */
		public var fightSoulLevel:int = 0;
		
		public var loginDay:int = 0;
		
		public var topLeaderTypes: Vector.<int>;
		/**
		 *夫妻名字 
		 */		
		public var coupleName:String;
		public function HeroData(priority:int=3000)
		{
			super(RoleType.TYPE_HERO,priority);
			spellList = new ActiveSpellList();
			amountInfo = new AmountInfo();
			mounModuletData = new MountModuleObjClientData();
		}
		
		
		public static var spellArrs:Array = [];

		/**
		 *坐骑资源id 
		 */
		public function get mount():int
		{
			return _mount;
		}

		public function set mount(value:int):void
		{
			_mount = value;
		}

		/**战旗等级*/
		public function get zhanqiLv():int
		{
			return _zhanqiLv;
		}

		public function set zhanqiLv(value:int):void
		{
			_zhanqiLv = value;
			/*var zhanqiInfo:Q_warflag = ZhanQiConfigData.getZhanQiDataById(_zhanqiLv);
			if(zhanqiInfo)
			{
				this.avatarInfo.zhanqiResID = zhanqiInfo.q_panel_show_id;
			}*/
		}

		public function get trailMountAnimat():String
		{
			return _trailMountAnimat;
		}

		public function set trailMountAnimat(value:String):void
		{
			_trailMountAnimat = value;
			this.avatarInfo.setMountResID(_trailMount, _trailMountAnimat);
		}

		public function get trailMount():String
		{
			return _trailMount;
		}

		public function set trailMount(value:String):void
		{
			_trailMount = value;
			this.avatarInfo.setMountResID(_trailMount, _trailMountAnimat);
		}

		/**
		 *衣服资源id 
		 */
		public function get cloths():int
		{
			return _cloths;
		}

		/**
		 * 服装资源
		 * @private
		 */
		public function set cloths(value:int):void
		{
			_cloths = value;
			/*var clothesRes : AvatarClothesRes = AvatarClothesResCfgData.getInfo(_cloths);
			if (!clothesRes)
			{
				clothesRes = AvatarClothesResCfgData.getInfo(this.job);
			}
			if(clothesRes){
				this.avatarInfo.setBodyResID(clothesRes.bodyRes, this.avatarInfo.bodyAnimatResID);
				this.avatarInfo.bodyEffectID = clothesRes.effectRes;
			}*/
		}

		/**
		 *头发资源id 
		 */
		public function get hair():int
		{
			return _hair;
		}

		/**
		 * 头发资源
		 * @private
		 */
		public function set hair(value:int):void
		{
			_hair = value;
		}

		/**
		 *副武器资源 
		 */
		public function get deputyWeapon():int
		{
			return _deputyWeapon;
		}

		/**
		 * @private
		 */
		public function set deputyWeapon(value:int):void
		{
			_deputyWeapon = value;
			var deputyWeaponRes : AvatarDeputyWeaponRes = AvatarDeputyWeaponResCfgData.getInfo(_deputyWeapon);
			if (deputyWeaponRes)
			{
				this.avatarInfo.deputyWeaponResID = deputyWeaponRes.res;
				this.avatarInfo.deputyWeaponEffectID = deputyWeaponRes.effectRes;
				this.avatarInfo.deputyWeaponEffectScale = deputyWeaponRes.effectScale;
				this.avatarInfo.deputyWeaponEffectOffset =new Vector3D(deputyWeaponRes.effectOffsetX, deputyWeaponRes.effectOffsetY, deputyWeaponRes.effectOffsetZ);
			}else{
				this.avatarInfo.deputyWeaponResID = null;
				this.avatarInfo.deputyWeaponEffectID = null;
			}
		}

		/**
		 *武器资源id
		 */
		public function get weapon():int
		{
			return _weapon;
		}

		/**
		 * @private
		 */
		public function set weapon(value:int):void
		{
			_weapon = value;
		/*	var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(_weapon);
			if (weaponRes)
			{
				this.avatarInfo.weaponResID = weaponRes.res;
				this.avatarInfo.weaponEffectID = weaponRes.effectRes;
				this.avatarInfo.weaponEffectScale = weaponRes.effectScale;
				this.avatarInfo.weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
			}else{
				this.avatarInfo.weaponResID = null;
				this.avatarInfo.weaponEffectID = null;
			}*/
		}

		public static function setUserSingleInfo(info : HeroData, nick : String = null) : void
		{
			
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
			data.faction=heroInfo.faction;
			//data.pkType = heroInfo.pkType;
			data.weapon = heroInfo.weapon;
			data.deputyWeapon = heroInfo.second_weapon;
			data.sex = heroInfo.sex;
			data.job = heroInfo.job;
			
			data.maxExp=heroInfo.maxExp.fValue;
			data.maxZhenqi=heroInfo.maxZhenQi.fValue;
			data.curExp=heroInfo.exp.fValue;
			data.guildId=heroInfo.guildId;
			data.guildMemberType = heroInfo.guildMemberType;
			data.guildName = heroInfo.guildName;
			data.guildIsLeader=heroInfo.guildIsLeader;
			data.topLeaderTypes = heroInfo.topLeaderTypes;
			
			///角色属性信息
			data.totalStat.setData(heroInfo.attributes);
			data.totalStat.setResDatas(heroInfo.resourceData);
			//因为跨服也会发这个，所以先把buff清了 by yfl
			data.buffList.length=0;
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
			data.sex=info.sex;
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
			data.faction=info.faction;
			
			data.weapon = info.weapon;
			data.deputyWeapon = info.second_weapon;
			data.junjieLv=info.junJieId;
			data.zhanqiLv=info.warflag;
			data.baowuLv=info.convoy;
			data.topLeaderTypes = info.topLeaderTypes;
			data.totalStat.setData(info.attributes);
			data.coupleName=info.marriageName;
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
			data.guildName = info.guildName;
			data.guildMemberType = info.guildMemberType;
			data.guildId=info.guildId;
			RoleData.readGeneric(data, new Point(info.position.x,info.position.y));
			
			data.keyValueList=info.keyValueList;
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
		public static function setOtherRoleData(heroData : HeroData, roleInfo : Object) : void
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
		
		private function setCountryModuleData(countryModuleObj : Object) : void
		{
			//			countryModuleData = new CountryModuleData();
			//			countryModuleData.setup(countryModuleObj);
		}
		
		/**
		 * 设置英雄镖车模块数据
		 * @param biaoModuleObjPro
		 *
		 */
		private function setBiaoModuleObjProto(biaoModuleObjPro : Object) : void
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
//		private function setMountData(mountModuleObj : Object) : void
//		{
//			mounModuletData.setConfig(mountModuleObj);
//		}
		
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
			return  StaticValue.BEIGE_TEXT;
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
