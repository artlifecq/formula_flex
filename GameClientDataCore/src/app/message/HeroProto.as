package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.HeroBasicProto;
	import app.message.BaZhenTuModuleObjProto;
	import app.message.GoodsContainerModuleObjProto;
	import app.message.KingWarModuleObjProto;
	import app.message.MailModuleObjClientProto;
	import app.message.TeamModuleObjProto;
	import app.message.SceneModuleObjClientProto;
	import app.message.MountModuleObjClientProto;
	import app.message.TransferModuleObjProto;
	import app.message.TaskModuleObjProto;
	import app.message.AddSpriteStatModuleObjProto;
	import app.message.HeroMiscModuleObjProto;
	import app.message.RechargeRankPromotionModuleObjProto;
	import app.message.VipModuleObjProto;
	import app.message.FamilyModuleObjProto;
	import app.message.SpellModuleObjProto;
	import app.message.WelfareModuleObjProto;
	import app.message.StallModuleObjProto;
	import app.message.DbRankModuleObjProto;
	import app.message.ShopModuleObjClientProto;
	import app.message.ClusterTeamModuleObjProto;
	import app.message.CountryModuleObjProto;
	import app.message.TradeModuleObjProto;
	import app.message.GuildModuleObjProto;
	import app.message.AchievementAndNickNameModuleObjProto;
	import app.message.RelationModuleObjProto;
	import app.message.BiaoModuleObjProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HeroProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_BASIC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.hero_basic", "heroBasic", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.HeroBasicProto; });

		private var hero_basic$field:app.message.HeroBasicProto;

		public function clearHeroBasic():void {
			hero_basic$field = null;
		}

		public function get hasHeroBasic():Boolean {
			return hero_basic$field != null;
		}

		public function set heroBasic(value:app.message.HeroBasicProto):void {
			hero_basic$field = value;
		}

		public function get heroBasic():app.message.HeroBasicProto {
			return hero_basic$field;
		}

		/**
		 *  @private
		 */
		public static const TASK_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.task_module_obj", "taskModuleObj", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskModuleObjProto; });

		private var task_module_obj$field:app.message.TaskModuleObjProto;

		public function clearTaskModuleObj():void {
			task_module_obj$field = null;
		}

		public function get hasTaskModuleObj():Boolean {
			return task_module_obj$field != null;
		}

		public function set taskModuleObj(value:app.message.TaskModuleObjProto):void {
			task_module_obj$field = value;
		}

		public function get taskModuleObj():app.message.TaskModuleObjProto {
			return task_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENT_AND_NICKNAME_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.achievement_and_nickname_module_obj", "achievementAndNicknameModuleObj", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AchievementAndNickNameModuleObjProto; });

		private var achievement_and_nickname_module_obj$field:app.message.AchievementAndNickNameModuleObjProto;

		public function clearAchievementAndNicknameModuleObj():void {
			achievement_and_nickname_module_obj$field = null;
		}

		public function get hasAchievementAndNicknameModuleObj():Boolean {
			return achievement_and_nickname_module_obj$field != null;
		}

		public function set achievementAndNicknameModuleObj(value:app.message.AchievementAndNickNameModuleObjProto):void {
			achievement_and_nickname_module_obj$field = value;
		}

		public function get achievementAndNicknameModuleObj():app.message.AchievementAndNickNameModuleObjProto {
			return achievement_and_nickname_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.spell_module_obj", "spellModuleObj", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellModuleObjProto; });

		private var spell_module_obj$field:app.message.SpellModuleObjProto;

		public function clearSpellModuleObj():void {
			spell_module_obj$field = null;
		}

		public function get hasSpellModuleObj():Boolean {
			return spell_module_obj$field != null;
		}

		public function set spellModuleObj(value:app.message.SpellModuleObjProto):void {
			spell_module_obj$field = value;
		}

		public function get spellModuleObj():app.message.SpellModuleObjProto {
			return spell_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_SPRITE_STAT_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.add_sprite_stat_module_obj", "addSpriteStatModuleObj", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AddSpriteStatModuleObjProto; });

		private var add_sprite_stat_module_obj$field:app.message.AddSpriteStatModuleObjProto;

		public function clearAddSpriteStatModuleObj():void {
			add_sprite_stat_module_obj$field = null;
		}

		public function get hasAddSpriteStatModuleObj():Boolean {
			return add_sprite_stat_module_obj$field != null;
		}

		public function set addSpriteStatModuleObj(value:app.message.AddSpriteStatModuleObjProto):void {
			add_sprite_stat_module_obj$field = value;
		}

		public function get addSpriteStatModuleObj():app.message.AddSpriteStatModuleObjProto {
			return add_sprite_stat_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.vip_module_obj", "vipModuleObj", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.VipModuleObjProto; });

		private var vip_module_obj$field:app.message.VipModuleObjProto;

		public function clearVipModuleObj():void {
			vip_module_obj$field = null;
		}

		public function get hasVipModuleObj():Boolean {
			return vip_module_obj$field != null;
		}

		public function set vipModuleObj(value:app.message.VipModuleObjProto):void {
			vip_module_obj$field = value;
		}

		public function get vipModuleObj():app.message.VipModuleObjProto {
			return vip_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_MISC_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.hero_misc_module_obj", "heroMiscModuleObj", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.HeroMiscModuleObjProto; });

		private var hero_misc_module_obj$field:app.message.HeroMiscModuleObjProto;

		public function clearHeroMiscModuleObj():void {
			hero_misc_module_obj$field = null;
		}

		public function get hasHeroMiscModuleObj():Boolean {
			return hero_misc_module_obj$field != null;
		}

		public function set heroMiscModuleObj(value:app.message.HeroMiscModuleObjProto):void {
			hero_misc_module_obj$field = value;
		}

		public function get heroMiscModuleObj():app.message.HeroMiscModuleObjProto {
			return hero_misc_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const RECHARGE_RANK_PROMOTION_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.recharge_rank_promotion_module_obj", "rechargeRankPromotionModuleObj", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.RechargeRankPromotionModuleObjProto; });

		private var recharge_rank_promotion_module_obj$field:app.message.RechargeRankPromotionModuleObjProto;

		public function clearRechargeRankPromotionModuleObj():void {
			recharge_rank_promotion_module_obj$field = null;
		}

		public function get hasRechargeRankPromotionModuleObj():Boolean {
			return recharge_rank_promotion_module_obj$field != null;
		}

		public function set rechargeRankPromotionModuleObj(value:app.message.RechargeRankPromotionModuleObjProto):void {
			recharge_rank_promotion_module_obj$field = value;
		}

		public function get rechargeRankPromotionModuleObj():app.message.RechargeRankPromotionModuleObjProto {
			return recharge_rank_promotion_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const WELFARE_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.welfare_module_obj", "welfareModuleObj", (27 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.WelfareModuleObjProto; });

		private var welfare_module_obj$field:app.message.WelfareModuleObjProto;

		public function clearWelfareModuleObj():void {
			welfare_module_obj$field = null;
		}

		public function get hasWelfareModuleObj():Boolean {
			return welfare_module_obj$field != null;
		}

		public function set welfareModuleObj(value:app.message.WelfareModuleObjProto):void {
			welfare_module_obj$field = value;
		}

		public function get welfareModuleObj():app.message.WelfareModuleObjProto {
			return welfare_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const CLUSTER_TEAM_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.cluster_team_module_obj", "clusterTeamModuleObj", (28 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ClusterTeamModuleObjProto; });

		private var cluster_team_module_obj$field:app.message.ClusterTeamModuleObjProto;

		public function clearClusterTeamModuleObj():void {
			cluster_team_module_obj$field = null;
		}

		public function get hasClusterTeamModuleObj():Boolean {
			return cluster_team_module_obj$field != null;
		}

		public function set clusterTeamModuleObj(value:app.message.ClusterTeamModuleObjProto):void {
			cluster_team_module_obj$field = value;
		}

		public function get clusterTeamModuleObj():app.message.ClusterTeamModuleObjProto {
			return cluster_team_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const TEAM_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.team_module_obj", "teamModuleObj", (29 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TeamModuleObjProto; });

		private var team_module_obj$field:app.message.TeamModuleObjProto;

		public function clearTeamModuleObj():void {
			team_module_obj$field = null;
		}

		public function get hasTeamModuleObj():Boolean {
			return team_module_obj$field != null;
		}

		public function set teamModuleObj(value:app.message.TeamModuleObjProto):void {
			team_module_obj$field = value;
		}

		public function get teamModuleObj():app.message.TeamModuleObjProto {
			return team_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.country_module_obj", "countryModuleObj", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryModuleObjProto; });

		private var country_module_obj$field:app.message.CountryModuleObjProto;

		public function clearCountryModuleObj():void {
			country_module_obj$field = null;
		}

		public function get hasCountryModuleObj():Boolean {
			return country_module_obj$field != null;
		}

		public function set countryModuleObj(value:app.message.CountryModuleObjProto):void {
			country_module_obj$field = value;
		}

		public function get countryModuleObj():app.message.CountryModuleObjProto {
			return country_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.family_module_obj", "familyModuleObj", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyModuleObjProto; });

		private var family_module_obj$field:app.message.FamilyModuleObjProto;

		public function clearFamilyModuleObj():void {
			family_module_obj$field = null;
		}

		public function get hasFamilyModuleObj():Boolean {
			return family_module_obj$field != null;
		}

		public function set familyModuleObj(value:app.message.FamilyModuleObjProto):void {
			family_module_obj$field = value;
		}

		public function get familyModuleObj():app.message.FamilyModuleObjProto {
			return family_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const KING_WAR_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.king_war_module_obj", "kingWarModuleObj", (32 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.KingWarModuleObjProto; });

		private var king_war_module_obj$field:app.message.KingWarModuleObjProto;

		public function clearKingWarModuleObj():void {
			king_war_module_obj$field = null;
		}

		public function get hasKingWarModuleObj():Boolean {
			return king_war_module_obj$field != null;
		}

		public function set kingWarModuleObj(value:app.message.KingWarModuleObjProto):void {
			king_war_module_obj$field = value;
		}

		public function get kingWarModuleObj():app.message.KingWarModuleObjProto {
			return king_war_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const BIAO_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.biao_module_obj", "biaoModuleObj", (33 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoModuleObjProto; });

		private var biao_module_obj$field:app.message.BiaoModuleObjProto;

		public function clearBiaoModuleObj():void {
			biao_module_obj$field = null;
		}

		public function get hasBiaoModuleObj():Boolean {
			return biao_module_obj$field != null;
		}

		public function set biaoModuleObj(value:app.message.BiaoModuleObjProto):void {
			biao_module_obj$field = value;
		}

		public function get biaoModuleObj():app.message.BiaoModuleObjProto {
			return biao_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.mount_module_obj", "mountModuleObj", (34 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountModuleObjClientProto; });

		private var mount_module_obj$field:app.message.MountModuleObjClientProto;

		public function clearMountModuleObj():void {
			mount_module_obj$field = null;
		}

		public function get hasMountModuleObj():Boolean {
			return mount_module_obj$field != null;
		}

		public function set mountModuleObj(value:app.message.MountModuleObjClientProto):void {
			mount_module_obj$field = value;
		}

		public function get mountModuleObj():app.message.MountModuleObjClientProto {
			return mount_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const BA_ZHEN_TU_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.ba_zhen_tu_module_obj", "baZhenTuModuleObj", (35 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BaZhenTuModuleObjProto; });

		private var ba_zhen_tu_module_obj$field:app.message.BaZhenTuModuleObjProto;

		public function clearBaZhenTuModuleObj():void {
			ba_zhen_tu_module_obj$field = null;
		}

		public function get hasBaZhenTuModuleObj():Boolean {
			return ba_zhen_tu_module_obj$field != null;
		}

		public function set baZhenTuModuleObj(value:app.message.BaZhenTuModuleObjProto):void {
			ba_zhen_tu_module_obj$field = value;
		}

		public function get baZhenTuModuleObj():app.message.BaZhenTuModuleObjProto {
			return ba_zhen_tu_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.scene_module_obj", "sceneModuleObj", (36 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SceneModuleObjClientProto; });

		private var scene_module_obj$field:app.message.SceneModuleObjClientProto;

		public function clearSceneModuleObj():void {
			scene_module_obj$field = null;
		}

		public function get hasSceneModuleObj():Boolean {
			return scene_module_obj$field != null;
		}

		public function set sceneModuleObj(value:app.message.SceneModuleObjClientProto):void {
			scene_module_obj$field = value;
		}

		public function get sceneModuleObj():app.message.SceneModuleObjClientProto {
			return scene_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.guild_module_obj", "guildModuleObj", (37 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildModuleObjProto; });

		private var guild_module_obj$field:app.message.GuildModuleObjProto;

		public function clearGuildModuleObj():void {
			guild_module_obj$field = null;
		}

		public function get hasGuildModuleObj():Boolean {
			return guild_module_obj$field != null;
		}

		public function set guildModuleObj(value:app.message.GuildModuleObjProto):void {
			guild_module_obj$field = value;
		}

		public function get guildModuleObj():app.message.GuildModuleObjProto {
			return guild_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const RELATION_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.relation_module_obj", "relationModuleObj", (38 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.RelationModuleObjProto; });

		private var relation_module_obj$field:app.message.RelationModuleObjProto;

		public function clearRelationModuleObj():void {
			relation_module_obj$field = null;
		}

		public function get hasRelationModuleObj():Boolean {
			return relation_module_obj$field != null;
		}

		public function set relationModuleObj(value:app.message.RelationModuleObjProto):void {
			relation_module_obj$field = value;
		}

		public function get relationModuleObj():app.message.RelationModuleObjProto {
			return relation_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.mail_module_obj", "mailModuleObj", (39 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MailModuleObjClientProto; });

		private var mail_module_obj$field:app.message.MailModuleObjClientProto;

		public function clearMailModuleObj():void {
			mail_module_obj$field = null;
		}

		public function get hasMailModuleObj():Boolean {
			return mail_module_obj$field != null;
		}

		public function set mailModuleObj(value:app.message.MailModuleObjClientProto):void {
			mail_module_obj$field = value;
		}

		public function get mailModuleObj():app.message.MailModuleObjClientProto {
			return mail_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_CONTAINER_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.goods_container_module_obj", "goodsContainerModuleObj", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsContainerModuleObjProto; });

		private var goods_container_module_obj$field:app.message.GoodsContainerModuleObjProto;

		public function clearGoodsContainerModuleObj():void {
			goods_container_module_obj$field = null;
		}

		public function get hasGoodsContainerModuleObj():Boolean {
			return goods_container_module_obj$field != null;
		}

		public function set goodsContainerModuleObj(value:app.message.GoodsContainerModuleObjProto):void {
			goods_container_module_obj$field = value;
		}

		public function get goodsContainerModuleObj():app.message.GoodsContainerModuleObjProto {
			return goods_container_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const TRADE_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.trade_module_obj", "tradeModuleObj", (41 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TradeModuleObjProto; });

		private var trade_module_obj$field:app.message.TradeModuleObjProto;

		public function clearTradeModuleObj():void {
			trade_module_obj$field = null;
		}

		public function get hasTradeModuleObj():Boolean {
			return trade_module_obj$field != null;
		}

		public function set tradeModuleObj(value:app.message.TradeModuleObjProto):void {
			trade_module_obj$field = value;
		}

		public function get tradeModuleObj():app.message.TradeModuleObjProto {
			return trade_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const SHOP_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.shop_module_obj", "shopModuleObj", (42 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ShopModuleObjClientProto; });

		private var shop_module_obj$field:app.message.ShopModuleObjClientProto;

		public function clearShopModuleObj():void {
			shop_module_obj$field = null;
		}

		public function get hasShopModuleObj():Boolean {
			return shop_module_obj$field != null;
		}

		public function set shopModuleObj(value:app.message.ShopModuleObjClientProto):void {
			shop_module_obj$field = value;
		}

		public function get shopModuleObj():app.message.ShopModuleObjClientProto {
			return shop_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const DB_RANK_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.db_rank_module_obj", "dbRankModuleObj", (43 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.DbRankModuleObjProto; });

		private var db_rank_module_obj$field:app.message.DbRankModuleObjProto;

		public function clearDbRankModuleObj():void {
			db_rank_module_obj$field = null;
		}

		public function get hasDbRankModuleObj():Boolean {
			return db_rank_module_obj$field != null;
		}

		public function set dbRankModuleObj(value:app.message.DbRankModuleObjProto):void {
			db_rank_module_obj$field = value;
		}

		public function get dbRankModuleObj():app.message.DbRankModuleObjProto {
			return db_rank_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const TRANSFER_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.transfer_module_obj", "transferModuleObj", (44 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TransferModuleObjProto; });

		private var transfer_module_obj$field:app.message.TransferModuleObjProto;

		public function clearTransferModuleObj():void {
			transfer_module_obj$field = null;
		}

		public function get hasTransferModuleObj():Boolean {
			return transfer_module_obj$field != null;
		}

		public function set transferModuleObj(value:app.message.TransferModuleObjProto):void {
			transfer_module_obj$field = value;
		}

		public function get transferModuleObj():app.message.TransferModuleObjProto {
			return transfer_module_obj$field;
		}

		/**
		 *  @private
		 */
		public static const STALL_MODULE_OBJ:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroProto.stall_module_obj", "stallModuleObj", (45 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StallModuleObjProto; });

		private var stall_module_obj$field:app.message.StallModuleObjProto;

		public function clearStallModuleObj():void {
			stall_module_obj$field = null;
		}

		public function get hasStallModuleObj():Boolean {
			return stall_module_obj$field != null;
		}

		public function set stallModuleObj(value:app.message.StallModuleObjProto):void {
			stall_module_obj$field = value;
		}

		public function get stallModuleObj():app.message.StallModuleObjProto {
			return stall_module_obj$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroBasic) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, hero_basic$field);
			}
			if (hasTaskModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, task_module_obj$field);
			}
			if (hasAchievementAndNicknameModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, achievement_and_nickname_module_obj$field);
			}
			if (hasSpellModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, spell_module_obj$field);
			}
			if (hasAddSpriteStatModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, add_sprite_stat_module_obj$field);
			}
			if (hasVipModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, vip_module_obj$field);
			}
			if (hasHeroMiscModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, hero_misc_module_obj$field);
			}
			if (hasRechargeRankPromotionModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, recharge_rank_promotion_module_obj$field);
			}
			if (hasWelfareModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, welfare_module_obj$field);
			}
			if (hasClusterTeamModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, cluster_team_module_obj$field);
			}
			if (hasTeamModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 29);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, team_module_obj$field);
			}
			if (hasCountryModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_module_obj$field);
			}
			if (hasFamilyModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_module_obj$field);
			}
			if (hasKingWarModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 32);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, king_war_module_obj$field);
			}
			if (hasBiaoModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 33);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, biao_module_obj$field);
			}
			if (hasMountModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 34);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mount_module_obj$field);
			}
			if (hasBaZhenTuModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 35);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, ba_zhen_tu_module_obj$field);
			}
			if (hasSceneModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 36);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, scene_module_obj$field);
			}
			if (hasGuildModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 37);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, guild_module_obj$field);
			}
			if (hasRelationModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 38);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, relation_module_obj$field);
			}
			if (hasMailModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 39);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail_module_obj$field);
			}
			if (hasGoodsContainerModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, goods_container_module_obj$field);
			}
			if (hasTradeModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 41);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, trade_module_obj$field);
			}
			if (hasShopModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 42);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, shop_module_obj$field);
			}
			if (hasDbRankModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 43);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, db_rank_module_obj$field);
			}
			if (hasTransferModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 44);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, transfer_module_obj$field);
			}
			if (hasStallModuleObj) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 45);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, stall_module_obj$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hero_basic$count:uint = 0;
			var task_module_obj$count:uint = 0;
			var achievement_and_nickname_module_obj$count:uint = 0;
			var spell_module_obj$count:uint = 0;
			var add_sprite_stat_module_obj$count:uint = 0;
			var vip_module_obj$count:uint = 0;
			var hero_misc_module_obj$count:uint = 0;
			var recharge_rank_promotion_module_obj$count:uint = 0;
			var welfare_module_obj$count:uint = 0;
			var cluster_team_module_obj$count:uint = 0;
			var team_module_obj$count:uint = 0;
			var country_module_obj$count:uint = 0;
			var family_module_obj$count:uint = 0;
			var king_war_module_obj$count:uint = 0;
			var biao_module_obj$count:uint = 0;
			var mount_module_obj$count:uint = 0;
			var ba_zhen_tu_module_obj$count:uint = 0;
			var scene_module_obj$count:uint = 0;
			var guild_module_obj$count:uint = 0;
			var relation_module_obj$count:uint = 0;
			var mail_module_obj$count:uint = 0;
			var goods_container_module_obj$count:uint = 0;
			var trade_module_obj$count:uint = 0;
			var shop_module_obj$count:uint = 0;
			var db_rank_module_obj$count:uint = 0;
			var transfer_module_obj$count:uint = 0;
			var stall_module_obj$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hero_basic$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.heroBasic cannot be set twice.');
					}
					++hero_basic$count;
					this.heroBasic = new app.message.HeroBasicProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.heroBasic);
					break;
				case 20:
					if (task_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.taskModuleObj cannot be set twice.');
					}
					++task_module_obj$count;
					this.taskModuleObj = new app.message.TaskModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.taskModuleObj);
					break;
				case 21:
					if (achievement_and_nickname_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.achievementAndNicknameModuleObj cannot be set twice.');
					}
					++achievement_and_nickname_module_obj$count;
					this.achievementAndNicknameModuleObj = new app.message.AchievementAndNickNameModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.achievementAndNicknameModuleObj);
					break;
				case 22:
					if (spell_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.spellModuleObj cannot be set twice.');
					}
					++spell_module_obj$count;
					this.spellModuleObj = new app.message.SpellModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.spellModuleObj);
					break;
				case 23:
					if (add_sprite_stat_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.addSpriteStatModuleObj cannot be set twice.');
					}
					++add_sprite_stat_module_obj$count;
					this.addSpriteStatModuleObj = new app.message.AddSpriteStatModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.addSpriteStatModuleObj);
					break;
				case 24:
					if (vip_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.vipModuleObj cannot be set twice.');
					}
					++vip_module_obj$count;
					this.vipModuleObj = new app.message.VipModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.vipModuleObj);
					break;
				case 25:
					if (hero_misc_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.heroMiscModuleObj cannot be set twice.');
					}
					++hero_misc_module_obj$count;
					this.heroMiscModuleObj = new app.message.HeroMiscModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.heroMiscModuleObj);
					break;
				case 26:
					if (recharge_rank_promotion_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.rechargeRankPromotionModuleObj cannot be set twice.');
					}
					++recharge_rank_promotion_module_obj$count;
					this.rechargeRankPromotionModuleObj = new app.message.RechargeRankPromotionModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rechargeRankPromotionModuleObj);
					break;
				case 27:
					if (welfare_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.welfareModuleObj cannot be set twice.');
					}
					++welfare_module_obj$count;
					this.welfareModuleObj = new app.message.WelfareModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.welfareModuleObj);
					break;
				case 28:
					if (cluster_team_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.clusterTeamModuleObj cannot be set twice.');
					}
					++cluster_team_module_obj$count;
					this.clusterTeamModuleObj = new app.message.ClusterTeamModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.clusterTeamModuleObj);
					break;
				case 29:
					if (team_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.teamModuleObj cannot be set twice.');
					}
					++team_module_obj$count;
					this.teamModuleObj = new app.message.TeamModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.teamModuleObj);
					break;
				case 30:
					if (country_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.countryModuleObj cannot be set twice.');
					}
					++country_module_obj$count;
					this.countryModuleObj = new app.message.CountryModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryModuleObj);
					break;
				case 31:
					if (family_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.familyModuleObj cannot be set twice.');
					}
					++family_module_obj$count;
					this.familyModuleObj = new app.message.FamilyModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyModuleObj);
					break;
				case 32:
					if (king_war_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.kingWarModuleObj cannot be set twice.');
					}
					++king_war_module_obj$count;
					this.kingWarModuleObj = new app.message.KingWarModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.kingWarModuleObj);
					break;
				case 33:
					if (biao_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.biaoModuleObj cannot be set twice.');
					}
					++biao_module_obj$count;
					this.biaoModuleObj = new app.message.BiaoModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.biaoModuleObj);
					break;
				case 34:
					if (mount_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.mountModuleObj cannot be set twice.');
					}
					++mount_module_obj$count;
					this.mountModuleObj = new app.message.MountModuleObjClientProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mountModuleObj);
					break;
				case 35:
					if (ba_zhen_tu_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.baZhenTuModuleObj cannot be set twice.');
					}
					++ba_zhen_tu_module_obj$count;
					this.baZhenTuModuleObj = new app.message.BaZhenTuModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.baZhenTuModuleObj);
					break;
				case 36:
					if (scene_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.sceneModuleObj cannot be set twice.');
					}
					++scene_module_obj$count;
					this.sceneModuleObj = new app.message.SceneModuleObjClientProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sceneModuleObj);
					break;
				case 37:
					if (guild_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.guildModuleObj cannot be set twice.');
					}
					++guild_module_obj$count;
					this.guildModuleObj = new app.message.GuildModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.guildModuleObj);
					break;
				case 38:
					if (relation_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.relationModuleObj cannot be set twice.');
					}
					++relation_module_obj$count;
					this.relationModuleObj = new app.message.RelationModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.relationModuleObj);
					break;
				case 39:
					if (mail_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.mailModuleObj cannot be set twice.');
					}
					++mail_module_obj$count;
					this.mailModuleObj = new app.message.MailModuleObjClientProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mailModuleObj);
					break;
				case 40:
					if (goods_container_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.goodsContainerModuleObj cannot be set twice.');
					}
					++goods_container_module_obj$count;
					this.goodsContainerModuleObj = new app.message.GoodsContainerModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.goodsContainerModuleObj);
					break;
				case 41:
					if (trade_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.tradeModuleObj cannot be set twice.');
					}
					++trade_module_obj$count;
					this.tradeModuleObj = new app.message.TradeModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.tradeModuleObj);
					break;
				case 42:
					if (shop_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.shopModuleObj cannot be set twice.');
					}
					++shop_module_obj$count;
					this.shopModuleObj = new app.message.ShopModuleObjClientProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.shopModuleObj);
					break;
				case 43:
					if (db_rank_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.dbRankModuleObj cannot be set twice.');
					}
					++db_rank_module_obj$count;
					this.dbRankModuleObj = new app.message.DbRankModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.dbRankModuleObj);
					break;
				case 44:
					if (transfer_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.transferModuleObj cannot be set twice.');
					}
					++transfer_module_obj$count;
					this.transferModuleObj = new app.message.TransferModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.transferModuleObj);
					break;
				case 45:
					if (stall_module_obj$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroProto.stallModuleObj cannot be set twice.');
					}
					++stall_module_obj$count;
					this.stallModuleObj = new app.message.StallModuleObjProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.stallModuleObj);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
