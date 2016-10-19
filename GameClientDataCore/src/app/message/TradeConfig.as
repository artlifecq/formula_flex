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
	public dynamic final class TradeConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TRADE_GOODS_LIMIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TradeConfig.trade_goods_limit", "tradeGoodsLimit", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var trade_goods_limit$field:int;

		private var hasField$0:uint = 0;

		public function clearTradeGoodsLimit():void {
			hasField$0 &= 0xfffffffe;
			trade_goods_limit$field = new int();
		}

		public function get hasTradeGoodsLimit():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set tradeGoodsLimit(value:int):void {
			hasField$0 |= 0x1;
			trade_goods_limit$field = value;
		}

		public function get tradeGoodsLimit():int {
			return trade_goods_limit$field;
		}

		/**
		 *  @private
		 */
		public static const TRADE_INVITE_EXPIRE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.TradeConfig.trade_invite_expire_time", "tradeInviteExpireTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var trade_invite_expire_time$field:Int64;

		public function clearTradeInviteExpireTime():void {
			trade_invite_expire_time$field = null;
		}

		public function get hasTradeInviteExpireTime():Boolean {
			return trade_invite_expire_time$field != null;
		}

		public function set tradeInviteExpireTime(value:Int64):void {
			trade_invite_expire_time$field = value;
		}

		public function get tradeInviteExpireTime():Int64 {
			return trade_invite_expire_time$field;
		}

		/**
		 *  @private
		 */
		public static const TRADE_MAX_DISTANCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TradeConfig.trade_max_distance", "tradeMaxDistance", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var trade_max_distance$field:int;

		public function clearTradeMaxDistance():void {
			hasField$0 &= 0xfffffffd;
			trade_max_distance$field = new int();
		}

		public function get hasTradeMaxDistance():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set tradeMaxDistance(value:int):void {
			hasField$0 |= 0x2;
			trade_max_distance$field = value;
		}

		public function get tradeMaxDistance():int {
			return trade_max_distance$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTradeGoodsLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, trade_goods_limit$field);
			}
			if (hasTradeInviteExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, trade_invite_expire_time$field);
			}
			if (hasTradeMaxDistance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, trade_max_distance$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var trade_goods_limit$count:uint = 0;
			var trade_invite_expire_time$count:uint = 0;
			var trade_max_distance$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (trade_goods_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: TradeConfig.tradeGoodsLimit cannot be set twice.');
					}
					++trade_goods_limit$count;
					this.tradeGoodsLimit = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (trade_invite_expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: TradeConfig.tradeInviteExpireTime cannot be set twice.');
					}
					++trade_invite_expire_time$count;
					this.tradeInviteExpireTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (trade_max_distance$count != 0) {
						throw new flash.errors.IOError('Bad data format: TradeConfig.tradeMaxDistance cannot be set twice.');
					}
					++trade_max_distance$count;
					this.tradeMaxDistance = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
