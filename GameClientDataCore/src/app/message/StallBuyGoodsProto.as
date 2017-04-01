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
	public dynamic final class StallBuyGoodsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IDX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallBuyGoodsProto.idx", "idx", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var idx$field:int;

		private var hasField$0:uint = 0;

		public function clearIdx():void {
			hasField$0 &= 0xfffffffe;
			idx$field = new int();
		}

		public function get hasIdx():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set idx(value:int):void {
			hasField$0 |= 0x1;
			idx$field = value;
		}

		public function get idx():int {
			return idx$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallBuyGoodsProto.goods_id", "goodsId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var goods_id$field:int;

		public function clearGoodsId():void {
			hasField$0 &= 0xfffffffd;
			goods_id$field = new int();
		}

		public function get hasGoodsId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set goodsId(value:int):void {
			hasField$0 |= 0x2;
			goods_id$field = value;
		}

		public function get goodsId():int {
			return goods_id$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_PRICE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallBuyGoodsProto.buy_price", "buyPrice", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buy_price$field:int;

		public function clearBuyPrice():void {
			hasField$0 &= 0xfffffffb;
			buy_price$field = new int();
		}

		public function get hasBuyPrice():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set buyPrice(value:int):void {
			hasField$0 |= 0x4;
			buy_price$field = value;
		}

		public function get buyPrice():int {
			return buy_price$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallBuyGoodsProto.buy_count", "buyCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buy_count$field:int;

		public function clearBuyCount():void {
			hasField$0 &= 0xfffffff7;
			buy_count$field = new int();
		}

		public function get hasBuyCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set buyCount(value:int):void {
			hasField$0 |= 0x8;
			buy_count$field = value;
		}

		public function get buyCount():int {
			return buy_count$field;
		}

		/**
		 *  @private
		 */
		public static const FLAG:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallBuyGoodsProto.flag", "flag", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var flag$field:int;

		public function clearFlag():void {
			hasField$0 &= 0xffffffef;
			flag$field = new int();
		}

		public function get hasFlag():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set flag(value:int):void {
			hasField$0 |= 0x10;
			flag$field = value;
		}

		public function get flag():int {
			return flag$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIdx) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, idx$field);
			}
			if (hasGoodsId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, goods_id$field);
			}
			if (hasBuyPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, buy_price$field);
			}
			if (hasBuyCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, buy_count$field);
			}
			if (hasFlag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, flag$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var idx$count:uint = 0;
			var goods_id$count:uint = 0;
			var buy_price$count:uint = 0;
			var buy_count$count:uint = 0;
			var flag$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (idx$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallBuyGoodsProto.idx cannot be set twice.');
					}
					++idx$count;
					this.idx = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (goods_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallBuyGoodsProto.goodsId cannot be set twice.');
					}
					++goods_id$count;
					this.goodsId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (buy_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallBuyGoodsProto.buyPrice cannot be set twice.');
					}
					++buy_price$count;
					this.buyPrice = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (buy_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallBuyGoodsProto.buyCount cannot be set twice.');
					}
					++buy_count$count;
					this.buyCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (flag$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallBuyGoodsProto.flag cannot be set twice.');
					}
					++flag$count;
					this.flag = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
