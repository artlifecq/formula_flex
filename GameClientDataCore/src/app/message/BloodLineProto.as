package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	import app.message.SpriteStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BloodLineProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodLineProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodLineProto.level", "level", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.BloodLineProto.name", "name", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const STAR:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodLineProto.star", "star", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var star$field:int;

		public function clearStar():void {
			hasField$0 &= 0xfffffffb;
			star$field = new int();
		}

		public function get hasStar():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set star(value:int):void {
			hasField$0 |= 0x4;
			star$field = value;
		}

		public function get star():int {
			return star$field;
		}

		/**
		 *  @private
		 */
		public static const STRENGTH_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.BloodLineProto.strength_cost", "strengthCost", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var strength_cost$field:app.message.UpgradeProto;

		public function clearStrengthCost():void {
			strength_cost$field = null;
		}

		public function get hasStrengthCost():Boolean {
			return strength_cost$field != null;
		}

		public function set strengthCost(value:app.message.UpgradeProto):void {
			strength_cost$field = value;
		}

		public function get strengthCost():app.message.UpgradeProto {
			return strength_cost$field;
		}

		/**
		 *  @private
		 */
		public static const NEED_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodLineProto.need_level", "needLevel", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var need_level$field:int;

		public function clearNeedLevel():void {
			hasField$0 &= 0xfffffff7;
			need_level$field = new int();
		}

		public function get hasNeedLevel():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set needLevel(value:int):void {
			hasField$0 |= 0x8;
			need_level$field = value;
		}

		public function get needLevel():int {
			return need_level$field;
		}

		/**
		 *  @private
		 */
		public static const SPRITE_PROTO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.BloodLineProto.sprite_proto", "spriteProto", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var sprite_proto$field:app.message.SpriteStatProto;

		public function clearSpriteProto():void {
			sprite_proto$field = null;
		}

		public function get hasSpriteProto():Boolean {
			return sprite_proto$field != null;
		}

		public function set spriteProto(value:app.message.SpriteStatProto):void {
			sprite_proto$field = value;
		}

		public function get spriteProto():app.message.SpriteStatProto {
			return sprite_proto$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_NUM:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodLineProto.skill_num", "skillNum", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_num$field:int;

		public function clearSkillNum():void {
			hasField$0 &= 0xffffffef;
			skill_num$field = new int();
		}

		public function get hasSkillNum():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set skillNum(value:int):void {
			hasField$0 |= 0x10;
			skill_num$field = value;
		}

		public function get skillNum():int {
			return skill_num$field;
		}

		/**
		 *  @private
		 */
		public static const WASH_GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.BloodLineProto.wash_goods", "washGoods", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var wash_goods$field:app.message.UpgradeProto;

		public function clearWashGoods():void {
			wash_goods$field = null;
		}

		public function get hasWashGoods():Boolean {
			return wash_goods$field != null;
		}

		public function set washGoods(value:app.message.UpgradeProto):void {
			wash_goods$field = value;
		}

		public function get washGoods():app.message.UpgradeProto {
			return wash_goods$field;
		}

		/**
		 *  @private
		 */
		public static const PROGRESS_RATE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodLineProto.progress_rate", "progressRate", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var progress_rate$field:int;

		public function clearProgressRate():void {
			hasField$0 &= 0xffffffdf;
			progress_rate$field = new int();
		}

		public function get hasProgressRate():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set progressRate(value:int):void {
			hasField$0 |= 0x20;
			progress_rate$field = value;
		}

		public function get progressRate():int {
			return progress_rate$field;
		}

		/**
		 *  @private
		 */
		public static const RESOURCES_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodLineProto.resources_id", "resourcesId", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var resources_id$field:int;

		public function clearResourcesId():void {
			hasField$0 &= 0xffffffbf;
			resources_id$field = new int();
		}

		public function get hasResourcesId():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set resourcesId(value:int):void {
			hasField$0 |= 0x40;
			resources_id$field = value;
		}

		public function get resourcesId():int {
			return resources_id$field;
		}

		/**
		 *  @private
		 */
		public static const NOTIFY_HAS_NEW_SPELL_OR_STAT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.BloodLineProto.notify_has_new_spell_or_stat", "notifyHasNewSpellOrStat", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var notify_has_new_spell_or_stat$field:Boolean;

		public function clearNotifyHasNewSpellOrStat():void {
			hasField$0 &= 0xffffff7f;
			notify_has_new_spell_or_stat$field = new Boolean();
		}

		public function get hasNotifyHasNewSpellOrStat():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set notifyHasNewSpellOrStat(value:Boolean):void {
			hasField$0 |= 0x80;
			notify_has_new_spell_or_stat$field = value;
		}

		public function get notifyHasNewSpellOrStat():Boolean {
			return notify_has_new_spell_or_stat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasStar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, star$field);
			}
			if (hasStrengthCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, strength_cost$field);
			}
			if (hasNeedLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, need_level$field);
			}
			if (hasSpriteProto) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, sprite_proto$field);
			}
			if (hasSkillNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, skill_num$field);
			}
			if (hasWashGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, wash_goods$field);
			}
			if (hasProgressRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, progress_rate$field);
			}
			if (hasResourcesId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, resources_id$field);
			}
			if (hasNotifyHasNewSpellOrStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, notify_has_new_spell_or_stat$field);
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
			var level$count:uint = 0;
			var name$count:uint = 0;
			var star$count:uint = 0;
			var strength_cost$count:uint = 0;
			var need_level$count:uint = 0;
			var sprite_proto$count:uint = 0;
			var skill_num$count:uint = 0;
			var wash_goods$count:uint = 0;
			var progress_rate$count:uint = 0;
			var resources_id$count:uint = 0;
			var notify_has_new_spell_or_stat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (star$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.star cannot be set twice.');
					}
					++star$count;
					this.star = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (strength_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.strengthCost cannot be set twice.');
					}
					++strength_cost$count;
					this.strengthCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.strengthCost);
					break;
				case 6:
					if (need_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.needLevel cannot be set twice.');
					}
					++need_level$count;
					this.needLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (sprite_proto$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.spriteProto cannot be set twice.');
					}
					++sprite_proto$count;
					this.spriteProto = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.spriteProto);
					break;
				case 8:
					if (skill_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.skillNum cannot be set twice.');
					}
					++skill_num$count;
					this.skillNum = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (wash_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.washGoods cannot be set twice.');
					}
					++wash_goods$count;
					this.washGoods = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.washGoods);
					break;
				case 10:
					if (progress_rate$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.progressRate cannot be set twice.');
					}
					++progress_rate$count;
					this.progressRate = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (resources_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.resourcesId cannot be set twice.');
					}
					++resources_id$count;
					this.resourcesId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 13:
					if (notify_has_new_spell_or_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodLineProto.notifyHasNewSpellOrStat cannot be set twice.');
					}
					++notify_has_new_spell_or_stat$count;
					this.notifyHasNewSpellOrStat = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
