package app.message.GuildNewsProto {
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
	public dynamic final class UpgradeLevelProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_AFTER_UPGRADE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildNewsProto.UpgradeLevelProto.level_after_upgrade", "levelAfterUpgrade", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_after_upgrade$field:int;

		private var hasField$0:uint = 0;

		public function clearLevelAfterUpgrade():void {
			hasField$0 &= 0xfffffffe;
			level_after_upgrade$field = new int();
		}

		public function get hasLevelAfterUpgrade():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set levelAfterUpgrade(value:int):void {
			hasField$0 |= 0x1;
			level_after_upgrade$field = value;
		}

		public function get levelAfterUpgrade():int {
			return level_after_upgrade$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevelAfterUpgrade) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level_after_upgrade$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level_after_upgrade$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level_after_upgrade$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeLevelProto.levelAfterUpgrade cannot be set twice.');
					}
					++level_after_upgrade$count;
					this.levelAfterUpgrade = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
