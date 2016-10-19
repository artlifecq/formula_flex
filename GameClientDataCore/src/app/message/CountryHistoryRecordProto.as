package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto;
	import app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto;
	import app.message.CountryHistoryRecordProto.CountryJingShuRecordProto;
	import app.message.CountryHistoryRecordProto.CountryWarDefenceWinProto;
	import app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto;
	import app.message.CountryHistoryType;
	import app.message.CountryHistoryRecordProto.GuildTopRankProto;
	import app.message.CountryHistoryRecordProto.CountryKingWarFirstProto;
	import app.message.CountryHistoryRecordProto.CountryWarAttackFailProto;
	import app.message.CountryHistoryRecordProto.CountryWarAttackWinProto;
	import app.message.CountryHistoryRecordProto.EmperorWarWinProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryHistoryRecordProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryHistoryRecordProto.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:Int64;

		public function clearTime():void {
			time$field = null;
		}

		public function get hasTime():Boolean {
			return time$field != null;
		}

		public function set time(value:Int64):void {
			time$field = value;
		}

		public function get time():Int64 {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.CountryHistoryRecordProto.type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryHistoryType);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_FIRST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_war_first", "countryWarFirst", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto; });

		private var country_war_first$field:app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto;

		public function clearCountryWarFirst():void {
			country_war_first$field = null;
		}

		public function get hasCountryWarFirst():Boolean {
			return country_war_first$field != null;
		}

		public function set countryWarFirst(value:app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto):void {
			country_war_first$field = value;
		}

		public function get countryWarFirst():app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto {
			return country_war_first$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_TOP_RANK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.guild_top_rank", "guildTopRank", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.GuildTopRankProto; });

		private var guild_top_rank$field:app.message.CountryHistoryRecordProto.GuildTopRankProto;

		public function clearGuildTopRank():void {
			guild_top_rank$field = null;
		}

		public function get hasGuildTopRank():Boolean {
			return guild_top_rank$field != null;
		}

		public function set guildTopRank(value:app.message.CountryHistoryRecordProto.GuildTopRankProto):void {
			guild_top_rank$field = value;
		}

		public function get guildTopRank():app.message.CountryHistoryRecordProto.GuildTopRankProto {
			return guild_top_rank$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_JING_SHU:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_jing_shu", "countryJingShu", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.CountryJingShuRecordProto; });

		private var country_jing_shu$field:app.message.CountryHistoryRecordProto.CountryJingShuRecordProto;

		public function clearCountryJingShu():void {
			country_jing_shu$field = null;
		}

		public function get hasCountryJingShu():Boolean {
			return country_jing_shu$field != null;
		}

		public function set countryJingShu(value:app.message.CountryHistoryRecordProto.CountryJingShuRecordProto):void {
			country_jing_shu$field = value;
		}

		public function get countryJingShu():app.message.CountryHistoryRecordProto.CountryJingShuRecordProto {
			return country_jing_shu$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_KING_WAR_FIRST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_king_war_first", "countryKingWarFirst", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.CountryKingWarFirstProto; });

		private var country_king_war_first$field:app.message.CountryHistoryRecordProto.CountryKingWarFirstProto;

		public function clearCountryKingWarFirst():void {
			country_king_war_first$field = null;
		}

		public function get hasCountryKingWarFirst():Boolean {
			return country_king_war_first$field != null;
		}

		public function set countryKingWarFirst(value:app.message.CountryHistoryRecordProto.CountryKingWarFirstProto):void {
			country_king_war_first$field = value;
		}

		public function get countryKingWarFirst():app.message.CountryHistoryRecordProto.CountryKingWarFirstProto {
			return country_king_war_first$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_KING_WAR_REPLACE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_king_war_replace", "countryKingWarReplace", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto; });

		private var country_king_war_replace$field:app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto;

		public function clearCountryKingWarReplace():void {
			country_king_war_replace$field = null;
		}

		public function get hasCountryKingWarReplace():Boolean {
			return country_king_war_replace$field != null;
		}

		public function set countryKingWarReplace(value:app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto):void {
			country_king_war_replace$field = value;
		}

		public function get countryKingWarReplace():app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto {
			return country_king_war_replace$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_ATTACK_WIN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_war_attack_win", "countryWarAttackWin", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.CountryWarAttackWinProto; });

		private var country_war_attack_win$field:app.message.CountryHistoryRecordProto.CountryWarAttackWinProto;

		public function clearCountryWarAttackWin():void {
			country_war_attack_win$field = null;
		}

		public function get hasCountryWarAttackWin():Boolean {
			return country_war_attack_win$field != null;
		}

		public function set countryWarAttackWin(value:app.message.CountryHistoryRecordProto.CountryWarAttackWinProto):void {
			country_war_attack_win$field = value;
		}

		public function get countryWarAttackWin():app.message.CountryHistoryRecordProto.CountryWarAttackWinProto {
			return country_war_attack_win$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_ATTACK_FAIL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_war_attack_fail", "countryWarAttackFail", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.CountryWarAttackFailProto; });

		private var country_war_attack_fail$field:app.message.CountryHistoryRecordProto.CountryWarAttackFailProto;

		public function clearCountryWarAttackFail():void {
			country_war_attack_fail$field = null;
		}

		public function get hasCountryWarAttackFail():Boolean {
			return country_war_attack_fail$field != null;
		}

		public function set countryWarAttackFail(value:app.message.CountryHistoryRecordProto.CountryWarAttackFailProto):void {
			country_war_attack_fail$field = value;
		}

		public function get countryWarAttackFail():app.message.CountryHistoryRecordProto.CountryWarAttackFailProto {
			return country_war_attack_fail$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_DEFENCE_WIN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_war_defence_win", "countryWarDefenceWin", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.CountryWarDefenceWinProto; });

		private var country_war_defence_win$field:app.message.CountryHistoryRecordProto.CountryWarDefenceWinProto;

		public function clearCountryWarDefenceWin():void {
			country_war_defence_win$field = null;
		}

		public function get hasCountryWarDefenceWin():Boolean {
			return country_war_defence_win$field != null;
		}

		public function set countryWarDefenceWin(value:app.message.CountryHistoryRecordProto.CountryWarDefenceWinProto):void {
			country_war_defence_win$field = value;
		}

		public function get countryWarDefenceWin():app.message.CountryHistoryRecordProto.CountryWarDefenceWinProto {
			return country_war_defence_win$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_DEFENCE_FAIL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.country_war_defence_fail", "countryWarDefenceFail", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto; });

		private var country_war_defence_fail$field:app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto;

		public function clearCountryWarDefenceFail():void {
			country_war_defence_fail$field = null;
		}

		public function get hasCountryWarDefenceFail():Boolean {
			return country_war_defence_fail$field != null;
		}

		public function set countryWarDefenceFail(value:app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto):void {
			country_war_defence_fail$field = value;
		}

		public function get countryWarDefenceFail():app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto {
			return country_war_defence_fail$field;
		}

		/**
		 *  @private
		 */
		public static const EMPEROR_WAR_WIN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryHistoryRecordProto.emperor_war_win", "emperorWarWin", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryHistoryRecordProto.EmperorWarWinProto; });

		private var emperor_war_win$field:app.message.CountryHistoryRecordProto.EmperorWarWinProto;

		public function clearEmperorWarWin():void {
			emperor_war_win$field = null;
		}

		public function get hasEmperorWarWin():Boolean {
			return emperor_war_win$field != null;
		}

		public function set emperorWarWin(value:app.message.CountryHistoryRecordProto.EmperorWarWinProto):void {
			emperor_war_win$field = value;
		}

		public function get emperorWarWin():app.message.CountryHistoryRecordProto.EmperorWarWinProto {
			return emperor_war_win$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, time$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, type$field);
			}
			if (hasCountryWarFirst) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_war_first$field);
			}
			if (hasGuildTopRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, guild_top_rank$field);
			}
			if (hasCountryJingShu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_jing_shu$field);
			}
			if (hasCountryKingWarFirst) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_king_war_first$field);
			}
			if (hasCountryKingWarReplace) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_king_war_replace$field);
			}
			if (hasCountryWarAttackWin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_war_attack_win$field);
			}
			if (hasCountryWarAttackFail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_war_attack_fail$field);
			}
			if (hasCountryWarDefenceWin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_war_defence_win$field);
			}
			if (hasCountryWarDefenceFail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_war_defence_fail$field);
			}
			if (hasEmperorWarWin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, emperor_war_win$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time$count:uint = 0;
			var type$count:uint = 0;
			var country_war_first$count:uint = 0;
			var guild_top_rank$count:uint = 0;
			var country_jing_shu$count:uint = 0;
			var country_king_war_first$count:uint = 0;
			var country_king_war_replace$count:uint = 0;
			var country_war_attack_win$count:uint = 0;
			var country_war_attack_fail$count:uint = 0;
			var country_war_defence_win$count:uint = 0;
			var country_war_defence_fail$count:uint = 0;
			var emperor_war_win$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 11:
					if (country_war_first$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryWarFirst cannot be set twice.');
					}
					++country_war_first$count;
					this.countryWarFirst = new app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryWarFirst);
					break;
				case 12:
					if (guild_top_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.guildTopRank cannot be set twice.');
					}
					++guild_top_rank$count;
					this.guildTopRank = new app.message.CountryHistoryRecordProto.GuildTopRankProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.guildTopRank);
					break;
				case 13:
					if (country_jing_shu$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryJingShu cannot be set twice.');
					}
					++country_jing_shu$count;
					this.countryJingShu = new app.message.CountryHistoryRecordProto.CountryJingShuRecordProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryJingShu);
					break;
				case 14:
					if (country_king_war_first$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryKingWarFirst cannot be set twice.');
					}
					++country_king_war_first$count;
					this.countryKingWarFirst = new app.message.CountryHistoryRecordProto.CountryKingWarFirstProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryKingWarFirst);
					break;
				case 15:
					if (country_king_war_replace$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryKingWarReplace cannot be set twice.');
					}
					++country_king_war_replace$count;
					this.countryKingWarReplace = new app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryKingWarReplace);
					break;
				case 16:
					if (country_war_attack_win$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryWarAttackWin cannot be set twice.');
					}
					++country_war_attack_win$count;
					this.countryWarAttackWin = new app.message.CountryHistoryRecordProto.CountryWarAttackWinProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryWarAttackWin);
					break;
				case 17:
					if (country_war_attack_fail$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryWarAttackFail cannot be set twice.');
					}
					++country_war_attack_fail$count;
					this.countryWarAttackFail = new app.message.CountryHistoryRecordProto.CountryWarAttackFailProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryWarAttackFail);
					break;
				case 18:
					if (country_war_defence_win$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryWarDefenceWin cannot be set twice.');
					}
					++country_war_defence_win$count;
					this.countryWarDefenceWin = new app.message.CountryHistoryRecordProto.CountryWarDefenceWinProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryWarDefenceWin);
					break;
				case 19:
					if (country_war_defence_fail$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.countryWarDefenceFail cannot be set twice.');
					}
					++country_war_defence_fail$count;
					this.countryWarDefenceFail = new app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryWarDefenceFail);
					break;
				case 20:
					if (emperor_war_win$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryHistoryRecordProto.emperorWarWin cannot be set twice.');
					}
					++emperor_war_win$count;
					this.emperorWarWin = new app.message.CountryHistoryRecordProto.EmperorWarWinProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.emperorWarWin);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
