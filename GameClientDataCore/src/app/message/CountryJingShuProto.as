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
	public dynamic final class CountryJingShuProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const JING_SHU_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryJingShuProto.jing_shu_count", "jingShuCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jing_shu_count$field:int;

		private var hasField$0:uint = 0;

		public function clearJingShuCount():void {
			hasField$0 &= 0xfffffffe;
			jing_shu_count$field = new int();
		}

		public function get hasJingShuCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set jingShuCount(value:int):void {
			hasField$0 |= 0x1;
			jing_shu_count$field = value;
		}

		public function get jingShuCount():int {
			return jing_shu_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasJingShuCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jing_shu_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var jing_shu_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (jing_shu_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryJingShuProto.jingShuCount cannot be set twice.');
					}
					++jing_shu_count$count;
					this.jingShuCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
