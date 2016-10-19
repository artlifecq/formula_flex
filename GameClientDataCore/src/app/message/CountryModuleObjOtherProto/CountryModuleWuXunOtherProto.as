package app.message.CountryModuleObjOtherProto {
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
	public dynamic final class CountryModuleWuXunOtherProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WU_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjOtherProto.CountryModuleWuXunOtherProto.wu_xun", "wuXun", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var wu_xun$field:Int64;

		public function clearWuXun():void {
			wu_xun$field = null;
		}

		public function get hasWuXun():Boolean {
			return wu_xun$field != null;
		}

		public function set wuXun(value:Int64):void {
			wu_xun$field = value;
		}

		public function get wuXun():Int64 {
			return wu_xun$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, wu_xun$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var wu_xun$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleWuXunOtherProto.wuXun cannot be set twice.');
					}
					++wu_xun$count;
					this.wuXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
