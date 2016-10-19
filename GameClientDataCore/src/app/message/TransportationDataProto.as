package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TransportationDataProto.TransportGoodsType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TransportationDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TRANSPORT_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.TransportationDataProto.transport_type", "transportType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.TransportationDataProto.TransportGoodsType);

		private var transport_type$field:int;

		private var hasField$0:uint = 0;

		public function clearTransportType():void {
			hasField$0 &= 0xfffffffe;
			transport_type$field = new int();
		}

		public function get hasTransportType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set transportType(value:int):void {
			hasField$0 |= 0x1;
			transport_type$field = value;
		}

		public function get transportType():int {
			return transport_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTransportType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, transport_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var transport_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (transport_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: TransportationDataProto.transportType cannot be set twice.');
					}
					++transport_type$count;
					this.transportType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
