package app.message.GoodsContainerProto {
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
	public dynamic final class StorageGoodsContainerProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UNLOCKED_PAGE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsContainerProto.StorageGoodsContainerProto.unlocked_page", "unlockedPage", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var unlocked_page$field:int;

		private var hasField$0:uint = 0;

		public function clearUnlockedPage():void {
			hasField$0 &= 0xfffffffe;
			unlocked_page$field = new int();
		}

		public function get hasUnlockedPage():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set unlockedPage(value:int):void {
			hasField$0 |= 0x1;
			unlocked_page$field = value;
		}

		public function get unlockedPage():int {
			return unlocked_page$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUnlockedPage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, unlocked_page$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var unlocked_page$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (unlocked_page$count != 0) {
						throw new flash.errors.IOError('Bad data format: StorageGoodsContainerProto.unlockedPage cannot be set twice.');
					}
					++unlocked_page$count;
					this.unlockedPage = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
