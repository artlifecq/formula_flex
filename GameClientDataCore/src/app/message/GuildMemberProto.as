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
	public dynamic final class GuildMemberProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAMILY_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.GuildMemberProto.family_name", "familyName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var family_name$field:String;

		public function clearFamilyName():void {
			family_name$field = null;
		}

		public function get hasFamilyName():Boolean {
			return family_name$field != null;
		}

		public function set familyName(value:String):void {
			family_name$field = value;
		}

		public function get familyName():String {
			return family_name$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildMemberProto.family_level", "familyLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_level$field:int;

		private var hasField$0:uint = 0;

		public function clearFamilyLevel():void {
			hasField$0 &= 0xfffffffe;
			family_level$field = new int();
		}

		public function get hasFamilyLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set familyLevel(value:int):void {
			hasField$0 |= 0x1;
			family_level$field = value;
		}

		public function get familyLevel():int {
			return family_level$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_FIGHTING_AMOUNT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildMemberProto.total_fighting_amount", "totalFightingAmount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_fighting_amount$field:Int64;

		public function clearTotalFightingAmount():void {
			total_fighting_amount$field = null;
		}

		public function get hasTotalFightingAmount():Boolean {
			return total_fighting_amount$field != null;
		}

		public function set totalFightingAmount(value:Int64):void {
			total_fighting_amount$field = value;
		}

		public function get totalFightingAmount():Int64 {
			return total_fighting_amount$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_GUILD_CONTRIBUTION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildMemberProto.total_guild_contribution", "totalGuildContribution", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_guild_contribution$field:Int64;

		public function clearTotalGuildContribution():void {
			total_guild_contribution$field = null;
		}

		public function get hasTotalGuildContribution():Boolean {
			return total_guild_contribution$field != null;
		}

		public function set totalGuildContribution(value:Int64):void {
			total_guild_contribution$field = value;
		}

		public function get totalGuildContribution():Int64 {
			return total_guild_contribution$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_MEMBER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildMemberProto.family_member", "familyMember", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_member$field:int;

		public function clearFamilyMember():void {
			hasField$0 &= 0xfffffffd;
			family_member$field = new int();
		}

		public function get hasFamilyMember():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set familyMember(value:int):void {
			hasField$0 |= 0x2;
			family_member$field = value;
		}

		public function get familyMember():int {
			return family_member$field;
		}

		/**
		 *  @private
		 */
		public static const ONLINE_MEMBER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildMemberProto.online_member", "onlineMember", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var online_member$field:int;

		public function clearOnlineMember():void {
			hasField$0 &= 0xfffffffb;
			online_member$field = new int();
		}

		public function get hasOnlineMember():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set onlineMember(value:int):void {
			hasField$0 |= 0x4;
			online_member$field = value;
		}

		public function get onlineMember():int {
			return online_member$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_LEADER_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildMemberProto.country_leader_count", "countryLeaderCount", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_leader_count$field:int;

		public function clearCountryLeaderCount():void {
			hasField$0 &= 0xfffffff7;
			country_leader_count$field = new int();
		}

		public function get hasCountryLeaderCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set countryLeaderCount(value:int):void {
			hasField$0 |= 0x8;
			country_leader_count$field = value;
		}

		public function get countryLeaderCount():int {
			return country_leader_count$field;
		}

		/**
		 *  @private
		 */
		public static const LEADER_ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildMemberProto.leader_id", "leaderId", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var leader_id$field:Int64;

		public function clearLeaderId():void {
			leader_id$field = null;
		}

		public function get hasLeaderId():Boolean {
			return leader_id$field != null;
		}

		public function set leaderId(value:Int64):void {
			leader_id$field = value;
		}

		public function get leaderId():Int64 {
			return leader_id$field;
		}

		/**
		 *  @private
		 */
		public static const LEADER_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.GuildMemberProto.leader_name", "leaderName", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var leader_name$field:String;

		public function clearLeaderName():void {
			leader_name$field = null;
		}

		public function get hasLeaderName():Boolean {
			return leader_name$field != null;
		}

		public function set leaderName(value:String):void {
			leader_name$field = value;
		}

		public function get leaderName():String {
			return leader_name$field;
		}

		/**
		 *  @private
		 */
		public static const LEADER_IS_ONLINE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GuildMemberProto.leader_is_online", "leaderIsOnline", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var leader_is_online$field:Boolean;

		public function clearLeaderIsOnline():void {
			hasField$0 &= 0xffffffef;
			leader_is_online$field = new Boolean();
		}

		public function get hasLeaderIsOnline():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set leaderIsOnline(value:Boolean):void {
			hasField$0 |= 0x10;
			leader_is_online$field = value;
		}

		public function get leaderIsOnline():Boolean {
			return leader_is_online$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFamilyName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, family_name$field);
			}
			if (hasFamilyLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, family_level$field);
			}
			if (hasTotalFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, total_fighting_amount$field);
			}
			if (hasTotalGuildContribution) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, total_guild_contribution$field);
			}
			if (hasFamilyMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, family_member$field);
			}
			if (hasOnlineMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, online_member$field);
			}
			if (hasCountryLeaderCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, country_leader_count$field);
			}
			if (hasLeaderId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, leader_id$field);
			}
			if (hasLeaderName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, leader_name$field);
			}
			if (hasLeaderIsOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, leader_is_online$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var family_name$count:uint = 0;
			var family_level$count:uint = 0;
			var total_fighting_amount$count:uint = 0;
			var total_guild_contribution$count:uint = 0;
			var family_member$count:uint = 0;
			var online_member$count:uint = 0;
			var country_leader_count$count:uint = 0;
			var leader_id$count:uint = 0;
			var leader_name$count:uint = 0;
			var leader_is_online$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (family_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.familyName cannot be set twice.');
					}
					++family_name$count;
					this.familyName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (family_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.familyLevel cannot be set twice.');
					}
					++family_level$count;
					this.familyLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (total_fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.totalFightingAmount cannot be set twice.');
					}
					++total_fighting_amount$count;
					this.totalFightingAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (total_guild_contribution$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.totalGuildContribution cannot be set twice.');
					}
					++total_guild_contribution$count;
					this.totalGuildContribution = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (family_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.familyMember cannot be set twice.');
					}
					++family_member$count;
					this.familyMember = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (online_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.onlineMember cannot be set twice.');
					}
					++online_member$count;
					this.onlineMember = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (country_leader_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.countryLeaderCount cannot be set twice.');
					}
					++country_leader_count$count;
					this.countryLeaderCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (leader_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.leaderId cannot be set twice.');
					}
					++leader_id$count;
					this.leaderId = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 11:
					if (leader_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.leaderName cannot be set twice.');
					}
					++leader_name$count;
					this.leaderName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 12:
					if (leader_is_online$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMemberProto.leaderIsOnline cannot be set twice.');
					}
					++leader_is_online$count;
					this.leaderIsOnline = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
