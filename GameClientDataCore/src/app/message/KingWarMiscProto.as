package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class KingWarMiscProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WAR_PREPARE_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarMiscProto.war_prepare_duration", "warPrepareDuration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var war_prepare_duration$field:Int64;

		public function clearWarPrepareDuration():void {
			war_prepare_duration$field = null;
		}

		public function get hasWarPrepareDuration():Boolean {
			return war_prepare_duration$field != null;
		}

		public function set warPrepareDuration(value:Int64):void {
			war_prepare_duration$field = value;
		}

		public function get warPrepareDuration():Int64 {
			return war_prepare_duration$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarMiscProto.war_duration", "warDuration", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var war_duration$field:Int64;

		public function clearWarDuration():void {
			war_duration$field = null;
		}

		public function get hasWarDuration():Boolean {
			return war_duration$field != null;
		}

		public function set warDuration(value:Int64):void {
			war_duration$field = value;
		}

		public function get warDuration():Int64 {
			return war_duration$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_LEADER_LEVEL_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.KingWarMiscProto.guild_leader_level_limit", "guildLeaderLevelLimit", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guild_leader_level_limit$field:int;

		private var hasField$0:uint = 0;

		public function clearGuildLeaderLevelLimit():void {
			hasField$0 &= 0xfffffffe;
			guild_leader_level_limit$field = new int();
		}

		public function get hasGuildLeaderLevelLimit():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set guildLeaderLevelLimit(value:int):void {
			hasField$0 |= 0x1;
			guild_leader_level_limit$field = value;
		}

		public function get guildLeaderLevelLimit():int {
			return guild_leader_level_limit$field;
		}

		/**
		 *  @private
		 */
		public static const BID_MIN_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.KingWarMiscProto.bid_min_limit", "bidMinLimit", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid_min_limit$field:int;

		public function clearBidMinLimit():void {
			hasField$0 &= 0xfffffffd;
			bid_min_limit$field = new int();
		}

		public function get hasBidMinLimit():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set bidMinLimit(value:int):void {
			hasField$0 |= 0x2;
			bid_min_limit$field = value;
		}

		public function get bidMinLimit():int {
			return bid_min_limit$field;
		}

		/**
		 *  @private
		 */
		public static const BID_RESET_BUILD_TOKEN_COUNT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarMiscProto.bid_reset_build_token_count", "bidResetBuildTokenCount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid_reset_build_token_count$field:Int64;

		public function clearBidResetBuildTokenCount():void {
			bid_reset_build_token_count$field = null;
		}

		public function get hasBidResetBuildTokenCount():Boolean {
			return bid_reset_build_token_count$field != null;
		}

		public function set bidResetBuildTokenCount(value:Int64):void {
			bid_reset_build_token_count$field = value;
		}

		public function get bidResetBuildTokenCount():Int64 {
			return bid_reset_build_token_count$field;
		}

		/**
		 *  @private
		 */
		public static const BID_START_BEFORE_WAR_START_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarMiscProto.bid_start_before_war_start_duration", "bidStartBeforeWarStartDuration", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid_start_before_war_start_duration$field:Int64;

		public function clearBidStartBeforeWarStartDuration():void {
			bid_start_before_war_start_duration$field = null;
		}

		public function get hasBidStartBeforeWarStartDuration():Boolean {
			return bid_start_before_war_start_duration$field != null;
		}

		public function set bidStartBeforeWarStartDuration(value:Int64):void {
			bid_start_before_war_start_duration$field = value;
		}

		public function get bidStartBeforeWarStartDuration():Int64 {
			return bid_start_before_war_start_duration$field;
		}

		/**
		 *  @private
		 */
		public static const BID_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarMiscProto.bid_duration", "bidDuration", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid_duration$field:Int64;

		public function clearBidDuration():void {
			bid_duration$field = null;
		}

		public function get hasBidDuration():Boolean {
			return bid_duration$field != null;
		}

		public function set bidDuration(value:Int64):void {
			bid_duration$field = value;
		}

		public function get bidDuration():Int64 {
			return bid_duration$field;
		}

		/**
		 *  @private
		 */
		public static const BID_DELAY_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarMiscProto.bid_delay_duration", "bidDelayDuration", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid_delay_duration$field:Int64;

		public function clearBidDelayDuration():void {
			bid_delay_duration$field = null;
		}

		public function get hasBidDelayDuration():Boolean {
			return bid_delay_duration$field != null;
		}

		public function set bidDelayDuration(value:Int64):void {
			bid_delay_duration$field = value;
		}

		public function get bidDelayDuration():Int64 {
			return bid_delay_duration$field;
		}

		/**
		 *  @private
		 */
		public static const BID_CAN_DELAY_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.KingWarMiscProto.bid_can_delay_times", "bidCanDelayTimes", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid_can_delay_times$field:int;

		public function clearBidCanDelayTimes():void {
			hasField$0 &= 0xfffffffb;
			bid_can_delay_times$field = new int();
		}

		public function get hasBidCanDelayTimes():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set bidCanDelayTimes(value:int):void {
			hasField$0 |= 0x4;
			bid_can_delay_times$field = value;
		}

		public function get bidCanDelayTimes():int {
			return bid_can_delay_times$field;
		}

		/**
		 *  @private
		 */
		public static const BID_CAN_DELAY_BEFORE_END:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.KingWarMiscProto.bid_can_delay_before_end", "bidCanDelayBeforeEnd", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid_can_delay_before_end$field:Int64;

		public function clearBidCanDelayBeforeEnd():void {
			bid_can_delay_before_end$field = null;
		}

		public function get hasBidCanDelayBeforeEnd():Boolean {
			return bid_can_delay_before_end$field != null;
		}

		public function set bidCanDelayBeforeEnd(value:Int64):void {
			bid_can_delay_before_end$field = value;
		}

		public function get bidCanDelayBeforeEnd():Int64 {
			return bid_can_delay_before_end$field;
		}

		/**
		 *  @private
		 */
		public static const KING_GUILD_MEMBE_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.KingWarMiscProto.king_guild_membe_prize", "kingGuildMembePrize", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var king_guild_membe_prize$field:app.message.PrizeProto;

		public function clearKingGuildMembePrize():void {
			king_guild_membe_prize$field = null;
		}

		public function get hasKingGuildMembePrize():Boolean {
			return king_guild_membe_prize$field != null;
		}

		public function set kingGuildMembePrize(value:app.message.PrizeProto):void {
			king_guild_membe_prize$field = value;
		}

		public function get kingGuildMembePrize():app.message.PrizeProto {
			return king_guild_membe_prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWarPrepareDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, war_prepare_duration$field);
			}
			if (hasWarDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, war_duration$field);
			}
			if (hasGuildLeaderLevelLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, guild_leader_level_limit$field);
			}
			if (hasBidMinLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, bid_min_limit$field);
			}
			if (hasBidResetBuildTokenCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, bid_reset_build_token_count$field);
			}
			if (hasBidStartBeforeWarStartDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, bid_start_before_war_start_duration$field);
			}
			if (hasBidDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, bid_duration$field);
			}
			if (hasBidDelayDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, bid_delay_duration$field);
			}
			if (hasBidCanDelayTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, bid_can_delay_times$field);
			}
			if (hasBidCanDelayBeforeEnd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, bid_can_delay_before_end$field);
			}
			if (hasKingGuildMembePrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, king_guild_membe_prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var war_prepare_duration$count:uint = 0;
			var war_duration$count:uint = 0;
			var guild_leader_level_limit$count:uint = 0;
			var bid_min_limit$count:uint = 0;
			var bid_reset_build_token_count$count:uint = 0;
			var bid_start_before_war_start_duration$count:uint = 0;
			var bid_duration$count:uint = 0;
			var bid_delay_duration$count:uint = 0;
			var bid_can_delay_times$count:uint = 0;
			var bid_can_delay_before_end$count:uint = 0;
			var king_guild_membe_prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (war_prepare_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.warPrepareDuration cannot be set twice.');
					}
					++war_prepare_duration$count;
					this.warPrepareDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (war_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.warDuration cannot be set twice.');
					}
					++war_duration$count;
					this.warDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (guild_leader_level_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.guildLeaderLevelLimit cannot be set twice.');
					}
					++guild_leader_level_limit$count;
					this.guildLeaderLevelLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (bid_min_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.bidMinLimit cannot be set twice.');
					}
					++bid_min_limit$count;
					this.bidMinLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (bid_reset_build_token_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.bidResetBuildTokenCount cannot be set twice.');
					}
					++bid_reset_build_token_count$count;
					this.bidResetBuildTokenCount = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 7:
					if (bid_start_before_war_start_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.bidStartBeforeWarStartDuration cannot be set twice.');
					}
					++bid_start_before_war_start_duration$count;
					this.bidStartBeforeWarStartDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 8:
					if (bid_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.bidDuration cannot be set twice.');
					}
					++bid_duration$count;
					this.bidDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 9:
					if (bid_delay_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.bidDelayDuration cannot be set twice.');
					}
					++bid_delay_duration$count;
					this.bidDelayDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 10:
					if (bid_can_delay_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.bidCanDelayTimes cannot be set twice.');
					}
					++bid_can_delay_times$count;
					this.bidCanDelayTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (bid_can_delay_before_end$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.bidCanDelayBeforeEnd cannot be set twice.');
					}
					++bid_can_delay_before_end$count;
					this.bidCanDelayBeforeEnd = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 12:
					if (king_guild_membe_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarMiscProto.kingGuildMembePrize cannot be set twice.');
					}
					++king_guild_membe_prize$count;
					this.kingGuildMembePrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.kingGuildMembePrize);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
