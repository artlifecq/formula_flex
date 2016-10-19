package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryModuleObjOtherProto.CountryModuleWuXunOtherProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryModuleObjOtherProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WU_XUN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryModuleObjOtherProto.wu_xun", "wuXun", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryModuleObjOtherProto.CountryModuleWuXunOtherProto; });

		private var wu_xun$field:app.message.CountryModuleObjOtherProto.CountryModuleWuXunOtherProto;

		public function clearWuXun():void {
			wu_xun$field = null;
		}

		public function get hasWuXun():Boolean {
			return wu_xun$field != null;
		}

		public function set wuXun(value:app.message.CountryModuleObjOtherProto.CountryModuleWuXunOtherProto):void {
			wu_xun$field = value;
		}

		public function get wuXun():app.message.CountryModuleObjOtherProto.CountryModuleWuXunOtherProto {
			return wu_xun$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, wu_xun$field);
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
				case 8:
					if (wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjOtherProto.wuXun cannot be set twice.');
					}
					++wu_xun$count;
					this.wuXun = new app.message.CountryModuleObjOtherProto.CountryModuleWuXunOtherProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.wuXun);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
