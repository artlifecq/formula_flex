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
	public dynamic final class TeamModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TEAM_AUTO_ACCEPT_INVITE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.TeamModuleObjProto.team_auto_accept_invite", "teamAutoAcceptInvite", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var team_auto_accept_invite$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearTeamAutoAcceptInvite():void {
			hasField$0 &= 0xfffffffe;
			team_auto_accept_invite$field = new Boolean();
		}

		public function get hasTeamAutoAcceptInvite():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set teamAutoAcceptInvite(value:Boolean):void {
			hasField$0 |= 0x1;
			team_auto_accept_invite$field = value;
		}

		public function get teamAutoAcceptInvite():Boolean {
			return team_auto_accept_invite$field;
		}

		/**
		 *  @private
		 */
		public static const TEAM_AUTO_ACCEPT_REQUEST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.TeamModuleObjProto.team_auto_accept_request", "teamAutoAcceptRequest", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var team_auto_accept_request$field:Boolean;

		public function clearTeamAutoAcceptRequest():void {
			hasField$0 &= 0xfffffffd;
			team_auto_accept_request$field = new Boolean();
		}

		public function get hasTeamAutoAcceptRequest():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set teamAutoAcceptRequest(value:Boolean):void {
			hasField$0 |= 0x2;
			team_auto_accept_request$field = value;
		}

		public function get teamAutoAcceptRequest():Boolean {
			return team_auto_accept_request$field;
		}

		/**
		 *  @private
		 */
		public static const TEAM_FORBID_OTHER_INVITE_ME_JOIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.TeamModuleObjProto.team_forbid_other_invite_me_join", "teamForbidOtherInviteMeJoin", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var team_forbid_other_invite_me_join$field:Boolean;

		public function clearTeamForbidOtherInviteMeJoin():void {
			hasField$0 &= 0xfffffffb;
			team_forbid_other_invite_me_join$field = new Boolean();
		}

		public function get hasTeamForbidOtherInviteMeJoin():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set teamForbidOtherInviteMeJoin(value:Boolean):void {
			hasField$0 |= 0x4;
			team_forbid_other_invite_me_join$field = value;
		}

		public function get teamForbidOtherInviteMeJoin():Boolean {
			return team_forbid_other_invite_me_join$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTeamAutoAcceptInvite) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, team_auto_accept_invite$field);
			}
			if (hasTeamAutoAcceptRequest) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, team_auto_accept_request$field);
			}
			if (hasTeamForbidOtherInviteMeJoin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, team_forbid_other_invite_me_join$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var team_auto_accept_invite$count:uint = 0;
			var team_auto_accept_request$count:uint = 0;
			var team_forbid_other_invite_me_join$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (team_auto_accept_invite$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamModuleObjProto.teamAutoAcceptInvite cannot be set twice.');
					}
					++team_auto_accept_invite$count;
					this.teamAutoAcceptInvite = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (team_auto_accept_request$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamModuleObjProto.teamAutoAcceptRequest cannot be set twice.');
					}
					++team_auto_accept_request$count;
					this.teamAutoAcceptRequest = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (team_forbid_other_invite_me_join$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamModuleObjProto.teamForbidOtherInviteMeJoin cannot be set twice.');
					}
					++team_forbid_other_invite_me_join$count;
					this.teamForbidOtherInviteMeJoin = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
