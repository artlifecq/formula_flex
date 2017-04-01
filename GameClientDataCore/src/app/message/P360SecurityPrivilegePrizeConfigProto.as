package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.P360SecurityPrivilegePrizeConfigProto.P360SecurityPrivilegePrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class P360SecurityPrivilegePrizeConfigProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PRIZELIST:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.P360SecurityPrivilegePrizeConfigProto.prizelist", "prizelist", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.P360SecurityPrivilegePrizeConfigProto.P360SecurityPrivilegePrizeProto; });

		[ArrayElementType("app.message.P360SecurityPrivilegePrizeConfigProto.P360SecurityPrivilegePrizeProto")]
		public var prizelist:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var prizelist$index:uint = 0; prizelist$index < this.prizelist.length; ++prizelist$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.prizelist[prizelist$index]);
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
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.prizelist.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.P360SecurityPrivilegePrizeConfigProto.P360SecurityPrivilegePrizeProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
