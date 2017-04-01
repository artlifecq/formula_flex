package app.message.AllBuyBackGoodsProto {
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
	public dynamic final class BuyBackGoodsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AllBuyBackGoodsProto.BuyBackGoodsProto.goods", "goods", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsProto; });

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
		public static const EXPIRE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.AllBuyBackGoodsProto.BuyBackGoodsProto.expire_time", "expireTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expire_time$field:Int64;

		public function clearExpireTime():void {
			expire_time$field = null;
		}

		public function get hasExpireTime():Boolean {
			return expire_time$field != null;
		}

		public function set expireTime(value:Int64):void {
			expire_time$field = value;
		}

		public function get expireTime():Int64 {
			return expire_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, goods$field);
			}
			if (hasExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, expire_time$field);
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
			var expire_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: BuyBackGoodsProto.goods cannot be set twice.');
					}
					++goods$count;
					this.goods = new app.message.GoodsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.goods);
					break;
				case 2:
					if (expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: BuyBackGoodsProto.expireTime cannot be set twice.');
					}
					++expire_time$count;
					this.expireTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
