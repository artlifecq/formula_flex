package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.DiscountGoodsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DiscountStoreProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.DiscountStoreProto.start_time", "startTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_time$field:Int64;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:Int64):void {
			start_time$field = value;
		}

		public function get startTime():Int64 {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		public static const END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.DiscountStoreProto.end_time", "endTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var end_time$field:Int64;

		public function clearEndTime():void {
			end_time$field = null;
		}

		public function get hasEndTime():Boolean {
			return end_time$field != null;
		}

		public function set endTime(value:Int64):void {
			end_time$field = value;
		}

		public function get endTime():Int64 {
			return end_time$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.DiscountStoreProto.title", "title", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:String;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:String):void {
			title$field = value;
		}

		public function get title():String {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_ARRAY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.DiscountStoreProto.goods_array", "goodsArray", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.DiscountGoodsProto; });

		[ArrayElementType("app.message.DiscountGoodsProto")]
		public var goodsArray:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, start_time$field);
			}
			if (hasEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, end_time$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, title$field);
			}
			for (var goodsArray$index:uint = 0; goodsArray$index < this.goodsArray.length; ++goodsArray$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.goodsArray[goodsArray$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start_time$count:uint = 0;
			var end_time$count:uint = 0;
			var title$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountStoreProto.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountStoreProto.endTime cannot be set twice.');
					}
					++end_time$count;
					this.endTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountStoreProto.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					this.goodsArray.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.DiscountGoodsProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
