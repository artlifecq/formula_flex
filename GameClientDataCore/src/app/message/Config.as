package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TaskConfig;
	import app.message.CountryWarConfig;
	import app.message.FamilyConfig;
	import app.message.PkConfig;
	import app.message.MiscConfig;
	import app.message.SceneTransportsProto;
	import app.message.MazeConfig;
	import app.message.TeamConfig;
	import app.message.EquipmentConfig;
	import app.message.GoodsConfig;
	import app.message.CollectObjectConfig;
	import app.message.KingWarConfig;
	import app.message.MonsterConfig;
	import app.message.SceneConfig;
	import app.message.GuildConfig;
	import app.message.ExamConfig;
	import app.message.AllTaxConfigProto;
	import app.message.BiaoConfig;
	import app.message.ReliveConfig;
	import app.message.WelfareConfig;
	import app.message.AddSpriteStatConfig;
	import app.message.AchievementAndNickNameConfig;
	import app.message.ShopConfig;
	import app.message.RelationConfig;
	import app.message.TradeConfig;
	import app.message.Config.AllGoodsContainerUnlockProto;
	import app.message.RaceConfig;
	import app.message.LevelConfig;
	import app.message.VipsProto;
	import app.message.SpellConfig;
	import app.message.ChatConfig;
	import app.message.StallConfig;
	import app.message.TaoNiConfig;
	import app.message.CountryConfig;
	import app.message.MailConfig;
	import app.message.MountConfig;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Config extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SCENE_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.scene_config", "sceneConfig", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SceneConfig; });

		private var scene_config$field:app.message.SceneConfig;

		public function clearSceneConfig():void {
			scene_config$field = null;
		}

		public function get hasSceneConfig():Boolean {
			return scene_config$field != null;
		}

		public function set sceneConfig(value:app.message.SceneConfig):void {
			scene_config$field = value;
		}

		public function get sceneConfig():app.message.SceneConfig {
			return scene_config$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.goods_config", "goodsConfig", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsConfig; });

		private var goods_config$field:app.message.GoodsConfig;

		public function clearGoodsConfig():void {
			goods_config$field = null;
		}

		public function get hasGoodsConfig():Boolean {
			return goods_config$field != null;
		}

		public function set goodsConfig(value:app.message.GoodsConfig):void {
			goods_config$field = value;
		}

		public function get goodsConfig():app.message.GoodsConfig {
			return goods_config$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.spell_config", "spellConfig", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellConfig; });

		private var spell_config$field:app.message.SpellConfig;

		public function clearSpellConfig():void {
			spell_config$field = null;
		}

		public function get hasSpellConfig():Boolean {
			return spell_config$field != null;
		}

		public function set spellConfig(value:app.message.SpellConfig):void {
			spell_config$field = value;
		}

		public function get spellConfig():app.message.SpellConfig {
			return spell_config$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENT_NICKNAME_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.achievement_nickname_config", "achievementNicknameConfig", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AchievementAndNickNameConfig; });

		private var achievement_nickname_config$field:app.message.AchievementAndNickNameConfig;

		public function clearAchievementNicknameConfig():void {
			achievement_nickname_config$field = null;
		}

		public function get hasAchievementNicknameConfig():Boolean {
			return achievement_nickname_config$field != null;
		}

		public function set achievementNicknameConfig(value:app.message.AchievementAndNickNameConfig):void {
			achievement_nickname_config$field = value;
		}

		public function get achievementNicknameConfig():app.message.AchievementAndNickNameConfig {
			return achievement_nickname_config$field;
		}

		/**
		 *  @private
		 */
		public static const RACE_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.race_config", "raceConfig", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.RaceConfig; });

		private var race_config$field:app.message.RaceConfig;

		public function clearRaceConfig():void {
			race_config$field = null;
		}

		public function get hasRaceConfig():Boolean {
			return race_config$field != null;
		}

		public function set raceConfig(value:app.message.RaceConfig):void {
			race_config$field = value;
		}

		public function get raceConfig():app.message.RaceConfig {
			return race_config$field;
		}

		/**
		 *  @private
		 */
		public static const SHOP_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.shop_config", "shopConfig", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ShopConfig; });

		private var shop_config$field:app.message.ShopConfig;

		public function clearShopConfig():void {
			shop_config$field = null;
		}

		public function get hasShopConfig():Boolean {
			return shop_config$field != null;
		}

		public function set shopConfig(value:app.message.ShopConfig):void {
			shop_config$field = value;
		}

		public function get shopConfig():app.message.ShopConfig {
			return shop_config$field;
		}

		/**
		 *  @private
		 */
		public static const TASK_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.task_config", "taskConfig", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskConfig; });

		private var task_config$field:app.message.TaskConfig;

		public function clearTaskConfig():void {
			task_config$field = null;
		}

		public function get hasTaskConfig():Boolean {
			return task_config$field != null;
		}

		public function set taskConfig(value:app.message.TaskConfig):void {
			task_config$field = value;
		}

		public function get taskConfig():app.message.TaskConfig {
			return task_config$field;
		}

		/**
		 *  @private
		 */
		public static const MONSTER_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.monster_config", "monsterConfig", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MonsterConfig; });

		private var monster_config$field:app.message.MonsterConfig;

		public function clearMonsterConfig():void {
			monster_config$field = null;
		}

		public function get hasMonsterConfig():Boolean {
			return monster_config$field != null;
		}

		public function set monsterConfig(value:app.message.MonsterConfig):void {
			monster_config$field = value;
		}

		public function get monsterConfig():app.message.MonsterConfig {
			return monster_config$field;
		}

		/**
		 *  @private
		 */
		public static const COLLEC_OBJECT_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.collec_object_config", "collecObjectConfig", (35 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CollectObjectConfig; });

		private var collec_object_config$field:app.message.CollectObjectConfig;

		public function clearCollecObjectConfig():void {
			collec_object_config$field = null;
		}

		public function get hasCollecObjectConfig():Boolean {
			return collec_object_config$field != null;
		}

		public function set collecObjectConfig(value:app.message.CollectObjectConfig):void {
			collec_object_config$field = value;
		}

		public function get collecObjectConfig():app.message.CollectObjectConfig {
			return collec_object_config$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.family", "family", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyConfig; });

		private var family$field:app.message.FamilyConfig;

		public function clearFamily():void {
			family$field = null;
		}

		public function get hasFamily():Boolean {
			return family$field != null;
		}

		public function set family(value:app.message.FamilyConfig):void {
			family$field = value;
		}

		public function get family():app.message.FamilyConfig {
			return family$field;
		}

		/**
		 *  @private
		 */
		public static const VIPS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.vips", "vips", (45 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.VipsProto; });

		private var vips$field:app.message.VipsProto;

		public function clearVips():void {
			vips$field = null;
		}

		public function get hasVips():Boolean {
			return vips$field != null;
		}

		public function set vips(value:app.message.VipsProto):void {
			vips$field = value;
		}

		public function get vips():app.message.VipsProto {
			return vips$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.mount", "mount", (50 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountConfig; });

		private var mount$field:app.message.MountConfig;

		public function clearMount():void {
			mount$field = null;
		}

		public function get hasMount():Boolean {
			return mount$field != null;
		}

		public function set mount(value:app.message.MountConfig):void {
			mount$field = value;
		}

		public function get mount():app.message.MountConfig {
			return mount$field;
		}

		/**
		 *  @private
		 */
		public static const EXAM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.exam", "exam", (55 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ExamConfig; });

		private var exam$field:app.message.ExamConfig;

		public function clearExam():void {
			exam$field = null;
		}

		public function get hasExam():Boolean {
			return exam$field != null;
		}

		public function set exam(value:app.message.ExamConfig):void {
			exam$field = value;
		}

		public function get exam():app.message.ExamConfig {
			return exam$field;
		}

		/**
		 *  @private
		 */
		public static const WELFARE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.welfare", "welfare", (60 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.WelfareConfig; });

		private var welfare$field:app.message.WelfareConfig;

		public function clearWelfare():void {
			welfare$field = null;
		}

		public function get hasWelfare():Boolean {
			return welfare$field != null;
		}

		public function set welfare(value:app.message.WelfareConfig):void {
			welfare$field = value;
		}

		public function get welfare():app.message.WelfareConfig {
			return welfare$field;
		}

		/**
		 *  @private
		 */
		public static const CHAT_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.chat_config", "chatConfig", (80 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ChatConfig; });

		private var chat_config$field:app.message.ChatConfig;

		public function clearChatConfig():void {
			chat_config$field = null;
		}

		public function get hasChatConfig():Boolean {
			return chat_config$field != null;
		}

		public function set chatConfig(value:app.message.ChatConfig):void {
			chat_config$field = value;
		}

		public function get chatConfig():app.message.ChatConfig {
			return chat_config$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.country_config", "countryConfig", (100 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryConfig; });

		private var country_config$field:app.message.CountryConfig;

		public function clearCountryConfig():void {
			country_config$field = null;
		}

		public function get hasCountryConfig():Boolean {
			return country_config$field != null;
		}

		public function set countryConfig(value:app.message.CountryConfig):void {
			country_config$field = value;
		}

		public function get countryConfig():app.message.CountryConfig {
			return country_config$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.country_war_config", "countryWarConfig", (101 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarConfig; });

		private var country_war_config$field:app.message.CountryWarConfig;

		public function clearCountryWarConfig():void {
			country_war_config$field = null;
		}

		public function get hasCountryWarConfig():Boolean {
			return country_war_config$field != null;
		}

		public function set countryWarConfig(value:app.message.CountryWarConfig):void {
			country_war_config$field = value;
		}

		public function get countryWarConfig():app.message.CountryWarConfig {
			return country_war_config$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.level_config", "levelConfig", (85 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.LevelConfig; });

		private var level_config$field:app.message.LevelConfig;

		public function clearLevelConfig():void {
			level_config$field = null;
		}

		public function get hasLevelConfig():Boolean {
			return level_config$field != null;
		}

		public function set levelConfig(value:app.message.LevelConfig):void {
			level_config$field = value;
		}

		public function get levelConfig():app.message.LevelConfig {
			return level_config$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_TRANPORTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.scene_tranports", "sceneTranports", (103 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SceneTransportsProto; });

		private var scene_tranports$field:app.message.SceneTransportsProto;

		public function clearSceneTranports():void {
			scene_tranports$field = null;
		}

		public function get hasSceneTranports():Boolean {
			return scene_tranports$field != null;
		}

		public function set sceneTranports(value:app.message.SceneTransportsProto):void {
			scene_tranports$field = value;
		}

		public function get sceneTranports():app.message.SceneTransportsProto {
			return scene_tranports$field;
		}

		/**
		 *  @private
		 */
		public static const ALL_UNLOCK_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.all_unlock_data", "allUnlockData", (104 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Config.AllGoodsContainerUnlockProto; });

		private var all_unlock_data$field:app.message.Config.AllGoodsContainerUnlockProto;

		public function clearAllUnlockData():void {
			all_unlock_data$field = null;
		}

		public function get hasAllUnlockData():Boolean {
			return all_unlock_data$field != null;
		}

		public function set allUnlockData(value:app.message.Config.AllGoodsContainerUnlockProto):void {
			all_unlock_data$field = value;
		}

		public function get allUnlockData():app.message.Config.AllGoodsContainerUnlockProto {
			return all_unlock_data$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.mail_config", "mailConfig", (210 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MailConfig; });

		private var mail_config$field:app.message.MailConfig;

		public function clearMailConfig():void {
			mail_config$field = null;
		}

		public function get hasMailConfig():Boolean {
			return mail_config$field != null;
		}

		public function set mailConfig(value:app.message.MailConfig):void {
			mail_config$field = value;
		}

		public function get mailConfig():app.message.MailConfig {
			return mail_config$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_SPRITE_STAT_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.add_sprite_stat_config", "addSpriteStatConfig", (211 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AddSpriteStatConfig; });

		private var add_sprite_stat_config$field:app.message.AddSpriteStatConfig;

		public function clearAddSpriteStatConfig():void {
			add_sprite_stat_config$field = null;
		}

		public function get hasAddSpriteStatConfig():Boolean {
			return add_sprite_stat_config$field != null;
		}

		public function set addSpriteStatConfig(value:app.message.AddSpriteStatConfig):void {
			add_sprite_stat_config$field = value;
		}

		public function get addSpriteStatConfig():app.message.AddSpriteStatConfig {
			return add_sprite_stat_config$field;
		}

		/**
		 *  @private
		 */
		public static const TEAM_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.team_config", "teamConfig", (212 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TeamConfig; });

		private var team_config$field:app.message.TeamConfig;

		public function clearTeamConfig():void {
			team_config$field = null;
		}

		public function get hasTeamConfig():Boolean {
			return team_config$field != null;
		}

		public function set teamConfig(value:app.message.TeamConfig):void {
			team_config$field = value;
		}

		public function get teamConfig():app.message.TeamConfig {
			return team_config$field;
		}

		/**
		 *  @private
		 */
		public static const RELATION_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.relation_config", "relationConfig", (213 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.RelationConfig; });

		private var relation_config$field:app.message.RelationConfig;

		public function clearRelationConfig():void {
			relation_config$field = null;
		}

		public function get hasRelationConfig():Boolean {
			return relation_config$field != null;
		}

		public function set relationConfig(value:app.message.RelationConfig):void {
			relation_config$field = value;
		}

		public function get relationConfig():app.message.RelationConfig {
			return relation_config$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPMENT_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.equipment_config", "equipmentConfig", (214 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentConfig; });

		private var equipment_config$field:app.message.EquipmentConfig;

		public function clearEquipmentConfig():void {
			equipment_config$field = null;
		}

		public function get hasEquipmentConfig():Boolean {
			return equipment_config$field != null;
		}

		public function set equipmentConfig(value:app.message.EquipmentConfig):void {
			equipment_config$field = value;
		}

		public function get equipmentConfig():app.message.EquipmentConfig {
			return equipment_config$field;
		}

		/**
		 *  @private
		 */
		public static const KING_WAR_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.king_war_config", "kingWarConfig", (215 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.KingWarConfig; });

		private var king_war_config$field:app.message.KingWarConfig;

		public function clearKingWarConfig():void {
			king_war_config$field = null;
		}

		public function get hasKingWarConfig():Boolean {
			return king_war_config$field != null;
		}

		public function set kingWarConfig(value:app.message.KingWarConfig):void {
			king_war_config$field = value;
		}

		public function get kingWarConfig():app.message.KingWarConfig {
			return king_war_config$field;
		}

		/**
		 *  @private
		 */
		public static const MISC_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.misc_config", "miscConfig", (250 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MiscConfig; });

		private var misc_config$field:app.message.MiscConfig;

		public function clearMiscConfig():void {
			misc_config$field = null;
		}

		public function get hasMiscConfig():Boolean {
			return misc_config$field != null;
		}

		public function set miscConfig(value:app.message.MiscConfig):void {
			misc_config$field = value;
		}

		public function get miscConfig():app.message.MiscConfig {
			return misc_config$field;
		}

		/**
		 *  @private
		 */
		public static const BIAO_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.biao_config", "biaoConfig", (251 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoConfig; });

		private var biao_config$field:app.message.BiaoConfig;

		public function clearBiaoConfig():void {
			biao_config$field = null;
		}

		public function get hasBiaoConfig():Boolean {
			return biao_config$field != null;
		}

		public function set biaoConfig(value:app.message.BiaoConfig):void {
			biao_config$field = value;
		}

		public function get biaoConfig():app.message.BiaoConfig {
			return biao_config$field;
		}

		/**
		 *  @private
		 */
		public static const TRADE_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.trade_config", "tradeConfig", (252 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TradeConfig; });

		private var trade_config$field:app.message.TradeConfig;

		public function clearTradeConfig():void {
			trade_config$field = null;
		}

		public function get hasTradeConfig():Boolean {
			return trade_config$field != null;
		}

		public function set tradeConfig(value:app.message.TradeConfig):void {
			trade_config$field = value;
		}

		public function get tradeConfig():app.message.TradeConfig {
			return trade_config$field;
		}

		/**
		 *  @private
		 */
		public static const TAO_NI_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.tao_ni_config", "taoNiConfig", (253 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaoNiConfig; });

		private var tao_ni_config$field:app.message.TaoNiConfig;

		public function clearTaoNiConfig():void {
			tao_ni_config$field = null;
		}

		public function get hasTaoNiConfig():Boolean {
			return tao_ni_config$field != null;
		}

		public function set taoNiConfig(value:app.message.TaoNiConfig):void {
			tao_ni_config$field = value;
		}

		public function get taoNiConfig():app.message.TaoNiConfig {
			return tao_ni_config$field;
		}

		/**
		 *  @private
		 */
		public static const RELIVE_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.relive_config", "reliveConfig", (254 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ReliveConfig; });

		private var relive_config$field:app.message.ReliveConfig;

		public function clearReliveConfig():void {
			relive_config$field = null;
		}

		public function get hasReliveConfig():Boolean {
			return relive_config$field != null;
		}

		public function set reliveConfig(value:app.message.ReliveConfig):void {
			relive_config$field = value;
		}

		public function get reliveConfig():app.message.ReliveConfig {
			return relive_config$field;
		}

		/**
		 *  @private
		 */
		public static const PK_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.pk_config", "pkConfig", (255 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PkConfig; });

		private var pk_config$field:app.message.PkConfig;

		public function clearPkConfig():void {
			pk_config$field = null;
		}

		public function get hasPkConfig():Boolean {
			return pk_config$field != null;
		}

		public function set pkConfig(value:app.message.PkConfig):void {
			pk_config$field = value;
		}

		public function get pkConfig():app.message.PkConfig {
			return pk_config$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.guild_config", "guildConfig", (256 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildConfig; });

		private var guild_config$field:app.message.GuildConfig;

		public function clearGuildConfig():void {
			guild_config$field = null;
		}

		public function get hasGuildConfig():Boolean {
			return guild_config$field != null;
		}

		public function set guildConfig(value:app.message.GuildConfig):void {
			guild_config$field = value;
		}

		public function get guildConfig():app.message.GuildConfig {
			return guild_config$field;
		}

		/**
		 *  @private
		 */
		public static const MAZE_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.maze_config", "mazeConfig", (258 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MazeConfig; });

		private var maze_config$field:app.message.MazeConfig;

		public function clearMazeConfig():void {
			maze_config$field = null;
		}

		public function get hasMazeConfig():Boolean {
			return maze_config$field != null;
		}

		public function set mazeConfig(value:app.message.MazeConfig):void {
			maze_config$field = value;
		}

		public function get mazeConfig():app.message.MazeConfig {
			return maze_config$field;
		}

		/**
		 *  @private
		 */
		public static const ALL_TAX_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.all_tax_config", "allTaxConfig", (260 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllTaxConfigProto; });

		private var all_tax_config$field:app.message.AllTaxConfigProto;

		public function clearAllTaxConfig():void {
			all_tax_config$field = null;
		}

		public function get hasAllTaxConfig():Boolean {
			return all_tax_config$field != null;
		}

		public function set allTaxConfig(value:app.message.AllTaxConfigProto):void {
			all_tax_config$field = value;
		}

		public function get allTaxConfig():app.message.AllTaxConfigProto {
			return all_tax_config$field;
		}

		/**
		 *  @private
		 */
		public static const STALL_CONFIG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.stall_config", "stallConfig", (261 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StallConfig; });

		private var stall_config$field:app.message.StallConfig;

		public function clearStallConfig():void {
			stall_config$field = null;
		}

		public function get hasStallConfig():Boolean {
			return stall_config$field != null;
		}

		public function set stallConfig(value:app.message.StallConfig):void {
			stall_config$field = value;
		}

		public function get stallConfig():app.message.StallConfig {
			return stall_config$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSceneConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, scene_config$field);
			}
			if (hasGoodsConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, goods_config$field);
			}
			if (hasSpellConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, spell_config$field);
			}
			if (hasAchievementNicknameConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, achievement_nickname_config$field);
			}
			if (hasRaceConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, race_config$field);
			}
			if (hasShopConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, shop_config$field);
			}
			if (hasTaskConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, task_config$field);
			}
			if (hasMonsterConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, monster_config$field);
			}
			if (hasCollecObjectConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 35);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, collec_object_config$field);
			}
			if (hasFamily) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family$field);
			}
			if (hasVips) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 45);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, vips$field);
			}
			if (hasMount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 50);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mount$field);
			}
			if (hasExam) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 55);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, exam$field);
			}
			if (hasWelfare) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 60);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, welfare$field);
			}
			if (hasChatConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 80);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chat_config$field);
			}
			if (hasCountryConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 100);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_config$field);
			}
			if (hasCountryWarConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 101);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_war_config$field);
			}
			if (hasLevelConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 85);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, level_config$field);
			}
			if (hasSceneTranports) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 103);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, scene_tranports$field);
			}
			if (hasAllUnlockData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 104);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, all_unlock_data$field);
			}
			if (hasMailConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 210);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_config$field);
			}
			if (hasAddSpriteStatConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 211);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, add_sprite_stat_config$field);
			}
			if (hasTeamConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 212);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, team_config$field);
			}
			if (hasRelationConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 213);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, relation_config$field);
			}
			if (hasEquipmentConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 214);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, equipment_config$field);
			}
			if (hasKingWarConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 215);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, king_war_config$field);
			}
			if (hasMiscConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 250);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, misc_config$field);
			}
			if (hasBiaoConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 251);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, biao_config$field);
			}
			if (hasTradeConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 252);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, trade_config$field);
			}
			if (hasTaoNiConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 253);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, tao_ni_config$field);
			}
			if (hasReliveConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 254);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, relive_config$field);
			}
			if (hasPkConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 255);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, pk_config$field);
			}
			if (hasGuildConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 256);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, guild_config$field);
			}
			if (hasMazeConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 258);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, maze_config$field);
			}
			if (hasAllTaxConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 260);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, all_tax_config$field);
			}
			if (hasStallConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 261);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, stall_config$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var scene_config$count:uint = 0;
			var goods_config$count:uint = 0;
			var spell_config$count:uint = 0;
			var achievement_nickname_config$count:uint = 0;
			var race_config$count:uint = 0;
			var shop_config$count:uint = 0;
			var task_config$count:uint = 0;
			var monster_config$count:uint = 0;
			var collec_object_config$count:uint = 0;
			var family$count:uint = 0;
			var vips$count:uint = 0;
			var mount$count:uint = 0;
			var exam$count:uint = 0;
			var welfare$count:uint = 0;
			var chat_config$count:uint = 0;
			var country_config$count:uint = 0;
			var country_war_config$count:uint = 0;
			var level_config$count:uint = 0;
			var scene_tranports$count:uint = 0;
			var all_unlock_data$count:uint = 0;
			var mail_config$count:uint = 0;
			var add_sprite_stat_config$count:uint = 0;
			var team_config$count:uint = 0;
			var relation_config$count:uint = 0;
			var equipment_config$count:uint = 0;
			var king_war_config$count:uint = 0;
			var misc_config$count:uint = 0;
			var biao_config$count:uint = 0;
			var trade_config$count:uint = 0;
			var tao_ni_config$count:uint = 0;
			var relive_config$count:uint = 0;
			var pk_config$count:uint = 0;
			var guild_config$count:uint = 0;
			var maze_config$count:uint = 0;
			var all_tax_config$count:uint = 0;
			var stall_config$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (scene_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.sceneConfig cannot be set twice.');
					}
					++scene_config$count;
					this.sceneConfig = new app.message.SceneConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sceneConfig);
					break;
				case 2:
					if (goods_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.goodsConfig cannot be set twice.');
					}
					++goods_config$count;
					this.goodsConfig = new app.message.GoodsConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.goodsConfig);
					break;
				case 3:
					if (spell_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.spellConfig cannot be set twice.');
					}
					++spell_config$count;
					this.spellConfig = new app.message.SpellConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.spellConfig);
					break;
				case 4:
					if (achievement_nickname_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.achievementNicknameConfig cannot be set twice.');
					}
					++achievement_nickname_config$count;
					this.achievementNicknameConfig = new app.message.AchievementAndNickNameConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.achievementNicknameConfig);
					break;
				case 14:
					if (race_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.raceConfig cannot be set twice.');
					}
					++race_config$count;
					this.raceConfig = new app.message.RaceConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.raceConfig);
					break;
				case 20:
					if (shop_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.shopConfig cannot be set twice.');
					}
					++shop_config$count;
					this.shopConfig = new app.message.ShopConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.shopConfig);
					break;
				case 25:
					if (task_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.taskConfig cannot be set twice.');
					}
					++task_config$count;
					this.taskConfig = new app.message.TaskConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.taskConfig);
					break;
				case 30:
					if (monster_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.monsterConfig cannot be set twice.');
					}
					++monster_config$count;
					this.monsterConfig = new app.message.MonsterConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.monsterConfig);
					break;
				case 35:
					if (collec_object_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.collecObjectConfig cannot be set twice.');
					}
					++collec_object_config$count;
					this.collecObjectConfig = new app.message.CollectObjectConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.collecObjectConfig);
					break;
				case 40:
					if (family$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.family cannot be set twice.');
					}
					++family$count;
					this.family = new app.message.FamilyConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.family);
					break;
				case 45:
					if (vips$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.vips cannot be set twice.');
					}
					++vips$count;
					this.vips = new app.message.VipsProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.vips);
					break;
				case 50:
					if (mount$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.mount cannot be set twice.');
					}
					++mount$count;
					this.mount = new app.message.MountConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mount);
					break;
				case 55:
					if (exam$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.exam cannot be set twice.');
					}
					++exam$count;
					this.exam = new app.message.ExamConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.exam);
					break;
				case 60:
					if (welfare$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.welfare cannot be set twice.');
					}
					++welfare$count;
					this.welfare = new app.message.WelfareConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.welfare);
					break;
				case 80:
					if (chat_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.chatConfig cannot be set twice.');
					}
					++chat_config$count;
					this.chatConfig = new app.message.ChatConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chatConfig);
					break;
				case 100:
					if (country_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.countryConfig cannot be set twice.');
					}
					++country_config$count;
					this.countryConfig = new app.message.CountryConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryConfig);
					break;
				case 101:
					if (country_war_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.countryWarConfig cannot be set twice.');
					}
					++country_war_config$count;
					this.countryWarConfig = new app.message.CountryWarConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryWarConfig);
					break;
				case 85:
					if (level_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.levelConfig cannot be set twice.');
					}
					++level_config$count;
					this.levelConfig = new app.message.LevelConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.levelConfig);
					break;
				case 103:
					if (scene_tranports$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.sceneTranports cannot be set twice.');
					}
					++scene_tranports$count;
					this.sceneTranports = new app.message.SceneTransportsProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sceneTranports);
					break;
				case 104:
					if (all_unlock_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.allUnlockData cannot be set twice.');
					}
					++all_unlock_data$count;
					this.allUnlockData = new app.message.Config.AllGoodsContainerUnlockProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.allUnlockData);
					break;
				case 210:
					if (mail_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.mailConfig cannot be set twice.');
					}
					++mail_config$count;
					this.mailConfig = new app.message.MailConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailConfig);
					break;
				case 211:
					if (add_sprite_stat_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.addSpriteStatConfig cannot be set twice.');
					}
					++add_sprite_stat_config$count;
					this.addSpriteStatConfig = new app.message.AddSpriteStatConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.addSpriteStatConfig);
					break;
				case 212:
					if (team_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.teamConfig cannot be set twice.');
					}
					++team_config$count;
					this.teamConfig = new app.message.TeamConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.teamConfig);
					break;
				case 213:
					if (relation_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.relationConfig cannot be set twice.');
					}
					++relation_config$count;
					this.relationConfig = new app.message.RelationConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.relationConfig);
					break;
				case 214:
					if (equipment_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.equipmentConfig cannot be set twice.');
					}
					++equipment_config$count;
					this.equipmentConfig = new app.message.EquipmentConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.equipmentConfig);
					break;
				case 215:
					if (king_war_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.kingWarConfig cannot be set twice.');
					}
					++king_war_config$count;
					this.kingWarConfig = new app.message.KingWarConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.kingWarConfig);
					break;
				case 250:
					if (misc_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.miscConfig cannot be set twice.');
					}
					++misc_config$count;
					this.miscConfig = new app.message.MiscConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.miscConfig);
					break;
				case 251:
					if (biao_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.biaoConfig cannot be set twice.');
					}
					++biao_config$count;
					this.biaoConfig = new app.message.BiaoConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.biaoConfig);
					break;
				case 252:
					if (trade_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.tradeConfig cannot be set twice.');
					}
					++trade_config$count;
					this.tradeConfig = new app.message.TradeConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.tradeConfig);
					break;
				case 253:
					if (tao_ni_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.taoNiConfig cannot be set twice.');
					}
					++tao_ni_config$count;
					this.taoNiConfig = new app.message.TaoNiConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.taoNiConfig);
					break;
				case 254:
					if (relive_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.reliveConfig cannot be set twice.');
					}
					++relive_config$count;
					this.reliveConfig = new app.message.ReliveConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.reliveConfig);
					break;
				case 255:
					if (pk_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.pkConfig cannot be set twice.');
					}
					++pk_config$count;
					this.pkConfig = new app.message.PkConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.pkConfig);
					break;
				case 256:
					if (guild_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.guildConfig cannot be set twice.');
					}
					++guild_config$count;
					this.guildConfig = new app.message.GuildConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.guildConfig);
					break;
				case 258:
					if (maze_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.mazeConfig cannot be set twice.');
					}
					++maze_config$count;
					this.mazeConfig = new app.message.MazeConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mazeConfig);
					break;
				case 260:
					if (all_tax_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.allTaxConfig cannot be set twice.');
					}
					++all_tax_config$count;
					this.allTaxConfig = new app.message.AllTaxConfigProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.allTaxConfig);
					break;
				case 261:
					if (stall_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: Config.stallConfig cannot be set twice.');
					}
					++stall_config$count;
					this.stallConfig = new app.message.StallConfig();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.stallConfig);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
