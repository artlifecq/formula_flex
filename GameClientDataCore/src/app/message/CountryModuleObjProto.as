package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryModuleObjProto.CountryModuleWuXunProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HAS_COLLECT_SALARY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CountryModuleObjProto.has_collect_salary", "hasCollectSalary", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_collect_salary$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearHasCollectSalary():void {
			hasField$0 &= 0xfffffffe;
			has_collect_salary$field = new Boolean();
		}

		public function get hasHasCollectSalary():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set hasCollectSalary(value:Boolean):void {
			hasField$0 |= 0x1;
			has_collect_salary$field = value;
		}

		public function get hasCollectSalary():Boolean {
			return has_collect_salary$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TODAY_BEEN_SET_OFFICER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CountryModuleObjProto.is_today_been_set_officer", "isTodayBeenSetOfficer", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_today_been_set_officer$field:Boolean;

		public function clearIsTodayBeenSetOfficer():void {
			hasField$0 &= 0xfffffffd;
			is_today_been_set_officer$field = new Boolean();
		}

		public function get hasIsTodayBeenSetOfficer():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isTodayBeenSetOfficer(value:Boolean):void {
			hasField$0 |= 0x2;
			is_today_been_set_officer$field = value;
		}

		public function get isTodayBeenSetOfficer():Boolean {
			return is_today_been_set_officer$field;
		}

		/**
		 *  @private
		 */
		public static const IS_COUNTRY_DONATE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CountryModuleObjProto.is_country_donate", "isCountryDonate", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_country_donate$field:Boolean;

		public function clearIsCountryDonate():void {
			hasField$0 &= 0xfffffffb;
			is_country_donate$field = new Boolean();
		}

		public function get hasIsCountryDonate():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isCountryDonate(value:Boolean):void {
			hasField$0 |= 0x4;
			is_country_donate$field = value;
		}

		public function get isCountryDonate():Boolean {
			return is_country_donate$field;
		}

		/**
		 *  @private
		 */
		public static const SET_DONT_TALK_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryModuleObjProto.set_dont_talk_times", "setDontTalkTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var set_dont_talk_times$field:int;

		public function clearSetDontTalkTimes():void {
			hasField$0 &= 0xfffffff7;
			set_dont_talk_times$field = new int();
		}

		public function get hasSetDontTalkTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set setDontTalkTimes(value:int):void {
			hasField$0 |= 0x8;
			set_dont_talk_times$field = value;
		}

		public function get setDontTalkTimes():int {
			return set_dont_talk_times$field;
		}

		/**
		 *  @private
		 */
		public static const CAPTIVITY_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryModuleObjProto.captivity_times", "captivityTimes", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var captivity_times$field:int;

		public function clearCaptivityTimes():void {
			hasField$0 &= 0xffffffef;
			captivity_times$field = new int();
		}

		public function get hasCaptivityTimes():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set captivityTimes(value:int):void {
			hasField$0 |= 0x10;
			captivity_times$field = value;
		}

		public function get captivityTimes():int {
			return captivity_times$field;
		}

		/**
		 *  @private
		 */
		public static const OFFICER_SET_UNTALK_END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.officer_set_untalk_end_time", "officerSetUntalkEndTime", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var officer_set_untalk_end_time$field:Int64;

		public function clearOfficerSetUntalkEndTime():void {
			officer_set_untalk_end_time$field = null;
		}

		public function get hasOfficerSetUntalkEndTime():Boolean {
			return officer_set_untalk_end_time$field != null;
		}

		public function set officerSetUntalkEndTime(value:Int64):void {
			officer_set_untalk_end_time$field = value;
		}

		public function get officerSetUntalkEndTime():Int64 {
			return officer_set_untalk_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const CAPTIVITY_END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.captivity_end_time", "captivityEndTime", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var captivity_end_time$field:Int64;

		public function clearCaptivityEndTime():void {
			captivity_end_time$field = null;
		}

		public function get hasCaptivityEndTime():Boolean {
			return captivity_end_time$field != null;
		}

		public function set captivityEndTime(value:Int64):void {
			captivity_end_time$field = value;
		}

		public function get captivityEndTime():Int64 {
			return captivity_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const WU_XUN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryModuleObjProto.wu_xun", "wuXun", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryModuleObjProto.CountryModuleWuXunProto; });

		private var wu_xun$field:app.message.CountryModuleObjProto.CountryModuleWuXunProto;

		public function clearWuXun():void {
			wu_xun$field = null;
		}

		public function get hasWuXun():Boolean {
			return wu_xun$field != null;
		}

		public function set wuXun(value:app.message.CountryModuleObjProto.CountryModuleWuXunProto):void {
			wu_xun$field = value;
		}

		public function get wuXun():app.message.CountryModuleObjProto.CountryModuleWuXunProto {
			return wu_xun$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TODAY_VOTE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CountryModuleObjProto.is_today_vote", "isTodayVote", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_today_vote$field:Boolean;

		public function clearIsTodayVote():void {
			hasField$0 &= 0xffffffdf;
			is_today_vote$field = new Boolean();
		}

		public function get hasIsTodayVote():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isTodayVote(value:Boolean):void {
			hasField$0 |= 0x20;
			is_today_vote$field = value;
		}

		public function get isTodayVote():Boolean {
			return is_today_vote$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHasCollectSalary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, has_collect_salary$field);
			}
			if (hasIsTodayBeenSetOfficer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_today_been_set_officer$field);
			}
			if (hasIsCountryDonate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_country_donate$field);
			}
			if (hasSetDontTalkTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, set_dont_talk_times$field);
			}
			if (hasCaptivityTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, captivity_times$field);
			}
			if (hasOfficerSetUntalkEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, officer_set_untalk_end_time$field);
			}
			if (hasCaptivityEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, captivity_end_time$field);
			}
			if (hasWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, wu_xun$field);
			}
			if (hasIsTodayVote) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_today_vote$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var has_collect_salary$count:uint = 0;
			var is_today_been_set_officer$count:uint = 0;
			var is_country_donate$count:uint = 0;
			var set_dont_talk_times$count:uint = 0;
			var captivity_times$count:uint = 0;
			var officer_set_untalk_end_time$count:uint = 0;
			var captivity_end_time$count:uint = 0;
			var wu_xun$count:uint = 0;
			var is_today_vote$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (has_collect_salary$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.hasCollectSalary cannot be set twice.');
					}
					++has_collect_salary$count;
					this.hasCollectSalary = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (is_today_been_set_officer$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.isTodayBeenSetOfficer cannot be set twice.');
					}
					++is_today_been_set_officer$count;
					this.isTodayBeenSetOfficer = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (is_country_donate$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.isCountryDonate cannot be set twice.');
					}
					++is_country_donate$count;
					this.isCountryDonate = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if (set_dont_talk_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.setDontTalkTimes cannot be set twice.');
					}
					++set_dont_talk_times$count;
					this.setDontTalkTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (captivity_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.captivityTimes cannot be set twice.');
					}
					++captivity_times$count;
					this.captivityTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (officer_set_untalk_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.officerSetUntalkEndTime cannot be set twice.');
					}
					++officer_set_untalk_end_time$count;
					this.officerSetUntalkEndTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 7:
					if (captivity_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.captivityEndTime cannot be set twice.');
					}
					++captivity_end_time$count;
					this.captivityEndTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 8:
					if (wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.wuXun cannot be set twice.');
					}
					++wu_xun$count;
					this.wuXun = new app.message.CountryModuleObjProto.CountryModuleWuXunProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.wuXun);
					break;
				case 9:
					if (is_today_vote$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleObjProto.isTodayVote cannot be set twice.');
					}
					++is_today_vote$count;
					this.isTodayVote = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
