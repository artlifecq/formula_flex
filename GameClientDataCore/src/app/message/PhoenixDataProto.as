package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AmountType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PhoenixDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.PhoenixDataProto.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.AmountType);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PhoenixDataProto.cost", "cost", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost$field:int;

		public function clearCost():void {
			hasField$0 &= 0xfffffffd;
			cost$field = new int();
		}

		public function get hasCost():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set cost(value:int):void {
			hasField$0 |= 0x2;
			cost$field = value;
		}

		public function get cost():int {
			return cost$field;
		}

		/**
		 *  @private
		 */
		public static const COEFFICIENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PhoenixDataProto.coefficient", "coefficient", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var coefficient$field:int;

		public function clearCoefficient():void {
			hasField$0 &= 0xfffffffb;
			coefficient$field = new int();
		}

		public function get hasCoefficient():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set coefficient(value:int):void {
			hasField$0 |= 0x4;
			coefficient$field = value;
		}

		public function get coefficient():int {
			return coefficient$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, type$field);
			}
			if (hasCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cost$field);
			}
			if (hasCoefficient) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, coefficient$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var cost$count:uint = 0;
			var coefficient$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixDataProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixDataProto.cost cannot be set twice.');
					}
					++cost$count;
					this.cost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (coefficient$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixDataProto.coefficient cannot be set twice.');
					}
					++coefficient$count;
					this.coefficient = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
