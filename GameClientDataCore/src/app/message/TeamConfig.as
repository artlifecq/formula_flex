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
	public dynamic final class TeamConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TEAM_MEMBER_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TeamConfig.team_member_count", "teamMemberCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var team_member_count$field:int;

		private var hasField$0:uint = 0;

		public function clearTeamMemberCount():void {
			hasField$0 &= 0xfffffffe;
			team_member_count$field = new int();
		}

		public function get hasTeamMemberCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set teamMemberCount(value:int):void {
			hasField$0 |= 0x1;
			team_member_count$field = value;
		}

		public function get teamMemberCount():int {
			return team_member_count$field;
		}

		/**
		 *  @private
		 */
		public static const TEAM_INVITE_REQUEST_EXPIRE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.TeamConfig.team_invite_request_expire_time", "teamInviteRequestExpireTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var team_invite_request_expire_time$field:Int64;

		public function clearTeamInviteRequestExpireTime():void {
			team_invite_request_expire_time$field = null;
		}

		public function get hasTeamInviteRequestExpireTime():Boolean {
			return team_invite_request_expire_time$field != null;
		}

		public function set teamInviteRequestExpireTime(value:Int64):void {
			team_invite_request_expire_time$field = value;
		}

		public function get teamInviteRequestExpireTime():Int64 {
			return team_invite_request_expire_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTeamMemberCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, team_member_count$field);
			}
			if (hasTeamInviteRequestExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, team_invite_request_expire_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var team_member_count$count:uint = 0;
			var team_invite_request_expire_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (team_member_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamConfig.teamMemberCount cannot be set twice.');
					}
					++team_member_count$count;
					this.teamMemberCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (team_invite_request_expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamConfig.teamInviteRequestExpireTime cannot be set twice.');
					}
					++team_invite_request_expire_time$count;
					this.teamInviteRequestExpireTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
