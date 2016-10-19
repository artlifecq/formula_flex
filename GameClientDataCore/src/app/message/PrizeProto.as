package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AmountValue;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AMOUNTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.PrizeProto.amounts", "amounts", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AmountValue; });

		[ArrayElementType("app.message.AmountValue")]
		public var amounts:Array = [];

		/**
		 *  @private
		 */
		public static const GOODS_WRAPPER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.PrizeProto.goods_wrapper", "goodsWrapper", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var goodsWrapper:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var amounts$index:uint = 0; amounts$index < this.amounts.length; ++amounts$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.amounts[amounts$index]);
			}
			for (var goodsWrapper$index:uint = 0; goodsWrapper$index < this.goodsWrapper.length; ++goodsWrapper$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.goodsWrapper[goodsWrapper$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.amounts.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.AmountValue()));
					break;
				case 10:
					this.goodsWrapper.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
