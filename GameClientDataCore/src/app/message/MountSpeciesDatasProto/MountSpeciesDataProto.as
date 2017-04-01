package app.message.MountSpeciesDatasProto {
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
	public dynamic final class MountSpeciesDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountSpeciesDatasProto.MountSpeciesDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.MountSpeciesDatasProto.MountSpeciesDataProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const REQUIRED_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountSpeciesDatasProto.MountSpeciesDataProto.required_level", "requiredLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var required_level$field:int;

		public function clearRequiredLevel():void {
			hasField$0 &= 0xfffffffd;
			required_level$field = new int();
		}

		public function get hasRequiredLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set requiredLevel(value:int):void {
			hasField$0 |= 0x2;
			required_level$field = value;
		}

		public function get requiredLevel():int {
			return required_level$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_LIFE_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountSpeciesDatasProto.MountSpeciesDataProto.max_life_time", "maxLifeTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_life_time$field:int;

		public function clearMaxLifeTime():void {
			hasField$0 &= 0xfffffffb;
			max_life_time$field = new int();
		}

		public function get hasMaxLifeTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set maxLifeTime(value:int):void {
			hasField$0 |= 0x4;
			max_life_time$field = value;
		}

		public function get maxLifeTime():int {
			return max_life_time$field;
		}

		/**
		 *  @private
		 */
		public static const INDENTIFY_MONEY_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountSpeciesDatasProto.MountSpeciesDataProto.indentify_money_cost", "indentifyMoneyCost", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var indentify_money_cost$field:int;

		public function clearIndentifyMoneyCost():void {
			hasField$0 &= 0xfffffff7;
			indentify_money_cost$field = new int();
		}

		public function get hasIndentifyMoneyCost():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set indentifyMoneyCost(value:int):void {
			hasField$0 |= 0x8;
			indentify_money_cost$field = value;
		}

		public function get indentifyMoneyCost():int {
			return indentify_money_cost$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_RIDE_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountSpeciesDatasProto.MountSpeciesDataProto.can_ride_level", "canRideLevel", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_ride_level$field:int;

		public function clearCanRideLevel():void {
			hasField$0 &= 0xffffffef;
			can_ride_level$field = new int();
		}

		public function get hasCanRideLevel():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set canRideLevel(value:int):void {
			hasField$0 |= 0x10;
			can_ride_level$field = value;
		}

		public function get canRideLevel():int {
			return can_ride_level$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_RIDE_FIGHT_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MountSpeciesDatasProto.MountSpeciesDataProto.can_ride_fight_level", "canRideFightLevel", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_ride_fight_level$field:int;

		public function clearCanRideFightLevel():void {
			hasField$0 &= 0xffffffdf;
			can_ride_fight_level$field = new int();
		}

		public function get hasCanRideFightLevel():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canRideFightLevel(value:int):void {
			hasField$0 |= 0x20;
			can_ride_fight_level$field = value;
		}

		public function get canRideFightLevel():int {
			return can_ride_fight_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasRequiredLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, required_level$field);
			}
			if (hasMaxLifeTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, max_life_time$field);
			}
			if (hasIndentifyMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, indentify_money_cost$field);
			}
			if (hasCanRideLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, can_ride_level$field);
			}
			if (hasCanRideFightLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, can_ride_fight_level$field);
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
			var required_level$count:uint = 0;
			var max_life_time$count:uint = 0;
			var indentify_money_cost$count:uint = 0;
			var can_ride_level$count:uint = 0;
			var can_ride_fight_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpeciesDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpeciesDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (required_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpeciesDataProto.requiredLevel cannot be set twice.');
					}
					++required_level$count;
					this.requiredLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (max_life_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpeciesDataProto.maxLifeTime cannot be set twice.');
					}
					++max_life_time$count;
					this.maxLifeTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (indentify_money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpeciesDataProto.indentifyMoneyCost cannot be set twice.');
					}
					++indentify_money_cost$count;
					this.indentifyMoneyCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (can_ride_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpeciesDataProto.canRideLevel cannot be set twice.');
					}
					++can_ride_level$count;
					this.canRideLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (can_ride_fight_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpeciesDataProto.canRideFightLevel cannot be set twice.');
					}
					++can_ride_fight_level$count;
					this.canRideFightLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
