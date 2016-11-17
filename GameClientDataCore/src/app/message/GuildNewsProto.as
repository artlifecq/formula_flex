package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GuildNewsProto.SetPosProto;
	import app.message.GuildNewsProto.MaintainProto;
	import app.message.GuildNewsProto.UpgradeLevelProto;
	import app.message.GuildNewsProto.JoinGuildProto;
	import app.message.GuildNewsProto.LeaveGuildProto;
	import app.message.GuildNewsProto.DonateProto;
	import app.message.GuildNewsProto.CreateGuildProto;
	import app.message.GuildNewsProto.DemoteLevelProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GuildNewsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildNewsProto.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SET_POS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.set_pos", "setPos", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.SetPosProto; });

		private var set_pos$field:app.message.GuildNewsProto.SetPosProto;

		public function clearSetPos():void {
			set_pos$field = null;
		}

		public function get hasSetPos():Boolean {
			return set_pos$field != null;
		}

		public function set setPos(value:app.message.GuildNewsProto.SetPosProto):void {
			set_pos$field = value;
		}

		public function get setPos():app.message.GuildNewsProto.SetPosProto {
			return set_pos$field;
		}

		/**
		 *  @private
		 */
		public static const JOIN_GUILD:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.join_guild", "joinGuild", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.JoinGuildProto; });

		private var join_guild$field:app.message.GuildNewsProto.JoinGuildProto;

		public function clearJoinGuild():void {
			join_guild$field = null;
		}

		public function get hasJoinGuild():Boolean {
			return join_guild$field != null;
		}

		public function set joinGuild(value:app.message.GuildNewsProto.JoinGuildProto):void {
			join_guild$field = value;
		}

		public function get joinGuild():app.message.GuildNewsProto.JoinGuildProto {
			return join_guild$field;
		}

		/**
		 *  @private
		 */
		public static const LEAVE_GUILD:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.leave_guild", "leaveGuild", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.LeaveGuildProto; });

		private var leave_guild$field:app.message.GuildNewsProto.LeaveGuildProto;

		public function clearLeaveGuild():void {
			leave_guild$field = null;
		}

		public function get hasLeaveGuild():Boolean {
			return leave_guild$field != null;
		}

		public function set leaveGuild(value:app.message.GuildNewsProto.LeaveGuildProto):void {
			leave_guild$field = value;
		}

		public function get leaveGuild():app.message.GuildNewsProto.LeaveGuildProto {
			return leave_guild$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.donate", "donate", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.DonateProto; });

		private var donate$field:app.message.GuildNewsProto.DonateProto;

		public function clearDonate():void {
			donate$field = null;
		}

		public function get hasDonate():Boolean {
			return donate$field != null;
		}

		public function set donate(value:app.message.GuildNewsProto.DonateProto):void {
			donate$field = value;
		}

		public function get donate():app.message.GuildNewsProto.DonateProto {
			return donate$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_GUILD:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.create_guild", "createGuild", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.CreateGuildProto; });

		private var create_guild$field:app.message.GuildNewsProto.CreateGuildProto;

		public function clearCreateGuild():void {
			create_guild$field = null;
		}

		public function get hasCreateGuild():Boolean {
			return create_guild$field != null;
		}

		public function set createGuild(value:app.message.GuildNewsProto.CreateGuildProto):void {
			create_guild$field = value;
		}

		public function get createGuild():app.message.GuildNewsProto.CreateGuildProto {
			return create_guild$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_LEVEL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.upgrade_level", "upgradeLevel", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.UpgradeLevelProto; });

		private var upgrade_level$field:app.message.GuildNewsProto.UpgradeLevelProto;

		public function clearUpgradeLevel():void {
			upgrade_level$field = null;
		}

		public function get hasUpgradeLevel():Boolean {
			return upgrade_level$field != null;
		}

		public function set upgradeLevel(value:app.message.GuildNewsProto.UpgradeLevelProto):void {
			upgrade_level$field = value;
		}

		public function get upgradeLevel():app.message.GuildNewsProto.UpgradeLevelProto {
			return upgrade_level$field;
		}

		/**
		 *  @private
		 */
		public static const DEMOTE_LEVEL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.demote_level", "demoteLevel", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.DemoteLevelProto; });

		private var demote_level$field:app.message.GuildNewsProto.DemoteLevelProto;

		public function clearDemoteLevel():void {
			demote_level$field = null;
		}

		public function get hasDemoteLevel():Boolean {
			return demote_level$field != null;
		}

		public function set demoteLevel(value:app.message.GuildNewsProto.DemoteLevelProto):void {
			demote_level$field = value;
		}

		public function get demoteLevel():app.message.GuildNewsProto.DemoteLevelProto {
			return demote_level$field;
		}

		/**
		 *  @private
		 */
		public static const MAINTAIN:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.maintain", "maintain", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildNewsProto.MaintainProto; });

		private var maintain$field:app.message.GuildNewsProto.MaintainProto;

		public function clearMaintain():void {
			maintain$field = null;
		}

		public function get hasMaintain():Boolean {
			return maintain$field != null;
		}

		public function set maintain(value:app.message.GuildNewsProto.MaintainProto):void {
			maintain$field = value;
		}

		public function get maintain():app.message.GuildNewsProto.MaintainProto {
			return maintain$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, time$field);
			}
			if (hasSetPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, set_pos$field);
			}
			if (hasJoinGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, join_guild$field);
			}
			if (hasLeaveGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, leave_guild$field);
			}
			if (hasDonate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, donate$field);
			}
			if (hasCreateGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, create_guild$field);
			}
			if (hasUpgradeLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, upgrade_level$field);
			}
			if (hasDemoteLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, demote_level$field);
			}
			if (hasMaintain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, maintain$field);
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
			var set_pos$count:uint = 0;
			var join_guild$count:uint = 0;
			var leave_guild$count:uint = 0;
			var donate$count:uint = 0;
			var create_guild$count:uint = 0;
			var upgrade_level$count:uint = 0;
			var demote_level$count:uint = 0;
			var maintain$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 10:
					if (set_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.setPos cannot be set twice.');
					}
					++set_pos$count;
					this.setPos = new app.message.GuildNewsProto.SetPosProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.setPos);
					break;
				case 12:
					if (join_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.joinGuild cannot be set twice.');
					}
					++join_guild$count;
					this.joinGuild = new app.message.GuildNewsProto.JoinGuildProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.joinGuild);
					break;
				case 13:
					if (leave_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.leaveGuild cannot be set twice.');
					}
					++leave_guild$count;
					this.leaveGuild = new app.message.GuildNewsProto.LeaveGuildProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.leaveGuild);
					break;
				case 14:
					if (donate$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.donate cannot be set twice.');
					}
					++donate$count;
					this.donate = new app.message.GuildNewsProto.DonateProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.donate);
					break;
				case 15:
					if (create_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.createGuild cannot be set twice.');
					}
					++create_guild$count;
					this.createGuild = new app.message.GuildNewsProto.CreateGuildProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.createGuild);
					break;
				case 16:
					if (upgrade_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.upgradeLevel cannot be set twice.');
					}
					++upgrade_level$count;
					this.upgradeLevel = new app.message.GuildNewsProto.UpgradeLevelProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.upgradeLevel);
					break;
				case 17:
					if (demote_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.demoteLevel cannot be set twice.');
					}
					++demote_level$count;
					this.demoteLevel = new app.message.GuildNewsProto.DemoteLevelProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.demoteLevel);
					break;
				case 18:
					if (maintain$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildNewsProto.maintain cannot be set twice.');
					}
					++maintain$count;
					this.maintain = new app.message.GuildNewsProto.MaintainProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.maintain);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
