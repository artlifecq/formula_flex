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
	public dynamic final class DiscountStoreServerProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COMBINE_SERVER_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.DiscountStoreServerProto.combine_server_id", "combineServerId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var combine_server_id$field:int;

		private var hasField$0:uint = 0;

		public function clearCombineServerId():void {
			hasField$0 &= 0xfffffffe;
			combine_server_id$field = new int();
		}

		public function get hasCombineServerId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set combineServerId(value:int):void {
			hasField$0 |= 0x1;
			combine_server_id$field = value;
		}

		public function get combineServerId():int {
			return combine_server_id$field;
		}

		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.DiscountStoreServerProto.start_time", "startTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.DiscountStoreServerProto.end_time", "endTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const INDEX:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.DiscountStoreServerProto.index", "index", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var index:Array = [];

		/**
		 *  @private
		 */
		public static const BUY_COUNT:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.DiscountStoreServerProto.buy_count", "buyCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var buyCount:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCombineServerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, combine_server_id$field);
			}
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, start_time$field);
			}
			if (hasEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, end_time$field);
			}
			for (var index$index:uint = 0; index$index < this.index.length; ++index$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.index[index$index]);
			}
			for (var buyCount$index:uint = 0; buyCount$index < this.buyCount.length; ++buyCount$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.buyCount[buyCount$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var combine_server_id$count:uint = 0;
			var start_time$count:uint = 0;
			var end_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (combine_server_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountStoreServerProto.combineServerId cannot be set twice.');
					}
					++combine_server_id$count;
					this.combineServerId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountStoreServerProto.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiscountStoreServerProto.endTime cannot be set twice.');
					}
					++end_time$count;
					this.endTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.index);
						break;
					}
					this.index.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.buyCount);
						break;
					}
					this.buyCount.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
