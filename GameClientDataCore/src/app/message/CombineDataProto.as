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
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CombineDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CombineDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const UPGRADE_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CombineDataProto.upgrade_data", "upgradeData", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

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
		public static const PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CombineDataProto.prize", "prize", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		private var prize$field:app.message.GoodsWrapperProto;

		public function clearPrize():void {
			prize$field = null;
		}

		public function get hasPrize():Boolean {
			return prize$field != null;
		}

		public function set prize(value:app.message.GoodsWrapperProto):void {
			prize$field = value;
		}

		public function get prize():app.message.GoodsWrapperProto {
			return prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasUpgradeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, upgrade_data$field);
			}
			if (hasPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, prize$field);
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
			var upgrade_data$count:uint = 0;
			var prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CombineDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (upgrade_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: CombineDataProto.upgradeData cannot be set twice.');
					}
					++upgrade_data$count;
					this.upgradeData = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.upgradeData);
					break;
				case 3:
					if (prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: CombineDataProto.prize cannot be set twice.');
					}
					++prize$count;
					this.prize = new app.message.GoodsWrapperProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.prize);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
