package com.rpgGame.app.data
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.mount.HorseExtraItemInfo;
	import com.rpgGame.app.manager.mount.ZhanQiExtraItemInfo;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.AreaCfgData;
	import com.rpgGame.coreData.cfg.AttFormulaConfig;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.AttachEffectCfgData;
	import com.rpgGame.coreData.cfg.AttributeCfg;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.ChangeModelCfgData;
	import com.rpgGame.coreData.cfg.ClientAreaCfgData;
	import com.rpgGame.coreData.cfg.ClientBuffCfgData;
	import com.rpgGame.coreData.cfg.ClientDialogCfgData;
	import com.rpgGame.coreData.cfg.ClientSceneEffectCfgData;
	import com.rpgGame.coreData.cfg.ClientSceneNpcCfgData;
	import com.rpgGame.coreData.cfg.ClientSceneRoleCfgData;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.cfg.DieCfgData;
	import com.rpgGame.coreData.cfg.FaceCfgData;
	import com.rpgGame.coreData.cfg.FightsoulData;
	import com.rpgGame.coreData.cfg.FightsoulModeData;
	import com.rpgGame.coreData.cfg.FightsoulPathData;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.cfg.GCDCfgData;
	import com.rpgGame.coreData.cfg.GlobalSettingCfgData;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.GmConfig;
	import com.rpgGame.coreData.cfg.GridOpenCfg;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.cfg.GuildSkillCfgData;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.cfg.HintCfgData;
	import com.rpgGame.coreData.cfg.HintConfig;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.HorseSpellData;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.cfg.InitPlayerInfoCfgData;
	import com.rpgGame.coreData.cfg.JiXianTiaoZhanCfgData;
	import com.rpgGame.coreData.cfg.JunJieData;
	import com.rpgGame.coreData.cfg.LijinCfgData;
	import com.rpgGame.coreData.cfg.LinkCfg;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.cfg.LostSkillUpData;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.cfg.MapJumpCfgData;
	import com.rpgGame.coreData.cfg.MapPreLoadData;
	import com.rpgGame.coreData.cfg.MibaoCfgData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.cfg.NineTowerCfg;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.PetAdvanceCfg;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.cfg.QBattleRewardCfgData;
	import com.rpgGame.coreData.cfg.QKindomnameCfgData;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.cfg.QVertexColorCfgData;
	import com.rpgGame.coreData.cfg.RaceCfgData;
	import com.rpgGame.coreData.cfg.RankDesignationData;
	import com.rpgGame.coreData.cfg.RedRewardCfgData;
	import com.rpgGame.coreData.cfg.RelationCfgData;
	import com.rpgGame.coreData.cfg.SceneEffectCfgData;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SourceGetCfg;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.cfg.StatNameCfgData;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.cfg.TransCfgData;
	import com.rpgGame.coreData.cfg.TriggerCfgData;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.WindowInfoData;
	import com.rpgGame.coreData.cfg.ZhanGongData;
	import com.rpgGame.coreData.cfg.ZhanGongMonsterData;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.cfg.ZoneCfgData;
	import com.rpgGame.coreData.cfg.ZoneMultyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.WorldBossCfgData;
	import com.rpgGame.coreData.cfg.animat.EffectAnimationCfgData;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.cfg.cheats.CheatsNodeCfg;
	import com.rpgGame.coreData.cfg.hunyin.HunYinHuDongData;
	import com.rpgGame.coreData.cfg.hunyin.HunYinSkillData;
	import com.rpgGame.coreData.cfg.hunyin.JieHunJieZiData;
	import com.rpgGame.coreData.cfg.item.EquipJiChengData;
	import com.rpgGame.coreData.cfg.item.EquipPolishCfg;
	import com.rpgGame.coreData.cfg.item.EquipStrengthCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.cfg.item.EquipWashCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.cfg.model.AvatarClothesResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarHairResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarMountResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.cfg.model.BaZhenTuResCfgData;
	import com.rpgGame.coreData.cfg.model.HeroModelCfgData;
	import com.rpgGame.coreData.cfg.model.MountModelCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
	import com.rpgGame.coreData.cfg.sound.GameSoundCfgData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Config;
	import com.rpgGame.coreData.clientConfig.ConfigClassRegister;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.netData.chat.bean.HyperInfo;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import app.message.ServiceConfig;
	
	import org.game.netCore.net_protobuff.BytesUtil;
	
	/**
	 * 配置数据解析模块，这个模块只提供数据的解析，不提供数据的存储，具体的数据存储到各自模块中
	 * 如果新写数据模块，！！！不要以这个模块为模板来做！！！
	 * @author 康露
	 * 2014年10月13日
	 */
	public class ConfigManager
	{
		public function ConfigManager()
		{
		}
		
		/**
		 * 直接使用缓存中的配置(如果缓存为空，向服务端请求配置文件)
		 */
		public function getLocalConfig() : void
		{
			var byte : ByteArray //= Mgr.resMgr.localConfigByte;
			if (byte == null)
			{
				GameLog.throwError(new Error("本地缓存为空"));
			}
			else
			{
				setConfig(byte, true);
			}
		}
		
		/**
		 * 使用服务器下发的配置
		 */
		public static function recServerConfig(byte : ByteArray) : void
		{
			setConfig(byte, false);
		}
		
		/**
		 * 设置只有客户端自己用的数据,配置在clientres/res/config/data 目录下的数据
		 */
		public static function recClientConfig(dic : Dictionary) : void
		{
			////////////////////////////////////////////////////////////////////////
			//
			//   以下为客户端专用表
			//
			///////////////////////////////////////////////////////////////////////
			ClientSceneNpcCfgData.setup(dic[ConfigClassRegister.ClientSceneNPC]);
			ClientSceneEffectCfgData.setup(dic[ConfigClassRegister.ClientSceneEffect]);
			ClientSceneRoleCfgData.setup(dic[ConfigClassRegister.ClientSceneRole]);
			ClientAreaCfgData.setup(dic[ConfigClassRegister.ClientArea]);
			ClientDialogCfgData.setup(dic[ConfigClassRegister.ClientDialog]);
			GmConfig.setup(dic[ConfigClassRegister.GmInfo]);
			GlobalSettingCfgData.setup(dic[ConfigClassRegister.GlobalSetting]);
			HintConfig.setup(dic[ConfigClassRegister.HintInfo]);
			GameSoundCfgData.setup(dic[ConfigClassRegister.GameSoundInfo]);
			
			HeroModelCfgData.setup(dic[ConfigClassRegister.HeroModel]);
			MountModelCfgData.setup(dic[ConfigClassRegister.MountModel]);
			AvatarMountResCfgData.setup(dic[ConfigClassRegister.AvatarMountRes]);
			AvatarWeapontResCfgData.setup(dic[ConfigClassRegister.AvatarWeaponRes]);
			AvatarDeputyWeaponResCfgData.setup(dic[ConfigClassRegister.AvatarDeputyWeaponRes]);
			AvatarClothesResCfgData.setup(dic[ConfigClassRegister.AvatarClothesRes]);
			AvatarHairResCfgData.setup(dic[ConfigClassRegister.AvatarHairRes]);
			AvatarResConfigSetData.setup(dic[ConfigClassRegister.AvatarResConfig]);
			
			AttachEffectCfgData.setup(dic[ConfigClassRegister.Attach_effect]);
			ChangeModelCfgData.setup(dic[ConfigClassRegister.ChangeModel]);
			RelationCfgData.setup(dic[ConfigClassRegister.Q_relation]);
			
			BaZhenTuResCfgData.setup(dic[ConfigClassRegister.BaZhenTuRes]);
			
			
			
			EffectAnimationCfgData.setup(dic[ConfigClassRegister.EffectAnimation]);
			FaceCfgData.setup(dic[ConfigClassRegister.FaceInfo]);
			//			GmLevelAddSpellPointData.setup(dic[ConfigClassRegister.GmLevelAddSpellPoint]);
			StatNameCfgData.setup(dic[ConfigClassRegister.SpriteStatNameInfo]);
			//			EquipTypeNameCfgData.setup(dic[ConfigClassRegister.EquipTypeNameInfo]);
			//			EquipRefineTimesCfgData.setup(dic[ConfigClassRegister.EquipRefineTimesInfo]);
			RaceCfgData.setup(dic[ConfigClassRegister.RaceNameInfo]);
			//			CrownNeiZhengCfgData.setup(dic[ConfigClassRegister.CrownNeiZhenInfo]);
			//			EquipMainStatCfgData.setup(dic[ConfigClassRegister.EquipMainStat]);
			HintCfgData.setUpHintTypeSet(dic[ConfigClassRegister.HintTypeSetInfo]);
			//			ClientCountryWarChengMenCfgData.setup(dic[ConfigClassRegister.CountryWarChengMenInfo]);
			//			CrownPanelPagesCfgData.setup(dic[ConfigClassRegister.CrownPageInfo]);
			ClientBuffCfgData.setUpHintTypeSet(dic[ConfigClassRegister.ClientBuff]);
			ItemConfig.setup(dic[ConfigClassRegister.Q_item]);
			TipsCfgData.setup(dic[ConfigClassRegister.Q_tipsinfo]);
			AttValueConfig.setup(dic[ConfigClassRegister.Q_att_values]);
			AttFormulaConfig.setup(dic[ConfigClassRegister.Q_att_transfer]);
			DieCfgData.setup(dic[ConfigClassRegister.Q_die]);
			GCDCfgData.setup(dic[ConfigClassRegister.Q_GCD]);
			SkillLvLDataManager.setup(dic[ConfigClassRegister.Q_skill_ignore]);
			
			EquipStrengthCfg.setup(dic[ConfigClassRegister.Q_equip_strength]);
			EquipPolishCfg.setup(dic[ConfigClassRegister.Q_equip_polish]);
			EquipWashCfg.setup(dic[ConfigClassRegister.Q_equip_wash]);
			EquipWashAttCfg.setup(dic[ConfigClassRegister.Q_equip_wash_attr]);
			//			CountryUnionStatCfgData.setup(null); //待解决
			MeridianCfg.setup(dic[ConfigClassRegister.Q_meridian]);
			ActivetyCfgData.setup(dic[ConfigClassRegister.Q_special_activities]);
			WorldBossCfgData.setup(dic[ConfigClassRegister.Q_world_boss]);
			QSinglecitybaseCfgData.setup(dic[ConfigClassRegister.Q_singlecitybase]);
			QBattleRewardCfgData.setup(dic[ConfigClassRegister.Q_battle_reward]);
			QKindomnameCfgData.setup(dic[ConfigClassRegister.Q_kindomname]);
			QVertexColorCfgData.setup(dic[ConfigClassRegister.Q_vertex_color]);
			
			////////////////////////////////////////////////////////////////////////
			//
			//   以下为服务器，客户端公用表
			//
			///////////////////////////////////////////////////////////////////////
			//场景相关
			MapDataManager.setSceneConfig(dic[ConfigClassRegister.Q_map]);
			MapPreLoadData.setup(dic[ConfigClassRegister.Q_map_preload]);
			// 地图区域
			AreaCfgData.setup(dic[ConfigClassRegister.Q_area]);
			// 传送门
			TransCfgData.setup(dic[ConfigClassRegister.Q_map_transfer]);
			// 跳跃点
			MapJumpCfgData.setup(dic[ConfigClassRegister.Q_map_jump]);
			//怪物//NPC
			MonsterDataManager.setMonsterConfig(dic[ConfigClassRegister.Q_monster]);//怪物总表
			MonsterDataManager.setSceneAreaMonsterConfig(dic[ConfigClassRegister.Q_scene_monster_area]);//怪物刷新表
			MonsterDataManager.setCollectConfig(dic[ConfigClassRegister.Q_npc]);//采集物信息
			
			//技能相关
			SpellDataManager.setConfig(dic[ConfigClassRegister.Q_skill_model]);//技能总表
			SpellDataManager.setWarningConfig(dic[ConfigClassRegister.Q_skill_warning]);//技能总表
			SpellEffectDataManager.setConfig(dic[ConfigClassRegister.Q_SpellEffect]);//每个技能效果，具体参数配置表
			AnimationDataManager.setConfig(dic[ConfigClassRegister.Q_SpellAnimation]);///技能特效配置表
			//公共CD配置
			//			GCDCfgData.setConfig(dic[ConfigClassRegister.Q_GCD]);
			//状态数据buff相关
			BuffStateDataManager.setConfig(dic[ConfigClassRegister.Q_buff]);
			//窗口信息
			WindowInfoData.setConfig(dic[ConfigClassRegister.Q_windowInfo]);
			FightsoulPathData.setConfig(dic[ConfigClassRegister.Q_fightsoul_path]);
			FightsoulData.setConfig(dic[ConfigClassRegister.Q_fightsoul]);
			FightsoulModeData.setConfig(dic[ConfigClassRegister.Q_fightsoul_mode]);
			GlobalSheetData.setup(dic[ConfigClassRegister.Q_global]);
			HeChengData.setup(dic[ConfigClassRegister.Q_hecheng]);
			EquipJiChengData.setup(dic[ConfigClassRegister.Q_equip_inherit_cost]);
			ZhanGongData.setup(dic[ConfigClassRegister.Q_meritorious]);
			ZhanGongMonsterData.setup(dic[ConfigClassRegister.Q_meritorious_monster]);
			JunJieData.setup(dic[ConfigClassRegister.Q_junjie]);
			//护宝
			HuBaoData.setup(dic[ConfigClassRegister.Q_convoy]);
			//格子配置
			GridOpenCfg.setup(dic[ConfigClassRegister.Q_backpack_grid]);
			//超链接配置
			LinkCfg.setup(dic[ConfigClassRegister.Q_hyperlinksMenu]);
			
			LostSkillData.setup(dic[ConfigClassRegister.Q_lostskill_open]);
			LostSkillUpData.setup(dic[ConfigClassRegister.Q_lostskill_up]);
			// 服务器发送 消息ID对应客户端 
			NotifyCfgData.setup(dic[ConfigClassRegister.Q_notify]);
			//任务表配置
			TaskMissionCfgData.setup(dic[ConfigClassRegister.Q_mission_base]);
			TaskMissionCfgData.setupReword(dic[ConfigClassRegister.Q_mission_reword]);
			TaskMissionCfgData.setupSegment(dic[ConfigClassRegister.Q_mission_segment]);
			TaskMissionCfgData.setupSuggest(dic[ConfigClassRegister.Q_suggest]);
			
			InitPlayerInfoCfgData.setup(dic[ConfigClassRegister.InitPlayerInfo]);
			
			
			//窗口信息配置
			FuncionBarCfgData.setup(dic[ConfigClassRegister.FunctionBarInfo]);
			NewFuncCfgData.setup(dic[ConfigClassRegister.Q_newfunc]);
			//心法
			CheatsCfg.setup(dic[ConfigClassRegister.Q_cheats]);
			CheatsNodeCfg.setup(dic[ConfigClassRegister.Q_cheats_node]);
			
			TaskMissionCfgData.setupSection(dic[ConfigClassRegister.Q_mission_section]);
			//坐骑数据
			HorseConfigData.setConfig(dic[ConfigClassRegister.Q_horse]);
			//战旗数据
			ZhanQiConfigData.setConfig(dic[ConfigClassRegister.Q_warflag]);
			//			HorseSpellData.setConfig(dic[ConfigClassRegister.Q_horse_skills]);
			HorseExtraItemInfo.createInfo();
			ZhanQiExtraItemInfo.createInfo();
			HunYinHuDongData.setup(dic[ConfigClassRegister.Q_interaction]);//婚姻互动
			HunYinSkillData.setup(dic[ConfigClassRegister.Q_marriage_skills]);//婚姻技能
			JieHunJieZiData.setup(dic[ConfigClassRegister.Q_advance_wedding]);//结婚进阶
			
			HorseSpellData.setConfig(dic[ConfigClassRegister.Q_horse_skills]);
			
			//副本相关配置
			ZoneCfgData.setup(dic[ConfigClassRegister.Q_zone]);
			LunJianCfg.setup(dic[ConfigClassRegister.Q_lunjian]);
			ZoneMultyCfgData.setup(dic[ConfigClassRegister.Q_zone_multy]);//多人副本
			TriggerCfgData.setup(dic[ConfigClassRegister.Q_map_trigger]);//触发区域
			SceneEffectCfgData.setup(dic[ConfigClassRegister.Q_map_effect]);
			DailyZoneCfgData.setup(dic[ConfigClassRegister.Q_daily_zone]);//日常副本
			DailyZoneMonsterCfgData.setup(dic[ConfigClassRegister.Q_dailyzone_monster]);//日常刷怪数据
			JiXianTiaoZhanCfgData.setup(dic[ConfigClassRegister.Q_limitchallenge]);//极限挑战
			//道具获取路径
			SourceGetCfg.setup(dic[ConfigClassRegister.Q_source]);//购买界面
			
			GuildCfgData.setupGuildInfo(dic[ConfigClassRegister.Q_guild]);//帮会等级
			GuildCfgData.setupGuildPermissionInfo(dic[ConfigClassRegister.Q_guild_permission]);//职务权限
			GuildSkillCfgData.setup(dic[ConfigClassRegister.Q_guildskill]);//帮派技能表
			//功能开启
			//ClientFunctionOpenCfgData.setup(dic["data.ClientFunctionOpen"]);
			BattleRankCfg.setup(dic[ConfigClassRegister.Q_battle_rank]);//巅峰对决
			NineTowerCfg.setup(dic[ConfigClassRegister.Q_nine_tower]);//九层妖塔	
			LijinCfgData.setup(dic[ConfigClassRegister.Q_daysdown_gold]);//天降礼金
			MibaoCfgData.setup(dic[ConfigClassRegister.Q_mibao_monster],dic[ConfigClassRegister.Q_mibao_reward]);//秦陵秘宝
			
			VipCfg.setup(dic[ConfigClassRegister.Q_vip]);//多人副本
			RedRewardCfgData.setup(dic[ConfigClassRegister.Q_redreward]);//红包
			PetCfg.setup(dic[ConfigClassRegister.Q_girl_pet]);//美人
			PetAdvanceCfg.setup(dic[ConfigClassRegister.Q_girl_advance]);//美人进阶
			RankDesignationData.setup(dic[ConfigClassRegister.Q_rank_designation]);//排行榜名称
			AttributeCfg.setup(dic[ConfigClassRegister.Q_shuxing]);//属性
		}
		
		/**
		 * 保存配置文件
		 * @param	config
		 * @param   isUseLocalCfg 是否使用本地存储的配置
		 */
		private static function setConfig(byte : ByteArray, isUseLocalCfg : Boolean) : void
		{
			var ver : Number;
			if (isUseLocalCfg)
			{
			}
			else
			{
				ver = BytesUtil.readVarint64(byte);
			}
			
			var configLen : int = BytesUtil.readVarint32(byte);
			var configBytes : ByteArray = new ByteArray();
			byte.readBytes(configBytes, 0, configLen);
			configBytes.uncompress();
			var config : Config = new Config();
//			config.mergeFrom(configBytes);
			
			//ServiceConfig描述这个服的单独配置，如开服时间，是否已合过服等等
			var serviceConfigLen : int = BytesUtil.readVarint32(byte);
			var serviceConfigBytes : ByteArray = new ByteArray();
			byte.readBytes(serviceConfigBytes, 0, serviceConfigLen);
			var serviceConfig : ServiceConfig = new ServiceConfig();
			serviceConfig.mergeFrom(serviceConfigBytes);
			
			//保存场景配置文件   抛出GAMEconfig_GET_SCENEconfig配置文件获取成功事件
			//			if (config.hasSceneConfig)
			//			{
			//				MapDataManager.setSceneConfig(config.sceneConfig);
			//			}
			
			//			if (config.hasSpellConfig)
			//			{
			//				SpellDataManager.setConfig(config.spellConfig.spellLearnConfig);
			//				//状态数据buff相关
			//				BuffStateDataManager.setConfig(config.spellConfig.stateConfig);
			//				SpellEffectDataManager.setConfig(config.spellConfig.spellEffectConfig);
			//				AnimationDataManager.setConfig(config.spellConfig.animationConfig);
			//				//公共CD配置
			//				GCDCfgData.setConfig(config.spellConfig.gcdGroupsConfig);
			//			}
			//			if (config.hasMonsterConfig)
			//			{
			//				MonsterDataManager.setConfig(config.monsterConfig); //怪物//NPC
			//			}
			
			
			//传送门
//			if (config.hasSceneTranports)
//			{
				//TranportsDataManager.setConfig(config.sceneTranports);
//			}
			
//			if (config.relationConfig)
//			{
//				FriendManager.MAX_FRIEND_NUM = config.relationConfig.friendCountLimit;
//				FriendManager.MAX_BLACK_NUM = config.relationConfig.blackCountLimit;
//			}
			
			//采集
//			CollectCfgData.setConfig(config.collecObjectConfig);
			//聊天
//			ChatCfgData.setChatConfig(config.chatConfig, config.miscConfig.paidChatGoodsId);
			//任务
//			TaskCfgData.setConfig(config.taskConfig);
			//复活相关配置
//			ReliveCfgData.setConfig(config.reliveConfig);
			//物品
			//			ItemCfgData.setAllCfgData(config.goodsConfig);
			//背包仓库解锁格子数据
//			GoodsContainerMamager.setUnlockDataConfig(config.allUnlockData);
			//帮派
//			SocietyStaticConfigData.setConfig(config.family);
			//商店配置
			//ShopCfgData.setConfig(config.shopConfig);
			//职业数据
//			RaceCfgData.setConfig(config.raceConfig);
			//邮箱
//			MailCfgData.setConfig(config.mailConfig);
			//答题
//			DaTiCfgData.setConfig(config.exam);
			//加点配置
//			AddSpriteStatCfgData.setConfig(config.addSpriteStatConfig);
			//物品合成
			//			CombineCfgData.setConfig(config.equipmentConfig.combineDatas);
			//装备合成
			//			EquipmentCombineCfgData.setConfig(config.equipmentConfig.combineEquipDatas);
			//装备打造
			//			EquipMakeCfgData.setConfig(config.equipmentConfig.equipBuild);
			//装备改造
			//			EquipmentGeneralCfgData.setConfig(config.equipmentConfig.generalDatas);
			//装备拆解
			//			EquipmentRefineDestoryCfgData.setConfig(config.equipmentConfig.destroyDatas);
			//装备强化
			//			RefineCfgData.setConfig(config.equipmentConfig.refineDatas);
			//王城战配置
//			FamilyWarCfgData.setup(config.kingWarConfig.miscData);
			//运镖配置
//			BiaoCfgData.setConfig(config.biaoConfig);
			//迷宫
//			MazeCfgData.setup(config.mazeConfig);
			//摆摊
//			StallCfgData.setup(config.stallConfig);
			
			
//			if (config.biaoConfig)
//			{ //镖局配置
				//				BiaoJuManager.setMiscData(config.biaoConfig.biaoJuMisc);
//			}
			//坐骑
//			MountConfigData.setConfig(config.mount);
			//讨逆配置
//			CountryTaoNiCfgData.setConfig(config.taoNiConfig);
			//税收配置
//			TaxCfgData.setConfig(config.allTaxConfig);
//			if (config.hasCountryConfig)
//			{
//				CountryStaticConfigData.setConfig(config.countryConfig);
//			}
			//国战配置
//			CountryWarCfgData.setConfig(config.countryWarConfig);
//			
//			if (config.hasRelationConfig)
//				FriendCfgData.setup(config.relationConfig);
		}
	}
}
