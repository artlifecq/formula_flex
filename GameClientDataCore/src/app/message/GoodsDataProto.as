package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentDataProto;
	import app.message.MountExpGoodsDataProto;
	import app.message.NormalGoodsDataProto;
	import app.message.FlowersGoodDataProto;
	import app.message.DuanGuDanGoodsDataProto;
	import app.message.GoodsType;
	import app.message.Quality;
	import app.message.UsableGoodsDataProto;
	import app.message.FeedGoodsDataProto;
	import app.message.MaterialDataProto;
	import app.message.MountSpellBookGoodsDataProto;
	import app.message.SpellBookGoodsDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.GoodsDataProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.GoodsDataProto.desc", "desc", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.GoodsDataProto.goods_type", "goodsType", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.GoodsType);

		private var goods_type$field:int;

		public function clearGoodsType():void {
			hasField$0 &= 0xfffffffd;
			goods_type$field = new int();
		}

		public function get hasGoodsType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set goodsType(value:int):void {
			hasField$0 |= 0x2;
			goods_type$field = value;
		}

		public function get goodsType():int {
			return goods_type$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsDataProto.max_count", "maxCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_count$field:int;

		public function clearMaxCount():void {
			hasField$0 &= 0xfffffffb;
			max_count$field = new int();
		}

		public function get hasMaxCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set maxCount(value:int):void {
			hasField$0 |= 0x4;
			max_count$field = value;
		}

		public function get maxCount():int {
			return max_count$field;
		}

		/**
		 *  @private
		 */
		public static const SELL_PRICE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsDataProto.sell_price", "sellPrice", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sell_price$field:int;

		public function clearSellPrice():void {
			hasField$0 &= 0xfffffff7;
			sell_price$field = new int();
		}

		public function get hasSellPrice():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set sellPrice(value:int):void {
			hasField$0 |= 0x8;
			sell_price$field = value;
		}

		public function get sellPrice():int {
			return sell_price$field;
		}

		/**
		 *  @private
		 */
		public static const SELL_MONEY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.GoodsDataProto.sell_money", "sellMoney", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sell_money$field:Boolean;

		public function clearSellMoney():void {
			hasField$0 &= 0xffffffef;
			sell_money$field = new Boolean();
		}

		public function get hasSellMoney():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set sellMoney(value:Boolean):void {
			hasField$0 |= 0x10;
			sell_money$field = value;
		}

		public function get sellMoney():Boolean {
			return sell_money$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.GoodsDataProto.quality", "quality", (7 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		public function clearQuality():void {
			hasField$0 &= 0xffffffdf;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x20;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const REQUIRE_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsDataProto.require_level", "requireLevel", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var require_level$field:int;

		public function clearRequireLevel():void {
			hasField$0 &= 0xffffffbf;
			require_level$field = new int();
		}

		public function get hasRequireLevel():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set requireLevel(value:int):void {
			hasField$0 |= 0x40;
			require_level$field = value;
		}

		public function get requireLevel():int {
			return require_level$field;
		}

		/**
		 *  @private
		 */
		public static const ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.GoodsDataProto.icon", "icon", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var icon$field:String;

		public function clearIcon():void {
			icon$field = null;
		}

		public function get hasIcon():Boolean {
			return icon$field != null;
		}

		public function set icon(value:String):void {
			icon$field = value;
		}

		public function get icon():String {
			return icon$field;
		}

		/**
		 *  @private
		 */
		public static const DROPABLE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.GoodsDataProto.dropable", "dropable", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dropable$field:Boolean;

		public function clearDropable():void {
			hasField$0 &= 0xffffff7f;
			dropable$field = new Boolean();
		}

		public function get hasDropable():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set dropable(value:Boolean):void {
			hasField$0 |= 0x80;
			dropable$field = value;
		}

		public function get dropable():Boolean {
			return dropable$field;
		}

		/**
		 *  @private
		 */
		public static const VERIFY_SELL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.GoodsDataProto.verify_sell", "verifySell", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var verify_sell$field:Boolean;

		public function clearVerifySell():void {
			hasField$0 &= 0xfffffeff;
			verify_sell$field = new Boolean();
		}

		public function get hasVerifySell():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set verifySell(value:Boolean):void {
			hasField$0 |= 0x100;
			verify_sell$field = value;
		}

		public function get verifySell():Boolean {
			return verify_sell$field;
		}

		/**
		 *  @private
		 */
		public static const VERIFY_DROP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.GoodsDataProto.verify_drop", "verifyDrop", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var verify_drop$field:Boolean;

		public function clearVerifyDrop():void {
			hasField$0 &= 0xfffffdff;
			verify_drop$field = new Boolean();
		}

		public function get hasVerifyDrop():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set verifyDrop(value:Boolean):void {
			hasField$0 |= 0x200;
			verify_drop$field = value;
		}

		public function get verifyDrop():Boolean {
			return verify_drop$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_NOT_OUT_DEPOT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.GoodsDataProto.can_not_out_depot", "canNotOutDepot", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_not_out_depot$field:Boolean;

		public function clearCanNotOutDepot():void {
			hasField$0 &= 0xfffffbff;
			can_not_out_depot$field = new Boolean();
		}

		public function get hasCanNotOutDepot():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set canNotOutDepot(value:Boolean):void {
			hasField$0 |= 0x400;
			can_not_out_depot$field = value;
		}

		public function get canNotOutDepot():Boolean {
			return can_not_out_depot$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.normal", "normal", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NormalGoodsDataProto; });

		private var normal$field:app.message.NormalGoodsDataProto;

		public function clearNormal():void {
			normal$field = null;
		}

		public function get hasNormal():Boolean {
			return normal$field != null;
		}

		public function set normal(value:app.message.NormalGoodsDataProto):void {
			normal$field = value;
		}

		public function get normal():app.message.NormalGoodsDataProto {
			return normal$field;
		}

		/**
		 *  @private
		 */
		public static const USABLE_GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.usable_goods", "usableGoods", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UsableGoodsDataProto; });

		private var usable_goods$field:app.message.UsableGoodsDataProto;

		public function clearUsableGoods():void {
			usable_goods$field = null;
		}

		public function get hasUsableGoods():Boolean {
			return usable_goods$field != null;
		}

		public function set usableGoods(value:app.message.UsableGoodsDataProto):void {
			usable_goods$field = value;
		}

		public function get usableGoods():app.message.UsableGoodsDataProto {
			return usable_goods$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPMENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.equipment", "equipment", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentDataProto; });

		private var equipment$field:app.message.EquipmentDataProto;

		public function clearEquipment():void {
			equipment$field = null;
		}

		public function get hasEquipment():Boolean {
			return equipment$field != null;
		}

		public function set equipment(value:app.message.EquipmentDataProto):void {
			equipment$field = value;
		}

		public function get equipment():app.message.EquipmentDataProto {
			return equipment$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_BOOKS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.spell_books", "spellBooks", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellBookGoodsDataProto; });

		private var spell_books$field:app.message.SpellBookGoodsDataProto;

		public function clearSpellBooks():void {
			spell_books$field = null;
		}

		public function get hasSpellBooks():Boolean {
			return spell_books$field != null;
		}

		public function set spellBooks(value:app.message.SpellBookGoodsDataProto):void {
			spell_books$field = value;
		}

		public function get spellBooks():app.message.SpellBookGoodsDataProto {
			return spell_books$field;
		}

		/**
		 *  @private
		 */
		public static const MATERIALS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.materials", "materials", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MaterialDataProto; });

		private var materials$field:app.message.MaterialDataProto;

		public function clearMaterials():void {
			materials$field = null;
		}

		public function get hasMaterials():Boolean {
			return materials$field != null;
		}

		public function set materials(value:app.message.MaterialDataProto):void {
			materials$field = value;
		}

		public function get materials():app.message.MaterialDataProto {
			return materials$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_EXP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.mount_exp", "mountExp", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountExpGoodsDataProto; });

		private var mount_exp$field:app.message.MountExpGoodsDataProto;

		public function clearMountExp():void {
			mount_exp$field = null;
		}

		public function get hasMountExp():Boolean {
			return mount_exp$field != null;
		}

		public function set mountExp(value:app.message.MountExpGoodsDataProto):void {
			mount_exp$field = value;
		}

		public function get mountExp():app.message.MountExpGoodsDataProto {
			return mount_exp$field;
		}

		/**
		 *  @private
		 */
		public static const FEED_GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.feed_goods", "feedGoods", (27 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FeedGoodsDataProto; });

		private var feed_goods$field:app.message.FeedGoodsDataProto;

		public function clearFeedGoods():void {
			feed_goods$field = null;
		}

		public function get hasFeedGoods():Boolean {
			return feed_goods$field != null;
		}

		public function set feedGoods(value:app.message.FeedGoodsDataProto):void {
			feed_goods$field = value;
		}

		public function get feedGoods():app.message.FeedGoodsDataProto {
			return feed_goods$field;
		}

		/**
		 *  @private
		 */
		public static const DUAN_GU_DAN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.duan_gu_dan", "duanGuDan", (28 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.DuanGuDanGoodsDataProto; });

		private var duan_gu_dan$field:app.message.DuanGuDanGoodsDataProto;

		public function clearDuanGuDan():void {
			duan_gu_dan$field = null;
		}

		public function get hasDuanGuDan():Boolean {
			return duan_gu_dan$field != null;
		}

		public function set duanGuDan(value:app.message.DuanGuDanGoodsDataProto):void {
			duan_gu_dan$field = value;
		}

		public function get duanGuDan():app.message.DuanGuDanGoodsDataProto {
			return duan_gu_dan$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_SPELL_BOOKS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.mount_spell_books", "mountSpellBooks", (29 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountSpellBookGoodsDataProto; });

		private var mount_spell_books$field:app.message.MountSpellBookGoodsDataProto;

		public function clearMountSpellBooks():void {
			mount_spell_books$field = null;
		}

		public function get hasMountSpellBooks():Boolean {
			return mount_spell_books$field != null;
		}

		public function set mountSpellBooks(value:app.message.MountSpellBookGoodsDataProto):void {
			mount_spell_books$field = value;
		}

		public function get mountSpellBooks():app.message.MountSpellBookGoodsDataProto {
			return mount_spell_books$field;
		}

		/**
		 *  @private
		 */
		public static const FLOWERS_GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GoodsDataProto.flowers_goods", "flowersGoods", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FlowersGoodDataProto; });

		private var flowers_goods$field:app.message.FlowersGoodDataProto;

		public function clearFlowersGoods():void {
			flowers_goods$field = null;
		}

		public function get hasFlowersGoods():Boolean {
			return flowers_goods$field != null;
		}

		public function set flowersGoods(value:app.message.FlowersGoodDataProto):void {
			flowers_goods$field = value;
		}

		public function get flowersGoods():app.message.FlowersGoodDataProto {
			return flowers_goods$field;
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
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, desc$field);
			}
			if (hasGoodsType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, goods_type$field);
			}
			if (hasMaxCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_count$field);
			}
			if (hasSellPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, sell_price$field);
			}
			if (hasSellMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, sell_money$field);
			}
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, quality$field);
			}
			if (hasRequireLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, require_level$field);
			}
			if (hasIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, icon$field);
			}
			if (hasDropable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, dropable$field);
			}
			if (hasVerifySell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, verify_sell$field);
			}
			if (hasVerifyDrop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, verify_drop$field);
			}
			if (hasCanNotOutDepot) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_not_out_depot$field);
			}
			if (hasNormal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, normal$field);
			}
			if (hasUsableGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, usable_goods$field);
			}
			if (hasEquipment) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, equipment$field);
			}
			if (hasSpellBooks) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, spell_books$field);
			}
			if (hasMaterials) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, materials$field);
			}
			if (hasMountExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mount_exp$field);
			}
			if (hasFeedGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, feed_goods$field);
			}
			if (hasDuanGuDan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, duan_gu_dan$field);
			}
			if (hasMountSpellBooks) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 29);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mount_spell_books$field);
			}
			if (hasFlowersGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, flowers_goods$field);
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
			var desc$count:uint = 0;
			var goods_type$count:uint = 0;
			var max_count$count:uint = 0;
			var sell_price$count:uint = 0;
			var sell_money$count:uint = 0;
			var quality$count:uint = 0;
			var require_level$count:uint = 0;
			var icon$count:uint = 0;
			var dropable$count:uint = 0;
			var verify_sell$count:uint = 0;
			var verify_drop$count:uint = 0;
			var can_not_out_depot$count:uint = 0;
			var normal$count:uint = 0;
			var usable_goods$count:uint = 0;
			var equipment$count:uint = 0;
			var spell_books$count:uint = 0;
			var materials$count:uint = 0;
			var mount_exp$count:uint = 0;
			var feed_goods$count:uint = 0;
			var duan_gu_dan$count:uint = 0;
			var mount_spell_books$count:uint = 0;
			var flowers_goods$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (goods_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.goodsType cannot be set twice.');
					}
					++goods_type$count;
					this.goodsType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 5:
					if (max_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.maxCount cannot be set twice.');
					}
					++max_count$count;
					this.maxCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (sell_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.sellPrice cannot be set twice.');
					}
					++sell_price$count;
					this.sellPrice = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (sell_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.sellMoney cannot be set twice.');
					}
					++sell_money$count;
					this.sellMoney = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 8:
					if (require_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.requireLevel cannot be set twice.');
					}
					++require_level$count;
					this.requireLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.icon cannot be set twice.');
					}
					++icon$count;
					this.icon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (dropable$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.dropable cannot be set twice.');
					}
					++dropable$count;
					this.dropable = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 11:
					if (verify_sell$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.verifySell cannot be set twice.');
					}
					++verify_sell$count;
					this.verifySell = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 12:
					if (verify_drop$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.verifyDrop cannot be set twice.');
					}
					++verify_drop$count;
					this.verifyDrop = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 13:
					if (can_not_out_depot$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.canNotOutDepot cannot be set twice.');
					}
					++can_not_out_depot$count;
					this.canNotOutDepot = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 20:
					if (normal$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.normal cannot be set twice.');
					}
					++normal$count;
					this.normal = new app.message.NormalGoodsDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.normal);
					break;
				case 21:
					if (usable_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.usableGoods cannot be set twice.');
					}
					++usable_goods$count;
					this.usableGoods = new app.message.UsableGoodsDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.usableGoods);
					break;
				case 22:
					if (equipment$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.equipment cannot be set twice.');
					}
					++equipment$count;
					this.equipment = new app.message.EquipmentDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.equipment);
					break;
				case 24:
					if (spell_books$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.spellBooks cannot be set twice.');
					}
					++spell_books$count;
					this.spellBooks = new app.message.SpellBookGoodsDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.spellBooks);
					break;
				case 25:
					if (materials$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.materials cannot be set twice.');
					}
					++materials$count;
					this.materials = new app.message.MaterialDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.materials);
					break;
				case 26:
					if (mount_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.mountExp cannot be set twice.');
					}
					++mount_exp$count;
					this.mountExp = new app.message.MountExpGoodsDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mountExp);
					break;
				case 27:
					if (feed_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.feedGoods cannot be set twice.');
					}
					++feed_goods$count;
					this.feedGoods = new app.message.FeedGoodsDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.feedGoods);
					break;
				case 28:
					if (duan_gu_dan$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.duanGuDan cannot be set twice.');
					}
					++duan_gu_dan$count;
					this.duanGuDan = new app.message.DuanGuDanGoodsDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.duanGuDan);
					break;
				case 29:
					if (mount_spell_books$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.mountSpellBooks cannot be set twice.');
					}
					++mount_spell_books$count;
					this.mountSpellBooks = new app.message.MountSpellBookGoodsDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mountSpellBooks);
					break;
				case 30:
					if (flowers_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsDataProto.flowersGoods cannot be set twice.');
					}
					++flowers_goods$count;
					this.flowersGoods = new app.message.FlowersGoodDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.flowersGoods);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
