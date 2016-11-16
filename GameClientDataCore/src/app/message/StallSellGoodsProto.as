package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StallSellGoodsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IDX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallSellGoodsProto.idx", "idx", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.StallSellGoodsProto.goods", "goods", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsProto; });

		private var goods$field:app.message.GoodsProto;

		public function clearGoods():void {
			goods$field = null;
		}

		public function get hasGoods():Boolean {
			return goods$field != null;
		}

		public function set goods(value:app.message.GoodsProto):void {
			goods$field = value;
		}

		public function get goods():app.message.GoodsProto {
			return goods$field;
		}

		/**
		 *  @private
		 */
		public static const PRICE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallSellGoodsProto.price", "price", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const FLAG:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.StallSellGoodsProto.flag", "flag", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var flag$field:int;

		public function clearFlag():void {
			hasField$0 &= 0xfffffffb;
			flag$field = new int();
		}

		public function get hasFlag():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set flag(value:int):void {
			hasField$0 |= 0x4;
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
			if (hasGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, goods$field);
			}
			if (hasPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, price$field);
			}
			if (hasFlag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
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
			var goods$count:uint = 0;
			var price$count:uint = 0;
			var flag$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (idx$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallSellGoodsProto.idx cannot be set twice.');
					}
					++idx$count;
					this.idx = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallSellGoodsProto.goods cannot be set twice.');
					}
					++goods$count;
					this.goods = new app.message.GoodsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.goods);
					break;
				case 3:
					if (price$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallSellGoodsProto.price cannot be set twice.');
					}
					++price$count;
					this.price = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (flag$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallSellGoodsProto.flag cannot be set twice.');
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
