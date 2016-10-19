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
	public dynamic final class PerHeroDailyConsumeInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.PerHeroDailyConsumeInfoProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:Int64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:Int64):void {
			id$field = value;
		}

		public function get id():Int64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const CONSUME_AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.PerHeroDailyConsumeInfoProto.consume_amount", "consumeAmount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var consume_amount$field:Int64;

		public function clearConsumeAmount():void {
			consume_amount$field = null;
		}

		public function get hasConsumeAmount():Boolean {
			return consume_amount$field != null;
		}

		public function set consumeAmount(value:Int64):void {
			consume_amount$field = value;
		}

		public function get consumeAmount():Int64 {
			return consume_amount$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECTED_TIME:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.PerHeroDailyConsumeInfoProto.collected_time", "collectedTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var collectedTime:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, id$field);
			}
			if (hasConsumeAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, consume_amount$field);
			}
			for (var collectedTime$index:uint = 0; collectedTime$index < this.collectedTime.length; ++collectedTime$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.collectedTime[collectedTime$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var consume_amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: PerHeroDailyConsumeInfoProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (consume_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: PerHeroDailyConsumeInfoProto.consumeAmount cannot be set twice.');
					}
					++consume_amount$count;
					this.consumeAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.collectedTime);
						break;
					}
					this.collectedTime.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
