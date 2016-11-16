package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ModelProto;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyMemberProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyMemberProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:Int64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:Int64):void {
			id$field = value;
		}

		public function get id():Int64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.FamilyMemberProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyMemberProto.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHTING_AMOUNT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyMemberProto.fighting_amount", "fightingAmount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fighting_amount$field:Int64;

		public function clearFightingAmount():void {
			fighting_amount$field = null;
		}

		public function get hasFightingAmount():Boolean {
			return fighting_amount$field != null;
		}

		public function set fightingAmount(value:Int64):void {
			fighting_amount$field = value;
		}

		public function get fightingAmount():Int64 {
			return fighting_amount$field;
		}

		/**
		 *  @private
		 */
		public static const MODEL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyMemberProto.model", "model", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ModelProto; });

		private var model$field:app.message.ModelProto;

		public function clearModel():void {
			model$field = null;
		}

		public function get hasModel():Boolean {
			return model$field != null;
		}

		public function set model(value:app.message.ModelProto):void {
			model$field = value;
		}

		public function get model():app.message.ModelProto {
			return model$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ONLINE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.FamilyMemberProto.is_online", "isOnline", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_online$field:Boolean;

		public function clearIsOnline():void {
			hasField$0 &= 0xfffffffd;
			is_online$field = new Boolean();
		}

		public function get hasIsOnline():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isOnline(value:Boolean):void {
			hasField$0 |= 0x2;
			is_online$field = value;
		}

		public function get isOnline():Boolean {
			return is_online$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_OFFLINE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyMemberProto.last_offline_time", "lastOfflineTime", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_offline_time$field:Int64;

		public function clearLastOfflineTime():void {
			last_offline_time$field = null;
		}

		public function get hasLastOfflineTime():Boolean {
			return last_offline_time$field != null;
		}

		public function set lastOfflineTime(value:Int64):void {
			last_offline_time$field = value;
		}

		public function get lastOfflineTime():Int64 {
			return last_offline_time$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyMemberProto.country", "country", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffb;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x4;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyMemberProto.scene_id", "sceneId", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_id$field:int;

		public function clearSceneId():void {
			hasField$0 &= 0xfffffff7;
			scene_id$field = new int();
		}

		public function get hasSceneId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set sceneId(value:int):void {
			hasField$0 |= 0x8;
			scene_id$field = value;
		}

		public function get sceneId():int {
			return scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_AUTO_ACCEPT_INVITE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.FamilyMemberProto.family_auto_accept_invite", "familyAutoAcceptInvite", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_auto_accept_invite$field:Boolean;

		public function clearFamilyAutoAcceptInvite():void {
			hasField$0 &= 0xffffffef;
			family_auto_accept_invite$field = new Boolean();
		}

		public function get hasFamilyAutoAcceptInvite():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set familyAutoAcceptInvite(value:Boolean):void {
			hasField$0 |= 0x10;
			family_auto_accept_invite$field = value;
		}

		public function get familyAutoAcceptInvite():Boolean {
			return family_auto_accept_invite$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_FORBID_OTHER_INVITE_ME_JOIN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.FamilyMemberProto.family_forbid_other_invite_me_join", "familyForbidOtherInviteMeJoin", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_forbid_other_invite_me_join$field:Boolean;

		public function clearFamilyForbidOtherInviteMeJoin():void {
			hasField$0 &= 0xffffffdf;
			family_forbid_other_invite_me_join$field = new Boolean();
		}

		public function get hasFamilyForbidOtherInviteMeJoin():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set familyForbidOtherInviteMeJoin(value:Boolean):void {
			hasField$0 |= 0x20;
			family_forbid_other_invite_me_join$field = value;
		}

		public function get familyForbidOtherInviteMeJoin():Boolean {
			return family_forbid_other_invite_me_join$field;
		}

		/**
		 *  @private
		 */
		public static const ENTER_FAMILY_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyMemberProto.enter_family_time", "enterFamilyTime", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var enter_family_time$field:Int64;

		public function clearEnterFamilyTime():void {
			enter_family_time$field = null;
		}

		public function get hasEnterFamilyTime():Boolean {
			return enter_family_time$field != null;
		}

		public function set enterFamilyTime(value:Int64):void {
			enter_family_time$field = value;
		}

		public function get enterFamilyTime():Int64 {
			return enter_family_time$field;
		}

		/**
		 *  @private
		 */
		public static const CONTRIBUTION_POINT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyMemberProto.contribution_point", "contributionPoint", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var contribution_point$field:Int64;

		public function clearContributionPoint():void {
			contribution_point$field = null;
		}

		public function get hasContributionPoint():Boolean {
			return contribution_point$field != null;
		}

		public function set contributionPoint(value:Int64):void {
			contribution_point$field = value;
		}

		public function get contributionPoint():Int64 {
			return contribution_point$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_GUILD_CONTRIBUTION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyMemberProto.total_guild_contribution", "totalGuildContribution", (14 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, name$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, fighting_amount$field);
			}
			if (hasModel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, model$field);
			}
			if (hasIsOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_online$field);
			}
			if (hasLastOfflineTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, last_offline_time$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, country$field);
			}
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, scene_id$field);
			}
			if (hasFamilyAutoAcceptInvite) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, family_auto_accept_invite$field);
			}
			if (hasFamilyForbidOtherInviteMeJoin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, family_forbid_other_invite_me_join$field);
			}
			if (hasEnterFamilyTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, enter_family_time$field);
			}
			if (hasContributionPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, contribution_point$field);
			}
			if (hasTotalGuildContribution) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, total_guild_contribution$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var level$count:uint = 0;
			var fighting_amount$count:uint = 0;
			var model$count:uint = 0;
			var is_online$count:uint = 0;
			var last_offline_time$count:uint = 0;
			var country$count:uint = 0;
			var scene_id$count:uint = 0;
			var family_auto_accept_invite$count:uint = 0;
			var family_forbid_other_invite_me_join$count:uint = 0;
			var enter_family_time$count:uint = 0;
			var contribution_point$count:uint = 0;
			var total_guild_contribution$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.fightingAmount cannot be set twice.');
					}
					++fighting_amount$count;
					this.fightingAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (model$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.model cannot be set twice.');
					}
					++model$count;
					this.model = new app.message.ModelProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.model);
					break;
				case 6:
					if (is_online$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.isOnline cannot be set twice.');
					}
					++is_online$count;
					this.isOnline = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 7:
					if (last_offline_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.lastOfflineTime cannot be set twice.');
					}
					++last_offline_time$count;
					this.lastOfflineTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 8:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (family_auto_accept_invite$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.familyAutoAcceptInvite cannot be set twice.');
					}
					++family_auto_accept_invite$count;
					this.familyAutoAcceptInvite = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 11:
					if (family_forbid_other_invite_me_join$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.familyForbidOtherInviteMeJoin cannot be set twice.');
					}
					++family_forbid_other_invite_me_join$count;
					this.familyForbidOtherInviteMeJoin = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 12:
					if (enter_family_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.enterFamilyTime cannot be set twice.');
					}
					++enter_family_time$count;
					this.enterFamilyTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 13:
					if (contribution_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.contributionPoint cannot be set twice.');
					}
					++contribution_point$count;
					this.contributionPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 14:
					if (total_guild_contribution$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMemberProto.totalGuildContribution cannot be set twice.');
					}
					++total_guild_contribution$count;
					this.totalGuildContribution = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
