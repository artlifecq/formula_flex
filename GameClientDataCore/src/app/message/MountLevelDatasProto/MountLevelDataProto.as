package app.message.MountLevelDatasProto {
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
	public dynamic final class MountLevelDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UPGRADE_EXP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MountLevelDatasProto.MountLevelDataProto.upgrade_exp", "upgradeExp", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_exp$field:Int64;

		public function clearUpgradeExp():void {
			upgrade_exp$field = null;
		}

		public function get hasUpgradeExp():Boolean {
			return upgrade_exp$field != null;
		}

		public function set upgradeExp(value:Int64):void {
			upgrade_exp$field = value;
		}

		public function get upgradeExp():Int64 {
			return upgrade_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUpgradeExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, upgrade_exp$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var upgrade_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (upgrade_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountLevelDataProto.upgradeExp cannot be set twice.');
					}
					++upgrade_exp$count;
					this.upgradeExp = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
