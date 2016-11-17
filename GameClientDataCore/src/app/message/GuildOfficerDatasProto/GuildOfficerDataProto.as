package app.message.GuildOfficerDatasProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GuildOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GuildOfficerDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.pos", "pos", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.GuildOfficerPos);

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
		public static const POS_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.pos_name", "posName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const CAN_NOT_KICK_OTHER_OFFICER_POS:RepeatedFieldDescriptor_TYPE_ENUM = new RepeatedFieldDescriptor_TYPE_ENUM("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.can_not_kick_other_officer_pos", "canNotKickOtherOfficerPos", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.GuildOfficerPos);

		[ArrayElementType("int")]
		public var canNotKickOtherOfficerPos:Array = [];

		/**
		 *  @private
		 */
		public static const CAN_SET_OFFICER_POS:RepeatedFieldDescriptor_TYPE_ENUM = new RepeatedFieldDescriptor_TYPE_ENUM("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.can_set_officer_pos", "canSetOfficerPos", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.GuildOfficerPos);

		[ArrayElementType("int")]
		public var canSetOfficerPos:Array = [];

		/**
		 *  @private
		 */
		public static const CAN_INVITE_OTHER_FAMILY:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.can_invite_other_family", "canInviteOtherFamily", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_invite_other_family$field:Boolean;

		public function clearCanInviteOtherFamily():void {
			hasField$0 &= 0xfffffffd;
			can_invite_other_family$field = new Boolean();
		}

		public function get hasCanInviteOtherFamily():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set canInviteOtherFamily(value:Boolean):void {
			hasField$0 |= 0x2;
			can_invite_other_family$field = value;
		}

		public function get canInviteOtherFamily():Boolean {
			return can_invite_other_family$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SET_ANNOUCEMENT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.can_set_annoucement", "canSetAnnoucement", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_set_annoucement$field:Boolean;

		public function clearCanSetAnnoucement():void {
			hasField$0 &= 0xfffffffb;
			can_set_annoucement$field = new Boolean();
		}

		public function get hasCanSetAnnoucement():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set canSetAnnoucement(value:Boolean):void {
			hasField$0 |= 0x4;
			can_set_annoucement$field = value;
		}

		public function get canSetAnnoucement():Boolean {
			return can_set_annoucement$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_UPGRADE_GUILD_LEVEL:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.can_upgrade_guild_level", "canUpgradeGuildLevel", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_upgrade_guild_level$field:Boolean;

		public function clearCanUpgradeGuildLevel():void {
			hasField$0 &= 0xfffffff7;
			can_upgrade_guild_level$field = new Boolean();
		}

		public function get hasCanUpgradeGuildLevel():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set canUpgradeGuildLevel(value:Boolean):void {
			hasField$0 |= 0x8;
			can_upgrade_guild_level$field = value;
		}

		public function get canUpgradeGuildLevel():Boolean {
			return can_upgrade_guild_level$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_KING_WAR_BID:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GuildOfficerDatasProto.GuildOfficerDataProto.can_king_war_bid", "canKingWarBid", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_king_war_bid$field:Boolean;

		public function clearCanKingWarBid():void {
			hasField$0 &= 0xffffffef;
			can_king_war_bid$field = new Boolean();
		}

		public function get hasCanKingWarBid():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set canKingWarBid(value:Boolean):void {
			hasField$0 |= 0x10;
			can_king_war_bid$field = value;
		}

		public function get canKingWarBid():Boolean {
			return can_king_war_bid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, pos$field);
			}
			if (hasPosName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, pos_name$field);
			}
			for (var canNotKickOtherOfficerPos$index:uint = 0; canNotKickOtherOfficerPos$index < this.canNotKickOtherOfficerPos.length; ++canNotKickOtherOfficerPos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.canNotKickOtherOfficerPos[canNotKickOtherOfficerPos$index]);
			}
			for (var canSetOfficerPos$index:uint = 0; canSetOfficerPos$index < this.canSetOfficerPos.length; ++canSetOfficerPos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.canSetOfficerPos[canSetOfficerPos$index]);
			}
			if (hasCanInviteOtherFamily) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_invite_other_family$field);
			}
			if (hasCanSetAnnoucement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_set_annoucement$field);
			}
			if (hasCanUpgradeGuildLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_upgrade_guild_level$field);
			}
			if (hasCanKingWarBid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_king_war_bid$field);
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
			var can_invite_other_family$count:uint = 0;
			var can_set_annoucement$count:uint = 0;
			var can_upgrade_guild_level$count:uint = 0;
			var can_king_war_bid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildOfficerDataProto.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (pos_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildOfficerDataProto.posName cannot be set twice.');
					}
					++pos_name$count;
					this.posName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_ENUM, this.canNotKickOtherOfficerPos);
						break;
					}
					this.canNotKickOtherOfficerPos.push(com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input));
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_ENUM, this.canSetOfficerPos);
						break;
					}
					this.canSetOfficerPos.push(com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input));
					break;
				case 5:
					if (can_invite_other_family$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildOfficerDataProto.canInviteOtherFamily cannot be set twice.');
					}
					++can_invite_other_family$count;
					this.canInviteOtherFamily = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 6:
					if (can_set_annoucement$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildOfficerDataProto.canSetAnnoucement cannot be set twice.');
					}
					++can_set_annoucement$count;
					this.canSetAnnoucement = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (can_upgrade_guild_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildOfficerDataProto.canUpgradeGuildLevel cannot be set twice.');
					}
					++can_upgrade_guild_level$count;
					this.canUpgradeGuildLevel = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 8:
					if (can_king_war_bid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildOfficerDataProto.canKingWarBid cannot be set twice.');
					}
					++can_king_war_bid$count;
					this.canKingWarBid = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
