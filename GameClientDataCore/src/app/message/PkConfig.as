package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PkMiscDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PkConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MISC_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.PkConfig.misc_data", "miscData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PkMiscDataProto; });

		private var misc_data$field:app.message.PkMiscDataProto;

		public function clearMiscData():void {
			misc_data$field = null;
		}

		public function get hasMiscData():Boolean {
			return misc_data$field != null;
		}

		public function set miscData(value:app.message.PkMiscDataProto):void {
			misc_data$field = value;
		}

		public function get miscData():app.message.PkMiscDataProto {
			return misc_data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMiscData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, misc_data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var misc_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (misc_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: PkConfig.miscData cannot be set twice.');
					}
					++misc_data$count;
					this.miscData = new app.message.PkMiscDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.miscData);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
