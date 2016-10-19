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
	public dynamic final class MountMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAN_TRANING_MOUNT_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.can_traning_mount_count", "canTraningMountCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_traning_mount_count$field:int;

		private var hasField$0:uint = 0;

		public function clearCanTraningMountCount():void {
			hasField$0 &= 0xfffffffe;
			can_traning_mount_count$field = new int();
		}

		public function get hasCanTraningMountCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set canTraningMountCount(value:int):void {
			hasField$0 |= 0x1;
			can_traning_mount_count$field = value;
		}

		public function get canTraningMountCount():int {
			return can_traning_mount_count$field;
		}

		/**
		 *  @private
		 */
		public static const UP_OR_DOWN_CD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.up_or_down_cd", "upOrDownCd", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var up_or_down_cd$field:int;

		public function clearUpOrDownCd():void {
			hasField$0 &= 0xfffffffd;
			up_or_down_cd$field = new int();
		}

		public function get hasUpOrDownCd():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set upOrDownCd(value:int):void {
			hasField$0 |= 0x2;
			up_or_down_cd$field = value;
		}

		public function get upOrDownCd():int {
			return up_or_down_cd$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_LEVEL_CAP_THAN_MASTER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.mount_level_cap_than_master", "mountLevelCapThanMaster", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mount_level_cap_than_master$field:int;

		public function clearMountLevelCapThanMaster():void {
			hasField$0 &= 0xfffffffb;
			mount_level_cap_than_master$field = new int();
		}

		public function get hasMountLevelCapThanMaster():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set mountLevelCapThanMaster(value:int):void {
			hasField$0 |= 0x4;
			mount_level_cap_than_master$field = value;
		}

		public function get mountLevelCapThanMaster():int {
			return mount_level_cap_than_master$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_HUNGER_DEGREE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.max_hunger_degree", "maxHungerDegree", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hunger_degree$field:int;

		public function clearMaxHungerDegree():void {
			hasField$0 &= 0xfffffff7;
			max_hunger_degree$field = new int();
		}

		public function get hasMaxHungerDegree():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set maxHungerDegree(value:int):void {
			hasField$0 |= 0x8;
			max_hunger_degree$field = value;
		}

		public function get maxHungerDegree():int {
			return max_hunger_degree$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_BREED_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.can_breed_level", "canBreedLevel", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_breed_level$field:int;

		public function clearCanBreedLevel():void {
			hasField$0 &= 0xffffffef;
			can_breed_level$field = new int();
		}

		public function get hasCanBreedLevel():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set canBreedLevel(value:int):void {
			hasField$0 |= 0x10;
			can_breed_level$field = value;
		}

		public function get canBreedLevel():int {
			return can_breed_level$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_BREED_MAX_HUNGRE_DEGREE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.can_breed_max_hungre_degree", "canBreedMaxHungreDegree", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_breed_max_hungre_degree$field:int;

		public function clearCanBreedMaxHungreDegree():void {
			hasField$0 &= 0xffffffdf;
			can_breed_max_hungre_degree$field = new int();
		}

		public function get hasCanBreedMaxHungreDegree():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canBreedMaxHungreDegree(value:int):void {
			hasField$0 |= 0x20;
			can_breed_max_hungre_degree$field = value;
		}

		public function get canBreedMaxHungreDegree():int {
			return can_breed_max_hungre_degree$field;
		}

		/**
		 *  @private
		 */
		public static const AUTO_DOWN_FROM_MOUNT_HUNGER_DEGREE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.auto_down_from_mount_hunger_degree", "autoDownFromMountHungerDegree", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var auto_down_from_mount_hunger_degree$field:int;

		public function clearAutoDownFromMountHungerDegree():void {
			hasField$0 &= 0xffffffbf;
			auto_down_from_mount_hunger_degree$field = new int();
		}

		public function get hasAutoDownFromMountHungerDegree():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set autoDownFromMountHungerDegree(value:int):void {
			hasField$0 |= 0x40;
			auto_down_from_mount_hunger_degree$field = value;
		}

		public function get autoDownFromMountHungerDegree():int {
			return auto_down_from_mount_hunger_degree$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_COST_BAND_MONEY_BASE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.refine_cost_band_money_base", "refineCostBandMoneyBase", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refine_cost_band_money_base$field:int;

		public function clearRefineCostBandMoneyBase():void {
			hasField$0 &= 0xffffff7f;
			refine_cost_band_money_base$field = new int();
		}

		public function get hasRefineCostBandMoneyBase():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set refineCostBandMoneyBase(value:int):void {
			hasField$0 |= 0x80;
			refine_cost_band_money_base$field = value;
		}

		public function get refineCostBandMoneyBase():int {
			return refine_cost_band_money_base$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_COST_VITALITY_BASE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.refine_cost_vitality_base", "refineCostVitalityBase", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refine_cost_vitality_base$field:int;

		public function clearRefineCostVitalityBase():void {
			hasField$0 &= 0xfffffeff;
			refine_cost_vitality_base$field = new int();
		}

		public function get hasRefineCostVitalityBase():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set refineCostVitalityBase(value:int):void {
			hasField$0 |= 0x100;
			refine_cost_vitality_base$field = value;
		}

		public function get refineCostVitalityBase():int {
			return refine_cost_vitality_base$field;
		}

		/**
		 *  @private
		 */
		public static const INHERIT_PER_SPELL_COST_BAND_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountMiscDataProto.inherit_per_spell_cost_band_money", "inheritPerSpellCostBandMoney", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var inherit_per_spell_cost_band_money$field:int;

		public function clearInheritPerSpellCostBandMoney():void {
			hasField$0 &= 0xfffffdff;
			inherit_per_spell_cost_band_money$field = new int();
		}

		public function get hasInheritPerSpellCostBandMoney():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set inheritPerSpellCostBandMoney(value:int):void {
			hasField$0 |= 0x200;
			inherit_per_spell_cost_band_money$field = value;
		}

		public function get inheritPerSpellCostBandMoney():int {
			return inherit_per_spell_cost_band_money$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCanTraningMountCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, can_traning_mount_count$field);
			}
			if (hasUpOrDownCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, up_or_down_cd$field);
			}
			if (hasMountLevelCapThanMaster) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mount_level_cap_than_master$field);
			}
			if (hasMaxHungerDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_hunger_degree$field);
			}
			if (hasCanBreedLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, can_breed_level$field);
			}
			if (hasCanBreedMaxHungreDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, can_breed_max_hungre_degree$field);
			}
			if (hasAutoDownFromMountHungerDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, auto_down_from_mount_hunger_degree$field);
			}
			if (hasRefineCostBandMoneyBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, refine_cost_band_money_base$field);
			}
			if (hasRefineCostVitalityBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, refine_cost_vitality_base$field);
			}
			if (hasInheritPerSpellCostBandMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, inherit_per_spell_cost_band_money$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var can_traning_mount_count$count:uint = 0;
			var up_or_down_cd$count:uint = 0;
			var mount_level_cap_than_master$count:uint = 0;
			var max_hunger_degree$count:uint = 0;
			var can_breed_level$count:uint = 0;
			var can_breed_max_hungre_degree$count:uint = 0;
			var auto_down_from_mount_hunger_degree$count:uint = 0;
			var refine_cost_band_money_base$count:uint = 0;
			var refine_cost_vitality_base$count:uint = 0;
			var inherit_per_spell_cost_band_money$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (can_traning_mount_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.canTraningMountCount cannot be set twice.');
					}
					++can_traning_mount_count$count;
					this.canTraningMountCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (up_or_down_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.upOrDownCd cannot be set twice.');
					}
					++up_or_down_cd$count;
					this.upOrDownCd = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (mount_level_cap_than_master$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.mountLevelCapThanMaster cannot be set twice.');
					}
					++mount_level_cap_than_master$count;
					this.mountLevelCapThanMaster = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (max_hunger_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.maxHungerDegree cannot be set twice.');
					}
					++max_hunger_degree$count;
					this.maxHungerDegree = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (can_breed_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.canBreedLevel cannot be set twice.');
					}
					++can_breed_level$count;
					this.canBreedLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (can_breed_max_hungre_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.canBreedMaxHungreDegree cannot be set twice.');
					}
					++can_breed_max_hungre_degree$count;
					this.canBreedMaxHungreDegree = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (auto_down_from_mount_hunger_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.autoDownFromMountHungerDegree cannot be set twice.');
					}
					++auto_down_from_mount_hunger_degree$count;
					this.autoDownFromMountHungerDegree = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (refine_cost_band_money_base$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.refineCostBandMoneyBase cannot be set twice.');
					}
					++refine_cost_band_money_base$count;
					this.refineCostBandMoneyBase = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (refine_cost_vitality_base$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.refineCostVitalityBase cannot be set twice.');
					}
					++refine_cost_vitality_base$count;
					this.refineCostVitalityBase = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (inherit_per_spell_cost_band_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountMiscDataProto.inheritPerSpellCostBandMoney cannot be set twice.');
					}
					++inherit_per_spell_cost_band_money$count;
					this.inheritPerSpellCostBandMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
