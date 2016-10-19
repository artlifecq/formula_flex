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
	public dynamic final class ModelProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VERISON:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ModelProto.verison", "verison", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var verison$field:int;

		private var hasField$0:uint = 0;

		public function clearVerison():void {
			hasField$0 &= 0xfffffffe;
			verison$field = new int();
		}

		public function get hasVerison():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set verison(value:int):void {
			hasField$0 |= 0x1;
			verison$field = value;
		}

		public function get verison():int {
			return verison$field;
		}

		/**
		 *  @private
		 */
		public static const RESOURCES:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.ModelProto.resources", "resources", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("int")]
		public var resources:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVerison) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, verison$field);
			}
			if (this.resources != null && this.resources.length > 0) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.writePackedRepeated(output, com.netease.protobuf.WriteUtils.write$TYPE_INT32, this.resources);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var verison$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (verison$count != 0) {
						throw new flash.errors.IOError('Bad data format: ModelProto.verison cannot be set twice.');
					}
					++verison$count;
					this.verison = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.resources);
						break;
					}
					this.resources.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
