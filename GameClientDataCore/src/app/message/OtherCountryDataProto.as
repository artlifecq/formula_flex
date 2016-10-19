package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryJingShuProto;
	import app.message.OtherUnionStatusProto;
	import app.message.CountryPowerType;
	import app.message.OtherCountryWarStatusProto;
	import app.message.CountryStrategyProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OtherCountryDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEQUENCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.OtherCountryDataProto.sequence", "sequence", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sequence$field:int;

		private var hasField$0:uint = 0;

		public function clearSequence():void {
			hasField$0 &= 0xfffffffe;
			sequence$field = new int();
		}

		public function get hasSequence():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sequence(value:int):void {
			hasField$0 |= 0x1;
			sequence$field = value;
		}

		public function get sequence():int {
			return sequence$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_POWER:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.OtherCountryDataProto.country_power", "countryPower", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_power$field:Int64;

		public function clearCountryPower():void {
			country_power$field = null;
		}

		public function get hasCountryPower():Boolean {
			return country_power$field != null;
		}

		public function set countryPower(value:Int64):void {
			country_power$field = value;
		}

		public function get countryPower():Int64 {
			return country_power$field;
		}

		/**
		 *  @private
		 */
		public static const POWER_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.OtherCountryDataProto.power_type", "powerType", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryPowerType);

		private var power_type$field:int;

		public function clearPowerType():void {
			hasField$0 &= 0xfffffffd;
			power_type$field = new int();
		}

		public function get hasPowerType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set powerType(value:int):void {
			hasField$0 |= 0x2;
			power_type$field = value;
		}

		public function get powerType():int {
			return power_type$field;
		}

		/**
		 *  @private
		 */
		public static const JING_SHU:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.OtherCountryDataProto.jing_shu", "jingShu", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryJingShuProto; });

		private var jing_shu$field:app.message.CountryJingShuProto;

		public function clearJingShu():void {
			jing_shu$field = null;
		}

		public function get hasJingShu():Boolean {
			return jing_shu$field != null;
		}

		public function set jingShu(value:app.message.CountryJingShuProto):void {
			jing_shu$field = value;
		}

		public function get jingShu():app.message.CountryJingShuProto {
			return jing_shu$field;
		}

		/**
		 *  @private
		 */
		public static const UNION_STATUS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.OtherCountryDataProto.union_status", "unionStatus", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.OtherUnionStatusProto; });

		private var union_status$field:app.message.OtherUnionStatusProto;

		public function clearUnionStatus():void {
			union_status$field = null;
		}

		public function get hasUnionStatus():Boolean {
			return union_status$field != null;
		}

		public function set unionStatus(value:app.message.OtherUnionStatusProto):void {
			union_status$field = value;
		}

		public function get unionStatus():app.message.OtherUnionStatusProto {
			return union_status$field;
		}

		/**
		 *  @private
		 */
		public static const STRATEGY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.OtherCountryDataProto.strategy", "strategy", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryStrategyProto; });

		private var strategy$field:app.message.CountryStrategyProto;

		public function clearStrategy():void {
			strategy$field = null;
		}

		public function get hasStrategy():Boolean {
			return strategy$field != null;
		}

		public function set strategy(value:app.message.CountryStrategyProto):void {
			strategy$field = value;
		}

		public function get strategy():app.message.CountryStrategyProto {
			return strategy$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_STATUS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.OtherCountryDataProto.war_status", "warStatus", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.OtherCountryWarStatusProto; });

		private var war_status$field:app.message.OtherCountryWarStatusProto;

		public function clearWarStatus():void {
			war_status$field = null;
		}

		public function get hasWarStatus():Boolean {
			return war_status$field != null;
		}

		public function set warStatus(value:app.message.OtherCountryWarStatusProto):void {
			war_status$field = value;
		}

		public function get warStatus():app.message.OtherCountryWarStatusProto {
			return war_status$field;
		}

		/**
		 *  @private
		 */
		public static const YESTERDAY_GOOD_COMMENTS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.OtherCountryDataProto.yesterday_good_comments", "yesterdayGoodComments", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yesterday_good_comments$field:int;

		public function clearYesterdayGoodComments():void {
			hasField$0 &= 0xfffffffb;
			yesterday_good_comments$field = new int();
		}

		public function get hasYesterdayGoodComments():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set yesterdayGoodComments(value:int):void {
			hasField$0 |= 0x4;
			yesterday_good_comments$field = value;
		}

		public function get yesterdayGoodComments():int {
			return yesterday_good_comments$field;
		}

		/**
		 *  @private
		 */
		public static const YESTERDAY_BAD_COMMENTS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.OtherCountryDataProto.yesterday_bad_comments", "yesterdayBadComments", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yesterday_bad_comments$field:int;

		public function clearYesterdayBadComments():void {
			hasField$0 &= 0xfffffff7;
			yesterday_bad_comments$field = new int();
		}

		public function get hasYesterdayBadComments():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set yesterdayBadComments(value:int):void {
			hasField$0 |= 0x8;
			yesterday_bad_comments$field = value;
		}

		public function get yesterdayBadComments():int {
			return yesterday_bad_comments$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSequence) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, sequence$field);
			}
			if (hasCountryPower) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, country_power$field);
			}
			if (hasPowerType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, power_type$field);
			}
			if (hasJingShu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, jing_shu$field);
			}
			if (hasUnionStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, union_status$field);
			}
			if (hasStrategy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, strategy$field);
			}
			if (hasWarStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, war_status$field);
			}
			if (hasYesterdayGoodComments) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, yesterday_good_comments$field);
			}
			if (hasYesterdayBadComments) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, yesterday_bad_comments$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var sequence$count:uint = 0;
			var country_power$count:uint = 0;
			var power_type$count:uint = 0;
			var jing_shu$count:uint = 0;
			var union_status$count:uint = 0;
			var strategy$count:uint = 0;
			var war_status$count:uint = 0;
			var yesterday_good_comments$count:uint = 0;
			var yesterday_bad_comments$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (sequence$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.sequence cannot be set twice.');
					}
					++sequence$count;
					this.sequence = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (country_power$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.countryPower cannot be set twice.');
					}
					++country_power$count;
					this.countryPower = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (power_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.powerType cannot be set twice.');
					}
					++power_type$count;
					this.powerType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 4:
					if (jing_shu$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.jingShu cannot be set twice.');
					}
					++jing_shu$count;
					this.jingShu = new app.message.CountryJingShuProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.jingShu);
					break;
				case 5:
					if (union_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.unionStatus cannot be set twice.');
					}
					++union_status$count;
					this.unionStatus = new app.message.OtherUnionStatusProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.unionStatus);
					break;
				case 6:
					if (strategy$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.strategy cannot be set twice.');
					}
					++strategy$count;
					this.strategy = new app.message.CountryStrategyProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.strategy);
					break;
				case 7:
					if (war_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.warStatus cannot be set twice.');
					}
					++war_status$count;
					this.warStatus = new app.message.OtherCountryWarStatusProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.warStatus);
					break;
				case 8:
					if (yesterday_good_comments$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.yesterdayGoodComments cannot be set twice.');
					}
					++yesterday_good_comments$count;
					this.yesterdayGoodComments = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (yesterday_bad_comments$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryDataProto.yesterdayBadComments cannot be set twice.');
					}
					++yesterday_bad_comments$count;
					this.yesterdayBadComments = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
