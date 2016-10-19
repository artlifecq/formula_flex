package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ExpPrizeProto;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RoulettePrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.RoulettePrizeProto.exp", "exp", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ExpPrizeProto; });

		private var exp$field:app.message.ExpPrizeProto;

		public function clearExp():void {
			exp$field = null;
		}

		public function get hasExp():Boolean {
			return exp$field != null;
		}

		public function set exp(value:app.message.ExpPrizeProto):void {
			exp$field = value;
		}

		public function get exp():app.message.ExpPrizeProto {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.RoulettePrizeProto.goods", "goods", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, exp$field);
			}
			if (hasGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, goods$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var exp$count:uint = 0;
			var goods$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoulettePrizeProto.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = new app.message.ExpPrizeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.exp);
					break;
				case 2:
					if (goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: RoulettePrizeProto.goods cannot be set twice.');
					}
					++goods$count;
					this.goods = new app.message.GoodsWrapperProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.goods);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
