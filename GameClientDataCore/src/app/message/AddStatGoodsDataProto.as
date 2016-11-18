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
	public dynamic final class AddStatGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USE_COUNT_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AddStatGoodsDataProto.use_count_limit", "useCountLimit", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var use_count_limit$field:int;

		private var hasField$0:uint = 0;

		public function clearUseCountLimit():void {
			hasField$0 &= 0xfffffffe;
			use_count_limit$field = new int();
		}

		public function get hasUseCountLimit():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set useCountLimit(value:int):void {
			hasField$0 |= 0x1;
			use_count_limit$field = value;
		}

		public function get useCountLimit():int {
			return use_count_limit$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUseCountLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, use_count_limit$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var use_count_limit$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (use_count_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddStatGoodsDataProto.useCountLimit cannot be set twice.');
					}
					++use_count_limit$count;
					this.useCountLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
