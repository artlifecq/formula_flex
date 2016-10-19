package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NpcProto;
	import app.message.SpriteStatProto;
	import flash.utils.ByteArray;
	import app.message.MonsterDataProto.MonsterType;
	import app.message.LiangCangProto;
	import app.message.GoodsWrapperProto;
	import app.message.MonsterRankProto;
	import app.message.NormalMonsterProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MonsterDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const BODY_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.body_res", "bodyRes", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var body_res$field:String;

		public function clearBodyRes():void {
			body_res$field = null;
		}

		public function get hasBodyRes():Boolean {
			return body_res$field != null;
		}

		public function set bodyRes(value:String):void {
			body_res$field = value;
		}

		public function get bodyRes():String {
			return body_res$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.mount_res", "mountRes", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var mount_res$field:String;

		public function clearMountRes():void {
			mount_res$field = null;
		}

		public function get hasMountRes():Boolean {
			return mount_res$field != null;
		}

		public function set mountRes(value:String):void {
			mount_res$field = value;
		}

		public function get mountRes():String {
			return mount_res$field;
		}

		/**
		 *  @private
		 */
		public static const HEAD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.head", "head", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var head$field:String;

		public function clearHead():void {
			head$field = null;
		}

		public function get hasHead():Boolean {
			return head$field != null;
		}

		public function set head(value:String):void {
			head$field = value;
		}

		public function get head():String {
			return head$field;
		}

		/**
		 *  @private
		 */
		public static const STAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MonsterDataProto.stat", "stat", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var stat$field:app.message.SpriteStatProto;

		public function clearStat():void {
			stat$field = null;
		}

		public function get hasStat():Boolean {
			return stat$field != null;
		}

		public function set stat(value:app.message.SpriteStatProto):void {
			stat$field = value;
		}

		public function get stat():app.message.SpriteStatProto {
			return stat$field;
		}

		/**
		 *  @private
		 */
		public static const MONSTER_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.MonsterDataProto.monster_type", "monsterType", (8 << 3) | com.netease.protobuf.WireType.VARINT, app.message.MonsterDataProto.MonsterType);

		private var monster_type$field:int;

		public function clearMonsterType():void {
			hasField$0 &= 0xfffffffb;
			monster_type$field = new int();
		}

		public function get hasMonsterType():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set monsterType(value:int):void {
			hasField$0 |= 0x4;
			monster_type$field = value;
		}

		public function get monsterType():int {
			return monster_type$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.scene_id", "sceneId", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_id$field:int;

		public function clearSceneId():void {
			hasField$0 &= 0xfffffff7;
			scene_id$field = new int();
		}

		public function get hasSceneId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set sceneId(value:int):void {
			hasField$0 |= 0x8;
			scene_id$field = value;
		}

		public function get sceneId():int {
			return scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const POS:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("app.message.MonsterDataProto.pos", "pos", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var pos:Array = [];

		/**
		 *  @private
		 */
		public static const IS_PHYSICAL_IMMUNE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.MonsterDataProto.is_physical_immune", "isPhysicalImmune", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_physical_immune$field:Boolean;

		public function clearIsPhysicalImmune():void {
			hasField$0 &= 0xffffffef;
			is_physical_immune$field = new Boolean();
		}

		public function get hasIsPhysicalImmune():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isPhysicalImmune(value:Boolean):void {
			hasField$0 |= 0x10;
			is_physical_immune$field = value;
		}

		public function get isPhysicalImmune():Boolean {
			return is_physical_immune$field;
		}

		/**
		 *  @private
		 */
		public static const IS_MAGICAL_IMMUNE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.MonsterDataProto.is_magical_immune", "isMagicalImmune", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_magical_immune$field:Boolean;

		public function clearIsMagicalImmune():void {
			hasField$0 &= 0xffffffdf;
			is_magical_immune$field = new Boolean();
		}

		public function get hasIsMagicalImmune():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isMagicalImmune(value:Boolean):void {
			hasField$0 |= 0x20;
			is_magical_immune$field = value;
		}

		public function get isMagicalImmune():Boolean {
			return is_magical_immune$field;
		}

		/**
		 *  @private
		 */
		public static const BODY_RADIUS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.body_radius", "bodyRadius", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var body_radius$field:int;

		public function clearBodyRadius():void {
			hasField$0 &= 0xffffffbf;
			body_radius$field = new int();
		}

		public function get hasBodyRadius():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set bodyRadius(value:int):void {
			hasField$0 |= 0x40;
			body_radius$field = value;
		}

		public function get bodyRadius():int {
			return body_radius$field;
		}

		/**
		 *  @private
		 */
		public static const FIX_DIRECTION:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.MonsterDataProto.fix_direction", "fixDirection", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fix_direction$field:Boolean;

		public function clearFixDirection():void {
			hasField$0 &= 0xffffff7f;
			fix_direction$field = new Boolean();
		}

		public function get hasFixDirection():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set fixDirection(value:Boolean):void {
			hasField$0 |= 0x80;
			fix_direction$field = value;
		}

		public function get fixDirection():Boolean {
			return fix_direction$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MonsterDataProto.rank_info", "rankInfo", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MonsterRankProto; });

		private var rank_info$field:app.message.MonsterRankProto;

		public function clearRankInfo():void {
			rank_info$field = null;
		}

		public function get hasRankInfo():Boolean {
			return rank_info$field != null;
		}

		public function set rankInfo(value:app.message.MonsterRankProto):void {
			rank_info$field = value;
		}

		public function get rankInfo():app.message.MonsterRankProto {
			return rank_info$field;
		}

		/**
		 *  @private
		 */
		public static const CHAT_INTERVAL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.chat_interval", "chatInterval", (40 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chat_interval$field:int;

		public function clearChatInterval():void {
			hasField$0 &= 0xfffffeff;
			chat_interval$field = new int();
		}

		public function get hasChatInterval():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set chatInterval(value:int):void {
			hasField$0 |= 0x100;
			chat_interval$field = value;
		}

		public function get chatInterval():int {
			return chat_interval$field;
		}

		/**
		 *  @private
		 */
		public static const CHAT:RepeatedFieldDescriptor$TYPE_BYTES = new RepeatedFieldDescriptor$TYPE_BYTES("app.message.MonsterDataProto.chat", "chat", (41 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("flash.utils.ByteArray")]
		public var chat:Array = [];

		/**
		 *  @private
		 */
		public static const PLUNDER_TIPS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.plunder_tips", "plunderTips", (42 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var plunder_tips$field:String;

		public function clearPlunderTips():void {
			plunder_tips$field = null;
		}

		public function get hasPlunderTips():Boolean {
			return plunder_tips$field != null;
		}

		public function set plunderTips(value:String):void {
			plunder_tips$field = value;
		}

		public function get plunderTips():String {
			return plunder_tips$field;
		}

		/**
		 *  @private
		 */
		public static const PLUNDER_GOODS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.MonsterDataProto.plunder_goods", "plunderGoods", (43 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var plunderGoods:Array = [];

		/**
		 *  @private
		 */
		public static const LIFE_BAR_OFFSET:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.life_bar_offset", "lifeBarOffset", (44 << 3) | com.netease.protobuf.WireType.VARINT);

		private var life_bar_offset$field:int;

		public function clearLifeBarOffset():void {
			hasField$0 &= 0xfffffdff;
			life_bar_offset$field = new int();
		}

		public function get hasLifeBarOffset():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set lifeBarOffset(value:int):void {
			hasField$0 |= 0x200;
			life_bar_offset$field = value;
		}

		public function get lifeBarOffset():int {
			return life_bar_offset$field;
		}

		/**
		 *  @private
		 */
		public static const ANIMATION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.animation", "animation", (45 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var animation$field:String;

		public function clearAnimation():void {
			animation$field = null;
		}

		public function get hasAnimation():Boolean {
			return animation$field != null;
		}

		public function set animation(value:String):void {
			animation$field = value;
		}

		public function get animation():String {
			return animation$field;
		}

		/**
		 *  @private
		 */
		public static const IMMUNE_DEAD_BEAT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.MonsterDataProto.immune_dead_beat", "immuneDeadBeat", (46 << 3) | com.netease.protobuf.WireType.VARINT);

		private var immune_dead_beat$field:Boolean;

		public function clearImmuneDeadBeat():void {
			hasField$0 &= 0xfffffbff;
			immune_dead_beat$field = new Boolean();
		}

		public function get hasImmuneDeadBeat():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set immuneDeadBeat(value:Boolean):void {
			hasField$0 |= 0x400;
			immune_dead_beat$field = value;
		}

		public function get immuneDeadBeat():Boolean {
			return immune_dead_beat$field;
		}

		/**
		 *  @private
		 */
		public static const DIRECTION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.direction", "direction", (47 << 3) | com.netease.protobuf.WireType.VARINT);

		private var direction$field:int;

		public function clearDirection():void {
			hasField$0 &= 0xfffff7ff;
			direction$field = new int();
		}

		public function get hasDirection():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set direction(value:int):void {
			hasField$0 |= 0x800;
			direction$field = value;
		}

		public function get direction():int {
			return direction$field;
		}

		/**
		 *  @private
		 */
		public static const SOUND:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.sound", "sound", (48 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const BEEN_HURT_ANIMATION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.been_hurt_animation", "beenHurtAnimation", (49 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var been_hurt_animation$field:String;

		public function clearBeenHurtAnimation():void {
			been_hurt_animation$field = null;
		}

		public function get hasBeenHurtAnimation():Boolean {
			return been_hurt_animation$field != null;
		}

		public function set beenHurtAnimation(value:String):void {
			been_hurt_animation$field = value;
		}

		public function get beenHurtAnimation():String {
			return been_hurt_animation$field;
		}

		/**
		 *  @private
		 */
		public static const SCALE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.scale", "scale", (50 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scale$field:int;

		public function clearScale():void {
			hasField$0 &= 0xffffefff;
			scale$field = new int();
		}

		public function get hasScale():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set scale(value:int):void {
			hasField$0 |= 0x1000;
			scale$field = value;
		}

		public function get scale():int {
			return scale$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_IN_SMALL_MAP_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MonsterDataProto.show_in_small_map_type", "showInSmallMapType", (51 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_in_small_map_type$field:int;

		public function clearShowInSmallMapType():void {
			hasField$0 &= 0xffffdfff;
			show_in_small_map_type$field = new int();
		}

		public function get hasShowInSmallMapType():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set showInSmallMapType(value:int):void {
			hasField$0 |= 0x2000;
			show_in_small_map_type$field = value;
		}

		public function get showInSmallMapType():int {
			return show_in_small_map_type$field;
		}

		/**
		 *  @private
		 */
		public static const SMALL_MAP_ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MonsterDataProto.small_map_icon", "smallMapIcon", (52 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var small_map_icon$field:String;

		public function clearSmallMapIcon():void {
			small_map_icon$field = null;
		}

		public function get hasSmallMapIcon():Boolean {
			return small_map_icon$field != null;
		}

		public function set smallMapIcon(value:String):void {
			small_map_icon$field = value;
		}

		public function get smallMapIcon():String {
			return small_map_icon$field;
		}

		/**
		 *  @private
		 */
		public static const NOMAL_MONSTER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MonsterDataProto.nomal_monster", "nomalMonster", (100 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NormalMonsterProto; });

		private var nomal_monster$field:app.message.NormalMonsterProto;

		public function clearNomalMonster():void {
			nomal_monster$field = null;
		}

		public function get hasNomalMonster():Boolean {
			return nomal_monster$field != null;
		}

		public function set nomalMonster(value:app.message.NormalMonsterProto):void {
			nomal_monster$field = value;
		}

		public function get nomalMonster():app.message.NormalMonsterProto {
			return nomal_monster$field;
		}

		/**
		 *  @private
		 */
		public static const NPC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MonsterDataProto.npc", "npc", (101 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcProto; });

		private var npc$field:app.message.NpcProto;

		public function clearNpc():void {
			npc$field = null;
		}

		public function get hasNpc():Boolean {
			return npc$field != null;
		}

		public function set npc(value:app.message.NpcProto):void {
			npc$field = value;
		}

		public function get npc():app.message.NpcProto {
			return npc$field;
		}

		/**
		 *  @private
		 */
		public static const LIANG_CANG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MonsterDataProto.liang_cang", "liangCang", (102 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.LiangCangProto; });

		private var liang_cang$field:app.message.LiangCangProto;

		public function clearLiangCang():void {
			liang_cang$field = null;
		}

		public function get hasLiangCang():Boolean {
			return liang_cang$field != null;
		}

		public function set liangCang(value:app.message.LiangCangProto):void {
			liang_cang$field = value;
		}

		public function get liangCang():app.message.LiangCangProto {
			return liang_cang$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasBodyRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, body_res$field);
			}
			if (hasMountRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, mount_res$field);
			}
			if (hasHead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, head$field);
			}
			if (hasStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, stat$field);
			}
			if (hasMonsterType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, monster_type$field);
			}
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_id$field);
			}
			for (var pos$index:uint = 0; pos$index < this.pos.length; ++pos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.pos[pos$index]);
			}
			if (hasIsPhysicalImmune) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_physical_immune$field);
			}
			if (hasIsMagicalImmune) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_magical_immune$field);
			}
			if (hasBodyRadius) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, body_radius$field);
			}
			if (hasFixDirection) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, fix_direction$field);
			}
			if (hasRankInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, rank_info$field);
			}
			if (hasChatInterval) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 40);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chat_interval$field);
			}
			for (var chat$index:uint = 0; chat$index < this.chat.length; ++chat$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 41);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, this.chat[chat$index]);
			}
			if (hasPlunderTips) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 42);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, plunder_tips$field);
			}
			for (var plunderGoods$index:uint = 0; plunderGoods$index < this.plunderGoods.length; ++plunderGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 43);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.plunderGoods[plunderGoods$index]);
			}
			if (hasLifeBarOffset) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 44);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, life_bar_offset$field);
			}
			if (hasAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 45);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, animation$field);
			}
			if (hasImmuneDeadBeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 46);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, immune_dead_beat$field);
			}
			if (hasDirection) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 47);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, direction$field);
			}
			if (hasSound) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 48);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, sound$field);
			}
			if (hasBeenHurtAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 49);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, been_hurt_animation$field);
			}
			if (hasScale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 50);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scale$field);
			}
			if (hasShowInSmallMapType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 51);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, show_in_small_map_type$field);
			}
			if (hasSmallMapIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 52);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, small_map_icon$field);
			}
			if (hasNomalMonster) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 100);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, nomal_monster$field);
			}
			if (hasNpc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 101);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, npc$field);
			}
			if (hasLiangCang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 102);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, liang_cang$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var level$count:uint = 0;
			var body_res$count:uint = 0;
			var mount_res$count:uint = 0;
			var head$count:uint = 0;
			var stat$count:uint = 0;
			var monster_type$count:uint = 0;
			var scene_id$count:uint = 0;
			var is_physical_immune$count:uint = 0;
			var is_magical_immune$count:uint = 0;
			var body_radius$count:uint = 0;
			var fix_direction$count:uint = 0;
			var rank_info$count:uint = 0;
			var chat_interval$count:uint = 0;
			var plunder_tips$count:uint = 0;
			var life_bar_offset$count:uint = 0;
			var animation$count:uint = 0;
			var immune_dead_beat$count:uint = 0;
			var direction$count:uint = 0;
			var sound$count:uint = 0;
			var been_hurt_animation$count:uint = 0;
			var scale$count:uint = 0;
			var show_in_small_map_type$count:uint = 0;
			var small_map_icon$count:uint = 0;
			var nomal_monster$count:uint = 0;
			var npc$count:uint = 0;
			var liang_cang$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (body_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.bodyRes cannot be set twice.');
					}
					++body_res$count;
					this.bodyRes = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (mount_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.mountRes cannot be set twice.');
					}
					++mount_res$count;
					this.mountRes = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (head$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.head cannot be set twice.');
					}
					++head$count;
					this.head = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.stat cannot be set twice.');
					}
					++stat$count;
					this.stat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.stat);
					break;
				case 8:
					if (monster_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.monsterType cannot be set twice.');
					}
					++monster_type$count;
					this.monsterType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 11:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT64, this.pos);
						break;
					}
					this.pos.push(com.netease.protobuf.ReadUtils.read$TYPE_INT64(input));
					break;
				case 16:
					if (is_physical_immune$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.isPhysicalImmune cannot be set twice.');
					}
					++is_physical_immune$count;
					this.isPhysicalImmune = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 17:
					if (is_magical_immune$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.isMagicalImmune cannot be set twice.');
					}
					++is_magical_immune$count;
					this.isMagicalImmune = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 18:
					if (body_radius$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.bodyRadius cannot be set twice.');
					}
					++body_radius$count;
					this.bodyRadius = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 19:
					if (fix_direction$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.fixDirection cannot be set twice.');
					}
					++fix_direction$count;
					this.fixDirection = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 30:
					if (rank_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.rankInfo cannot be set twice.');
					}
					++rank_info$count;
					this.rankInfo = new app.message.MonsterRankProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rankInfo);
					break;
				case 40:
					if (chat_interval$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.chatInterval cannot be set twice.');
					}
					++chat_interval$count;
					this.chatInterval = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 41:
					this.chat.push(com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input));
					break;
				case 42:
					if (plunder_tips$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.plunderTips cannot be set twice.');
					}
					++plunder_tips$count;
					this.plunderTips = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 43:
					this.plunderGoods.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				case 44:
					if (life_bar_offset$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.lifeBarOffset cannot be set twice.');
					}
					++life_bar_offset$count;
					this.lifeBarOffset = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 45:
					if (animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.animation cannot be set twice.');
					}
					++animation$count;
					this.animation = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 46:
					if (immune_dead_beat$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.immuneDeadBeat cannot be set twice.');
					}
					++immune_dead_beat$count;
					this.immuneDeadBeat = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 47:
					if (direction$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.direction cannot be set twice.');
					}
					++direction$count;
					this.direction = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 48:
					if (sound$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.sound cannot be set twice.');
					}
					++sound$count;
					this.sound = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 49:
					if (been_hurt_animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.beenHurtAnimation cannot be set twice.');
					}
					++been_hurt_animation$count;
					this.beenHurtAnimation = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 50:
					if (scale$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.scale cannot be set twice.');
					}
					++scale$count;
					this.scale = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 51:
					if (show_in_small_map_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.showInSmallMapType cannot be set twice.');
					}
					++show_in_small_map_type$count;
					this.showInSmallMapType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 52:
					if (small_map_icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.smallMapIcon cannot be set twice.');
					}
					++small_map_icon$count;
					this.smallMapIcon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 100:
					if (nomal_monster$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.nomalMonster cannot be set twice.');
					}
					++nomal_monster$count;
					this.nomalMonster = new app.message.NormalMonsterProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.nomalMonster);
					break;
				case 101:
					if (npc$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.npc cannot be set twice.');
					}
					++npc$count;
					this.npc = new app.message.NpcProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.npc);
					break;
				case 102:
					if (liang_cang$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterDataProto.liangCang cannot be set twice.');
					}
					++liang_cang$count;
					this.liangCang = new app.message.LiangCangProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.liangCang);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
