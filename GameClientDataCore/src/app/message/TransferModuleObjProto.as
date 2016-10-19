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
	public dynamic final class TransferModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NEXT_CAN_CHANGE_NAME_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.TransferModuleObjProto.next_can_change_name_time", "nextCanChangeNameTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var next_can_change_name_time$field:Int64;

		public function clearNextCanChangeNameTime():void {
			next_can_change_name_time$field = null;
		}

		public function get hasNextCanChangeNameTime():Boolean {
			return next_can_change_name_time$field != null;
		}

		public function set nextCanChangeNameTime(value:Int64):void {
			next_can_change_name_time$field = value;
		}

		public function get nextCanChangeNameTime():Int64 {
			return next_can_change_name_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNextCanChangeNameTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, next_can_change_name_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var next_can_change_name_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (next_can_change_name_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: TransferModuleObjProto.nextCanChangeNameTime cannot be set twice.');
					}
					++next_can_change_name_time$count;
					this.nextCanChangeNameTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
