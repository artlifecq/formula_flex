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
	public dynamic final class DepotGoodsContainerProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UNLOCKED_SIZE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GoodsContainerProto.DepotGoodsContainerProto.unlocked_size", "unlockedSize", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var unlocked_size$field:int;

		private var hasField$0:uint = 0;

		public function clearUnlockedSize():void {
			hasField$0 &= 0xfffffffe;
			unlocked_size$field = new int();
		}

		public function get hasUnlockedSize():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set unlockedSize(value:int):void {
			hasField$0 |= 0x1;
			unlocked_size$field = value;
		}

		public function get unlockedSize():int {
			return unlocked_size$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUnlockedSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, unlocked_size$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var unlocked_size$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (unlocked_size$count != 0) {
						throw new flash.errors.IOError('Bad data format: DepotGoodsContainerProto.unlockedSize cannot be set twice.');
					}
					++unlocked_size$count;
					this.unlockedSize = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
