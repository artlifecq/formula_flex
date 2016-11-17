package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TouJingConfig.TouJingPrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TouJingConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TOU_JING_TIME_DATA:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.TouJingConfig.tou_jing_time_data", "touJingTimeData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var tou_jing_time_data$field:String;

		public function clearTouJingTimeData():void {
			tou_jing_time_data$field = null;
		}

		public function get hasTouJingTimeData():Boolean {
			return tou_jing_time_data$field != null;
		}

		public function set touJingTimeData(value:String):void {
			tou_jing_time_data$field = value;
		}

		public function get touJingTimeData():String {
			return tou_jing_time_data$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_JING_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.TouJingConfig.tou_jing_duration", "touJingDuration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_jing_duration$field:Int64;

		public function clearTouJingDuration():void {
			tou_jing_duration$field = null;
		}

		public function get hasTouJingDuration():Boolean {
			return tou_jing_duration$field != null;
		}

		public function set touJingDuration(value:Int64):void {
			tou_jing_duration$field = value;
		}

		public function get touJingDuration():Int64 {
			return tou_jing_duration$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_JING_PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.TouJingConfig.tou_jing_prize", "touJingPrize", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TouJingConfig.TouJingPrizeProto; });

		[ArrayElementType("app.message.TouJingConfig.TouJingPrizeProto")]
		public var touJingPrize:Array = [];

		/**
		 *  @private
		 */
		public static const TOU_JING_HAS_PRIZE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TouJingConfig.tou_jing_has_prize_times", "touJingHasPrizeTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_jing_has_prize_times$field:int;

		private var hasField$0:uint = 0;

		public function clearTouJingHasPrizeTimes():void {
			hasField$0 &= 0xfffffffe;
			tou_jing_has_prize_times$field = new int();
		}

		public function get hasTouJingHasPrizeTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set touJingHasPrizeTimes(value:int):void {
			hasField$0 |= 0x1;
			tou_jing_has_prize_times$field = value;
		}

		public function get touJingHasPrizeTimes():int {
			return tou_jing_has_prize_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_JING_TIMES_PER_DAY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TouJingConfig.tou_jing_times_per_day", "touJingTimesPerDay", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_jing_times_per_day$field:int;

		public function clearTouJingTimesPerDay():void {
			hasField$0 &= 0xfffffffd;
			tou_jing_times_per_day$field = new int();
		}

		public function get hasTouJingTimesPerDay():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set touJingTimesPerDay(value:int):void {
			hasField$0 |= 0x2;
			tou_jing_times_per_day$field = value;
		}

		public function get touJingTimesPerDay():int {
			return tou_jing_times_per_day$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTouJingTimeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, tou_jing_time_data$field);
			}
			if (hasTouJingDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, tou_jing_duration$field);
			}
			for (var touJingPrize$index:uint = 0; touJingPrize$index < this.touJingPrize.length; ++touJingPrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.touJingPrize[touJingPrize$index]);
			}
			if (hasTouJingHasPrizeTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tou_jing_has_prize_times$field);
			}
			if (hasTouJingTimesPerDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tou_jing_times_per_day$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tou_jing_time_data$count:uint = 0;
			var tou_jing_duration$count:uint = 0;
			var tou_jing_has_prize_times$count:uint = 0;
			var tou_jing_times_per_day$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tou_jing_time_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingConfig.touJingTimeData cannot be set twice.');
					}
					++tou_jing_time_data$count;
					this.touJingTimeData = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (tou_jing_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingConfig.touJingDuration cannot be set twice.');
					}
					++tou_jing_duration$count;
					this.touJingDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					this.touJingPrize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.TouJingConfig.TouJingPrizeProto()));
					break;
				case 4:
					if (tou_jing_has_prize_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingConfig.touJingHasPrizeTimes cannot be set twice.');
					}
					++tou_jing_has_prize_times$count;
					this.touJingHasPrizeTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (tou_jing_times_per_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingConfig.touJingTimesPerDay cannot be set twice.');
					}
					++tou_jing_times_per_day$count;
					this.touJingTimesPerDay = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
