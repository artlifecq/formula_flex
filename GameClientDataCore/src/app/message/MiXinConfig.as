package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MiXinConfig.MiXinPrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MiXinConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MI_XIN_PRIZE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.MiXinConfig.mi_xin_prize", "miXinPrize", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MiXinConfig.MiXinPrizeProto; });

		[ArrayElementType("app.message.MiXinConfig.MiXinPrizeProto")]
		public var miXinPrize:Array = [];

		/**
		 *  @private
		 */
		public static const TIMES_PER_DAY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiXinConfig.times_per_day", "timesPerDay", (9 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const MI_XIN_START_MIN_HOUR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiXinConfig.mi_xin_start_min_hour", "miXinStartMinHour", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mi_xin_start_min_hour$field:int;

		public function clearMiXinStartMinHour():void {
			hasField$0 &= 0xfffffffd;
			mi_xin_start_min_hour$field = new int();
		}

		public function get hasMiXinStartMinHour():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set miXinStartMinHour(value:int):void {
			hasField$0 |= 0x2;
			mi_xin_start_min_hour$field = value;
		}

		public function get miXinStartMinHour():int {
			return mi_xin_start_min_hour$field;
		}

		/**
		 *  @private
		 */
		public static const MI_XIN_START_MAX_HOUR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiXinConfig.mi_xin_start_max_hour", "miXinStartMaxHour", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mi_xin_start_max_hour$field:int;

		public function clearMiXinStartMaxHour():void {
			hasField$0 &= 0xfffffffb;
			mi_xin_start_max_hour$field = new int();
		}

		public function get hasMiXinStartMaxHour():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set miXinStartMaxHour(value:int):void {
			hasField$0 |= 0x4;
			mi_xin_start_max_hour$field = value;
		}

		public function get miXinStartMaxHour():int {
			return mi_xin_start_max_hour$field;
		}

		/**
		 *  @private
		 */
		public static const MI_XIN_ADD_MULTIPLE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("app.message.MiXinConfig.mi_xin_add_multiple", "miXinAddMultiple", (12 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		private var mi_xin_add_multiple$field:Number;

		public function clearMiXinAddMultiple():void {
			hasField$0 &= 0xfffffff7;
			mi_xin_add_multiple$field = new Number();
		}

		public function get hasMiXinAddMultiple():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set miXinAddMultiple(value:Number):void {
			hasField$0 |= 0x8;
			mi_xin_add_multiple$field = value;
		}

		public function get miXinAddMultiple():Number {
			return mi_xin_add_multiple$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var miXinPrize$index:uint = 0; miXinPrize$index < this.miXinPrize.length; ++miXinPrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.miXinPrize[miXinPrize$index]);
			}
			if (hasTimesPerDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, times_per_day$field);
			}
			if (hasMiXinStartMinHour) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mi_xin_start_min_hour$field);
			}
			if (hasMiXinStartMaxHour) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mi_xin_start_max_hour$field);
			}
			if (hasMiXinAddMultiple) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_FLOAT(output, mi_xin_add_multiple$field);
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
			var mi_xin_start_min_hour$count:uint = 0;
			var mi_xin_start_max_hour$count:uint = 0;
			var mi_xin_add_multiple$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.miXinPrize.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.MiXinConfig.MiXinPrizeProto()));
					break;
				case 9:
					if (times_per_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinConfig.timesPerDay cannot be set twice.');
					}
					++times_per_day$count;
					this.timesPerDay = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (mi_xin_start_min_hour$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinConfig.miXinStartMinHour cannot be set twice.');
					}
					++mi_xin_start_min_hour$count;
					this.miXinStartMinHour = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (mi_xin_start_max_hour$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinConfig.miXinStartMaxHour cannot be set twice.');
					}
					++mi_xin_start_max_hour$count;
					this.miXinStartMaxHour = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (mi_xin_add_multiple$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinConfig.miXinAddMultiple cannot be set twice.');
					}
					++mi_xin_add_multiple$count;
					this.miXinAddMultiple = com.netease.protobuf.ReadUtils.read$TYPE_FLOAT(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
