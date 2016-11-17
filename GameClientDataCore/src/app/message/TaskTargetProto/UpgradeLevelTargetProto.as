package app.message.TaskTargetProto {
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
	public dynamic final class UpgradeLevelTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UPGRADE_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.UpgradeLevelTargetProto.upgrade_level", "upgradeLevel", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_level$field:int;

		private var hasField$0:uint = 0;

		public function clearUpgradeLevel():void {
			hasField$0 &= 0xfffffffe;
			upgrade_level$field = new int();
		}

		public function get hasUpgradeLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set upgradeLevel(value:int):void {
			hasField$0 |= 0x1;
			upgrade_level$field = value;
		}

		public function get upgradeLevel():int {
			return upgrade_level$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_RECOMMEND_MONSTER:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.UpgradeLevelTargetProto.upgrade_recommend_monster", "upgradeRecommendMonster", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var upgradeRecommendMonster:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUpgradeLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, upgrade_level$field);
			}
			for (var upgradeRecommendMonster$index:uint = 0; upgradeRecommendMonster$index < this.upgradeRecommendMonster.length; ++upgradeRecommendMonster$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.upgradeRecommendMonster[upgradeRecommendMonster$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var upgrade_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (upgrade_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeLevelTargetProto.upgradeLevel cannot be set twice.');
					}
					++upgrade_level$count;
					this.upgradeLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.upgradeRecommendMonster);
						break;
					}
					this.upgradeRecommendMonster.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
