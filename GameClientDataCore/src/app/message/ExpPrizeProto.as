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
	public dynamic final class ExpPrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExpPrizeProto.per", "per", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var per$field:int;

		private var hasField$0:uint = 0;

		public function clearPer():void {
			hasField$0 &= 0xfffffffe;
			per$field = new int();
		}

		public function get hasPer():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set per(value:int):void {
			hasField$0 |= 0x1;
			per$field = value;
		}

		public function get per():int {
			return per$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, per$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var per$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (per$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExpPrizeProto.per cannot be set twice.');
					}
					++per$count;
					this.per = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
