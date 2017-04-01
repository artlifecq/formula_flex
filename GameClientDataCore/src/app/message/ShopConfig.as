package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ShopProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ShopConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SYSTEM_SHOP:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ShopConfig.system_shop", "systemShop", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ShopProto; });

		private var system_shop$field:app.message.ShopProto;

		public function clearSystemShop():void {
			system_shop$field = null;
		}

		public function get hasSystemShop():Boolean {
			return system_shop$field != null;
		}

		public function set systemShop(value:app.message.ShopProto):void {
			system_shop$field = value;
		}

		public function get systemShop():app.message.ShopProto {
			return system_shop$field;
		}

		/**
		 *  @private
		 */
		public static const DEPOT_SHOP:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ShopConfig.depot_shop", "depotShop", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ShopProto; });

		private var depot_shop$field:app.message.ShopProto;

		public function clearDepotShop():void {
			depot_shop$field = null;
		}

		public function get hasDepotShop():Boolean {
			return depot_shop$field != null;
		}

		public function set depotShop(value:app.message.ShopProto):void {
			depot_shop$field = value;
		}

		public function get depotShop():app.message.ShopProto {
			return depot_shop$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_BACK_CAPACITY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ShopConfig.buy_back_capacity", "buyBackCapacity", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buy_back_capacity$field:int;

		private var hasField$0:uint = 0;

		public function clearBuyBackCapacity():void {
			hasField$0 &= 0xfffffffe;
			buy_back_capacity$field = new int();
		}

		public function get hasBuyBackCapacity():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set buyBackCapacity(value:int):void {
			hasField$0 |= 0x1;
			buy_back_capacity$field = value;
		}

		public function get buyBackCapacity():int {
			return buy_back_capacity$field;
		}

		/**
		 *  @private
		 */
		public static const REPAIR_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ShopConfig.repair_cost", "repairCost", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var repair_cost$field:int;

		public function clearRepairCost():void {
			hasField$0 &= 0xfffffffd;
			repair_cost$field = new int();
		}

		public function get hasRepairCost():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set repairCost(value:int):void {
			hasField$0 |= 0x2;
			repair_cost$field = value;
		}

		public function get repairCost():int {
			return repair_cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSystemShop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, system_shop$field);
			}
			if (hasDepotShop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, depot_shop$field);
			}
			if (hasBuyBackCapacity) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, buy_back_capacity$field);
			}
			if (hasRepairCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, repair_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var system_shop$count:uint = 0;
			var depot_shop$count:uint = 0;
			var buy_back_capacity$count:uint = 0;
			var repair_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (system_shop$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopConfig.systemShop cannot be set twice.');
					}
					++system_shop$count;
					this.systemShop = new app.message.ShopProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.systemShop);
					break;
				case 2:
					if (depot_shop$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopConfig.depotShop cannot be set twice.');
					}
					++depot_shop$count;
					this.depotShop = new app.message.ShopProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.depotShop);
					break;
				case 3:
					if (buy_back_capacity$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopConfig.buyBackCapacity cannot be set twice.');
					}
					++buy_back_capacity$count;
					this.buyBackCapacity = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (repair_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopConfig.repairCost cannot be set twice.');
					}
					++repair_cost$count;
					this.repairCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
