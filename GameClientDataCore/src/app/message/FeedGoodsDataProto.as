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
	public dynamic final class FeedGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REDUCE_HUNGER_DEGREE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FeedGoodsDataProto.reduce_hunger_degree", "reduceHungerDegree", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var reduce_hunger_degree$field:int;

		private var hasField$0:uint = 0;

		public function clearReduceHungerDegree():void {
			hasField$0 &= 0xfffffffe;
			reduce_hunger_degree$field = new int();
		}

		public function get hasReduceHungerDegree():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set reduceHungerDegree(value:int):void {
			hasField$0 |= 0x1;
			reduce_hunger_degree$field = value;
		}

		public function get reduceHungerDegree():int {
			return reduce_hunger_degree$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasReduceHungerDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, reduce_hunger_degree$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var reduce_hunger_degree$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (reduce_hunger_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: FeedGoodsDataProto.reduceHungerDegree cannot be set twice.');
					}
					++reduce_hunger_degree$count;
					this.reduceHungerDegree = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
