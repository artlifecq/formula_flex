package app.message.ClientConfigsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ClientConfigProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ClientConfigsProto.ClientConfigProto.index", "index", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var index$field:int;

		private var hasField$0:uint = 0;

		public function clearIndex():void {
			hasField$0 &= 0xfffffffe;
			index$field = new int();
		}

		public function get hasIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set index(value:int):void {
			hasField$0 |= 0x1;
			index$field = value;
		}

		public function get index():int {
			return index$field;
		}

		/**
		 *  @private
		 */
		public static const DATA:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.ClientConfigsProto.ClientConfigProto.data", "data", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var data$field:flash.utils.ByteArray;

		public function clearData():void {
			data$field = null;
		}

		public function get hasData():Boolean {
			return data$field != null;
		}

		public function set data(value:flash.utils.ByteArray):void {
			data$field = value;
		}

		public function get data():flash.utils.ByteArray {
			return data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, index$field);
			}
			if (hasData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var index$count:uint = 0;
			var data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (index$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientConfigProto.index cannot be set twice.');
					}
					++index$count;
					this.index = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (data$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientConfigProto.data cannot be set twice.');
					}
					++data$count;
					this.data = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
