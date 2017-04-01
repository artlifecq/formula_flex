package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AllBuyBackGoodsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ShopModuleObjClientProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BUY_BACK_GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ShopModuleObjClientProto.buy_back_goods", "buyBackGoods", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllBuyBackGoodsProto; });

		private var buy_back_goods$field:app.message.AllBuyBackGoodsProto;

		public function clearBuyBackGoods():void {
			buy_back_goods$field = null;
		}

		public function get hasBuyBackGoods():Boolean {
			return buy_back_goods$field != null;
		}

		public function set buyBackGoods(value:app.message.AllBuyBackGoodsProto):void {
			buy_back_goods$field = value;
		}

		public function get buyBackGoods():app.message.AllBuyBackGoodsProto {
			return buy_back_goods$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBuyBackGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, buy_back_goods$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var buy_back_goods$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (buy_back_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShopModuleObjClientProto.buyBackGoods cannot be set twice.');
					}
					++buy_back_goods$count;
					this.buyBackGoods = new app.message.AllBuyBackGoodsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.buyBackGoods);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
