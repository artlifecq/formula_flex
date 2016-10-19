package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentRefineCostDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentRefineCostDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentRefineCostDataProto.refine_times", "refineTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refine_times$field:int;

		public function clearRefineTimes():void {
			hasField$0 &= 0xfffffffd;
			refine_times$field = new int();
		}

		public function get hasRefineTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set refineTimes(value:int):void {
			hasField$0 |= 0x2;
			refine_times$field = value;
		}

		public function get refineTimes():int {
			return refine_times$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentRefineCostDataProto.upgrade_data", "upgradeData", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var upgrade_data$field:app.message.UpgradeProto;

		public function clearUpgradeData():void {
			upgrade_data$field = null;
		}

		public function get hasUpgradeData():Boolean {
			return upgrade_data$field != null;
		}

		public function set upgradeData(value:app.message.UpgradeProto):void {
			upgrade_data$field = value;
		}

		public function get upgradeData():app.message.UpgradeProto {
			return upgrade_data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasRefineTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, refine_times$field);
			}
			if (hasUpgradeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, upgrade_data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var refine_times$count:uint = 0;
			var upgrade_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineCostDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (refine_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineCostDataProto.refineTimes cannot be set twice.');
					}
					++refine_times$count;
					this.refineTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (upgrade_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineCostDataProto.upgradeData cannot be set twice.');
					}
					++upgrade_data$count;
					this.upgradeData = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.upgradeData);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
