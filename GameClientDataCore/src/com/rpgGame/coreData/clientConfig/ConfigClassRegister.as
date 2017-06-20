package com.rpgGame.coreData.clientConfig
{
	import flash.net.registerClassAlias;
	
	import org.client.mainCore.ds.HashMap;
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	*/
	public class ConfigClassRegister
	{
		private static var _classMap:HashMap = new HashMap();
				/**  名称备注	资源路径#资源路径	动画名称#动画名称	碰撞隐藏节点#碰撞隐藏节点，用;分割多个节点	消散时间#消散时间	前轴围绕半径#前轴围绕半径	前轴围绕角速度#前轴围绕角速度（度/秒）	收敛次数#收敛次数	围绕半径#围绕半径	围绕角速度#围绕角速度（度/秒） */
		public static const EffectAnimation:String = "data.animat.EffectAnimation";
		/**  客户端区域数据			 */
		public static const ClientArea:String = "data.ClientArea";
		/**  客户端自定义buff				 */
		public static const ClientBuff:String = "data.ClientBuff";
		/**  客户端对话数据									 */
		public static const ClientDialog:String = "data.ClientDialog";
		/**  客户端的场景																																																		 */
		public static const ClientScene:String = "data.ClientScene";
		/**  客户端在场景中的特效						 */
		public static const ClientSceneEffect:String = "data.ClientSceneEffect";
		/**  客户端在场景中的NPC									 */
		public static const ClientSceneNPC:String = "data.ClientSceneNPC";
		/**  客户端在场景中的特效						 */
		public static const ClientSceneRole:String = "data.ClientSceneRole";
		/**  客户端表情配置					 */
		public static const FaceInfo:String = "data.FaceInfo";
		/**  窗口链接信息表											 */
		public static const FunctionBarInfo:String = "data.FunctionBarInfo";
		/**  游戏音乐配置表							 */
		public static const GameSoundInfo:String = "data.GameSoundInfo";
		/**  设置的主键#设置的主键，不重复就行	设置备注#设置备注	玻璃效果颜色#玻璃效果颜色	摄像机Y偏移#摄像机Y偏移	摄像机转角#摄像机转角	摄像机仰角#摄像机仰角	摄像机最小仰角#摄像机最小仰角	摄像机最大仰角#摄像机最大仰角	摄像机距离#摄像机距离	摄像机拖拽速度#摄像机鼠标拖拽速度	摄像机最小距离#摄像机最小距离	摄像机最大距离#摄像机最大距离	摄像机滚轮速度#摄像机鼠标滚轮速度	摄像机远裁切#摄像机远裁切	智能摄像机最小距离#智能摄像机最小距离	跳跃高度#跳跃高度	二级跳跃高度#二级跳跃高度	跳跃速率#跳跃速率	二级跳跃速率#二级跳跃速率	跳跃结束时间#跳跃结束时间	二级跳跃结束时间#二级跳跃结束时间	跳跃打断时间#跳跃打断时间	二级跳跃打断时间#二级跳跃打断时间	二级跳跃概率#二级跳跃概率（0~100）	跳跃开始时间#跳跃开始时间	二级跳跃开始时间#二级跳跃开始时间	死亡效果类型#死亡效果类型	外发光强度#外发光强度	外发光大小#外发光大小	外发光品质#外发光品质	外发光敌方颜色#外发光敌方颜色	外发光友方颜色#外发光友方颜色	外发光中立方颜色#外发光中立方颜色	半身像偏移#半身像偏移	头像偏移#头像偏移	Boss头像偏移#Boss头像偏移 */
		public static const GlobalSetting:String = "data.GlobalSetting";
		/**  GM命令							 */
		public static const GmInfo:String = "data.GmInfo";
		/**  广播，提示语				 */
		public static const HintInfo:String = "data.HintInfo";
		/**  消息提示类型配置表																													 */
		public static const HintTypeSetInfo:String = "data.HintTypeSetInfo";
		/**  区域数据库						 */
		public static const Q_area:String = "data.map.Q_area";
		/**  							本列取消，安全区改为刷格方式							本列取消																																										 */
		public static const Q_map:String = "data.map.Q_map";
		/**  场景特效动态生成表						 */
		public static const Q_map_effect:String = "data.map.Q_map_effect";
		/**  预加载资源表		 */
		public static const Q_map_preload:String = "data.map.Q_map_preload";
		/**  地图传送点数据库												 */
		public static const Q_map_transfer:String = "data.map.Q_map_transfer";
		/**  场景音效配置信息					 */
		public static const SceneSoundInfo:String = "data.map.SceneSoundInfo";
		/**  场景触发器配置表								 */
		public static const SceneTriggerInfo:String = "data.map.SceneTriggerInfo";
		/**  换装衣服特效资源配置							 */
		public static const AvatarClothesEffectRes:String = "data.model.AvatarClothesEffectRes";
		/**  衣服换模型						 */
		public static const AvatarClothesRes:String = "data.model.AvatarClothesRes";
		/**  副武器资源							 */
		public static const AvatarDeputyWeaponRes:String = "data.model.AvatarDeputyWeaponRes";
		/**  头发资源		 */
		public static const AvatarHairRes:String = "data.model.AvatarHairRes";
		/**  换装坐骑资源配置ID		 */
		public static const AvatarMountRes:String = "data.model.AvatarMountRes";
		/**  换装武器特效资源配置				 */
		public static const AvatarWeaponEffectRes:String = "data.model.AvatarWeaponEffectRes";
		/**  主武器资源							 */
		public static const AvatarWeaponRes:String = "data.model.AvatarWeaponRes";
		/**  换装头发资源配置ID		 */
		public static const BaZhenTuRes:String = "data.model.BaZhenTuRes";
		/**  变身ID						 */
		public static const ChangeModel:String = "data.model.ChangeModel";
		/**  角色骨骼						 */
		public static const HeroModel:String = "data.model.HeroModel";
		/**  坐骑模型表	功能名称	动画资源名称 */
		public static const MountModel:String = "data.model.MountModel";
		/**  3 怪物基本信息数据库																																																																绑定器			 */
		public static const Q_monster:String = "data.monster.Q_monster";
		/**  NPC配置数据库																									 */
		public static const Q_npc:String = "data.monster.Q_npc";
		/**  定点刷怪数据库 -- 编辑器录入									 */
		public static const Q_scene_monster:String = "data.monster.Q_scene_monster";
		/**  区域刷怪数据库 -- 编辑器录入											 */
		public static const Q_scene_monster_area:String = "data.monster.Q_scene_monster_area";
		/**  每个职业一级属性换算二级属性表		 */
		public static const Q_att_transfer:String = "data.Q_att_transfer";
		/**  所有属性相关的数据																														 */
		public static const Q_att_values:String = "data.Q_att_values";
		/**  巅峰等级段位升级表						 */
		public static const Q_battle_rank:String = "data.Q_battle_rank";
		/**  心法数据库												 */
		public static const Q_cheats:String = "data.Q_cheats";
		/**  经脉冲穴数据库																 */
		public static const Q_cheats_node:String = "data.Q_cheats_node";
		/**  押镖护宝											 */
		public static const Q_convoy:String = "data.Q_convoy";
		/**  资源副本数据库	副本类型 （1真气,2装备,3经验）	背景图													 */
		public static const Q_daily_zone:String = "data.Q_daily_zone";
		/**  每日副本刷怪配置表													 */
		public static const Q_dailyzone_monster:String = "data.Q_dailyzone_monster";
		/**  复活界面配置表				 */
		public static const Q_die:String = "data.Q_die";
		/**  继承消耗表			 */
		public static const Q_equip_inherit_cost:String = "data.Q_equip_inherit_cost";
		/**  琢磨配置表			 */
		public static const Q_equip_polish:String = "data.Q_equip_polish";
		/**  强化配置表						 */
		public static const Q_equip_strength:String = "data.Q_equip_strength";
		/**  					 */
		public static const Q_equip_wash:String = "data.Q_equip_wash";
		/**  				 */
		public static const Q_equip_wash_attr:String = "data.Q_equip_wash_attr";
		/**  战魂升级数据						 */
		public static const Q_fightsoul:String = "data.Q_fightsoul";
		/**  战魂模型数据							 */
		public static const Q_fightsoul_mode:String = "data.Q_fightsoul_mode";
		/**  战魂升级数据			 */
		public static const Q_fightsoul_path:String = "data.Q_fightsoul_path";
		/**  全局变量表		 */
		public static const Q_global:String = "data.Q_global";
		/**   										 */
		public static const Q_guild:String = "data.Q_guild";
		/**  															 */
		public static const Q_guild_permission:String = "data.Q_guild_permission";
		/**  帮派技能表					 */
		public static const Q_guildskill:String = "data.Q_guildskill";
		/**  道具合成表									 */
		public static const Q_hecheng:String = "data.Q_hecheng";
		/**  坐骑基本信息数据库																					 */
		public static const Q_horse:String = "data.Q_horse";
		/**  坐骑技能数据库		 */
		public static const Q_horse_skills:String = "data.Q_horse_skills";
		/**  2物品基本信息数据库																																																																																						 */
		public static const Q_item:String = "data.Q_item";
		/**  军阶数据表					 */
		public static const Q_junjie:String = "data.Q_junjie";
		/**  绝学开放表							 */
		public static const Q_lostskill_open:String = "data.Q_lostskill_open";
		/**  绝学升级表		 */
		public static const Q_lostskill_up:String = "data.Q_lostskill_up";
		/**  论剑配置表											 */
		public static const Q_lunjian:String = "data.Q_lunjian";
		/**  副本触发表																				 */
		public static const Q_map_trigger:String = "data.Q_map_trigger";
		/**  经脉冲穴数据库																 */
		public static const Q_meridian:String = "data.Q_meridian";
		/**  战功表												 */
		public static const Q_meritorious:String = "data.Q_meritorious";
		/**  战功表					 */
		public static const Q_meritorious_monster:String = "data.Q_meritorious_monster";
		/**  任务表(所有任务都这里)																																										 */
		public static const Q_mission_base:String = "data.Q_mission_base";
		/**  任务奖励配置表			 */
		public static const Q_mission_reword:String = "data.Q_mission_reword";
		/**  ??				 */
		public static const Q_mission_section:String = "data.Q_mission_section";
		/**  任务对话配置表(1-20000为主线任务对应的对话id，20001-30000是支线任务对话id)			 */
		public static const Q_mission_segment:String = "data.Q_mission_segment";
		/**  功能开放表														 */
		public static const Q_newfunc:String = "data.Q_newfunc";
		/**  九层妖塔							 */
		public static const Q_nine_tower:String = "data.Q_nine_tower";
		/**  通知列表			 */
		public static const Q_notify:String = "data.Q_notify";
		/**  阵营关系				 */
		public static const Q_relation:String = "data.Q_relation";
		/**  16商城道具配置表													 */
		public static const Q_shop:String = "data.Q_shop";
		/**  购买界面其他途径提示数据库				 */
		public static const Q_source:String = "data.Q_source";
		/**  活动配置表																										 */
		public static const Q_special_activities:String = "data.Q_special_activities";
		/**  tipsid	标题	描述 */
		public static const Q_tipsinfo:String = "data.Q_tipsinfo";
		/**  战旗基本信息数据库																	 */
		public static const Q_warflag:String = "data.Q_warflag";
		/**  窗口链接				 */
		public static const Q_windowInfo:String = "data.Q_windowInfo";
		/**  世界BOSS活动配置								 */
		public static const Q_world_boss:String = "data.Q_world_boss";
		/**  副本数据表															 */
		public static const Q_zone:String = "data.Q_zone";
		/**  多人副本数据表								 */
		public static const Q_zone_multy:String = "data.Q_zone_multy";
		/**  职业对应的名字		 */
		public static const RaceNameInfo:String = "data.RaceNameInfo";
		/**  赛马模型等配置信息								 */
		public static const RacingInfo:String = "data.RacingInfo";
		/**  赛马答题验证配置信息						 */
		public static const RacingQuestion:String = "data.RacingQuestion";
		/**  换装资源配置											 */
		public static const AvatarResConfig:String = "data.res.AvatarResConfig";
		/**  在场景中巡逻的NPC，角色，怪物等，信息配置	在场景中巡逻的NPC，角色，怪物等，信息配置									 */
		public static const SceneCharPatrolInfo:String = "data.SceneCharPatrolInfo";
		/**  socket返回错误码提示			 */
		public static const SocketErrorNoteInfo:String = "data.SocketErrorNoteInfo";
		/**  对象绑定器,绑定器可绑定在玩家，怪物，地面特效等，用来加强效果和增强功能，实现功能的组合									 */
		public static const Attach:String = "data.spell.Attach";
		/**  地面特效			 */
		public static const Attach_effect:String = "data.spell.Attach_effect";
		/**  BUFF效果配置数据表																																									 */
		public static const Q_buff:String = "data.spell.Q_buff";
		/**  公共CD表	 */
		public static const Q_GCD:String = "data.spell.Q_GCD";
		/**  技能无视防御伤害数据库																		 */
		public static const Q_skill_ignore:String = "data.spell.Q_skill_ignore";
		/**  技能基本信息配置数据表																																																																																																																																									 */
		public static const Q_skill_model:String = "data.spell.Q_skill_model";
		/**  预警技能关联表			 */
		public static const Q_skill_warning:String = "data.spell.Q_skill_warning";
		/**  技能效果配置表																				 */
		public static const Q_SpellAnimation:String = "data.spell.Q_SpellAnimation";
		/**  单个技能效果的数据配置																								 */
		public static const Q_SpellEffect:String = "data.spell.Q_SpellEffect";
		/**  召唤物表												 */
		public static const Q_summon:String = "data.spell.Q_summon";
		/**  属性的名字（针对不同的地方可以有不同的配置）	 */
		public static const SpriteStatNameInfo:String = "data.SpriteStatNameInfo";

		public static function setup():void
		{
			regClass("data.animat.EffectAnimation", com.rpgGame.coreData.clientConfig.EffectAnimation);
			regClass("data.ClientArea", com.rpgGame.coreData.clientConfig.ClientArea);
			regClass("data.ClientBuff", com.rpgGame.coreData.clientConfig.ClientBuff);
			regClass("data.ClientDialog", com.rpgGame.coreData.clientConfig.ClientDialog);
			regClass("data.ClientScene", com.rpgGame.coreData.clientConfig.ClientScene);
			regClass("data.ClientSceneEffect", com.rpgGame.coreData.clientConfig.ClientSceneEffect);
			regClass("data.ClientSceneNPC", com.rpgGame.coreData.clientConfig.ClientSceneNPC);
			regClass("data.ClientSceneRole", com.rpgGame.coreData.clientConfig.ClientSceneRole);
			regClass("data.FaceInfo", com.rpgGame.coreData.clientConfig.FaceInfo);
			regClass("data.FunctionBarInfo", com.rpgGame.coreData.clientConfig.FunctionBarInfo);
			regClass("data.GameSoundInfo", com.rpgGame.coreData.clientConfig.GameSoundInfo);
			regClass("data.GlobalSetting", com.rpgGame.coreData.clientConfig.GlobalSetting);
			regClass("data.GmInfo", com.rpgGame.coreData.clientConfig.GmInfo);
			regClass("data.HintInfo", com.rpgGame.coreData.clientConfig.HintInfo);
			regClass("data.HintTypeSetInfo", com.rpgGame.coreData.clientConfig.HintTypeSetInfo);
			regClass("data.map.Q_area", com.rpgGame.coreData.clientConfig.Q_area);
			regClass("data.map.Q_map", com.rpgGame.coreData.clientConfig.Q_map);
			regClass("data.map.Q_map_effect", com.rpgGame.coreData.clientConfig.Q_map_effect);
			regClass("data.map.Q_map_preload", com.rpgGame.coreData.clientConfig.Q_map_preload);
			regClass("data.map.Q_map_transfer", com.rpgGame.coreData.clientConfig.Q_map_transfer);
			regClass("data.map.SceneSoundInfo", com.rpgGame.coreData.clientConfig.SceneSoundInfo);
			regClass("data.map.SceneTriggerInfo", com.rpgGame.coreData.clientConfig.SceneTriggerInfo);
			regClass("data.model.AvatarClothesEffectRes", com.rpgGame.coreData.clientConfig.AvatarClothesEffectRes);
			regClass("data.model.AvatarClothesRes", com.rpgGame.coreData.clientConfig.AvatarClothesRes);
			regClass("data.model.AvatarDeputyWeaponRes", com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes);
			regClass("data.model.AvatarHairRes", com.rpgGame.coreData.clientConfig.AvatarHairRes);
			regClass("data.model.AvatarMountRes", com.rpgGame.coreData.clientConfig.AvatarMountRes);
			regClass("data.model.AvatarWeaponEffectRes", com.rpgGame.coreData.clientConfig.AvatarWeaponEffectRes);
			regClass("data.model.AvatarWeaponRes", com.rpgGame.coreData.clientConfig.AvatarWeaponRes);
			regClass("data.model.BaZhenTuRes", com.rpgGame.coreData.clientConfig.BaZhenTuRes);
			regClass("data.model.ChangeModel", com.rpgGame.coreData.clientConfig.ChangeModel);
			regClass("data.model.HeroModel", com.rpgGame.coreData.clientConfig.HeroModel);
			regClass("data.model.MountModel", com.rpgGame.coreData.clientConfig.MountModel);
			regClass("data.monster.Q_monster", com.rpgGame.coreData.clientConfig.Q_monster);
			regClass("data.monster.Q_npc", com.rpgGame.coreData.clientConfig.Q_npc);
			regClass("data.monster.Q_scene_monster", com.rpgGame.coreData.clientConfig.Q_scene_monster);
			regClass("data.monster.Q_scene_monster_area", com.rpgGame.coreData.clientConfig.Q_scene_monster_area);
			regClass("data.Q_att_transfer", com.rpgGame.coreData.clientConfig.Q_att_transfer);
			regClass("data.Q_att_values", com.rpgGame.coreData.clientConfig.Q_att_values);
			regClass("data.Q_battle_rank", com.rpgGame.coreData.clientConfig.Q_battle_rank);
			regClass("data.Q_cheats", com.rpgGame.coreData.clientConfig.Q_cheats);
			regClass("data.Q_cheats_node", com.rpgGame.coreData.clientConfig.Q_cheats_node);
			regClass("data.Q_convoy", com.rpgGame.coreData.clientConfig.Q_convoy);
			regClass("data.Q_daily_zone", com.rpgGame.coreData.clientConfig.Q_daily_zone);
			regClass("data.Q_dailyzone_monster", com.rpgGame.coreData.clientConfig.Q_dailyzone_monster);
			regClass("data.Q_die", com.rpgGame.coreData.clientConfig.Q_die);
			regClass("data.Q_equip_inherit_cost", com.rpgGame.coreData.clientConfig.Q_equip_inherit_cost);
			regClass("data.Q_equip_polish", com.rpgGame.coreData.clientConfig.Q_equip_polish);
			regClass("data.Q_equip_strength", com.rpgGame.coreData.clientConfig.Q_equip_strength);
			regClass("data.Q_equip_wash", com.rpgGame.coreData.clientConfig.Q_equip_wash);
			regClass("data.Q_equip_wash_attr", com.rpgGame.coreData.clientConfig.Q_equip_wash_attr);
			regClass("data.Q_fightsoul", com.rpgGame.coreData.clientConfig.Q_fightsoul);
			regClass("data.Q_fightsoul_mode", com.rpgGame.coreData.clientConfig.Q_fightsoul_mode);
			regClass("data.Q_fightsoul_path", com.rpgGame.coreData.clientConfig.Q_fightsoul_path);
			regClass("data.Q_global", com.rpgGame.coreData.clientConfig.Q_global);
			regClass("data.Q_guild", com.rpgGame.coreData.clientConfig.Q_guild);
			regClass("data.Q_guild_permission", com.rpgGame.coreData.clientConfig.Q_guild_permission);
			regClass("data.Q_guildskill", com.rpgGame.coreData.clientConfig.Q_guildskill);
			regClass("data.Q_hecheng", com.rpgGame.coreData.clientConfig.Q_hecheng);
			regClass("data.Q_horse", com.rpgGame.coreData.clientConfig.Q_horse);
			regClass("data.Q_horse_skills", com.rpgGame.coreData.clientConfig.Q_horse_skills);
			regClass("data.Q_item", com.rpgGame.coreData.clientConfig.Q_item);
			regClass("data.Q_junjie", com.rpgGame.coreData.clientConfig.Q_junjie);
			regClass("data.Q_lostskill_open", com.rpgGame.coreData.clientConfig.Q_lostskill_open);
			regClass("data.Q_lostskill_up", com.rpgGame.coreData.clientConfig.Q_lostskill_up);
			regClass("data.Q_lunjian", com.rpgGame.coreData.clientConfig.Q_lunjian);
			regClass("data.Q_map_trigger", com.rpgGame.coreData.clientConfig.Q_map_trigger);
			regClass("data.Q_meridian", com.rpgGame.coreData.clientConfig.Q_meridian);
			regClass("data.Q_meritorious", com.rpgGame.coreData.clientConfig.Q_meritorious);
			regClass("data.Q_meritorious_monster", com.rpgGame.coreData.clientConfig.Q_meritorious_monster);
			regClass("data.Q_mission_base", com.rpgGame.coreData.clientConfig.Q_mission_base);
			regClass("data.Q_mission_reword", com.rpgGame.coreData.clientConfig.Q_mission_reword);
			regClass("data.Q_mission_section", com.rpgGame.coreData.clientConfig.Q_mission_section);
			regClass("data.Q_mission_segment", com.rpgGame.coreData.clientConfig.Q_mission_segment);
			regClass("data.Q_newfunc", com.rpgGame.coreData.clientConfig.Q_newfunc);
			regClass("data.Q_nine_tower", com.rpgGame.coreData.clientConfig.Q_nine_tower);
			regClass("data.Q_notify", com.rpgGame.coreData.clientConfig.Q_notify);
			regClass("data.Q_relation", com.rpgGame.coreData.clientConfig.Q_relation);
			regClass("data.Q_shop", com.rpgGame.coreData.clientConfig.Q_shop);
			regClass("data.Q_source", com.rpgGame.coreData.clientConfig.Q_source);
			regClass("data.Q_special_activities", com.rpgGame.coreData.clientConfig.Q_special_activities);
			regClass("data.Q_tipsinfo", com.rpgGame.coreData.clientConfig.Q_tipsinfo);
			regClass("data.Q_warflag", com.rpgGame.coreData.clientConfig.Q_warflag);
			regClass("data.Q_windowInfo", com.rpgGame.coreData.clientConfig.Q_windowInfo);
			regClass("data.Q_world_boss", com.rpgGame.coreData.clientConfig.Q_world_boss);
			regClass("data.Q_zone", com.rpgGame.coreData.clientConfig.Q_zone);
			regClass("data.Q_zone_multy", com.rpgGame.coreData.clientConfig.Q_zone_multy);
			regClass("data.RaceNameInfo", com.rpgGame.coreData.clientConfig.RaceNameInfo);
			regClass("data.RacingInfo", com.rpgGame.coreData.clientConfig.RacingInfo);
			regClass("data.RacingQuestion", com.rpgGame.coreData.clientConfig.RacingQuestion);
			regClass("data.res.AvatarResConfig", com.rpgGame.coreData.clientConfig.AvatarResConfig);
			regClass("data.SceneCharPatrolInfo", com.rpgGame.coreData.clientConfig.SceneCharPatrolInfo);
			regClass("data.SocketErrorNoteInfo", com.rpgGame.coreData.clientConfig.SocketErrorNoteInfo);
			regClass("data.spell.Attach", com.rpgGame.coreData.clientConfig.Attach);
			regClass("data.spell.Attach_effect", com.rpgGame.coreData.clientConfig.Attach_effect);
			regClass("data.spell.Q_buff", com.rpgGame.coreData.clientConfig.Q_buff);
			regClass("data.spell.Q_GCD", com.rpgGame.coreData.clientConfig.Q_GCD);
			regClass("data.spell.Q_skill_ignore", com.rpgGame.coreData.clientConfig.Q_skill_ignore);
			regClass("data.spell.Q_skill_model", com.rpgGame.coreData.clientConfig.Q_skill_model);
			regClass("data.spell.Q_skill_warning", com.rpgGame.coreData.clientConfig.Q_skill_warning);
			regClass("data.spell.Q_SpellAnimation", com.rpgGame.coreData.clientConfig.Q_SpellAnimation);
			regClass("data.spell.Q_SpellEffect", com.rpgGame.coreData.clientConfig.Q_SpellEffect);
			regClass("data.spell.Q_summon", com.rpgGame.coreData.clientConfig.Q_summon);
			regClass("data.SpriteStatNameInfo", com.rpgGame.coreData.clientConfig.SpriteStatNameInfo);

		}
		private static function regClass(name:String, cls:Class):void
		{
			_classMap.add(name,cls);
			registerClassAlias(name, cls);
		}
		public static function getClass(name:String):Class
		{
			return _classMap.getValue(name);
		}
	}
}
		