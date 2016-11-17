package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.RaceId;
	import app.message.EquipType;
	import app.message.SecondWeaponType;
	import app.message.Sex;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EQUIP_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentDataProto.equip_type", "equipType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.EquipType);

		private var equip_type$field:int;

		private var hasField$0:uint = 0;

		public function clearEquipType():void {
			hasField$0 &= 0xfffffffe;
			equip_type$field = new int();
		}

		public function get hasEquipType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set equipType(value:int):void {
			hasField$0 |= 0x1;
			equip_type$field = value;
		}

		public function get equipType():int {
			return equip_type$field;
		}

		/**
		 *  @private
		 */
		public static const SECOND_WEAPON_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentDataProto.second_weapon_type", "secondWeaponType", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.SecondWeaponType);

		private var second_weapon_type$field:int;

		public function clearSecondWeaponType():void {
			hasField$0 &= 0xfffffffd;
			second_weapon_type$field = new int();
		}

		public function get hasSecondWeaponType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set secondWeaponType(value:int):void {
			hasField$0 |= 0x2;
			second_weapon_type$field = value;
		}

		public function get secondWeaponType():int {
			return second_weapon_type$field;
		}

		/**
		 *  @private
		 */
		public static const RACE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentDataProto.race", "race", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.RaceId);

		private var race$field:int;

		public function clearRace():void {
			hasField$0 &= 0xfffffffb;
			race$field = new int();
		}

		public function get hasRace():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set race(value:int):void {
			hasField$0 |= 0x4;
			race$field = value;
		}

		public function get race():int {
			return race$field;
		}

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentDataProto.sex", "sex", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Sex);

		private var sex$field:int;

		public function clearSex():void {
			hasField$0 &= 0xfffffff7;
			sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x8;
			sex$field = value;
		}

		public function get sex():int {
			return sex$field;
		}

		/**
		 *  @private
		 */
		public static const IS_EQUIP_BIND:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.EquipmentDataProto.is_equip_bind", "isEquipBind", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_equip_bind$field:Boolean;

		public function clearIsEquipBind():void {
			hasField$0 &= 0xffffffef;
			is_equip_bind$field = new Boolean();
		}

		public function get hasIsEquipBind():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isEquipBind(value:Boolean):void {
			hasField$0 |= 0x10;
			is_equip_bind$field = value;
		}

		public function get isEquipBind():Boolean {
			return is_equip_bind$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL_STAGE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentDataProto.level_stage", "levelStage", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_stage$field:int;

		public function clearLevelStage():void {
			hasField$0 &= 0xffffffdf;
			level_stage$field = new int();
		}

		public function get hasLevelStage():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set levelStage(value:int):void {
			hasField$0 |= 0x20;
			level_stage$field = value;
		}

		public function get levelStage():int {
			return level_stage$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_MAIN_STAT_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentDataProto.refine_main_stat_id", "refineMainStatId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refine_main_stat_id$field:int;

		public function clearRefineMainStatId():void {
			hasField$0 &= 0xffffffbf;
			refine_main_stat_id$field = new int();
		}

		public function get hasRefineMainStatId():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set refineMainStatId(value:int):void {
			hasField$0 |= 0x40;
			refine_main_stat_id$field = value;
		}

		public function get refineMainStatId():int {
			return refine_main_stat_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEquipType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, equip_type$field);
			}
			if (hasSecondWeaponType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, second_weapon_type$field);
			}
			if (hasRace) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, race$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, sex$field);
			}
			if (hasIsEquipBind) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_equip_bind$field);
			}
			if (hasLevelStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level_stage$field);
			}
			if (hasRefineMainStatId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, refine_main_stat_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var equip_type$count:uint = 0;
			var second_weapon_type$count:uint = 0;
			var race$count:uint = 0;
			var sex$count:uint = 0;
			var is_equip_bind$count:uint = 0;
			var level_stage$count:uint = 0;
			var refine_main_stat_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (equip_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDataProto.equipType cannot be set twice.');
					}
					++equip_type$count;
					this.equipType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (second_weapon_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDataProto.secondWeaponType cannot be set twice.');
					}
					++second_weapon_type$count;
					this.secondWeaponType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (race$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDataProto.race cannot be set twice.');
					}
					++race$count;
					this.race = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDataProto.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 6:
					if (is_equip_bind$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDataProto.isEquipBind cannot be set twice.');
					}
					++is_equip_bind$count;
					this.isEquipBind = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (level_stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDataProto.levelStage cannot be set twice.');
					}
					++level_stage$count;
					this.levelStage = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (refine_main_stat_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDataProto.refineMainStatId cannot be set twice.');
					}
					++refine_main_stat_id$count;
					this.refineMainStatId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
