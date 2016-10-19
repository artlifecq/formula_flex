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
	public dynamic final class StallTypeDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.StallTypeDataProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_STALL_NAME_LENGTH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.max_stall_name_length", "maxStallNameLength", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_stall_name_length$field:int;

		public function clearMaxStallNameLength():void {
			hasField$0 &= 0xfffffffd;
			max_stall_name_length$field = new int();
		}

		public function get hasMaxStallNameLength():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set maxStallNameLength(value:int):void {
			hasField$0 |= 0x2;
			max_stall_name_length$field = value;
		}

		public function get maxStallNameLength():int {
			return max_stall_name_length$field;
		}

		/**
		 *  @private
		 */
		public static const SELL_GOODS_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.sell_goods_count", "sellGoodsCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sell_goods_count$field:int;

		public function clearSellGoodsCount():void {
			hasField$0 &= 0xfffffffb;
			sell_goods_count$field = new int();
		}

		public function get hasSellGoodsCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set sellGoodsCount(value:int):void {
			hasField$0 |= 0x4;
			sell_goods_count$field = value;
		}

		public function get sellGoodsCount():int {
			return sell_goods_count$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_GOODS_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.buy_goods_count", "buyGoodsCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buy_goods_count$field:int;

		public function clearBuyGoodsCount():void {
			hasField$0 &= 0xfffffff7;
			buy_goods_count$field = new int();
		}

		public function get hasBuyGoodsCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set buyGoodsCount(value:int):void {
			hasField$0 |= 0x8;
			buy_goods_count$field = value;
		}

		public function get buyGoodsCount():int {
			return buy_goods_count$field;
		}

		/**
		 *  @private
		 */
		public static const STALL_FEE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.stall_fee", "stallFee", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stall_fee$field:int;

		public function clearStallFee():void {
			hasField$0 &= 0xffffffef;
			stall_fee$field = new int();
		}

		public function get hasStallFee():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set stallFee(value:int):void {
			hasField$0 |= 0x10;
			stall_fee$field = value;
		}

		public function get stallFee():int {
			return stall_fee$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_PRICE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.buy_price", "buyPrice", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var buy_price$field:int;

		public function clearBuyPrice():void {
			hasField$0 &= 0xffffffdf;
			buy_price$field = new int();
		}

		public function get hasBuyPrice():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set buyPrice(value:int):void {
			hasField$0 |= 0x20;
			buy_price$field = value;
		}

		public function get buyPrice():int {
			return buy_price$field;
		}

		/**
		 *  @private
		 */
		public static const MIN_BUY_HOUR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.min_buy_hour", "minBuyHour", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var min_buy_hour$field:int;

		public function clearMinBuyHour():void {
			hasField$0 &= 0xffffffbf;
			min_buy_hour$field = new int();
		}

		public function get hasMinBuyHour():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set minBuyHour(value:int):void {
			hasField$0 |= 0x40;
			min_buy_hour$field = value;
		}

		public function get minBuyHour():int {
			return min_buy_hour$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_BUY_HOUR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.max_buy_hour", "maxBuyHour", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_buy_hour$field:int;

		public function clearMaxBuyHour():void {
			hasField$0 &= 0xffffff7f;
			max_buy_hour$field = new int();
		}

		public function get hasMaxBuyHour():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set maxBuyHour(value:int):void {
			hasField$0 |= 0x80;
			max_buy_hour$field = value;
		}

		public function get maxBuyHour():int {
			return max_buy_hour$field;
		}

		/**
		 *  @private
		 */
		public static const AD_MAX_LENGTH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.StallTypeDataProto.ad_max_length", "adMaxLength", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ad_max_length$field:int;

		public function clearAdMaxLength():void {
			hasField$0 &= 0xfffffeff;
			ad_max_length$field = new int();
		}

		public function get hasAdMaxLength():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set adMaxLength(value:int):void {
			hasField$0 |= 0x100;
			ad_max_length$field = value;
		}

		public function get adMaxLength():int {
			return ad_max_length$field;
		}

		/**
		 *  @private
		 */
		public static const BROADCAST_AD_DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.StallTypeDataProto.broadcast_ad_duration", "broadcastAdDuration", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var broadcast_ad_duration$field:Int64;

		public function clearBroadcastAdDuration():void {
			broadcast_ad_duration$field = null;
		}

		public function get hasBroadcastAdDuration():Boolean {
			return broadcast_ad_duration$field != null;
		}

		public function set broadcastAdDuration(value:Int64):void {
			broadcast_ad_duration$field = value;
		}

		public function get broadcastAdDuration():Int64 {
			return broadcast_ad_duration$field;
		}

		/**
		 *  @private
		 */
		public static const STALL_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.StallTypeDataProto.stall_res", "stallRes", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var stall_res$field:String;

		public function clearStallRes():void {
			stall_res$field = null;
		}

		public function get hasStallRes():Boolean {
			return stall_res$field != null;
		}

		public function set stallRes(value:String):void {
			stall_res$field = value;
		}

		public function get stallRes():String {
			return stall_res$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasMaxStallNameLength) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_stall_name_length$field);
			}
			if (hasSellGoodsCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, sell_goods_count$field);
			}
			if (hasBuyGoodsCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, buy_goods_count$field);
			}
			if (hasStallFee) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, stall_fee$field);
			}
			if (hasBuyPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, buy_price$field);
			}
			if (hasMinBuyHour) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, min_buy_hour$field);
			}
			if (hasMaxBuyHour) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_buy_hour$field);
			}
			if (hasAdMaxLength) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ad_max_length$field);
			}
			if (hasBroadcastAdDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, broadcast_ad_duration$field);
			}
			if (hasStallRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, stall_res$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var name$count:uint = 0;
			var max_stall_name_length$count:uint = 0;
			var sell_goods_count$count:uint = 0;
			var buy_goods_count$count:uint = 0;
			var stall_fee$count:uint = 0;
			var buy_price$count:uint = 0;
			var min_buy_hour$count:uint = 0;
			var max_buy_hour$count:uint = 0;
			var ad_max_length$count:uint = 0;
			var broadcast_ad_duration$count:uint = 0;
			var stall_res$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (max_stall_name_length$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.maxStallNameLength cannot be set twice.');
					}
					++max_stall_name_length$count;
					this.maxStallNameLength = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (sell_goods_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.sellGoodsCount cannot be set twice.');
					}
					++sell_goods_count$count;
					this.sellGoodsCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (buy_goods_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.buyGoodsCount cannot be set twice.');
					}
					++buy_goods_count$count;
					this.buyGoodsCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (stall_fee$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.stallFee cannot be set twice.');
					}
					++stall_fee$count;
					this.stallFee = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (buy_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.buyPrice cannot be set twice.');
					}
					++buy_price$count;
					this.buyPrice = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (min_buy_hour$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.minBuyHour cannot be set twice.');
					}
					++min_buy_hour$count;
					this.minBuyHour = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (max_buy_hour$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.maxBuyHour cannot be set twice.');
					}
					++max_buy_hour$count;
					this.maxBuyHour = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (ad_max_length$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.adMaxLength cannot be set twice.');
					}
					++ad_max_length$count;
					this.adMaxLength = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (broadcast_ad_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.broadcastAdDuration cannot be set twice.');
					}
					++broadcast_ad_duration$count;
					this.broadcastAdDuration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 20:
					if (stall_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallTypeDataProto.stallRes cannot be set twice.');
					}
					++stall_res$count;
					this.stallRes = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
