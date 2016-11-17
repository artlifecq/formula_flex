package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.StallBuyGoodsProto;
	import app.message.StallSellGoodsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StallDetailProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STALL_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallDetailProto.stall_id", "stallId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stall_id$field:int;

		private var hasField$0:uint = 0;

		public function clearStallId():void {
			hasField$0 &= 0xfffffffe;
			stall_id$field = new int();
		}

		public function get hasStallId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set stallId(value:int):void {
			hasField$0 |= 0x1;
			stall_id$field = value;
		}

		public function get stallId():int {
			return stall_id$field;
		}

		/**
		 *  @private
		 */
		public static const STALL_VERSION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallDetailProto.stall_version", "stallVersion", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stall_version$field:int;

		public function clearStallVersion():void {
			hasField$0 &= 0xfffffffd;
			stall_version$field = new int();
		}

		public function get hasStallVersion():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set stallVersion(value:int):void {
			hasField$0 |= 0x2;
			stall_version$field = value;
		}

		public function get stallVersion():int {
			return stall_version$field;
		}

		/**
		 *  @private
		 */
		public static const SELL_GOODS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.StallDetailProto.sell_goods", "sellGoods", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StallSellGoodsProto; });

		[ArrayElementType("app.message.StallSellGoodsProto")]
		public var sellGoods:Array = [];

		/**
		 *  @private
		 */
		public static const BUY_GOODS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.StallDetailProto.buy_goods", "buyGoods", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StallBuyGoodsProto; });

		[ArrayElementType("app.message.StallBuyGoodsProto")]
		public var buyGoods:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStallId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, stall_id$field);
			}
			if (hasStallVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, stall_version$field);
			}
			for (var sellGoods$index:uint = 0; sellGoods$index < this.sellGoods.length; ++sellGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.sellGoods[sellGoods$index]);
			}
			for (var buyGoods$index:uint = 0; buyGoods$index < this.buyGoods.length; ++buyGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.buyGoods[buyGoods$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var stall_id$count:uint = 0;
			var stall_version$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (stall_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallDetailProto.stallId cannot be set twice.');
					}
					++stall_id$count;
					this.stallId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (stall_version$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallDetailProto.stallVersion cannot be set twice.');
					}
					++stall_version$count;
					this.stallVersion = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					this.sellGoods.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.StallSellGoodsProto()));
					break;
				case 4:
					this.buyGoods.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.StallBuyGoodsProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
