package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryWarRecordProto;
	import app.message.CountryWarProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WARS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryWarDataProto.wars", "wars", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarProto; });

		[ArrayElementType("app.message.CountryWarProto")]
		public var wars:Array = [];

		/**
		 *  @private
		 */
		public static const RECENT_RECORDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryWarDataProto.recent_records", "recentRecords", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarRecordProto; });

		[ArrayElementType("app.message.CountryWarRecordProto")]
		public var recentRecords:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var wars$index:uint = 0; wars$index < this.wars.length; ++wars$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.wars[wars$index]);
			}
			for (var recentRecords$index:uint = 0; recentRecords$index < this.recentRecords.length; ++recentRecords$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.recentRecords[recentRecords$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.wars.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryWarProto()));
					break;
				case 2:
					this.recentRecords.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryWarRecordProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
