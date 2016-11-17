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
	public dynamic final class StallMiscProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SELL_MAX_PRICE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallMiscProto.sell_max_price", "sellMaxPrice", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sell_max_price$field:int;

		private var hasField$0:uint = 0;

		public function clearSellMaxPrice():void {
			hasField$0 &= 0xfffffffe;
			sell_max_price$field = new int();
		}

		public function get hasSellMaxPrice():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sellMaxPrice(value:int):void {
			hasField$0 |= 0x1;
			sell_max_price$field = value;
		}

		public function get sellMaxPrice():int {
			return sell_max_price$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_MAX_PRICE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallMiscProto.buy_max_price", "buyMaxPrice", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buy_max_price$field:int;

		public function clearBuyMaxPrice():void {
			hasField$0 &= 0xfffffffd;
			buy_max_price$field = new int();
		}

		public function get hasBuyMaxPrice():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set buyMaxPrice(value:int):void {
			hasField$0 |= 0x2;
			buy_max_price$field = value;
		}

		public function get buyMaxPrice():int {
			return buy_max_price$field;
		}

		/**
		 *  @private
		 */
		public static const STALL_TAX_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallMiscProto.stall_tax_percent", "stallTaxPercent", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stall_tax_percent$field:int;

		public function clearStallTaxPercent():void {
			hasField$0 &= 0xfffffffb;
			stall_tax_percent$field = new int();
		}

		public function get hasStallTaxPercent():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set stallTaxPercent(value:int):void {
			hasField$0 |= 0x4;
			stall_tax_percent$field = value;
		}

		public function get stallTaxPercent():int {
			return stall_tax_percent$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSellMaxPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sell_max_price$field);
			}
			if (hasBuyMaxPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, buy_max_price$field);
			}
			if (hasStallTaxPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, stall_tax_percent$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sell_max_price$count:uint = 0;
			var buy_max_price$count:uint = 0;
			var stall_tax_percent$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sell_max_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallMiscProto.sellMaxPrice cannot be set twice.');
					}
					++sell_max_price$count;
					this.sellMaxPrice = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (buy_max_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallMiscProto.buyMaxPrice cannot be set twice.');
					}
					++buy_max_price$count;
					this.buyMaxPrice = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (stall_tax_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallMiscProto.stallTaxPercent cannot be set twice.');
					}
					++stall_tax_percent$count;
					this.stallTaxPercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
