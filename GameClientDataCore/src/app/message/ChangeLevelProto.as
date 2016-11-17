package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChangeLevelProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NEW_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChangeLevelProto.new_level", "newLevel", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var new_level$field:int;

		private var hasField$0:uint = 0;

		public function clearNewLevel():void {
			hasField$0 &= 0xfffffffe;
			new_level$field = new int();
		}

		public function get hasNewLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set newLevel(value:int):void {
			hasField$0 |= 0x1;
			new_level$field = value;
		}

		public function get newLevel():int {
			return new_level$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.ChangeLevelProto.exp", "exp", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CAN_STORAGE_EXP:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.ChangeLevelProto.can_storage_exp", "canStorageExp", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_storage_exp$field:Int64;

		public function clearCanStorageExp():void {
			can_storage_exp$field = null;
		}

		public function get hasCanStorageExp():Boolean {
			return can_storage_exp$field != null;
		}

		public function set canStorageExp(value:Int64):void {
			can_storage_exp$field = value;
		}

		public function get canStorageExp():Int64 {
			return can_storage_exp$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ADD_SPELL_POINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChangeLevelProto.total_add_spell_point", "totalAddSpellPoint", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_add_spell_point$field:int;

		public function clearTotalAddSpellPoint():void {
			hasField$0 &= 0xfffffffd;
			total_add_spell_point$field = new int();
		}

		public function get hasTotalAddSpellPoint():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set totalAddSpellPoint(value:int):void {
			hasField$0 |= 0x2;
			total_add_spell_point$field = value;
		}

		public function get totalAddSpellPoint():int {
			return total_add_spell_point$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ADD_SPRITE_STAT_POINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChangeLevelProto.total_add_sprite_stat_point", "totalAddSpriteStatPoint", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_add_sprite_stat_point$field:int;

		public function clearTotalAddSpriteStatPoint():void {
			hasField$0 &= 0xfffffffb;
			total_add_sprite_stat_point$field = new int();
		}

		public function get hasTotalAddSpriteStatPoint():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set totalAddSpriteStatPoint(value:int):void {
			hasField$0 |= 0x4;
			total_add_sprite_stat_point$field = value;
		}

		public function get totalAddSpriteStatPoint():int {
			return total_add_sprite_stat_point$field;
		}

		/**
		 *  @private
		 */
		public static const PHOENIX_REFINE_MONEY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChangeLevelProto.phoenix_refine_money", "phoenixRefineMoney", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var phoenix_refine_money$field:int;

		public function clearPhoenixRefineMoney():void {
			hasField$0 &= 0xfffffff7;
			phoenix_refine_money$field = new int();
		}

		public function get hasPhoenixRefineMoney():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set phoenixRefineMoney(value:int):void {
			hasField$0 |= 0x8;
			phoenix_refine_money$field = value;
		}

		public function get phoenixRefineMoney():int {
			return phoenix_refine_money$field;
		}

		/**
		 *  @private
		 */
		public static const PHOENIX_REFINE_EXP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChangeLevelProto.phoenix_refine_exp", "phoenixRefineExp", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var phoenix_refine_exp$field:int;

		public function clearPhoenixRefineExp():void {
			hasField$0 &= 0xffffffef;
			phoenix_refine_exp$field = new int();
		}

		public function get hasPhoenixRefineExp():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set phoenixRefineExp(value:int):void {
			hasField$0 |= 0x10;
			phoenix_refine_exp$field = value;
		}

		public function get phoenixRefineExp():int {
			return phoenix_refine_exp$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_SLOT_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChangeLevelProto.mount_slot_count", "mountSlotCount", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mount_slot_count$field:int;

		public function clearMountSlotCount():void {
			hasField$0 &= 0xffffffdf;
			mount_slot_count$field = new int();
		}

		public function get hasMountSlotCount():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set mountSlotCount(value:int):void {
			hasField$0 |= 0x20;
			mount_slot_count$field = value;
		}

		public function get mountSlotCount():int {
			return mount_slot_count$field;
		}

		/**
		 *  @private
		 */
		public static const RELIVE_COEFF:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChangeLevelProto.relive_coeff", "reliveCoeff", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var relive_coeff$field:int;

		public function clearReliveCoeff():void {
			hasField$0 &= 0xffffffbf;
			relive_coeff$field = new int();
		}

		public function get hasReliveCoeff():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set reliveCoeff(value:int):void {
			hasField$0 |= 0x40;
			relive_coeff$field = value;
		}

		public function get reliveCoeff():int {
			return relive_coeff$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNewLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, new_level$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, exp$field);
			}
			if (hasCanStorageExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, can_storage_exp$field);
			}
			if (hasTotalAddSpellPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, total_add_spell_point$field);
			}
			if (hasTotalAddSpriteStatPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, total_add_sprite_stat_point$field);
			}
			if (hasPhoenixRefineMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, phoenix_refine_money$field);
			}
			if (hasPhoenixRefineExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, phoenix_refine_exp$field);
			}
			if (hasMountSlotCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mount_slot_count$field);
			}
			if (hasReliveCoeff) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, relive_coeff$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var new_level$count:uint = 0;
			var exp$count:uint = 0;
			var can_storage_exp$count:uint = 0;
			var total_add_spell_point$count:uint = 0;
			var total_add_sprite_stat_point$count:uint = 0;
			var phoenix_refine_money$count:uint = 0;
			var phoenix_refine_exp$count:uint = 0;
			var mount_slot_count$count:uint = 0;
			var relive_coeff$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (new_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.newLevel cannot be set twice.');
					}
					++new_level$count;
					this.newLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (can_storage_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.canStorageExp cannot be set twice.');
					}
					++can_storage_exp$count;
					this.canStorageExp = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (total_add_spell_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.totalAddSpellPoint cannot be set twice.');
					}
					++total_add_spell_point$count;
					this.totalAddSpellPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (total_add_sprite_stat_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.totalAddSpriteStatPoint cannot be set twice.');
					}
					++total_add_sprite_stat_point$count;
					this.totalAddSpriteStatPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (phoenix_refine_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.phoenixRefineMoney cannot be set twice.');
					}
					++phoenix_refine_money$count;
					this.phoenixRefineMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (phoenix_refine_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.phoenixRefineExp cannot be set twice.');
					}
					++phoenix_refine_exp$count;
					this.phoenixRefineExp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (mount_slot_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.mountSlotCount cannot be set twice.');
					}
					++mount_slot_count$count;
					this.mountSlotCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (relive_coeff$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangeLevelProto.reliveCoeff cannot be set twice.');
					}
					++relive_coeff$count;
					this.reliveCoeff = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
