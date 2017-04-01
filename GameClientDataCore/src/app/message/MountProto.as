package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpriteStatProto;
	import app.message.MountSpellsProto;
	import app.message.Sex;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MountProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const UNIDENTIFIED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.MountProto.unidentified", "unidentified", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var unidentified$field:Boolean;

		public function clearUnidentified():void {
			hasField$0 &= 0xfffffffd;
			unidentified$field = new Boolean();
		}

		public function get hasUnidentified():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set unidentified(value:Boolean):void {
			hasField$0 |= 0x2;
			unidentified$field = value;
		}

		public function get unidentified():Boolean {
			return unidentified$field;
		}

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.MountProto.sex", "sex", (6 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Sex);

		private var sex$field:int;

		public function clearSex():void {
			hasField$0 &= 0xfffffffb;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x4;
			sex$field = value;
		}

		public function get sex():int {
			return sex$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountProto.level", "level", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffff7;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x8;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.MountProto.exp", "exp", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:Int64;

		public function clearExp():void {
			exp$field = null;
		}

		public function get hasExp():Boolean {
			return exp$field != null;
		}

		public function set exp(value:Int64):void {
			exp$field = value;
		}

		public function get exp():Int64 {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const HUNGER_DEGREE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountProto.hunger_degree", "hungerDegree", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hunger_degree$field:int;

		public function clearHungerDegree():void {
			hasField$0 &= 0xffffffef;
			hunger_degree$field = new int();
		}

		public function get hasHungerDegree():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set hungerDegree(value:int):void {
			hasField$0 |= 0x10;
			hunger_degree$field = value;
		}

		public function get hungerDegree():int {
			return hunger_degree$field;
		}

		/**
		 *  @private
		 */
		public static const VITALITY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountProto.vitality", "vitality", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vitality$field:int;

		public function clearVitality():void {
			hasField$0 &= 0xffffffdf;
			vitality$field = new int();
		}

		public function get hasVitality():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set vitality(value:int):void {
			hasField$0 |= 0x20;
			vitality$field = value;
		}

		public function get vitality():int {
			return vitality$field;
		}

		/**
		 *  @private
		 */
		public static const VITALITY_EXP:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.MountProto.vitality_exp", "vitalityExp", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vitality_exp$field:Int64;

		public function clearVitalityExp():void {
			vitality_exp$field = null;
		}

		public function get hasVitalityExp():Boolean {
			return vitality_exp$field != null;
		}

		public function set vitalityExp(value:Int64):void {
			vitality_exp$field = value;
		}

		public function get vitalityExp():Int64 {
			return vitality_exp$field;
		}

		/**
		 *  @private
		 */
		public static const IS_BREED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.MountProto.is_breed", "isBreed", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_breed$field:Boolean;

		public function clearIsBreed():void {
			hasField$0 &= 0xffffffbf;
			is_breed$field = new Boolean();
		}

		public function get hasIsBreed():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set isBreed(value:Boolean):void {
			hasField$0 |= 0x40;
			is_breed$field = value;
		}

		public function get isBreed():Boolean {
			return is_breed$field;
		}

		/**
		 *  @private
		 */
		public static const LIFE_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountProto.life_time", "lifeTime", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var life_time$field:int;

		public function clearLifeTime():void {
			hasField$0 &= 0xffffff7f;
			life_time$field = new int();
		}

		public function get hasLifeTime():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set lifeTime(value:int):void {
			hasField$0 |= 0x80;
			life_time$field = value;
		}

		public function get lifeTime():int {
			return life_time$field;
		}

		/**
		 *  @private
		 */
		public static const BORN_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountProto.born_stat", "bornStat", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var born_stat$field:app.message.SpriteStatProto;

		public function clearBornStat():void {
			born_stat$field = null;
		}

		public function get hasBornStat():Boolean {
			return born_stat$field != null;
		}

		public function set bornStat(value:app.message.SpriteStatProto):void {
			born_stat$field = value;
		}

		public function get bornStat():app.message.SpriteStatProto {
			return born_stat$field;
		}

		/**
		 *  @private
		 */
		public static const GROWTH_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountProto.growth_stat", "growthStat", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var growth_stat$field:app.message.SpriteStatProto;

		public function clearGrowthStat():void {
			growth_stat$field = null;
		}

		public function get hasGrowthStat():Boolean {
			return growth_stat$field != null;
		}

		public function set growthStat(value:app.message.SpriteStatProto):void {
			growth_stat$field = value;
		}

		public function get growthStat():app.message.SpriteStatProto {
			return growth_stat$field;
		}

		/**
		 *  @private
		 */
		public static const GROWTH_TRANS_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountProto.growth_trans_stat", "growthTransStat", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var growth_trans_stat$field:app.message.SpriteStatProto;

		public function clearGrowthTransStat():void {
			growth_trans_stat$field = null;
		}

		public function get hasGrowthTransStat():Boolean {
			return growth_trans_stat$field != null;
		}

		public function set growthTransStat(value:app.message.SpriteStatProto):void {
			growth_trans_stat$field = value;
		}

		public function get growthTransStat():app.message.SpriteStatProto {
			return growth_trans_stat$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_SPELLS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountProto.mount_spells", "mountSpells", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountSpellsProto; });

		private var mount_spells$field:app.message.MountSpellsProto;

		public function clearMountSpells():void {
			mount_spells$field = null;
		}

		public function get hasMountSpells():Boolean {
			return mount_spells$field != null;
		}

		public function set mountSpells(value:app.message.MountSpellsProto):void {
			mount_spells$field = value;
		}

		public function get mountSpells():app.message.MountSpellsProto {
			return mount_spells$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasUnidentified) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, unidentified$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, sex$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, exp$field);
			}
			if (hasHungerDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hunger_degree$field);
			}
			if (hasVitality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vitality$field);
			}
			if (hasVitalityExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, vitality_exp$field);
			}
			if (hasIsBreed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_breed$field);
			}
			if (hasLifeTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, life_time$field);
			}
			if (hasBornStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, born_stat$field);
			}
			if (hasGrowthStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, growth_stat$field);
			}
			if (hasGrowthTransStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, growth_trans_stat$field);
			}
			if (hasMountSpells) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_spells$field);
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
			var unidentified$count:uint = 0;
			var sex$count:uint = 0;
			var level$count:uint = 0;
			var exp$count:uint = 0;
			var hunger_degree$count:uint = 0;
			var vitality$count:uint = 0;
			var vitality_exp$count:uint = 0;
			var is_breed$count:uint = 0;
			var life_time$count:uint = 0;
			var born_stat$count:uint = 0;
			var growth_stat$count:uint = 0;
			var growth_trans_stat$count:uint = 0;
			var mount_spells$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (unidentified$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.unidentified cannot be set twice.');
					}
					++unidentified$count;
					this.unidentified = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 6:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 7:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 16:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 8:
					if (hunger_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.hungerDegree cannot be set twice.');
					}
					++hunger_degree$count;
					this.hungerDegree = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (vitality$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.vitality cannot be set twice.');
					}
					++vitality$count;
					this.vitality = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 17:
					if (vitality_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.vitalityExp cannot be set twice.');
					}
					++vitality_exp$count;
					this.vitalityExp = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 10:
					if (is_breed$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.isBreed cannot be set twice.');
					}
					++is_breed$count;
					this.isBreed = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 11:
					if (life_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.lifeTime cannot be set twice.');
					}
					++life_time$count;
					this.lifeTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (born_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.bornStat cannot be set twice.');
					}
					++born_stat$count;
					this.bornStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.bornStat);
					break;
				case 13:
					if (growth_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.growthStat cannot be set twice.');
					}
					++growth_stat$count;
					this.growthStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.growthStat);
					break;
				case 14:
					if (growth_trans_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.growthTransStat cannot be set twice.');
					}
					++growth_trans_stat$count;
					this.growthTransStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.growthTransStat);
					break;
				case 15:
					if (mount_spells$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountProto.mountSpells cannot be set twice.');
					}
					++mount_spells$count;
					this.mountSpells = new app.message.MountSpellsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountSpells);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
