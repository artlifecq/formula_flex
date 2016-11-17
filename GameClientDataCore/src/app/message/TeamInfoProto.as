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
	public dynamic final class TeamInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TEAM_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TeamInfoProto.team_id", "teamId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var team_id$field:int;

		private var hasField$0:uint = 0;

		public function clearTeamId():void {
			hasField$0 &= 0xfffffffe;
			team_id$field = new int();
		}

		public function get hasTeamId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set teamId(value:int):void {
			hasField$0 |= 0x1;
			team_id$field = value;
		}

		public function get teamId():int {
			return team_id$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TeamInfoProto.hero_count", "heroCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_count$field:int;

		public function clearHeroCount():void {
			hasField$0 &= 0xfffffffd;
			hero_count$field = new int();
		}

		public function get hasHeroCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set heroCount(value:int):void {
			hasField$0 |= 0x2;
			hero_count$field = value;
		}

		public function get heroCount():int {
			return hero_count$field;
		}

		/**
		 *  @private
		 */
		public static const LEADER_ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.TeamInfoProto.leader_id", "leaderId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const LEADER_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.TeamInfoProto.leader_name", "leaderName", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const LEADER_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TeamInfoProto.leader_level", "leaderLevel", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var leader_level$field:int;

		public function clearLeaderLevel():void {
			hasField$0 &= 0xfffffffb;
			leader_level$field = new int();
		}

		public function get hasLeaderLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set leaderLevel(value:int):void {
			hasField$0 |= 0x4;
			leader_level$field = value;
		}

		public function get leaderLevel():int {
			return leader_level$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHT_AMOUNT_THRESHOLD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.TeamInfoProto.fight_amount_threshold", "fightAmountThreshold", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fight_amount_threshold$field:Int64;

		public function clearFightAmountThreshold():void {
			fight_amount_threshold$field = null;
		}

		public function get hasFightAmountThreshold():Boolean {
			return fight_amount_threshold$field != null;
		}

		public function set fightAmountThreshold(value:Int64):void {
			fight_amount_threshold$field = value;
		}

		public function get fightAmountThreshold():Int64 {
			return fight_amount_threshold$field;
		}

		/**
		 *  @private
		 */
		public static const IS_AUTO_START:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.TeamInfoProto.is_auto_start", "isAutoStart", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_auto_start$field:Boolean;

		public function clearIsAutoStart():void {
			hasField$0 &= 0xfffffff7;
			is_auto_start$field = new Boolean();
		}

		public function get hasIsAutoStart():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isAutoStart(value:Boolean):void {
			hasField$0 |= 0x8;
			is_auto_start$field = value;
		}

		public function get isAutoStart():Boolean {
			return is_auto_start$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_PWD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.TeamInfoProto.has_pwd", "hasPwd", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_pwd$field:Boolean;

		public function clearHasPwd():void {
			hasField$0 &= 0xffffffef;
			has_pwd$field = new Boolean();
		}

		public function get hasHasPwd():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set hasPwd(value:Boolean):void {
			hasField$0 |= 0x10;
			has_pwd$field = value;
		}

		public function get hasPwd():Boolean {
			return has_pwd$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTeamId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, team_id$field);
			}
			if (hasHeroCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hero_count$field);
			}
			if (hasLeaderId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, leader_id$field);
			}
			if (hasLeaderName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, leader_name$field);
			}
			if (hasLeaderLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, leader_level$field);
			}
			if (hasFightAmountThreshold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, fight_amount_threshold$field);
			}
			if (hasIsAutoStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_auto_start$field);
			}
			if (hasHasPwd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, has_pwd$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var team_id$count:uint = 0;
			var hero_count$count:uint = 0;
			var leader_id$count:uint = 0;
			var leader_name$count:uint = 0;
			var leader_level$count:uint = 0;
			var fight_amount_threshold$count:uint = 0;
			var is_auto_start$count:uint = 0;
			var has_pwd$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (team_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.teamId cannot be set twice.');
					}
					++team_id$count;
					this.teamId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (hero_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.heroCount cannot be set twice.');
					}
					++hero_count$count;
					this.heroCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (leader_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.leaderId cannot be set twice.');
					}
					++leader_id$count;
					this.leaderId = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (leader_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.leaderName cannot be set twice.');
					}
					++leader_name$count;
					this.leaderName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 8:
					if (leader_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.leaderLevel cannot be set twice.');
					}
					++leader_level$count;
					this.leaderLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (fight_amount_threshold$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.fightAmountThreshold cannot be set twice.');
					}
					++fight_amount_threshold$count;
					this.fightAmountThreshold = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (is_auto_start$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.isAutoStart cannot be set twice.');
					}
					++is_auto_start$count;
					this.isAutoStart = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (has_pwd$count != 0) {
						throw new flash.errors.IOError('Bad data format: TeamInfoProto.hasPwd cannot be set twice.');
					}
					++has_pwd$count;
					this.hasPwd = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
