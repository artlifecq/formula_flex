package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryWarTopRankProto;
	import app.message.CountryWarType;
	import app.message.CountryWarLogProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarEndProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WAR_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.CountryWarEndProto.war_type", "warType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryWarType);

		private var war_type$field:int;

		private var hasField$0:uint = 0;

		public function clearWarType():void {
			hasField$0 &= 0xfffffffe;
			war_type$field = new int();
		}

		public function get hasWarType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set warType(value:int):void {
			hasField$0 |= 0x1;
			war_type$field = value;
		}

		public function get warType():int {
			return war_type$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarEndProto.attack_country", "attackCountry", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_country$field:int;

		public function clearAttackCountry():void {
			hasField$0 &= 0xfffffffd;
			attack_country$field = new int();
		}

		public function get hasAttackCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set attackCountry(value:int):void {
			hasField$0 |= 0x2;
			attack_country$field = value;
		}

		public function get attackCountry():int {
			return attack_country$field;
		}

		/**
		 *  @private
		 */
		public static const SUPPORT_ATTACK_COUNTRY_COUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarEndProto.support_attack_country_count", "supportAttackCountryCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var support_attack_country_count$field:Int64;

		public function clearSupportAttackCountryCount():void {
			support_attack_country_count$field = null;
		}

		public function get hasSupportAttackCountryCount():Boolean {
			return support_attack_country_count$field != null;
		}

		public function set supportAttackCountryCount(value:Int64):void {
			support_attack_country_count$field = value;
		}

		public function get supportAttackCountryCount():Int64 {
			return support_attack_country_count$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK_TOP_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryWarEndProto.attack_top_ranks", "attackTopRanks", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarTopRankProto; });

		[ArrayElementType("app.message.CountryWarTopRankProto")]
		public var attackTopRanks:Array = [];

		/**
		 *  @private
		 */
		public static const ATTACK_COUNTRY_TOTAL_KILL_HERO_TIMES:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarEndProto.attack_country_total_kill_hero_times", "attackCountryTotalKillHeroTimes", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_country_total_kill_hero_times$field:Int64;

		public function clearAttackCountryTotalKillHeroTimes():void {
			attack_country_total_kill_hero_times$field = null;
		}

		public function get hasAttackCountryTotalKillHeroTimes():Boolean {
			return attack_country_total_kill_hero_times$field != null;
		}

		public function set attackCountryTotalKillHeroTimes(value:Int64):void {
			attack_country_total_kill_hero_times$field = value;
		}

		public function get attackCountryTotalKillHeroTimes():Int64 {
			return attack_country_total_kill_hero_times$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarEndProto.defence_country", "defenceCountry", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var defence_country$field:int;

		public function clearDefenceCountry():void {
			hasField$0 &= 0xfffffffb;
			defence_country$field = new int();
		}

		public function get hasDefenceCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set defenceCountry(value:int):void {
			hasField$0 |= 0x4;
			defence_country$field = value;
		}

		public function get defenceCountry():int {
			return defence_country$field;
		}

		/**
		 *  @private
		 */
		public static const SUPPORT_DEFENCE_COUNTRY_COUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarEndProto.support_defence_country_count", "supportDefenceCountryCount", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var support_defence_country_count$field:Int64;

		public function clearSupportDefenceCountryCount():void {
			support_defence_country_count$field = null;
		}

		public function get hasSupportDefenceCountryCount():Boolean {
			return support_defence_country_count$field != null;
		}

		public function set supportDefenceCountryCount(value:Int64):void {
			support_defence_country_count$field = value;
		}

		public function get supportDefenceCountryCount():Int64 {
			return support_defence_country_count$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_TOP_RANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryWarEndProto.defence_top_ranks", "defenceTopRanks", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarTopRankProto; });

		[ArrayElementType("app.message.CountryWarTopRankProto")]
		public var defenceTopRanks:Array = [];

		/**
		 *  @private
		 */
		public static const DEFENCE_COUNTRY_TOTAL_KILL_HERO_TIMES:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarEndProto.defence_country_total_kill_hero_times", "defenceCountryTotalKillHeroTimes", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var defence_country_total_kill_hero_times$field:Int64;

		public function clearDefenceCountryTotalKillHeroTimes():void {
			defence_country_total_kill_hero_times$field = null;
		}

		public function get hasDefenceCountryTotalKillHeroTimes():Boolean {
			return defence_country_total_kill_hero_times$field != null;
		}

		public function set defenceCountryTotalKillHeroTimes(value:Int64):void {
			defence_country_total_kill_hero_times$field = value;
		}

		public function get defenceCountryTotalKillHeroTimes():Int64 {
			return defence_country_total_kill_hero_times$field;
		}

		/**
		 *  @private
		 */
		public static const WIN_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarEndProto.win_country", "winCountry", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var win_country$field:int;

		public function clearWinCountry():void {
			hasField$0 &= 0xfffffff7;
			win_country$field = new int();
		}

		public function get hasWinCountry():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set winCountry(value:int):void {
			hasField$0 |= 0x8;
			win_country$field = value;
		}

		public function get winCountry():int {
			return win_country$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_LOGS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryWarEndProto.country_war_logs", "countryWarLogs", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarLogProto; });

		[ArrayElementType("app.message.CountryWarLogProto")]
		public var countryWarLogs:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWarType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, war_type$field);
			}
			if (hasAttackCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, attack_country$field);
			}
			if (hasSupportAttackCountryCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, support_attack_country_count$field);
			}
			for (var attackTopRanks$index:uint = 0; attackTopRanks$index < this.attackTopRanks.length; ++attackTopRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.attackTopRanks[attackTopRanks$index]);
			}
			if (hasAttackCountryTotalKillHeroTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, attack_country_total_kill_hero_times$field);
			}
			if (hasDefenceCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, defence_country$field);
			}
			if (hasSupportDefenceCountryCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, support_defence_country_count$field);
			}
			for (var defenceTopRanks$index:uint = 0; defenceTopRanks$index < this.defenceTopRanks.length; ++defenceTopRanks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.defenceTopRanks[defenceTopRanks$index]);
			}
			if (hasDefenceCountryTotalKillHeroTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, defence_country_total_kill_hero_times$field);
			}
			if (hasWinCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, win_country$field);
			}
			for (var countryWarLogs$index:uint = 0; countryWarLogs$index < this.countryWarLogs.length; ++countryWarLogs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.countryWarLogs[countryWarLogs$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var war_type$count:uint = 0;
			var attack_country$count:uint = 0;
			var support_attack_country_count$count:uint = 0;
			var attack_country_total_kill_hero_times$count:uint = 0;
			var defence_country$count:uint = 0;
			var support_defence_country_count$count:uint = 0;
			var defence_country_total_kill_hero_times$count:uint = 0;
			var win_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (war_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.warType cannot be set twice.');
					}
					++war_type$count;
					this.warType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (attack_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.attackCountry cannot be set twice.');
					}
					++attack_country$count;
					this.attackCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (support_attack_country_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.supportAttackCountryCount cannot be set twice.');
					}
					++support_attack_country_count$count;
					this.supportAttackCountryCount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					this.attackTopRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryWarTopRankProto()));
					break;
				case 5:
					if (attack_country_total_kill_hero_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.attackCountryTotalKillHeroTimes cannot be set twice.');
					}
					++attack_country_total_kill_hero_times$count;
					this.attackCountryTotalKillHeroTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (defence_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.defenceCountry cannot be set twice.');
					}
					++defence_country$count;
					this.defenceCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (support_defence_country_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.supportDefenceCountryCount cannot be set twice.');
					}
					++support_defence_country_count$count;
					this.supportDefenceCountryCount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 8:
					this.defenceTopRanks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryWarTopRankProto()));
					break;
				case 9:
					if (defence_country_total_kill_hero_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.defenceCountryTotalKillHeroTimes cannot be set twice.');
					}
					++defence_country_total_kill_hero_times$count;
					this.defenceCountryTotalKillHeroTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 10:
					if (win_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarEndProto.winCountry cannot be set twice.');
					}
					++win_country$count;
					this.winCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					this.countryWarLogs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryWarLogProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
