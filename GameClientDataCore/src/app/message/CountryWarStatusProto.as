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
	public dynamic final class CountryWarStatusProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_PROTECT_END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarStatusProto.country_war_protect_end_time", "countryWarProtectEndTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_war_protect_end_time$field:Int64;

		public function clearCountryWarProtectEndTime():void {
			country_war_protect_end_time$field = null;
		}

		public function get hasCountryWarProtectEndTime():Boolean {
			return country_war_protect_end_time$field != null;
		}

		public function set countryWarProtectEndTime(value:Int64):void {
			country_war_protect_end_time$field = value;
		}

		public function get countryWarProtectEndTime():Int64 {
			return country_war_protect_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_REVENGE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarStatusProto.country_war_revenge_time", "countryWarRevengeTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_war_revenge_time$field:Int64;

		public function clearCountryWarRevengeTime():void {
			country_war_revenge_time$field = null;
		}

		public function get hasCountryWarRevengeTime():Boolean {
			return country_war_revenge_time$field != null;
		}

		public function set countryWarRevengeTime(value:Int64):void {
			country_war_revenge_time$field = value;
		}

		public function get countryWarRevengeTime():Int64 {
			return country_war_revenge_time$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_REVENGE_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarStatusProto.country_war_revenge_country", "countryWarRevengeCountry", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_war_revenge_country$field:int;

		private var hasField$0:uint = 0;

		public function clearCountryWarRevengeCountry():void {
			hasField$0 &= 0xfffffffe;
			country_war_revenge_country$field = new int();
		}

		public function get hasCountryWarRevengeCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set countryWarRevengeCountry(value:int):void {
			hasField$0 |= 0x1;
			country_war_revenge_country$field = value;
		}

		public function get countryWarRevengeCountry():int {
			return country_war_revenge_country$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_WIN_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarStatusProto.country_war_win_times", "countryWarWinTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_war_win_times$field:int;

		public function clearCountryWarWinTimes():void {
			hasField$0 &= 0xfffffffd;
			country_war_win_times$field = new int();
		}

		public function get hasCountryWarWinTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set countryWarWinTimes(value:int):void {
			hasField$0 |= 0x2;
			country_war_win_times$field = value;
		}

		public function get countryWarWinTimes():int {
			return country_war_win_times$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_FAIL_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarStatusProto.country_war_fail_times", "countryWarFailTimes", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_war_fail_times$field:int;

		public function clearCountryWarFailTimes():void {
			hasField$0 &= 0xfffffffb;
			country_war_fail_times$field = new int();
		}

		public function get hasCountryWarFailTimes():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set countryWarFailTimes(value:int):void {
			hasField$0 |= 0x4;
			country_war_fail_times$field = value;
		}

		public function get countryWarFailTimes():int {
			return country_war_fail_times$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_WIN_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarStatusProto.last_win_country", "lastWinCountry", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_win_country$field:int;

		public function clearLastWinCountry():void {
			hasField$0 &= 0xfffffff7;
			last_win_country$field = new int();
		}

		public function get hasLastWinCountry():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set lastWinCountry(value:int):void {
			hasField$0 |= 0x8;
			last_win_country$field = value;
		}

		public function get lastWinCountry():int {
			return last_win_country$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_LOSE_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarStatusProto.last_lose_country", "lastLoseCountry", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_lose_country$field:int;

		public function clearLastLoseCountry():void {
			hasField$0 &= 0xffffffef;
			last_lose_country$field = new int();
		}

		public function get hasLastLoseCountry():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set lastLoseCountry(value:int):void {
			hasField$0 |= 0x10;
			last_lose_country$field = value;
		}

		public function get lastLoseCountry():int {
			return last_lose_country$field;
		}

		/**
		 *  @private
		 */
		public static const ADMIRE_END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarStatusProto.admire_end_time", "admireEndTime", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var admire_end_time$field:Int64;

		public function clearAdmireEndTime():void {
			admire_end_time$field = null;
		}

		public function get hasAdmireEndTime():Boolean {
			return admire_end_time$field != null;
		}

		public function set admireEndTime(value:Int64):void {
			admire_end_time$field = value;
		}

		public function get admireEndTime():Int64 {
			return admire_end_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountryWarProtectEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, country_war_protect_end_time$field);
			}
			if (hasCountryWarRevengeTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, country_war_revenge_time$field);
			}
			if (hasCountryWarRevengeCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country_war_revenge_country$field);
			}
			if (hasCountryWarWinTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country_war_win_times$field);
			}
			if (hasCountryWarFailTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country_war_fail_times$field);
			}
			if (hasLastWinCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, last_win_country$field);
			}
			if (hasLastLoseCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, last_lose_country$field);
			}
			if (hasAdmireEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, admire_end_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var country_war_protect_end_time$count:uint = 0;
			var country_war_revenge_time$count:uint = 0;
			var country_war_revenge_country$count:uint = 0;
			var country_war_win_times$count:uint = 0;
			var country_war_fail_times$count:uint = 0;
			var last_win_country$count:uint = 0;
			var last_lose_country$count:uint = 0;
			var admire_end_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country_war_protect_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.countryWarProtectEndTime cannot be set twice.');
					}
					++country_war_protect_end_time$count;
					this.countryWarProtectEndTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (country_war_revenge_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.countryWarRevengeTime cannot be set twice.');
					}
					++country_war_revenge_time$count;
					this.countryWarRevengeTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (country_war_revenge_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.countryWarRevengeCountry cannot be set twice.');
					}
					++country_war_revenge_country$count;
					this.countryWarRevengeCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (country_war_win_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.countryWarWinTimes cannot be set twice.');
					}
					++country_war_win_times$count;
					this.countryWarWinTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (country_war_fail_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.countryWarFailTimes cannot be set twice.');
					}
					++country_war_fail_times$count;
					this.countryWarFailTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (last_win_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.lastWinCountry cannot be set twice.');
					}
					++last_win_country$count;
					this.lastWinCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (last_lose_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.lastLoseCountry cannot be set twice.');
					}
					++last_lose_country$count;
					this.lastLoseCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (admire_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarStatusProto.admireEndTime cannot be set twice.');
					}
					++admire_end_time$count;
					this.admireEndTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
