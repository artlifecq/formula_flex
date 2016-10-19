package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NormalUsableDataProto.NormalEfficacy;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NormalUsableDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EFFICACY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.NormalUsableDataProto.efficacy", "efficacy", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.NormalUsableDataProto.NormalEfficacy);

		private var efficacy$field:int;

		private var hasField$0:uint = 0;

		public function clearEfficacy():void {
			hasField$0 &= 0xfffffffe;
			efficacy$field = new int();
		}

		public function get hasEfficacy():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set efficacy(value:int):void {
			hasField$0 |= 0x1;
			efficacy$field = value;
		}

		public function get efficacy():int {
			return efficacy$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEfficacy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, efficacy$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var efficacy$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (efficacy$count != 0) {
						throw new flash.errors.IOError('Bad data format: NormalUsableDataProto.efficacy cannot be set twice.');
					}
					++efficacy$count;
					this.efficacy = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
