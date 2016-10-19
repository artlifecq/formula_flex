package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto.UpgradeGoodsInfoProto;
	import app.message.AmountValue;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UpgradeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GOODS_INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.UpgradeProto.goods_info", "goodsInfo", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto.UpgradeGoodsInfoProto; });

		[ArrayElementType("app.message.UpgradeProto.UpgradeGoodsInfoProto")]
		public var goodsInfo:Array = [];

		/**
		 *  @private
		 */
		public static const AMOUNT_COST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.UpgradeProto.amount_cost", "amountCost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AmountValue; });

		[ArrayElementType("app.message.AmountValue")]
		public var amountCost:Array = [];

		/**
		 *  @private
		 */
		public static const BLESS_MAX_AMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradeProto.bless_max_amount", "blessMaxAmount", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bless_max_amount$field:int;

		private var hasField$0:uint = 0;

		public function clearBlessMaxAmount():void {
			hasField$0 &= 0xfffffffe;
			bless_max_amount$field = new int();
		}

		public function get hasBlessMaxAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set blessMaxAmount(value:int):void {
			hasField$0 |= 0x1;
			bless_max_amount$field = value;
		}

		public function get blessMaxAmount():int {
			return bless_max_amount$field;
		}

		/**
		 *  @private
		 */
		public static const RATE_DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.UpgradeProto.rate_desc", "rateDesc", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rate_desc$field:String;

		public function clearRateDesc():void {
			rate_desc$field = null;
		}

		public function get hasRateDesc():Boolean {
			return rate_desc$field != null;
		}

		public function set rateDesc(value:String):void {
			rate_desc$field = value;
		}

		public function get rateDesc():String {
			return rate_desc$field;
		}

		/**
		 *  @private
		 */
		public static const RATE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.UpgradeProto.rate", "rate", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rate$field:int;

		public function clearRate():void {
			hasField$0 &= 0xfffffffd;
			rate$field = new int();
		}

		public function get hasRate():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set rate(value:int):void {
			hasField$0 |= 0x2;
			rate$field = value;
		}

		public function get rate():int {
			return rate$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var goodsInfo$index:uint = 0; goodsInfo$index < this.goodsInfo.length; ++goodsInfo$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.goodsInfo[goodsInfo$index]);
			}
			for (var amountCost$index:uint = 0; amountCost$index < this.amountCost.length; ++amountCost$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amountCost[amountCost$index]);
			}
			if (hasBlessMaxAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bless_max_amount$field);
			}
			if (hasRateDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, rate_desc$field);
			}
			if (hasRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rate$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var bless_max_amount$count:uint = 0;
			var rate_desc$count:uint = 0;
			var rate$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.goodsInfo.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.UpgradeProto.UpgradeGoodsInfoProto()));
					break;
				case 2:
					this.amountCost.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.AmountValue()));
					break;
				case 10:
					if (bless_max_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeProto.blessMaxAmount cannot be set twice.');
					}
					++bless_max_amount$count;
					this.blessMaxAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (rate_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeProto.rateDesc cannot be set twice.');
					}
					++rate_desc$count;
					this.rateDesc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (rate$count != 0) {
						throw new flash.errors.IOError('Bad data format: UpgradeProto.rate cannot be set twice.');
					}
					++rate$count;
					this.rate = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
