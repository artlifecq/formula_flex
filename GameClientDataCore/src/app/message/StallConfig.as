package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.StallTypeDatasProto;
	import app.message.StallBuyGoodsDatasProto;
	import app.message.StallMiscProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StallConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MISC_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.StallConfig.misc_data", "miscData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StallMiscProto; });

		private var misc_data$field:app.message.StallMiscProto;

		public function clearMiscData():void {
			misc_data$field = null;
		}

		public function get hasMiscData():Boolean {
			return misc_data$field != null;
		}

		public function set miscData(value:app.message.StallMiscProto):void {
			misc_data$field = value;
		}

		public function get miscData():app.message.StallMiscProto {
			return misc_data$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.StallConfig.type_datas", "typeDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StallTypeDatasProto; });

		private var type_datas$field:app.message.StallTypeDatasProto;

		public function clearTypeDatas():void {
			type_datas$field = null;
		}

		public function get hasTypeDatas():Boolean {
			return type_datas$field != null;
		}

		public function set typeDatas(value:app.message.StallTypeDatasProto):void {
			type_datas$field = value;
		}

		public function get typeDatas():app.message.StallTypeDatasProto {
			return type_datas$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_GOODS_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.StallConfig.buy_goods_datas", "buyGoodsDatas", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StallBuyGoodsDatasProto; });

		private var buy_goods_datas$field:app.message.StallBuyGoodsDatasProto;

		public function clearBuyGoodsDatas():void {
			buy_goods_datas$field = null;
		}

		public function get hasBuyGoodsDatas():Boolean {
			return buy_goods_datas$field != null;
		}

		public function set buyGoodsDatas(value:app.message.StallBuyGoodsDatasProto):void {
			buy_goods_datas$field = value;
		}

		public function get buyGoodsDatas():app.message.StallBuyGoodsDatasProto {
			return buy_goods_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMiscData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, misc_data$field);
			}
			if (hasTypeDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, type_datas$field);
			}
			if (hasBuyGoodsDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, buy_goods_datas$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var misc_data$count:uint = 0;
			var type_datas$count:uint = 0;
			var buy_goods_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (misc_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallConfig.miscData cannot be set twice.');
					}
					++misc_data$count;
					this.miscData = new app.message.StallMiscProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.miscData);
					break;
				case 2:
					if (type_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallConfig.typeDatas cannot be set twice.');
					}
					++type_datas$count;
					this.typeDatas = new app.message.StallTypeDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.typeDatas);
					break;
				case 3:
					if (buy_goods_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallConfig.buyGoodsDatas cannot be set twice.');
					}
					++buy_goods_datas$count;
					this.buyGoodsDatas = new app.message.StallBuyGoodsDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.buyGoodsDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
