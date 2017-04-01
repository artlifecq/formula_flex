package app.message.Config {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Config.AllGoodsContainerUnlockProto.StorageUnlockProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AllGoodsContainerUnlockProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DEPOT_MAX_SIZE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.Config.AllGoodsContainerUnlockProto.depot_max_size", "depotMaxSize", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var depot_max_size$field:int;

		private var hasField$0:uint = 0;

		public function clearDepotMaxSize():void {
			hasField$0 &= 0xfffffffe;
			depot_max_size$field = new int();
		}

		public function get hasDepotMaxSize():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set depotMaxSize(value:int):void {
			hasField$0 |= 0x1;
			depot_max_size$field = value;
		}

		public function get depotMaxSize():int {
			return depot_max_size$field;
		}

		/**
		 *  @private
		 */
		public static const DEPOT_UNLOCK_MONEY_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.Config.AllGoodsContainerUnlockProto.depot_unlock_money_cost", "depotUnlockMoneyCost", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var depot_unlock_money_cost$field:int;

		public function clearDepotUnlockMoneyCost():void {
			hasField$0 &= 0xfffffffd;
			depot_unlock_money_cost$field = new int();
		}

		public function get hasDepotUnlockMoneyCost():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set depotUnlockMoneyCost(value:int):void {
			hasField$0 |= 0x2;
			depot_unlock_money_cost$field = value;
		}

		public function get depotUnlockMoneyCost():int {
			return depot_unlock_money_cost$field;
		}

		/**
		 *  @private
		 */
		public static const DEPOT_UNLOCK_BAND_MONEY_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.Config.AllGoodsContainerUnlockProto.depot_unlock_band_money_cost", "depotUnlockBandMoneyCost", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var depot_unlock_band_money_cost$field:int;

		public function clearDepotUnlockBandMoneyCost():void {
			hasField$0 &= 0xfffffffb;
			depot_unlock_band_money_cost$field = new int();
		}

		public function get hasDepotUnlockBandMoneyCost():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set depotUnlockBandMoneyCost(value:int):void {
			hasField$0 |= 0x4;
			depot_unlock_band_money_cost$field = value;
		}

		public function get depotUnlockBandMoneyCost():int {
			return depot_unlock_band_money_cost$field;
		}

		/**
		 *  @private
		 */
		public static const STORAGE_DATAS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.Config.AllGoodsContainerUnlockProto.storage_datas", "storageDatas", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Config.AllGoodsContainerUnlockProto.StorageUnlockProto; });

		[ArrayElementType("app.message.Config.AllGoodsContainerUnlockProto.StorageUnlockProto")]
		public var storageDatas:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDepotMaxSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, depot_max_size$field);
			}
			if (hasDepotUnlockMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, depot_unlock_money_cost$field);
			}
			if (hasDepotUnlockBandMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, depot_unlock_band_money_cost$field);
			}
			for (var storageDatas$index:uint = 0; storageDatas$index < this.storageDatas.length; ++storageDatas$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.storageDatas[storageDatas$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var depot_max_size$count:uint = 0;
			var depot_unlock_money_cost$count:uint = 0;
			var depot_unlock_band_money_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (depot_max_size$count != 0) {
						throw new flash.errors.IOError('Bad data format: AllGoodsContainerUnlockProto.depotMaxSize cannot be set twice.');
					}
					++depot_max_size$count;
					this.depotMaxSize = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (depot_unlock_money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: AllGoodsContainerUnlockProto.depotUnlockMoneyCost cannot be set twice.');
					}
					++depot_unlock_money_cost$count;
					this.depotUnlockMoneyCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (depot_unlock_band_money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: AllGoodsContainerUnlockProto.depotUnlockBandMoneyCost cannot be set twice.');
					}
					++depot_unlock_band_money_cost$count;
					this.depotUnlockBandMoneyCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					this.storageDatas.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.Config.AllGoodsContainerUnlockProto.StorageUnlockProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
