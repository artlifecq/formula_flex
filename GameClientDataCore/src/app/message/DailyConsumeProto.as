package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.DailyConsumeProto.DailyConsumeSingleProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DailyConsumeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.DailyConsumeProto.start_time", "startTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const END_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.DailyConsumeProto.end_time", "endTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.DailyConsumeProto.prize", "prize", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.DailyConsumeProto.DailyConsumeSingleProto; });

		[ArrayElementType("app.message.DailyConsumeProto.DailyConsumeSingleProto")]
		public var prize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, start_time$field);
			}
			if (hasEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, end_time$field);
			}
			for (var prize$index:uint = 0; prize$index < this.prize.length; ++prize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.prize[prize$index]);
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
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyConsumeProto.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyConsumeProto.endTime cannot be set twice.');
					}
					++end_time$count;
					this.endTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					this.prize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.DailyConsumeProto.DailyConsumeSingleProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
