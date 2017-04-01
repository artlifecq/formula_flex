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
	public dynamic final class FamilyAnimalBarSceneProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MONSTER_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyAnimalBarSceneProto.monster_id", "monsterId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var monster_id$field:int;

		private var hasField$0:uint = 0;

		public function clearMonsterId():void {
			hasField$0 &= 0xfffffffe;
			monster_id$field = new int();
		}

		public function get hasMonsterId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set monsterId(value:int):void {
			hasField$0 |= 0x1;
			monster_id$field = value;
		}

		public function get monsterId():int {
			return monster_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMonsterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, monster_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var monster_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (monster_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyAnimalBarSceneProto.monsterId cannot be set twice.');
					}
					++monster_id$count;
					this.monsterId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
