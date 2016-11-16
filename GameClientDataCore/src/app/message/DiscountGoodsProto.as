package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DiscountGoodsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.DiscountGoodsProto.goods", "goods", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		private var goods$field:app.message.GoodsWrapperProto;

		public function clearGoods():void {
			goods$field = null;
		}

		public function get hasGoods():Boolean {
			return goods$field != null;
		}

		public function set goods(value:app.message.GoodsWrapperProto):void {
			goods$field = value;
		}

		public function get goods():app.message.GoodsWrapperProto {
			return goods$field;
		}

		/**
		 *  @private
		 */
		public static const PRICE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DiscountGoodsProto.price", "price", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var price$field:int;

		private var hasField$0:uint = 0;

		public function clearPrice():void {
			hasField$0 &= 0xfffffffe;
			price$field = new int();
		}

		public function get hasPrice():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set price(value:int):void {
			hasField$0 |= 0x1;
			price$field = value;
		}

		public function get price():int {
			return price$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_PRICE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DiscountGoodsProto.show_price", "showPrice", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_price$field:int;

		public function clearShowPrice():void {
			hasField$0 &= 0xfffffffd;
			show_price$field = new int();
		}

		public function get hasShowPrice():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set showPrice(value:int):void {
			hasField$0 |= 0x2;
			show_price$field = value;
		}

		public function get showPrice():int {
			return show_price$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DiscountGoodsProto.count_limit", "countLimit", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count_limit$field:int;

		public function clearCountLimit():void {
			hasField$0 &= 0xfffffffb;
			count_limit$field = new int();
		}

		public function get hasCountLimit():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set countLimit(value:int):void {
			hasField$0 |= 0x4;
			count_limit$field = value;
		}

		public function get countLimit():int {
			return count_limit$field;
		}

		/**
		 *  @private
		 */
		public static const PROMOTION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DiscountGoodsProto.promotion", "promotion", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var promotion$field:int;

		public function clearPromotion():void {
			hasField$0 &= 0xfffffff7;
			promotion$field = new int();
		}

		public function get hasPromotion():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set promotion(value:int):void {
			hasField$0 |= 0x8;
			promotion$field = value;
		}

		public function get promotion():int {
			return promotion$field;
		}

		/**
		 *  @private
		 */
		public static const RATIO:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DiscountGoodsProto.ratio", "ratio", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ratio$field:int;

		public function clearRatio():void {
			hasField$0 &= 0xffffffef;
			ratio$field = new int();
		}

		public function get hasRatio():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set ratio(value:int):void {
			hasField$0 |= 0x10;
			ratio$field = value;
		}

		public function get ratio():int {
			return ratio$field;
		}

		/**
		 *  @private
		 */
		public static const DESC:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.DiscountGoodsProto.desc", "desc", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, goods$field);
			}
			if (hasPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, price$field);
			}
			if (hasShowPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, show_price$field);
			}
			if (hasCountLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, count_limit$field);
			}
			if (hasPromotion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, promotion$field);
			}
			if (hasRatio) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, ratio$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, desc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var goods$count:uint = 0;
			var price$count:uint = 0;
			var show_price$count:uint = 0;
			var count_limit$count:uint = 0;
			var promotion$count:uint = 0;
			var ratio$count:uint = 0;
			var desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountGoodsProto.goods cannot be set twice.');
					}
					++goods$count;
					this.goods = new app.message.GoodsWrapperProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.goods);
					break;
				case 2:
					if (price$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountGoodsProto.price cannot be set twice.');
					}
					++price$count;
					this.price = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (show_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountGoodsProto.showPrice cannot be set twice.');
					}
					++show_price$count;
					this.showPrice = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (count_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountGoodsProto.countLimit cannot be set twice.');
					}
					++count_limit$count;
					this.countLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (promotion$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountGoodsProto.promotion cannot be set twice.');
					}
					++promotion$count;
					this.promotion = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (ratio$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountGoodsProto.ratio cannot be set twice.');
					}
					++ratio$count;
					this.ratio = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountGoodsProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
