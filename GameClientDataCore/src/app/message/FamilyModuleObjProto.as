package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyCollageLearnSpellsProto;
	import app.message.CountryOfficerPos;
	import app.message.FamilyModuleObjProto.FamilyInfoProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAMILY_AUTO_ACCEPT_INVITE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.FamilyModuleObjProto.family_auto_accept_invite", "familyAutoAcceptInvite", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_auto_accept_invite$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearFamilyAutoAcceptInvite():void {
			hasField$0 &= 0xfffffffe;
			family_auto_accept_invite$field = new Boolean();
		}

		public function get hasFamilyAutoAcceptInvite():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set familyAutoAcceptInvite(value:Boolean):void {
			hasField$0 |= 0x1;
			family_auto_accept_invite$field = value;
		}

		public function get familyAutoAcceptInvite():Boolean {
			return family_auto_accept_invite$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_FORBID_OTHER_INVITE_ME_JOIN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.FamilyModuleObjProto.family_forbid_other_invite_me_join", "familyForbidOtherInviteMeJoin", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_forbid_other_invite_me_join$field:Boolean;

		public function clearFamilyForbidOtherInviteMeJoin():void {
			hasField$0 &= 0xfffffffd;
			family_forbid_other_invite_me_join$field = new Boolean();
		}

		public function get hasFamilyForbidOtherInviteMeJoin():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set familyForbidOtherInviteMeJoin(value:Boolean):void {
			hasField$0 |= 0x2;
			family_forbid_other_invite_me_join$field = value;
		}

		public function get familyForbidOtherInviteMeJoin():Boolean {
			return family_forbid_other_invite_me_join$field;
		}

		/**
		 *  @private
		 */
		public static const COLLAGE_LEARN_SPELLS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyModuleObjProto.collage_learn_spells", "collageLearnSpells", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyCollageLearnSpellsProto; });

		private var collage_learn_spells$field:app.message.FamilyCollageLearnSpellsProto;

		public function clearCollageLearnSpells():void {
			collage_learn_spells$field = null;
		}

		public function get hasCollageLearnSpells():Boolean {
			return collage_learn_spells$field != null;
		}

		public function set collageLearnSpells(value:app.message.FamilyCollageLearnSpellsProto):void {
			collage_learn_spells$field = value;
		}

		public function get collageLearnSpells():app.message.FamilyCollageLearnSpellsProto {
			return collage_learn_spells$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_LI_LIAN:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyModuleObjProto.family_li_lian", "familyLiLian", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_li_lian$field:Int64;

		public function clearFamilyLiLian():void {
			family_li_lian$field = null;
		}

		public function get hasFamilyLiLian():Boolean {
			return family_li_lian$field != null;
		}

		public function set familyLiLian(value:Int64):void {
			family_li_lian$field = value;
		}

		public function get familyLiLian():Int64 {
			return family_li_lian$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_INFO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyModuleObjProto.family_info", "familyInfo", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyModuleObjProto.FamilyInfoProto; });

		private var family_info$field:app.message.FamilyModuleObjProto.FamilyInfoProto;

		public function clearFamilyInfo():void {
			family_info$field = null;
		}

		public function get hasFamilyInfo():Boolean {
			return family_info$field != null;
		}

		public function set familyInfo(value:app.message.FamilyModuleObjProto.FamilyInfoProto):void {
			family_info$field = value;
		}

		public function get familyInfo():app.message.FamilyModuleObjProto.FamilyInfoProto {
			return family_info$field;
		}

		/**
		 *  @private
		 */
		public static const OFFICER_POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.FamilyModuleObjProto.officer_pos", "officerPos", (41 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryOfficerPos);

		private var officer_pos$field:int;

		public function clearOfficerPos():void {
			hasField$0 &= 0xfffffffb;
			officer_pos$field = new int();
		}

		public function get hasOfficerPos():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set officerPos(value:int):void {
			hasField$0 |= 0x4;
			officer_pos$field = value;
		}

		public function get officerPos():int {
			return officer_pos$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFamilyAutoAcceptInvite) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, family_auto_accept_invite$field);
			}
			if (hasFamilyForbidOtherInviteMeJoin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, family_forbid_other_invite_me_join$field);
			}
			if (hasCollageLearnSpells) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, collage_learn_spells$field);
			}
			if (hasFamilyLiLian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, family_li_lian$field);
			}
			if (hasFamilyInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, family_info$field);
			}
			if (hasOfficerPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 41);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, officer_pos$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var family_auto_accept_invite$count:uint = 0;
			var family_forbid_other_invite_me_join$count:uint = 0;
			var collage_learn_spells$count:uint = 0;
			var family_li_lian$count:uint = 0;
			var family_info$count:uint = 0;
			var officer_pos$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (family_auto_accept_invite$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjProto.familyAutoAcceptInvite cannot be set twice.');
					}
					++family_auto_accept_invite$count;
					this.familyAutoAcceptInvite = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if (family_forbid_other_invite_me_join$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjProto.familyForbidOtherInviteMeJoin cannot be set twice.');
					}
					++family_forbid_other_invite_me_join$count;
					this.familyForbidOtherInviteMeJoin = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 3:
					if (collage_learn_spells$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjProto.collageLearnSpells cannot be set twice.');
					}
					++collage_learn_spells$count;
					this.collageLearnSpells = new app.message.FamilyCollageLearnSpellsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.collageLearnSpells);
					break;
				case 4:
					if (family_li_lian$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjProto.familyLiLian cannot be set twice.');
					}
					++family_li_lian$count;
					this.familyLiLian = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 40:
					if (family_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjProto.familyInfo cannot be set twice.');
					}
					++family_info$count;
					this.familyInfo = new app.message.FamilyModuleObjProto.FamilyInfoProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.familyInfo);
					break;
				case 41:
					if (officer_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjProto.officerPos cannot be set twice.');
					}
					++officer_pos$count;
					this.officerPos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
