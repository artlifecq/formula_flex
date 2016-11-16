package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentBuildMaterialProto.MaterialGroupDataWithCountProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentBuildMaterialProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GROUP_WITH_COUNT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.EquipmentBuildMaterialProto.group_with_count", "groupWithCount", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentBuildMaterialProto.MaterialGroupDataWithCountProto; });

		[ArrayElementType("app.message.EquipmentBuildMaterialProto.MaterialGroupDataWithCountProto")]
		public var groupWithCount:Array = [];

		/**
		 *  @private
		 */
		public static const MONEY_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentBuildMaterialProto.money_cost", "moneyCost", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_cost$field:int;

		private var hasField$0:uint = 0;

		public function clearMoneyCost():void {
			hasField$0 &= 0xfffffffe;
			money_cost$field = new int();
		}

		public function get hasMoneyCost():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set moneyCost(value:int):void {
			hasField$0 |= 0x1;
			money_cost$field = value;
		}

		public function get moneyCost():int {
			return money_cost$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIP_ID:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.EquipmentBuildMaterialProto.equip_id", "equipId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var equipId:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var groupWithCount$index:uint = 0; groupWithCount$index < this.groupWithCount.length; ++groupWithCount$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.groupWithCount[groupWithCount$index]);
			}
			if (hasMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, money_cost$field);
			}
			for (var equipId$index:uint = 0; equipId$index < this.equipId.length; ++equipId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.equipId[equipId$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var money_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.groupWithCount.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.EquipmentBuildMaterialProto.MaterialGroupDataWithCountProto()));
					break;
				case 2:
					if (money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentBuildMaterialProto.moneyCost cannot be set twice.');
					}
					++money_cost$count;
					this.moneyCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.equipId);
						break;
					}
					this.equipId.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
