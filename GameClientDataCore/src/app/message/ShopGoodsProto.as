package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AmountType;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ShopGoodsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PRICE_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.ShopGoodsProto.price_type", "priceType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.AmountType);

		private var price_type$field:int;

		private var hasField$0:uint = 0;

		public function clearPriceType():void {
			hasField$0 &= 0xfffffffe;
			price_type$field = new int();
		}

		public function get hasPriceType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set priceType(value:int):void {
			hasField$0 |= 0x1;
			price_type$field = value;
		}

		public function get priceType():int {
			return price_type$field;
		}

		/**
		 *  @private
		 */
		public static const PRICE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ShopGoodsProto.price", "price", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var price$field:int;

		public function clearPrice():void {
			hasField$0 &= 0xfffffffd;
			price$field = new int();
		}

		public function get hasPrice():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set price(value:int):void {
			hasField$0 |= 0x2;
			price$field = value;
		}

		public function get price():int {
			return price$field;
		}

		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.ShopGoodsProto.start_time", "startTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_time$field:Int64;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:Int64):void {
			start_time$field = value;
		}

		public function get startTime():Int64 {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		public static const END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.ShopGoodsProto.end_time", "endTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var end_time$field:Int64;

		public function clearEndTime():void {
			end_time$field = null;
		}

		public function get hasEndTime():Boolean {
			return end_time$field != null;
		}

		public function set endTime(value:Int64):void {
			end_time$field = value;
		}

		public function get endTime():Int64 {
			return end_time$field;
		}

		/**
		 *  @private
		 */
		public static const PROMOTION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ShopGoodsProto.promotion", "promotion", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var promotion$field:int;

		public function clearPromotion():void {
			hasField$0 &= 0xfffffffb;
			promotion$field = new int();
		}

		public function get hasPromotion():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set promotion(value:int):void {
			hasField$0 |= 0x4;
			promotion$field = value;
		}

		public function get promotion():int {
			return promotion$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_PRICE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ShopGoodsProto.show_price", "showPrice", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_price$field:int;

		public function clearShowPrice():void {
			hasField$0 &= 0xfffffff7;
			show_price$field = new int();
		}

		public function get hasShowPrice():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set showPrice(value:int):void {
			hasField$0 |= 0x8;
			show_price$field = value;
		}

		public function get showPrice():int {
			return show_price$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_WRAPPER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.ShopGoodsProto.goods_wrapper", "goodsWrapper", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		private var goods_wrapper$field:app.message.GoodsWrapperProto;

		public function clearGoodsWrapper():void {
			goods_wrapper$field = null;
		}

		public function get hasGoodsWrapper():Boolean {
			return goods_wrapper$field != null;
		}

		public function set goodsWrapper(value:app.message.GoodsWrapperProto):void {
			goods_wrapper$field = value;
		}

		public function get goodsWrapper():app.message.GoodsWrapperProto {
			return goods_wrapper$field;
		}

		/**
		 *  @private
		 */
		public static const DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.ShopGoodsProto.desc", "desc", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if (hasPriceType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, price_type$field);
			}
			if (hasPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, price$field);
			}
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, start_time$field);
			}
			if (hasEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, end_time$field);
			}
			if (hasPromotion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, promotion$field);
			}
			if (hasShowPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, show_price$field);
			}
			if (hasGoodsWrapper) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, goods_wrapper$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, desc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var price_type$count:uint = 0;
			var price$count:uint = 0;
			var start_time$count:uint = 0;
			var end_time$count:uint = 0;
			var promotion$count:uint = 0;
			var show_price$count:uint = 0;
			var goods_wrapper$count:uint = 0;
			var desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (price_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.priceType cannot be set twice.');
					}
					++price_type$count;
					this.priceType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (price$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.price cannot be set twice.');
					}
					++price$count;
					this.price = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.endTime cannot be set twice.');
					}
					++end_time$count;
					this.endTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 5:
					if (promotion$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.promotion cannot be set twice.');
					}
					++promotion$count;
					this.promotion = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (show_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.showPrice cannot be set twice.');
					}
					++show_price$count;
					this.showPrice = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (goods_wrapper$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.goodsWrapper cannot be set twice.');
					}
					++goods_wrapper$count;
					this.goodsWrapper = new app.message.GoodsWrapperProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.goodsWrapper);
					break;
				case 8:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopGoodsProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
