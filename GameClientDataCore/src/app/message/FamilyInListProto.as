package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyInListProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.FamilyInListProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:flash.utils.ByteArray;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:flash.utils.ByteArray):void {
			name$field = value;
		}

		public function get name():flash.utils.ByteArray {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyInListProto.country", "country", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		private var hasField$0:uint = 0;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffe;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x1;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyInListProto.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyInListProto.hero_count", "heroCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_count$field:int;

		public function clearHeroCount():void {
			hasField$0 &= 0xfffffffb;
			hero_count$field = new int();
		}

		public function get hasHeroCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set heroCount(value:int):void {
			hasField$0 |= 0x4;
			hero_count$field = value;
		}

		public function get heroCount():int {
			return hero_count$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_HERO_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyInListProto.max_hero_count", "maxHeroCount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hero_count$field:int;

		public function clearMaxHeroCount():void {
			hasField$0 &= 0xfffffff7;
			max_hero_count$field = new int();
		}

		public function get hasMaxHeroCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set maxHeroCount(value:int):void {
			hasField$0 |= 0x8;
			max_hero_count$field = value;
		}

		public function get maxHeroCount():int {
			return max_hero_count$field;
		}

		/**
		 *  @private
		 */
		public static const IS_AUTO_ACCEPT_JOIN_REQUEST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.FamilyInListProto.is_auto_accept_join_request", "isAutoAcceptJoinRequest", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_auto_accept_join_request$field:Boolean;

		public function clearIsAutoAcceptJoinRequest():void {
			hasField$0 &= 0xffffffef;
			is_auto_accept_join_request$field = new Boolean();
		}

		public function get hasIsAutoAcceptJoinRequest():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isAutoAcceptJoinRequest(value:Boolean):void {
			hasField$0 |= 0x10;
			is_auto_accept_join_request$field = value;
		}

		public function get isAutoAcceptJoinRequest():Boolean {
			return is_auto_accept_join_request$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ANY_LEADER_ONLINE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.FamilyInListProto.is_any_leader_online", "isAnyLeaderOnline", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_any_leader_online$field:Boolean;

		public function clearIsAnyLeaderOnline():void {
			hasField$0 &= 0xffffffdf;
			is_any_leader_online$field = new Boolean();
		}

		public function get hasIsAnyLeaderOnline():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isAnyLeaderOnline(value:Boolean):void {
			hasField$0 |= 0x20;
			is_any_leader_online$field = value;
		}

		public function get isAnyLeaderOnline():Boolean {
			return is_any_leader_online$field;
		}

		/**
		 *  @private
		 */
		public static const LEADER_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyInListProto.leader_id", "leaderId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const LEADER_NAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.FamilyInListProto.leader_name", "leaderName", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var leader_name$field:flash.utils.ByteArray;

		public function clearLeaderName():void {
			leader_name$field = null;
		}

		public function get hasLeaderName():Boolean {
			return leader_name$field != null;
		}

		public function set leaderName(value:flash.utils.ByteArray):void {
			leader_name$field = value;
		}

		public function get leaderName():flash.utils.ByteArray {
			return leader_name$field;
		}

		/**
		 *  @private
		 */
		public static const ONLINE_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyInListProto.online_count", "onlineCount", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var online_count$field:int;

		public function clearOnlineCount():void {
			hasField$0 &= 0xffffffbf;
			online_count$field = new int();
		}

		public function get hasOnlineCount():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set onlineCount(value:int):void {
			hasField$0 |= 0x40;
			online_count$field = value;
		}

		public function get onlineCount():int {
			return online_count$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyInListProto.create_time", "createTime", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var create_time$field:Int64;

		public function clearCreateTime():void {
			create_time$field = null;
		}

		public function get hasCreateTime():Boolean {
			return create_time$field != null;
		}

		public function set createTime(value:Int64):void {
			create_time$field = value;
		}

		public function get createTime():Int64 {
			return create_time$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.FamilyInListProto.guild_name", "guildName", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guild_name$field:String;

		public function clearGuildName():void {
			guild_name$field = null;
		}

		public function get hasGuildName():Boolean {
			return guild_name$field != null;
		}

		public function set guildName(value:String):void {
			guild_name$field = value;
		}

		public function get guildName():String {
			return guild_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, name$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasHeroCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hero_count$field);
			}
			if (hasMaxHeroCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_hero_count$field);
			}
			if (hasIsAutoAcceptJoinRequest) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_auto_accept_join_request$field);
			}
			if (hasIsAnyLeaderOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_any_leader_online$field);
			}
			if (hasLeaderId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, leader_id$field);
			}
			if (hasLeaderName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, leader_name$field);
			}
			if (hasOnlineCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, online_count$field);
			}
			if (hasCreateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, create_time$field);
			}
			if (hasGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, guild_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var country$count:uint = 0;
			var level$count:uint = 0;
			var hero_count$count:uint = 0;
			var max_hero_count$count:uint = 0;
			var is_auto_accept_join_request$count:uint = 0;
			var is_any_leader_online$count:uint = 0;
			var leader_id$count:uint = 0;
			var leader_name$count:uint = 0;
			var online_count$count:uint = 0;
			var create_time$count:uint = 0;
			var guild_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 2:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (hero_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.heroCount cannot be set twice.');
					}
					++hero_count$count;
					this.heroCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (max_hero_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.maxHeroCount cannot be set twice.');
					}
					++max_hero_count$count;
					this.maxHeroCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (is_auto_accept_join_request$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.isAutoAcceptJoinRequest cannot be set twice.');
					}
					++is_auto_accept_join_request$count;
					this.isAutoAcceptJoinRequest = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (is_any_leader_online$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.isAnyLeaderOnline cannot be set twice.');
					}
					++is_any_leader_online$count;
					this.isAnyLeaderOnline = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 8:
					if (leader_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.leaderId cannot be set twice.');
					}
					++leader_id$count;
					this.leaderId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 9:
					if (leader_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.leaderName cannot be set twice.');
					}
					++leader_name$count;
					this.leaderName = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 10:
					if (online_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.onlineCount cannot be set twice.');
					}
					++online_count$count;
					this.onlineCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (create_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.createTime cannot be set twice.');
					}
					++create_time$count;
					this.createTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 12:
					if (guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInListProto.guildName cannot be set twice.');
					}
					++guild_name$count;
					this.guildName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
