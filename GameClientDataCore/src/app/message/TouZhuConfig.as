package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TouZhuConfig.TouZhuPrize;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TouZhuConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PRIZES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.TouZhuConfig.prizes", "prizes", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TouZhuConfig.TouZhuPrize; });

		[ArrayElementType("app.message.TouZhuConfig.TouZhuPrize")]
		public var prizes:Array = [];

		/**
		 *  @private
		 */
		public static const TIMES_PER_DAY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TouZhuConfig.times_per_day", "timesPerDay", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var times_per_day$field:int;

		private var hasField$0:uint = 0;

		public function clearTimesPerDay():void {
			hasField$0 &= 0xfffffffe;
			times_per_day$field = new int();
		}

		public function get hasTimesPerDay():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set timesPerDay(value:int):void {
			hasField$0 |= 0x1;
			times_per_day$field = value;
		}

		public function get timesPerDay():int {
			return times_per_day$field;
		}

		/**
		 *  @private
		 */
		public static const TIME_DATA:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.TouZhuConfig.time_data", "timeData", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.TouZhuConfig.duration", "duration", (8 << 3) | com.netease.protobuf.WireType.VARINT);

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
			for (var prizes$index:uint = 0; prizes$index < this.prizes.length; ++prizes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.prizes[prizes$index]);
			}
			if (hasTimesPerDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, times_per_day$field);
			}
			if (hasTimeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, time_data$field);
			}
			if (hasDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, duration$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var times_per_day$count:uint = 0;
			var time_data$count:uint = 0;
			var duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.prizes.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.TouZhuConfig.TouZhuPrize()));
					break;
				case 6:
					if (times_per_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouZhuConfig.timesPerDay cannot be set twice.');
					}
					++times_per_day$count;
					this.timesPerDay = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (time_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouZhuConfig.timeData cannot be set twice.');
					}
					++time_data$count;
					this.timeData = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouZhuConfig.duration cannot be set twice.');
					}
					++duration$count;
					this.duration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
