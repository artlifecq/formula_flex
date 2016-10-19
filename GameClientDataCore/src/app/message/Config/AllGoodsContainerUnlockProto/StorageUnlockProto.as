package app.message.Config.AllGoodsContainerUnlockProto {
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
	public dynamic final class StorageUnlockProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.Config.AllGoodsContainerUnlockProto.StorageUnlockProto.page", "page", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var page$field:int;

		private var hasField$0:uint = 0;

		public function clearPage():void {
			hasField$0 &= 0xfffffffe;
			page$field = new int();
		}

		public function get hasPage():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set page(value:int):void {
			hasField$0 |= 0x1;
			page$field = value;
		}

		public function get page():int {
			return page$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.Config.AllGoodsContainerUnlockProto.StorageUnlockProto.upgrade_data", "upgradeData", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

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
		public static const TOTAL_OPEN_SIZE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.Config.AllGoodsContainerUnlockProto.StorageUnlockProto.total_open_size", "totalOpenSize", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_open_size$field:int;

		public function clearTotalOpenSize():void {
			hasField$0 &= 0xfffffffd;
			total_open_size$field = new int();
		}

		public function get hasTotalOpenSize():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set totalOpenSize(value:int):void {
			hasField$0 |= 0x2;
			total_open_size$field = value;
		}

		public function get totalOpenSize():int {
			return total_open_size$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, page$field);
			}
			if (hasUpgradeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, upgrade_data$field);
			}
			if (hasTotalOpenSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, total_open_size$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var page$count:uint = 0;
			var upgrade_data$count:uint = 0;
			var total_open_size$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (page$count != 0) {
						throw new flash.errors.IOError('Bad data format: StorageUnlockProto.page cannot be set twice.');
					}
					++page$count;
					this.page = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (upgrade_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: StorageUnlockProto.upgradeData cannot be set twice.');
					}
					++upgrade_data$count;
					this.upgradeData = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.upgradeData);
					break;
				case 3:
					if (total_open_size$count != 0) {
						throw new flash.errors.IOError('Bad data format: StorageUnlockProto.totalOpenSize cannot be set twice.');
					}
					++total_open_size$count;
					this.totalOpenSize = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
