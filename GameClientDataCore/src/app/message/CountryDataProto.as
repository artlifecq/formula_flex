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
	import app.message.CountryPowerType;
	import app.message.CountryWarStatusProto;
	import app.message.CountryExchequerProto;
	import app.message.CountryUnionStatusProto;
	import app.message.CountryStrategyProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POWER_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.CountryDataProto.power_type", "powerType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryPowerType);

		private var power_type$field:int;

		private var hasField$0:uint = 0;

		public function clearPowerType():void {
			hasField$0 &= 0xfffffffe;
			power_type$field = new int();
		}

		public function get hasPowerType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set powerType(value:int):void {
			hasField$0 |= 0x1;
			power_type$field = value;
		}

		public function get powerType():int {
			return power_type$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_POWER:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryDataProto.country_power", "countryPower", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const JING_SHU:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryDataProto.jing_shu", "jingShu", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryJingShuProto; });

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
		public static const UNION_STATUS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryDataProto.union_status", "unionStatus", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryUnionStatusProto; });

		private var union_status$field:app.message.CountryUnionStatusProto;

		public function clearUnionStatus():void {
			union_status$field = null;
		}

		public function get hasUnionStatus():Boolean {
			return union_status$field != null;
		}

		public function set unionStatus(value:app.message.CountryUnionStatusProto):void {
			union_status$field = value;
		}

		public function get unionStatus():app.message.CountryUnionStatusProto {
			return union_status$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_STATUS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryDataProto.war_status", "warStatus", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarStatusProto; });

		private var war_status$field:app.message.CountryWarStatusProto;

		public function clearWarStatus():void {
			war_status$field = null;
		}

		public function get hasWarStatus():Boolean {
			return war_status$field != null;
		}

		public function set warStatus(value:app.message.CountryWarStatusProto):void {
			war_status$field = value;
		}

		public function get warStatus():app.message.CountryWarStatusProto {
			return war_status$field;
		}

		/**
		 *  @private
		 */
		public static const EXCHEQUER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryDataProto.exchequer", "exchequer", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryExchequerProto; });

		private var exchequer$field:app.message.CountryExchequerProto;

		public function clearExchequer():void {
			exchequer$field = null;
		}

		public function get hasExchequer():Boolean {
			return exchequer$field != null;
		}

		public function set exchequer(value:app.message.CountryExchequerProto):void {
			exchequer$field = value;
		}

		public function get exchequer():app.message.CountryExchequerProto {
			return exchequer$field;
		}

		/**
		 *  @private
		 */
		public static const STRATEGY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryDataProto.strategy", "strategy", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryStrategyProto; });

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
		public static const YESTERDAY_GOOD_COMMENTS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryDataProto.yesterday_good_comments", "yesterdayGoodComments", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yesterday_good_comments$field:int;

		public function clearYesterdayGoodComments():void {
			hasField$0 &= 0xfffffffd;
			yesterday_good_comments$field = new int();
		}

		public function get hasYesterdayGoodComments():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set yesterdayGoodComments(value:int):void {
			hasField$0 |= 0x2;
			yesterday_good_comments$field = value;
		}

		public function get yesterdayGoodComments():int {
			return yesterday_good_comments$field;
		}

		/**
		 *  @private
		 */
		public static const YESTERDAY_BAD_COMMENTS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryDataProto.yesterday_bad_comments", "yesterdayBadComments", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yesterday_bad_comments$field:int;

		public function clearYesterdayBadComments():void {
			hasField$0 &= 0xfffffffb;
			yesterday_bad_comments$field = new int();
		}

		public function get hasYesterdayBadComments():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set yesterdayBadComments(value:int):void {
			hasField$0 |= 0x4;
			yesterday_bad_comments$field = value;
		}

		public function get yesterdayBadComments():int {
			return yesterday_bad_comments$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPowerType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, power_type$field);
			}
			if (hasCountryPower) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, country_power$field);
			}
			if (hasJingShu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, jing_shu$field);
			}
			if (hasUnionStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, union_status$field);
			}
			if (hasWarStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, war_status$field);
			}
			if (hasExchequer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, exchequer$field);
			}
			if (hasStrategy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, strategy$field);
			}
			if (hasYesterdayGoodComments) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, yesterday_good_comments$field);
			}
			if (hasYesterdayBadComments) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, yesterday_bad_comments$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var power_type$count:uint = 0;
			var country_power$count:uint = 0;
			var jing_shu$count:uint = 0;
			var union_status$count:uint = 0;
			var war_status$count:uint = 0;
			var exchequer$count:uint = 0;
			var strategy$count:uint = 0;
			var yesterday_good_comments$count:uint = 0;
			var yesterday_bad_comments$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (power_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.powerType cannot be set twice.');
					}
					++power_type$count;
					this.powerType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (country_power$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.countryPower cannot be set twice.');
					}
					++country_power$count;
					this.countryPower = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (jing_shu$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.jingShu cannot be set twice.');
					}
					++jing_shu$count;
					this.jingShu = new app.message.CountryJingShuProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.jingShu);
					break;
				case 4:
					if (union_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.unionStatus cannot be set twice.');
					}
					++union_status$count;
					this.unionStatus = new app.message.CountryUnionStatusProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.unionStatus);
					break;
				case 5:
					if (war_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.warStatus cannot be set twice.');
					}
					++war_status$count;
					this.warStatus = new app.message.CountryWarStatusProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.warStatus);
					break;
				case 6:
					if (exchequer$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.exchequer cannot be set twice.');
					}
					++exchequer$count;
					this.exchequer = new app.message.CountryExchequerProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.exchequer);
					break;
				case 7:
					if (strategy$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.strategy cannot be set twice.');
					}
					++strategy$count;
					this.strategy = new app.message.CountryStrategyProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.strategy);
					break;
				case 8:
					if (yesterday_good_comments$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.yesterdayGoodComments cannot be set twice.');
					}
					++yesterday_good_comments$count;
					this.yesterdayGoodComments = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (yesterday_bad_comments$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryDataProto.yesterdayBadComments cannot be set twice.');
					}
					++yesterday_bad_comments$count;
					this.yesterdayBadComments = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
