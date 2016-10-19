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
	public dynamic final class Int64StringPairProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.Int64StringPairProto.key", "key", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var key$field:Int64;

		public function clearKey():void {
			key$field = null;
		}

		public function get hasKey():Boolean {
			return key$field != null;
		}

		public function set key(value:Int64):void {
			key$field = value;
		}

		public function get key():Int64 {
			return key$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.Int64StringPairProto.value", "value", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var value$field:String;

		public function clearValue():void {
			value$field = null;
		}

		public function get hasValue():Boolean {
			return value$field != null;
		}

		public function set value(value:String):void {
			value$field = value;
		}

		public function get value():String {
			return value$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, key$field);
			}
			if (hasValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, value$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var key$count:uint = 0;
			var value$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (key$count != 0) {
						throw new flash.errors.IOError('Bad data format: Int64StringPairProto.key cannot be set twice.');
					}
					++key$count;
					this.key = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (value$count != 0) {
						throw new flash.errors.IOError('Bad data format: Int64StringPairProto.value cannot be set twice.');
					}
					++value$count;
					this.value = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
