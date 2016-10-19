package app.message.AllFamilyOfficerDatasProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyOfficerPos;
	import app.message.FamilyBuildingType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyOfficerDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.pos", "pos", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FamilyOfficerPos);

		private var pos$field:int;

		private var hasField$0:uint = 0;

		public function clearPos():void {
			hasField$0 &= 0xfffffffe;
			pos$field = new int();
		}

		public function get hasPos():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set pos(value:int):void {
			hasField$0 |= 0x1;
			pos$field = value;
		}

		public function get pos():int {
			return pos$field;
		}

		/**
		 *  @private
		 */
		public static const POS_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.pos_name", "posName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pos_name$field:String;

		public function clearPosName():void {
			pos_name$field = null;
		}

		public function get hasPosName():Boolean {
			return pos_name$field != null;
		}

		public function set posName(value:String):void {
			pos_name$field = value;
		}

		public function get posName():String {
			return pos_name$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_INVITE_OTHER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_invite_other", "canInviteOther", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_invite_other$field:Boolean;

		public function clearCanInviteOther():void {
			hasField$0 &= 0xfffffffd;
			can_invite_other$field = new Boolean();
		}

		public function get hasCanInviteOther():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set canInviteOther(value:Boolean):void {
			hasField$0 |= 0x2;
			can_invite_other$field = value;
		}

		public function get canInviteOther():Boolean {
			return can_invite_other$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_KICK_OTHER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_kick_other", "canKickOther", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_kick_other$field:Boolean;

		public function clearCanKickOther():void {
			hasField$0 &= 0xfffffffb;
			can_kick_other$field = new Boolean();
		}

		public function get hasCanKickOther():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set canKickOther(value:Boolean):void {
			hasField$0 |= 0x4;
			can_kick_other$field = value;
		}

		public function get canKickOther():Boolean {
			return can_kick_other$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SET_OFFICER_POS:RepeatedFieldDescriptor$TYPE_ENUM = new RepeatedFieldDescriptor$TYPE_ENUM("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_set_officer_pos", "canSetOfficerPos", (5 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FamilyOfficerPos);

		[ArrayElementType("int")]
		public var canSetOfficerPos:Array = [];

		/**
		 *  @private
		 */
		public static const CAN_UPGRADE_BUILDING:RepeatedFieldDescriptor$TYPE_ENUM = new RepeatedFieldDescriptor$TYPE_ENUM("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_upgrade_building", "canUpgradeBuilding", (6 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FamilyBuildingType);

		[ArrayElementType("int")]
		public var canUpgradeBuilding:Array = [];

		/**
		 *  @private
		 */
		public static const CAN_CHANGE_ANNOUNCEMENT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_change_announcement", "canChangeAnnouncement", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_change_announcement$field:Boolean;

		public function clearCanChangeAnnouncement():void {
			hasField$0 &= 0xfffffff7;
			can_change_announcement$field = new Boolean();
		}

		public function get hasCanChangeAnnouncement():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set canChangeAnnouncement(value:Boolean):void {
			hasField$0 |= 0x8;
			can_change_announcement$field = value;
		}

		public function get canChangeAnnouncement():Boolean {
			return can_change_announcement$field;
		}

		/**
		 *  @private
		 */
		public static const IMPEACH_LEADER_OFFLINE_DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.impeach_leader_offline_duration", "impeachLeaderOfflineDuration", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var impeach_leader_offline_duration$field:Int64;

		public function clearImpeachLeaderOfflineDuration():void {
			impeach_leader_offline_duration$field = null;
		}

		public function get hasImpeachLeaderOfflineDuration():Boolean {
			return impeach_leader_offline_duration$field != null;
		}

		public function set impeachLeaderOfflineDuration(value:Int64):void {
			impeach_leader_offline_duration$field = value;
		}

		public function get impeachLeaderOfflineDuration():Int64 {
			return impeach_leader_offline_duration$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SET_AUTO_ACCEPT_JOIN_REQUEST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_set_auto_accept_join_request", "canSetAutoAcceptJoinRequest", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_set_auto_accept_join_request$field:Boolean;

		public function clearCanSetAutoAcceptJoinRequest():void {
			hasField$0 &= 0xffffffef;
			can_set_auto_accept_join_request$field = new Boolean();
		}

		public function get hasCanSetAutoAcceptJoinRequest():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set canSetAutoAcceptJoinRequest(value:Boolean):void {
			hasField$0 |= 0x10;
			can_set_auto_accept_join_request$field = value;
		}

		public function get canSetAutoAcceptJoinRequest():Boolean {
			return can_set_auto_accept_join_request$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_USE_FAMILY_TOKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_use_family_token", "canUseFamilyToken", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_use_family_token$field:Boolean;

		public function clearCanUseFamilyToken():void {
			hasField$0 &= 0xffffffdf;
			can_use_family_token$field = new Boolean();
		}

		public function get hasCanUseFamilyToken():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canUseFamilyToken(value:Boolean):void {
			hasField$0 |= 0x20;
			can_use_family_token$field = value;
		}

		public function get canUseFamilyToken():Boolean {
			return can_use_family_token$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_OPEN_ANIMAL_BAR_DUNGEON:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_open_animal_bar_dungeon", "canOpenAnimalBarDungeon", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_open_animal_bar_dungeon$field:Boolean;

		public function clearCanOpenAnimalBarDungeon():void {
			hasField$0 &= 0xffffffbf;
			can_open_animal_bar_dungeon$field = new Boolean();
		}

		public function get hasCanOpenAnimalBarDungeon():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set canOpenAnimalBarDungeon(value:Boolean):void {
			hasField$0 |= 0x40;
			can_open_animal_bar_dungeon$field = value;
		}

		public function get canOpenAnimalBarDungeon():Boolean {
			return can_open_animal_bar_dungeon$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_CREATE_GUILD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_create_guild", "canCreateGuild", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_create_guild$field:Boolean;

		public function clearCanCreateGuild():void {
			hasField$0 &= 0xffffff7f;
			can_create_guild$field = new Boolean();
		}

		public function get hasCanCreateGuild():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set canCreateGuild(value:Boolean):void {
			hasField$0 |= 0x80;
			can_create_guild$field = value;
		}

		public function get canCreateGuild():Boolean {
			return can_create_guild$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_JOIN_GUILD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_join_guild", "canJoinGuild", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_join_guild$field:Boolean;

		public function clearCanJoinGuild():void {
			hasField$0 &= 0xfffffeff;
			can_join_guild$field = new Boolean();
		}

		public function get hasCanJoinGuild():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set canJoinGuild(value:Boolean):void {
			hasField$0 |= 0x100;
			can_join_guild$field = value;
		}

		public function get canJoinGuild():Boolean {
			return can_join_guild$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_LEAVE_GUILD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto.can_leave_guild", "canLeaveGuild", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_leave_guild$field:Boolean;

		public function clearCanLeaveGuild():void {
			hasField$0 &= 0xfffffdff;
			can_leave_guild$field = new Boolean();
		}

		public function get hasCanLeaveGuild():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set canLeaveGuild(value:Boolean):void {
			hasField$0 |= 0x200;
			can_leave_guild$field = value;
		}

		public function get canLeaveGuild():Boolean {
			return can_leave_guild$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, pos$field);
			}
			if (hasPosName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pos_name$field);
			}
			if (hasCanInviteOther) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_invite_other$field);
			}
			if (hasCanKickOther) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_kick_other$field);
			}
			for (var canSetOfficerPos$index:uint = 0; canSetOfficerPos$index < this.canSetOfficerPos.length; ++canSetOfficerPos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.canSetOfficerPos[canSetOfficerPos$index]);
			}
			for (var canUpgradeBuilding$index:uint = 0; canUpgradeBuilding$index < this.canUpgradeBuilding.length; ++canUpgradeBuilding$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.canUpgradeBuilding[canUpgradeBuilding$index]);
			}
			if (hasCanChangeAnnouncement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_change_announcement$field);
			}
			if (hasImpeachLeaderOfflineDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, impeach_leader_offline_duration$field);
			}
			if (hasCanSetAutoAcceptJoinRequest) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_set_auto_accept_join_request$field);
			}
			if (hasCanUseFamilyToken) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_use_family_token$field);
			}
			if (hasCanOpenAnimalBarDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_open_animal_bar_dungeon$field);
			}
			if (hasCanCreateGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_create_guild$field);
			}
			if (hasCanJoinGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_join_guild$field);
			}
			if (hasCanLeaveGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, can_leave_guild$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pos$count:uint = 0;
			var pos_name$count:uint = 0;
			var can_invite_other$count:uint = 0;
			var can_kick_other$count:uint = 0;
			var can_change_announcement$count:uint = 0;
			var impeach_leader_offline_duration$count:uint = 0;
			var can_set_auto_accept_join_request$count:uint = 0;
			var can_use_family_token$count:uint = 0;
			var can_open_animal_bar_dungeon$count:uint = 0;
			var can_create_guild$count:uint = 0;
			var can_join_guild$count:uint = 0;
			var can_leave_guild$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (pos_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.posName cannot be set twice.');
					}
					++pos_name$count;
					this.posName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (can_invite_other$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canInviteOther cannot be set twice.');
					}
					++can_invite_other$count;
					this.canInviteOther = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if (can_kick_other$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canKickOther cannot be set twice.');
					}
					++can_kick_other$count;
					this.canKickOther = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_ENUM, this.canSetOfficerPos);
						break;
					}
					this.canSetOfficerPos.push(com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input));
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_ENUM, this.canUpgradeBuilding);
						break;
					}
					this.canUpgradeBuilding.push(com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input));
					break;
				case 7:
					if (can_change_announcement$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canChangeAnnouncement cannot be set twice.');
					}
					++can_change_announcement$count;
					this.canChangeAnnouncement = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 8:
					if (impeach_leader_offline_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.impeachLeaderOfflineDuration cannot be set twice.');
					}
					++impeach_leader_offline_duration$count;
					this.impeachLeaderOfflineDuration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 9:
					if (can_set_auto_accept_join_request$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canSetAutoAcceptJoinRequest cannot be set twice.');
					}
					++can_set_auto_accept_join_request$count;
					this.canSetAutoAcceptJoinRequest = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 10:
					if (can_use_family_token$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canUseFamilyToken cannot be set twice.');
					}
					++can_use_family_token$count;
					this.canUseFamilyToken = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 11:
					if (can_open_animal_bar_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canOpenAnimalBarDungeon cannot be set twice.');
					}
					++can_open_animal_bar_dungeon$count;
					this.canOpenAnimalBarDungeon = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 13:
					if (can_create_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canCreateGuild cannot be set twice.');
					}
					++can_create_guild$count;
					this.canCreateGuild = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 14:
					if (can_join_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canJoinGuild cannot be set twice.');
					}
					++can_join_guild$count;
					this.canJoinGuild = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 15:
					if (can_leave_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyOfficerDataProto.canLeaveGuild cannot be set twice.');
					}
					++can_leave_guild$count;
					this.canLeaveGuild = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
