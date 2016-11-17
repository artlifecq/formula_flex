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
	public dynamic final class CountryStrategyProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_TODAY_START_DUO_JING:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryStrategyProto.is_today_start_duo_jing", "isTodayStartDuoJing", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_today_start_duo_jing$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsTodayStartDuoJing():void {
			hasField$0 &= 0xfffffffe;
			is_today_start_duo_jing$field = new Boolean();
		}

		public function get hasIsTodayStartDuoJing():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isTodayStartDuoJing(value:Boolean):void {
			hasField$0 |= 0x1;
			is_today_start_duo_jing$field = value;
		}

		public function get isTodayStartDuoJing():Boolean {
			return is_today_start_duo_jing$field;
		}

		/**
		 *  @private
		 */
		public static const DUO_JING_END_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryStrategyProto.duo_jing_end_time", "duoJingEndTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var duo_jing_end_time$field:Int64;

		public function clearDuoJingEndTime():void {
			duo_jing_end_time$field = null;
		}

		public function get hasDuoJingEndTime():Boolean {
			return duo_jing_end_time$field != null;
		}

		public function set duoJingEndTime(value:Int64):void {
			duo_jing_end_time$field = value;
		}

		public function get duoJingEndTime():Int64 {
			return duo_jing_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TODAY_START_MI_XIN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryStrategyProto.is_today_start_mi_xin", "isTodayStartMiXin", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_today_start_mi_xin$field:Boolean;

		public function clearIsTodayStartMiXin():void {
			hasField$0 &= 0xfffffffd;
			is_today_start_mi_xin$field = new Boolean();
		}

		public function get hasIsTodayStartMiXin():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isTodayStartMiXin(value:Boolean):void {
			hasField$0 |= 0x2;
			is_today_start_mi_xin$field = value;
		}

		public function get isTodayStartMiXin():Boolean {
			return is_today_start_mi_xin$field;
		}

		/**
		 *  @private
		 */
		public static const MI_XIN_END_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryStrategyProto.mi_xin_end_time", "miXinEndTime", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mi_xin_end_time$field:Int64;

		public function clearMiXinEndTime():void {
			mi_xin_end_time$field = null;
		}

		public function get hasMiXinEndTime():Boolean {
			return mi_xin_end_time$field != null;
		}

		public function set miXinEndTime(value:Int64):void {
			mi_xin_end_time$field = value;
		}

		public function get miXinEndTime():Int64 {
			return mi_xin_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const MI_XIN_TARGET_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryStrategyProto.mi_xin_target_country", "miXinTargetCountry", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mi_xin_target_country$field:int;

		public function clearMiXinTargetCountry():void {
			hasField$0 &= 0xfffffffb;
			mi_xin_target_country$field = new int();
		}

		public function get hasMiXinTargetCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set miXinTargetCountry(value:int):void {
			hasField$0 |= 0x4;
			mi_xin_target_country$field = value;
		}

		public function get miXinTargetCountry():int {
			return mi_xin_target_country$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_MILITARY_SUBSIBY:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryStrategyProto.has_military_subsiby", "hasMilitarySubsiby", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_military_subsiby$field:Boolean;

		public function clearHasMilitarySubsiby():void {
			hasField$0 &= 0xfffffff7;
			has_military_subsiby$field = new Boolean();
		}

		public function get hasHasMilitarySubsiby():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set hasMilitarySubsiby(value:Boolean):void {
			hasField$0 |= 0x8;
			has_military_subsiby$field = value;
		}

		public function get hasMilitarySubsiby():Boolean {
			return has_military_subsiby$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TODAY_START_GUO_YUN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryStrategyProto.is_today_start_guo_yun", "isTodayStartGuoYun", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_today_start_guo_yun$field:Boolean;

		public function clearIsTodayStartGuoYun():void {
			hasField$0 &= 0xffffffef;
			is_today_start_guo_yun$field = new Boolean();
		}

		public function get hasIsTodayStartGuoYun():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isTodayStartGuoYun(value:Boolean):void {
			hasField$0 |= 0x10;
			is_today_start_guo_yun$field = value;
		}

		public function get isTodayStartGuoYun():Boolean {
			return is_today_start_guo_yun$field;
		}

		/**
		 *  @private
		 */
		public static const GUO_YUN_START_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryStrategyProto.guo_yun_start_time", "guoYunStartTime", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guo_yun_start_time$field:Int64;

		public function clearGuoYunStartTime():void {
			guo_yun_start_time$field = null;
		}

		public function get hasGuoYunStartTime():Boolean {
			return guo_yun_start_time$field != null;
		}

		public function set guoYunStartTime(value:Int64):void {
			guo_yun_start_time$field = value;
		}

		public function get guoYunStartTime():Int64 {
			return guo_yun_start_time$field;
		}

		/**
		 *  @private
		 */
		public static const GUO_YUN_END_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryStrategyProto.guo_yun_end_time", "guoYunEndTime", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guo_yun_end_time$field:Int64;

		public function clearGuoYunEndTime():void {
			guo_yun_end_time$field = null;
		}

		public function get hasGuoYunEndTime():Boolean {
			return guo_yun_end_time$field != null;
		}

		public function set guoYunEndTime(value:Int64):void {
			guo_yun_end_time$field = value;
		}

		public function get guoYunEndTime():Int64 {
			return guo_yun_end_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsTodayStartDuoJing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_today_start_duo_jing$field);
			}
			if (hasDuoJingEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, duo_jing_end_time$field);
			}
			if (hasIsTodayStartMiXin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_today_start_mi_xin$field);
			}
			if (hasMiXinEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, mi_xin_end_time$field);
			}
			if (hasMiXinTargetCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mi_xin_target_country$field);
			}
			if (hasHasMilitarySubsiby) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, has_military_subsiby$field);
			}
			if (hasIsTodayStartGuoYun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_today_start_guo_yun$field);
			}
			if (hasGuoYunStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, guo_yun_start_time$field);
			}
			if (hasGuoYunEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, guo_yun_end_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_today_start_duo_jing$count:uint = 0;
			var duo_jing_end_time$count:uint = 0;
			var is_today_start_mi_xin$count:uint = 0;
			var mi_xin_end_time$count:uint = 0;
			var mi_xin_target_country$count:uint = 0;
			var has_military_subsiby$count:uint = 0;
			var is_today_start_guo_yun$count:uint = 0;
			var guo_yun_start_time$count:uint = 0;
			var guo_yun_end_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_today_start_duo_jing$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.isTodayStartDuoJing cannot be set twice.');
					}
					++is_today_start_duo_jing$count;
					this.isTodayStartDuoJing = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (duo_jing_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.duoJingEndTime cannot be set twice.');
					}
					++duo_jing_end_time$count;
					this.duoJingEndTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (is_today_start_mi_xin$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.isTodayStartMiXin cannot be set twice.');
					}
					++is_today_start_mi_xin$count;
					this.isTodayStartMiXin = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 6:
					if (mi_xin_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.miXinEndTime cannot be set twice.');
					}
					++mi_xin_end_time$count;
					this.miXinEndTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 7:
					if (mi_xin_target_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.miXinTargetCountry cannot be set twice.');
					}
					++mi_xin_target_country$count;
					this.miXinTargetCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (has_military_subsiby$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.hasMilitarySubsiby cannot be set twice.');
					}
					++has_military_subsiby$count;
					this.hasMilitarySubsiby = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 15:
					if (is_today_start_guo_yun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.isTodayStartGuoYun cannot be set twice.');
					}
					++is_today_start_guo_yun$count;
					this.isTodayStartGuoYun = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 16:
					if (guo_yun_start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.guoYunStartTime cannot be set twice.');
					}
					++guo_yun_start_time$count;
					this.guoYunStartTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 17:
					if (guo_yun_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryStrategyProto.guoYunEndTime cannot be set twice.');
					}
					++guo_yun_end_time$count;
					this.guoYunEndTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
