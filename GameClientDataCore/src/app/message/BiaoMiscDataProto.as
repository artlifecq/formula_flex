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
	public dynamic final class BiaoMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UP_TO_BIAO_MAX_DISTANCE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoMiscDataProto.up_to_biao_max_distance", "upToBiaoMaxDistance", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var up_to_biao_max_distance$field:int;

		private var hasField$0:uint = 0;

		public function clearUpToBiaoMaxDistance():void {
			hasField$0 &= 0xfffffffe;
			up_to_biao_max_distance$field = new int();
		}

		public function get hasUpToBiaoMaxDistance():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set upToBiaoMaxDistance(value:int):void {
			hasField$0 |= 0x1;
			up_to_biao_max_distance$field = value;
		}

		public function get upToBiaoMaxDistance():int {
			return up_to_biao_max_distance$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUpToBiaoMaxDistance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, up_to_biao_max_distance$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var up_to_biao_max_distance$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (up_to_biao_max_distance$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoMiscDataProto.upToBiaoMaxDistance cannot be set twice.');
					}
					++up_to_biao_max_distance$count;
					this.upToBiaoMaxDistance = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
