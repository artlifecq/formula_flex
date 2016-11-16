package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.JailDungeonSceneProto;
	import app.message.KingWarDungeonProto;
	import app.message.BaZhenTuDungeonProto;
	import app.message.TaoNiDungeonProto;
	import flash.utils.ByteArray;
	import app.message.NormalSceneProto;
	import app.message.MazeDungeonProto;
	import app.message.FamilyAnimalBarSceneProto;
	import app.message.GroupDungeonProto;
	import app.message.StoryDungeonProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SceneProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SceneProto.scene_id", "sceneId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSceneId():void {
			hasField$0 &= 0xfffffffe;
			scene_id$field = new int();
		}

		public function get hasSceneId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sceneId(value:int):void {
			hasField$0 |= 0x1;
			scene_id$field = value;
		}

		public function get sceneId():int {
			return scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const MAP:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SceneProto.map", "map", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var map$field:String;

		public function clearMap():void {
			map$field = null;
		}

		public function get hasMap():Boolean {
			return map$field != null;
		}

		public function set map(value:String):void {
			map$field = value;
		}

		public function get map():String {
			return map$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.SceneProto.name", "name", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:flash.utils.ByteArray;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:flash.utils.ByteArray):void {
			name$field = value;
		}

		public function get name():flash.utils.ByteArray {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const POET:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.SceneProto.poet", "poet", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var poet$field:flash.utils.ByteArray;

		public function clearPoet():void {
			poet$field = null;
		}

		public function get hasPoet():Boolean {
			return poet$field != null;
		}

		public function set poet(value:flash.utils.ByteArray):void {
			poet$field = value;
		}

		public function get poet():flash.utils.ByteArray {
			return poet$field;
		}

		/**
		 *  @private
		 */
		public static const FIXED_PK_MODE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SceneProto.fixed_pk_mode", "fixedPkMode", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fixed_pk_mode$field:int;

		public function clearFixedPkMode():void {
			hasField$0 &= 0xfffffffd;
			fixed_pk_mode$field = new int();
		}

		public function get hasFixedPkMode():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set fixedPkMode(value:int):void {
			hasField$0 |= 0x2;
			fixed_pk_mode$field = value;
		}

		public function get fixedPkMode():int {
			return fixed_pk_mode$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HERO_LEVEL_PROTECT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_hero_level_protect", "isHeroLevelProtect", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hero_level_protect$field:Boolean;

		public function clearIsHeroLevelProtect():void {
			hasField$0 &= 0xfffffffb;
			is_hero_level_protect$field = new Boolean();
		}

		public function get hasIsHeroLevelProtect():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isHeroLevelProtect(value:Boolean):void {
			hasField$0 |= 0x4;
			is_hero_level_protect$field = value;
		}

		public function get isHeroLevelProtect():Boolean {
			return is_hero_level_protect$field;
		}

		/**
		 *  @private
		 */
		public static const IS_NEW_HERO_PROTECT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_new_hero_protect", "isNewHeroProtect", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_new_hero_protect$field:Boolean;

		public function clearIsNewHeroProtect():void {
			hasField$0 &= 0xfffffff7;
			is_new_hero_protect$field = new Boolean();
		}

		public function get hasIsNewHeroProtect():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isNewHeroProtect(value:Boolean):void {
			hasField$0 |= 0x8;
			is_new_hero_protect$field = value;
		}

		public function get isNewHeroProtect():Boolean {
			return is_new_hero_protect$field;
		}

		/**
		 *  @private
		 */
		public static const IS_DEATH_PROTECT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_death_protect", "isDeathProtect", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_death_protect$field:Boolean;

		public function clearIsDeathProtect():void {
			hasField$0 &= 0xffffffef;
			is_death_protect$field = new Boolean();
		}

		public function get hasIsDeathProtect():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isDeathProtect(value:Boolean):void {
			hasField$0 |= 0x10;
			is_death_protect$field = value;
		}

		public function get isDeathProtect():Boolean {
			return is_death_protect$field;
		}

		/**
		 *  @private
		 */
		public static const IS_NIGHT_AUTO_PROTECT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_night_auto_protect", "isNightAutoProtect", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_night_auto_protect$field:Boolean;

		public function clearIsNightAutoProtect():void {
			hasField$0 &= 0xffffffdf;
			is_night_auto_protect$field = new Boolean();
		}

		public function get hasIsNightAutoProtect():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isNightAutoProtect(value:Boolean):void {
			hasField$0 |= 0x20;
			is_night_auto_protect$field = value;
		}

		public function get isNightAutoProtect():Boolean {
			return is_night_auto_protect$field;
		}

		/**
		 *  @private
		 */
		public static const IS_MOUNT_LIMIT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_mount_limit", "isMountLimit", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_mount_limit$field:Boolean;

		public function clearIsMountLimit():void {
			hasField$0 &= 0xffffffbf;
			is_mount_limit$field = new Boolean();
		}

		public function get hasIsMountLimit():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set isMountLimit(value:Boolean):void {
			hasField$0 |= 0x40;
			is_mount_limit$field = value;
		}

		public function get isMountLimit():Boolean {
			return is_mount_limit$field;
		}

		/**
		 *  @private
		 */
		public static const SOUND:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SceneProto.sound", "sound", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sound$field:String;

		public function clearSound():void {
			sound$field = null;
		}

		public function get hasSound():Boolean {
			return sound$field != null;
		}

		public function set sound(value:String):void {
			sound$field = value;
		}

		public function get sound():String {
			return sound$field;
		}

		/**
		 *  @private
		 */
		public static const MAP_NAME_RESOURCE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SceneProto.map_name_resource", "mapNameResource", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var map_name_resource$field:String;

		public function clearMapNameResource():void {
			map_name_resource$field = null;
		}

		public function get hasMapNameResource():Boolean {
			return map_name_resource$field != null;
		}

		public function set mapNameResource(value:String):void {
			map_name_resource$field = value;
		}

		public function get mapNameResource():String {
			return map_name_resource$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TRANSPORT_GOODS_LIMIT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_transport_goods_limit", "isTransportGoodsLimit", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_transport_goods_limit$field:Boolean;

		public function clearIsTransportGoodsLimit():void {
			hasField$0 &= 0xffffff7f;
			is_transport_goods_limit$field = new Boolean();
		}

		public function get hasIsTransportGoodsLimit():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set isTransportGoodsLimit(value:Boolean):void {
			hasField$0 |= 0x80;
			is_transport_goods_limit$field = value;
		}

		public function get isTransportGoodsLimit():Boolean {
			return is_transport_goods_limit$field;
		}

		/**
		 *  @private
		 */
		public static const IS_USE_SPELL_LIMIT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_use_spell_limit", "isUseSpellLimit", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_use_spell_limit$field:Boolean;

		public function clearIsUseSpellLimit():void {
			hasField$0 &= 0xfffffeff;
			is_use_spell_limit$field = new Boolean();
		}

		public function get hasIsUseSpellLimit():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set isUseSpellLimit(value:Boolean):void {
			hasField$0 |= 0x100;
			is_use_spell_limit$field = value;
		}

		public function get isUseSpellLimit():Boolean {
			return is_use_spell_limit$field;
		}

		/**
		 *  @private
		 */
		public static const IS_RELIVE_LIMIT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_relive_limit", "isReliveLimit", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_relive_limit$field:Boolean;

		public function clearIsReliveLimit():void {
			hasField$0 &= 0xfffffdff;
			is_relive_limit$field = new Boolean();
		}

		public function get hasIsReliveLimit():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set isReliveLimit(value:Boolean):void {
			hasField$0 |= 0x200;
			is_relive_limit$field = value;
		}

		public function get isReliveLimit():Boolean {
			return is_relive_limit$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HERO_DEAD_NOT_DROP:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_hero_dead_not_drop", "isHeroDeadNotDrop", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hero_dead_not_drop$field:Boolean;

		public function clearIsHeroDeadNotDrop():void {
			hasField$0 &= 0xfffffbff;
			is_hero_dead_not_drop$field = new Boolean();
		}

		public function get hasIsHeroDeadNotDrop():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set isHeroDeadNotDrop(value:Boolean):void {
			hasField$0 |= 0x400;
			is_hero_dead_not_drop$field = value;
		}

		public function get isHeroDeadNotDrop():Boolean {
			return is_hero_dead_not_drop$field;
		}

		/**
		 *  @private
		 */
		public static const IS_SEE_ALL:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SceneProto.is_see_all", "isSeeAll", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_see_all$field:Boolean;

		public function clearIsSeeAll():void {
			hasField$0 &= 0xfffff7ff;
			is_see_all$field = new Boolean();
		}

		public function get hasIsSeeAll():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set isSeeAll(value:Boolean):void {
			hasField$0 |= 0x800;
			is_see_all$field = value;
		}

		public function get isSeeAll():Boolean {
			return is_see_all$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_SCENE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.normal_scene", "normalScene", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NormalSceneProto; });

		private var normal_scene$field:app.message.NormalSceneProto;

		public function clearNormalScene():void {
			normal_scene$field = null;
		}

		public function get hasNormalScene():Boolean {
			return normal_scene$field != null;
		}

		public function set normalScene(value:app.message.NormalSceneProto):void {
			normal_scene$field = value;
		}

		public function get normalScene():app.message.NormalSceneProto {
			return normal_scene$field;
		}

		/**
		 *  @private
		 */
		public static const JAIL_SCENE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.jail_scene", "jailScene", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.JailDungeonSceneProto; });

		private var jail_scene$field:app.message.JailDungeonSceneProto;

		public function clearJailScene():void {
			jail_scene$field = null;
		}

		public function get hasJailScene():Boolean {
			return jail_scene$field != null;
		}

		public function set jailScene(value:app.message.JailDungeonSceneProto):void {
			jail_scene$field = value;
		}

		public function get jailScene():app.message.JailDungeonSceneProto {
			return jail_scene$field;
		}

		/**
		 *  @private
		 */
		public static const GROUP_DUNGEON:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.group_dungeon", "groupDungeon", (32 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GroupDungeonProto; });

		private var group_dungeon$field:app.message.GroupDungeonProto;

		public function clearGroupDungeon():void {
			group_dungeon$field = null;
		}

		public function get hasGroupDungeon():Boolean {
			return group_dungeon$field != null;
		}

		public function set groupDungeon(value:app.message.GroupDungeonProto):void {
			group_dungeon$field = value;
		}

		public function get groupDungeon():app.message.GroupDungeonProto {
			return group_dungeon$field;
		}

		/**
		 *  @private
		 */
		public static const KING_WAR_DUNGEON:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.king_war_dungeon", "kingWarDungeon", (33 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.KingWarDungeonProto; });

		private var king_war_dungeon$field:app.message.KingWarDungeonProto;

		public function clearKingWarDungeon():void {
			king_war_dungeon$field = null;
		}

		public function get hasKingWarDungeon():Boolean {
			return king_war_dungeon$field != null;
		}

		public function set kingWarDungeon(value:app.message.KingWarDungeonProto):void {
			king_war_dungeon$field = value;
		}

		public function get kingWarDungeon():app.message.KingWarDungeonProto {
			return king_war_dungeon$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_ANIMAL_BAR_SCENE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.family_animal_bar_scene", "familyAnimalBarScene", (34 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyAnimalBarSceneProto; });

		private var family_animal_bar_scene$field:app.message.FamilyAnimalBarSceneProto;

		public function clearFamilyAnimalBarScene():void {
			family_animal_bar_scene$field = null;
		}

		public function get hasFamilyAnimalBarScene():Boolean {
			return family_animal_bar_scene$field != null;
		}

		public function set familyAnimalBarScene(value:app.message.FamilyAnimalBarSceneProto):void {
			family_animal_bar_scene$field = value;
		}

		public function get familyAnimalBarScene():app.message.FamilyAnimalBarSceneProto {
			return family_animal_bar_scene$field;
		}

		/**
		 *  @private
		 */
		public static const BA_ZHEN_TU_DUNGEON:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.ba_zhen_tu_dungeon", "baZhenTuDungeon", (35 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BaZhenTuDungeonProto; });

		private var ba_zhen_tu_dungeon$field:app.message.BaZhenTuDungeonProto;

		public function clearBaZhenTuDungeon():void {
			ba_zhen_tu_dungeon$field = null;
		}

		public function get hasBaZhenTuDungeon():Boolean {
			return ba_zhen_tu_dungeon$field != null;
		}

		public function set baZhenTuDungeon(value:app.message.BaZhenTuDungeonProto):void {
			ba_zhen_tu_dungeon$field = value;
		}

		public function get baZhenTuDungeon():app.message.BaZhenTuDungeonProto {
			return ba_zhen_tu_dungeon$field;
		}

		/**
		 *  @private
		 */
		public static const TAO_NI_DUNGEON:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.tao_ni_dungeon", "taoNiDungeon", (36 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaoNiDungeonProto; });

		private var tao_ni_dungeon$field:app.message.TaoNiDungeonProto;

		public function clearTaoNiDungeon():void {
			tao_ni_dungeon$field = null;
		}

		public function get hasTaoNiDungeon():Boolean {
			return tao_ni_dungeon$field != null;
		}

		public function set taoNiDungeon(value:app.message.TaoNiDungeonProto):void {
			tao_ni_dungeon$field = value;
		}

		public function get taoNiDungeon():app.message.TaoNiDungeonProto {
			return tao_ni_dungeon$field;
		}

		/**
		 *  @private
		 */
		public static const MAZE_DUNGEON:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.maze_dungeon", "mazeDungeon", (37 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MazeDungeonProto; });

		private var maze_dungeon$field:app.message.MazeDungeonProto;

		public function clearMazeDungeon():void {
			maze_dungeon$field = null;
		}

		public function get hasMazeDungeon():Boolean {
			return maze_dungeon$field != null;
		}

		public function set mazeDungeon(value:app.message.MazeDungeonProto):void {
			maze_dungeon$field = value;
		}

		public function get mazeDungeon():app.message.MazeDungeonProto {
			return maze_dungeon$field;
		}

		/**
		 *  @private
		 */
		public static const STORY_DUNGEON:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SceneProto.story_dungeon", "storyDungeon", (38 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StoryDungeonProto; });

		private var story_dungeon$field:app.message.StoryDungeonProto;

		public function clearStoryDungeon():void {
			story_dungeon$field = null;
		}

		public function get hasStoryDungeon():Boolean {
			return story_dungeon$field != null;
		}

		public function set storyDungeon(value:app.message.StoryDungeonProto):void {
			story_dungeon$field = value;
		}

		public function get storyDungeon():app.message.StoryDungeonProto {
			return story_dungeon$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, scene_id$field);
			}
			if (hasMap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, map$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, name$field);
			}
			if (hasPoet) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, poet$field);
			}
			if (hasFixedPkMode) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fixed_pk_mode$field);
			}
			if (hasIsHeroLevelProtect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_hero_level_protect$field);
			}
			if (hasIsNewHeroProtect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_new_hero_protect$field);
			}
			if (hasIsDeathProtect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_death_protect$field);
			}
			if (hasIsNightAutoProtect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_night_auto_protect$field);
			}
			if (hasIsMountLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_mount_limit$field);
			}
			if (hasSound) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, sound$field);
			}
			if (hasMapNameResource) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, map_name_resource$field);
			}
			if (hasIsTransportGoodsLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_transport_goods_limit$field);
			}
			if (hasIsUseSpellLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_use_spell_limit$field);
			}
			if (hasIsReliveLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_relive_limit$field);
			}
			if (hasIsHeroDeadNotDrop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_hero_dead_not_drop$field);
			}
			if (hasIsSeeAll) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_see_all$field);
			}
			if (hasNormalScene) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, normal_scene$field);
			}
			if (hasJailScene) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, jail_scene$field);
			}
			if (hasGroupDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 32);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, group_dungeon$field);
			}
			if (hasKingWarDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 33);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, king_war_dungeon$field);
			}
			if (hasFamilyAnimalBarScene) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 34);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, family_animal_bar_scene$field);
			}
			if (hasBaZhenTuDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 35);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, ba_zhen_tu_dungeon$field);
			}
			if (hasTaoNiDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 36);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, tao_ni_dungeon$field);
			}
			if (hasMazeDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 37);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, maze_dungeon$field);
			}
			if (hasStoryDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 38);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, story_dungeon$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var scene_id$count:uint = 0;
			var map$count:uint = 0;
			var name$count:uint = 0;
			var poet$count:uint = 0;
			var fixed_pk_mode$count:uint = 0;
			var is_hero_level_protect$count:uint = 0;
			var is_new_hero_protect$count:uint = 0;
			var is_death_protect$count:uint = 0;
			var is_night_auto_protect$count:uint = 0;
			var is_mount_limit$count:uint = 0;
			var sound$count:uint = 0;
			var map_name_resource$count:uint = 0;
			var is_transport_goods_limit$count:uint = 0;
			var is_use_spell_limit$count:uint = 0;
			var is_relive_limit$count:uint = 0;
			var is_hero_dead_not_drop$count:uint = 0;
			var is_see_all$count:uint = 0;
			var normal_scene$count:uint = 0;
			var jail_scene$count:uint = 0;
			var group_dungeon$count:uint = 0;
			var king_war_dungeon$count:uint = 0;
			var family_animal_bar_scene$count:uint = 0;
			var ba_zhen_tu_dungeon$count:uint = 0;
			var tao_ni_dungeon$count:uint = 0;
			var maze_dungeon$count:uint = 0;
			var story_dungeon$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (map$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.map cannot be set twice.');
					}
					++map$count;
					this.map = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 4:
					if (poet$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.poet cannot be set twice.');
					}
					++poet$count;
					this.poet = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 5:
					if (fixed_pk_mode$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.fixedPkMode cannot be set twice.');
					}
					++fixed_pk_mode$count;
					this.fixedPkMode = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (is_hero_level_protect$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isHeroLevelProtect cannot be set twice.');
					}
					++is_hero_level_protect$count;
					this.isHeroLevelProtect = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (is_new_hero_protect$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isNewHeroProtect cannot be set twice.');
					}
					++is_new_hero_protect$count;
					this.isNewHeroProtect = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 8:
					if (is_death_protect$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isDeathProtect cannot be set twice.');
					}
					++is_death_protect$count;
					this.isDeathProtect = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 9:
					if (is_night_auto_protect$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isNightAutoProtect cannot be set twice.');
					}
					++is_night_auto_protect$count;
					this.isNightAutoProtect = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 11:
					if (is_mount_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isMountLimit cannot be set twice.');
					}
					++is_mount_limit$count;
					this.isMountLimit = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 12:
					if (sound$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.sound cannot be set twice.');
					}
					++sound$count;
					this.sound = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 13:
					if (map_name_resource$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.mapNameResource cannot be set twice.');
					}
					++map_name_resource$count;
					this.mapNameResource = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 14:
					if (is_transport_goods_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isTransportGoodsLimit cannot be set twice.');
					}
					++is_transport_goods_limit$count;
					this.isTransportGoodsLimit = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 16:
					if (is_use_spell_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isUseSpellLimit cannot be set twice.');
					}
					++is_use_spell_limit$count;
					this.isUseSpellLimit = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 17:
					if (is_relive_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isReliveLimit cannot be set twice.');
					}
					++is_relive_limit$count;
					this.isReliveLimit = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 18:
					if (is_hero_dead_not_drop$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isHeroDeadNotDrop cannot be set twice.');
					}
					++is_hero_dead_not_drop$count;
					this.isHeroDeadNotDrop = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 19:
					if (is_see_all$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.isSeeAll cannot be set twice.');
					}
					++is_see_all$count;
					this.isSeeAll = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 30:
					if (normal_scene$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.normalScene cannot be set twice.');
					}
					++normal_scene$count;
					this.normalScene = new app.message.NormalSceneProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.normalScene);
					break;
				case 31:
					if (jail_scene$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.jailScene cannot be set twice.');
					}
					++jail_scene$count;
					this.jailScene = new app.message.JailDungeonSceneProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.jailScene);
					break;
				case 32:
					if (group_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.groupDungeon cannot be set twice.');
					}
					++group_dungeon$count;
					this.groupDungeon = new app.message.GroupDungeonProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.groupDungeon);
					break;
				case 33:
					if (king_war_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.kingWarDungeon cannot be set twice.');
					}
					++king_war_dungeon$count;
					this.kingWarDungeon = new app.message.KingWarDungeonProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.kingWarDungeon);
					break;
				case 34:
					if (family_animal_bar_scene$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.familyAnimalBarScene cannot be set twice.');
					}
					++family_animal_bar_scene$count;
					this.familyAnimalBarScene = new app.message.FamilyAnimalBarSceneProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.familyAnimalBarScene);
					break;
				case 35:
					if (ba_zhen_tu_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.baZhenTuDungeon cannot be set twice.');
					}
					++ba_zhen_tu_dungeon$count;
					this.baZhenTuDungeon = new app.message.BaZhenTuDungeonProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.baZhenTuDungeon);
					break;
				case 36:
					if (tao_ni_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.taoNiDungeon cannot be set twice.');
					}
					++tao_ni_dungeon$count;
					this.taoNiDungeon = new app.message.TaoNiDungeonProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.taoNiDungeon);
					break;
				case 37:
					if (maze_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.mazeDungeon cannot be set twice.');
					}
					++maze_dungeon$count;
					this.mazeDungeon = new app.message.MazeDungeonProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mazeDungeon);
					break;
				case 38:
					if (story_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneProto.storyDungeon cannot be set twice.');
					}
					++story_dungeon$count;
					this.storyDungeon = new app.message.StoryDungeonProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.storyDungeon);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
