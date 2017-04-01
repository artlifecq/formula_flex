package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Quality;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentCombineCostDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_STAGE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentCombineCostDataProto.level_stage", "levelStage", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_stage$field:int;

		private var hasField$0:uint = 0;

		public function clearLevelStage():void {
			hasField$0 &= 0xfffffffe;
			level_stage$field = new int();
		}

		public function get hasLevelStage():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set levelStage(value:int):void {
			hasField$0 |= 0x1;
			level_stage$field = value;
		}

		public function get levelStage():int {
			return level_stage$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentCombineCostDataProto.quality", "quality", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		public function clearQuality():void {
			hasField$0 &= 0xfffffffd;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x2;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const RATE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentCombineCostDataProto.rate", "rate", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rate$field:int;

		public function clearRate():void {
			hasField$0 &= 0xfffffffb;
			rate$field = new int();
		}

		public function get hasRate():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set rate(value:int):void {
			hasField$0 |= 0x4;
			rate$field = value;
		}

		public function get rate():int {
			return rate$field;
		}

		/**
		 *  @private
		 */
		public static const COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentCombineCostDataProto.cost", "cost", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost$field:int;

		public function clearCost():void {
			hasField$0 &= 0xfffffff7;
			cost$field = new int();
		}

		public function get hasCost():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set cost(value:int):void {
			hasField$0 |= 0x8;
			cost$field = value;
		}

		public function get cost():int {
			return cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevelStage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level_stage$field);
			}
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, quality$field);
			}
			if (hasRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, rate$field);
			}
			if (hasCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level_stage$count:uint = 0;
			var quality$count:uint = 0;
			var rate$count:uint = 0;
			var cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level_stage$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineCostDataProto.levelStage cannot be set twice.');
					}
					++level_stage$count;
					this.levelStage = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineCostDataProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (rate$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineCostDataProto.rate cannot be set twice.');
					}
					++rate$count;
					this.rate = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineCostDataProto.cost cannot be set twice.');
					}
					++cost$count;
					this.cost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
