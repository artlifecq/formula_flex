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
	public dynamic final class AmountGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AMOUNT_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.AmountGoodsDataProto.amount_type", "amountType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.AmountType);

		private var amount_type$field:int;

		private var hasField$0:uint = 0;

		public function clearAmountType():void {
			hasField$0 &= 0xfffffffe;
			amount_type$field = new int();
		}

		public function get hasAmountType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set amountType(value:int):void {
			hasField$0 |= 0x1;
			amount_type$field = value;
		}

		public function get amountType():int {
			return amount_type$field;
		}

		/**
		 *  @private
		 */
		public static const AMOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AmountGoodsDataProto.amount", "amount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var amount$field:int;

		public function clearAmount():void {
			hasField$0 &= 0xfffffffd;
			amount$field = new int();
		}

		public function get hasAmount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set amount(value:int):void {
			hasField$0 |= 0x2;
			amount$field = value;
		}

		public function get amount():int {
			return amount$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAmountType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, amount_type$field);
			}
			if (hasAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, amount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var amount_type$count:uint = 0;
			var amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (amount_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmountGoodsDataProto.amountType cannot be set twice.');
					}
					++amount_type$count;
					this.amountType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: AmountGoodsDataProto.amount cannot be set twice.');
					}
					++amount$count;
					this.amount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
