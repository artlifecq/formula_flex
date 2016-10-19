package app.message.MountHungerDegreeDatasProto {
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
	public dynamic final class MountHungerDegreeDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MAX_HUNGER_DEGREE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountHungerDegreeDatasProto.MountHungerDegreeDataProto.max_hunger_degree", "maxHungerDegree", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hunger_degree$field:int;

		private var hasField$0:uint = 0;

		public function clearMaxHungerDegree():void {
			hasField$0 &= 0xfffffffe;
			max_hunger_degree$field = new int();
		}

		public function get hasMaxHungerDegree():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set maxHungerDegree(value:int):void {
			hasField$0 |= 0x1;
			max_hunger_degree$field = value;
		}

		public function get maxHungerDegree():int {
			return max_hunger_degree$field;
		}

		/**
		 *  @private
		 */
		public static const SPEED_PERCENT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountHungerDegreeDatasProto.MountHungerDegreeDataProto.speed_percent", "speedPercent", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var speed_percent$field:int;

		public function clearSpeedPercent():void {
			hasField$0 &= 0xfffffffd;
			speed_percent$field = new int();
		}

		public function get hasSpeedPercent():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set speedPercent(value:int):void {
			hasField$0 |= 0x2;
			speed_percent$field = value;
		}

		public function get speedPercent():int {
			return speed_percent$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMaxHungerDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_hunger_degree$field);
			}
			if (hasSpeedPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, speed_percent$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var max_hunger_degree$count:uint = 0;
			var speed_percent$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (max_hunger_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountHungerDegreeDataProto.maxHungerDegree cannot be set twice.');
					}
					++max_hunger_degree$count;
					this.maxHungerDegree = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (speed_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountHungerDegreeDataProto.speedPercent cannot be set twice.');
					}
					++speed_percent$count;
					this.speedPercent = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
