package app.message.NpcDialogProto.TransportDialogProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NpcTransportsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TRANSPORT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.transport", "transport", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto; });

		[ArrayElementType("app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto")]
		public var transport:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var transport$index:uint = 0; transport$index < this.transport.length; ++transport$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.transport[transport$index]);
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
					this.transport.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.NpcDialogProto.TransportDialogProto.NpcTransportsProto.NpcTransportProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
