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
	public dynamic final class MazeMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME_DATA:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.MazeMiscDataProto.time_data", "timeData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var time_data$field:String;

		public function clearTimeData():void {
			time_data$field = null;
		}

		public function get hasTimeData():Boolean {
			return time_data$field != null;
		}

		public function set timeData(value:String):void {
			time_data$field = value;
		}

		public function get timeData():String {
			return time_data$field;
		}

		/**
		 *  @private
		 */
		public static const PREPARE_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.MazeMiscDataProto.prepare_duration", "prepareDuration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var prepare_duration$field:Int64;

		public function clearPrepareDuration():void {
			prepare_duration$field = null;
		}

		public function get hasPrepareDuration():Boolean {
			return prepare_duration$field != null;
		}

		public function set prepareDuration(value:Int64):void {
			prepare_duration$field = value;
		}

		public function get prepareDuration():Int64 {
			return prepare_duration$field;
		}

		/**
		 *  @private
		 */
		public static const DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.MazeMiscDataProto.duration", "duration", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var duration$field:Int64;

		public function clearDuration():void {
			duration$field = null;
		}

		public function get hasDuration():Boolean {
			return duration$field != null;
		}

		public function set duration(value:Int64):void {
			duration$field = value;
		}

		public function get duration():Int64 {
			return duration$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTimeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, time_data$field);
			}
			if (hasPrepareDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, prepare_duration$field);
			}
			if (hasDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, duration$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time_data$count:uint = 0;
			var prepare_duration$count:uint = 0;
			var duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeMiscDataProto.timeData cannot be set twice.');
					}
					++time_data$count;
					this.timeData = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (prepare_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeMiscDataProto.prepareDuration cannot be set twice.');
					}
					++prepare_duration$count;
					this.prepareDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeMiscDataProto.duration cannot be set twice.');
					}
					++duration$count;
					this.duration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
