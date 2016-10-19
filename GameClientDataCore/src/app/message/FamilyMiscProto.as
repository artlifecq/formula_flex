package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyMiscProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEAVE_FAMILY_NEXT_JOIN_OR_CREATE_FAMILY_DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyMiscProto.leave_family_next_join_or_create_family_duration", "leaveFamilyNextJoinOrCreateFamilyDuration", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var leave_family_next_join_or_create_family_duration$field:Int64;

		public function clearLeaveFamilyNextJoinOrCreateFamilyDuration():void {
			leave_family_next_join_or_create_family_duration$field = null;
		}

		public function get hasLeaveFamilyNextJoinOrCreateFamilyDuration():Boolean {
			return leave_family_next_join_or_create_family_duration$field != null;
		}

		public function set leaveFamilyNextJoinOrCreateFamilyDuration(value:Int64):void {
			leave_family_next_join_or_create_family_duration$field = value;
		}

		public function get leaveFamilyNextJoinOrCreateFamilyDuration():Int64 {
			return leave_family_next_join_or_create_family_duration$field;
		}

		/**
		 *  @private
		 */
		public static const LEAVE_FAMILY_ADD_CD_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyMiscProto.leave_family_add_cd_level", "leaveFamilyAddCdLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var leave_family_add_cd_level$field:int;

		private var hasField$0:uint = 0;

		public function clearLeaveFamilyAddCdLevel():void {
			hasField$0 &= 0xfffffffe;
			leave_family_add_cd_level$field = new int();
		}

		public function get hasLeaveFamilyAddCdLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set leaveFamilyAddCdLevel(value:int):void {
			hasField$0 |= 0x1;
			leave_family_add_cd_level$field = value;
		}

		public function get leaveFamilyAddCdLevel():int {
			return leave_family_add_cd_level$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_CREATE_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyMiscProto.family_create_money", "familyCreateMoney", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_create_money$field:int;

		public function clearFamilyCreateMoney():void {
			hasField$0 &= 0xfffffffd;
			family_create_money$field = new int();
		}

		public function get hasFamilyCreateMoney():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set familyCreateMoney(value:int):void {
			hasField$0 |= 0x2;
			family_create_money$field = value;
		}

		public function get familyCreateMoney():int {
			return family_create_money$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_CREATE_GOODS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyMiscProto.family_create_goods", "familyCreateGoods", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_create_goods$field:int;

		public function clearFamilyCreateGoods():void {
			hasField$0 &= 0xfffffffb;
			family_create_goods$field = new int();
		}

		public function get hasFamilyCreateGoods():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set familyCreateGoods(value:int):void {
			hasField$0 |= 0x4;
			family_create_goods$field = value;
		}

		public function get familyCreateGoods():int {
			return family_create_goods$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_ANNOUNCEMENT_DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyMiscProto.change_announcement_duration", "changeAnnouncementDuration", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var change_announcement_duration$field:Int64;

		public function clearChangeAnnouncementDuration():void {
			change_announcement_duration$field = null;
		}

		public function get hasChangeAnnouncementDuration():Boolean {
			return change_announcement_duration$field != null;
		}

		public function set changeAnnouncementDuration(value:Int64):void {
			change_announcement_duration$field = value;
		}

		public function get changeAnnouncementDuration():Int64 {
			return change_announcement_duration$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_MONEY_BASE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyMiscProto.donate_money_base", "donateMoneyBase", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var donate_money_base$field:int;

		public function clearDonateMoneyBase():void {
			hasField$0 &= 0xfffffff7;
			donate_money_base$field = new int();
		}

		public function get hasDonateMoneyBase():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set donateMoneyBase(value:int):void {
			hasField$0 |= 0x8;
			donate_money_base$field = value;
		}

		public function get donateMoneyBase():int {
			return donate_money_base$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_MONEY_GIVE_CONTRIBUTION_POINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyMiscProto.donate_money_give_contribution_point", "donateMoneyGiveContributionPoint", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var donate_money_give_contribution_point$field:int;

		public function clearDonateMoneyGiveContributionPoint():void {
			hasField$0 &= 0xffffffef;
			donate_money_give_contribution_point$field = new int();
		}

		public function get hasDonateMoneyGiveContributionPoint():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set donateMoneyGiveContributionPoint(value:int):void {
			hasField$0 |= 0x10;
			donate_money_give_contribution_point$field = value;
		}

		public function get donateMoneyGiveContributionPoint():int {
			return donate_money_give_contribution_point$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_GOODS_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyMiscProto.donate_goods_id", "donateGoodsId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var donate_goods_id$field:int;

		public function clearDonateGoodsId():void {
			hasField$0 &= 0xffffffdf;
			donate_goods_id$field = new int();
		}

		public function get hasDonateGoodsId():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set donateGoodsId(value:int):void {
			hasField$0 |= 0x20;
			donate_goods_id$field = value;
		}

		public function get donateGoodsId():int {
			return donate_goods_id$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_GOODS_UPGRADE_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyMiscProto.donate_goods_upgrade_data", "donateGoodsUpgradeData", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var donate_goods_upgrade_data$field:app.message.UpgradeProto;

		public function clearDonateGoodsUpgradeData():void {
			donate_goods_upgrade_data$field = null;
		}

		public function get hasDonateGoodsUpgradeData():Boolean {
			return donate_goods_upgrade_data$field != null;
		}

		public function set donateGoodsUpgradeData(value:app.message.UpgradeProto):void {
			donate_goods_upgrade_data$field = value;
		}

		public function get donateGoodsUpgradeData():app.message.UpgradeProto {
			return donate_goods_upgrade_data$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_GOODS_GIVE_CONTRIBUTION_POINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyMiscProto.donate_goods_give_contribution_point", "donateGoodsGiveContributionPoint", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var donate_goods_give_contribution_point$field:int;

		public function clearDonateGoodsGiveContributionPoint():void {
			hasField$0 &= 0xffffffbf;
			donate_goods_give_contribution_point$field = new int();
		}

		public function get hasDonateGoodsGiveContributionPoint():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set donateGoodsGiveContributionPoint(value:int):void {
			hasField$0 |= 0x40;
			donate_goods_give_contribution_point$field = value;
		}

		public function get donateGoodsGiveContributionPoint():int {
			return donate_goods_give_contribution_point$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_ANIMAL_BAR_DUNGEON_START_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyMiscProto.family_animal_bar_dungeon_start_time", "familyAnimalBarDungeonStartTime", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_animal_bar_dungeon_start_time$field:Int64;

		public function clearFamilyAnimalBarDungeonStartTime():void {
			family_animal_bar_dungeon_start_time$field = null;
		}

		public function get hasFamilyAnimalBarDungeonStartTime():Boolean {
			return family_animal_bar_dungeon_start_time$field != null;
		}

		public function set familyAnimalBarDungeonStartTime(value:Int64):void {
			family_animal_bar_dungeon_start_time$field = value;
		}

		public function get familyAnimalBarDungeonStartTime():Int64 {
			return family_animal_bar_dungeon_start_time$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_ANIMAL_BAR_DUNGEON_END_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyMiscProto.family_animal_bar_dungeon_end_time", "familyAnimalBarDungeonEndTime", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_animal_bar_dungeon_end_time$field:Int64;

		public function clearFamilyAnimalBarDungeonEndTime():void {
			family_animal_bar_dungeon_end_time$field = null;
		}

		public function get hasFamilyAnimalBarDungeonEndTime():Boolean {
			return family_animal_bar_dungeon_end_time$field != null;
		}

		public function set familyAnimalBarDungeonEndTime(value:Int64):void {
			family_animal_bar_dungeon_end_time$field = value;
		}

		public function get familyAnimalBarDungeonEndTime():Int64 {
			return family_animal_bar_dungeon_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_ANIMAL_BAR_DUNGEON_TIME_LIMIT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyMiscProto.family_animal_bar_dungeon_time_limit", "familyAnimalBarDungeonTimeLimit", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_animal_bar_dungeon_time_limit$field:Int64;

		public function clearFamilyAnimalBarDungeonTimeLimit():void {
			family_animal_bar_dungeon_time_limit$field = null;
		}

		public function get hasFamilyAnimalBarDungeonTimeLimit():Boolean {
			return family_animal_bar_dungeon_time_limit$field != null;
		}

		public function set familyAnimalBarDungeonTimeLimit(value:Int64):void {
			family_animal_bar_dungeon_time_limit$field = value;
		}

		public function get familyAnimalBarDungeonTimeLimit():Int64 {
			return family_animal_bar_dungeon_time_limit$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_FAMILY_MEMBER_IMPEACH_LEADER_NEED_LEADER_OFFLINE_DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyMiscProto.normal_family_member_impeach_leader_need_leader_offline_duration", "normalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var normal_family_member_impeach_leader_need_leader_offline_duration$field:Int64;

		public function clearNormalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration():void {
			normal_family_member_impeach_leader_need_leader_offline_duration$field = null;
		}

		public function get hasNormalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration():Boolean {
			return normal_family_member_impeach_leader_need_leader_offline_duration$field != null;
		}

		public function set normalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration(value:Int64):void {
			normal_family_member_impeach_leader_need_leader_offline_duration$field = value;
		}

		public function get normalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration():Int64 {
			return normal_family_member_impeach_leader_need_leader_offline_duration$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLeaveFamilyNextJoinOrCreateFamilyDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, leave_family_next_join_or_create_family_duration$field);
			}
			if (hasLeaveFamilyAddCdLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, leave_family_add_cd_level$field);
			}
			if (hasFamilyCreateMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, family_create_money$field);
			}
			if (hasFamilyCreateGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, family_create_goods$field);
			}
			if (hasChangeAnnouncementDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, change_announcement_duration$field);
			}
			if (hasDonateMoneyBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, donate_money_base$field);
			}
			if (hasDonateMoneyGiveContributionPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, donate_money_give_contribution_point$field);
			}
			if (hasDonateGoodsId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, donate_goods_id$field);
			}
			if (hasDonateGoodsUpgradeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, donate_goods_upgrade_data$field);
			}
			if (hasDonateGoodsGiveContributionPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, donate_goods_give_contribution_point$field);
			}
			if (hasFamilyAnimalBarDungeonStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, family_animal_bar_dungeon_start_time$field);
			}
			if (hasFamilyAnimalBarDungeonEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, family_animal_bar_dungeon_end_time$field);
			}
			if (hasFamilyAnimalBarDungeonTimeLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, family_animal_bar_dungeon_time_limit$field);
			}
			if (hasNormalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, normal_family_member_impeach_leader_need_leader_offline_duration$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var leave_family_next_join_or_create_family_duration$count:uint = 0;
			var leave_family_add_cd_level$count:uint = 0;
			var family_create_money$count:uint = 0;
			var family_create_goods$count:uint = 0;
			var change_announcement_duration$count:uint = 0;
			var donate_money_base$count:uint = 0;
			var donate_money_give_contribution_point$count:uint = 0;
			var donate_goods_id$count:uint = 0;
			var donate_goods_upgrade_data$count:uint = 0;
			var donate_goods_give_contribution_point$count:uint = 0;
			var family_animal_bar_dungeon_start_time$count:uint = 0;
			var family_animal_bar_dungeon_end_time$count:uint = 0;
			var family_animal_bar_dungeon_time_limit$count:uint = 0;
			var normal_family_member_impeach_leader_need_leader_offline_duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (leave_family_next_join_or_create_family_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.leaveFamilyNextJoinOrCreateFamilyDuration cannot be set twice.');
					}
					++leave_family_next_join_or_create_family_duration$count;
					this.leaveFamilyNextJoinOrCreateFamilyDuration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (leave_family_add_cd_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.leaveFamilyAddCdLevel cannot be set twice.');
					}
					++leave_family_add_cd_level$count;
					this.leaveFamilyAddCdLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (family_create_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.familyCreateMoney cannot be set twice.');
					}
					++family_create_money$count;
					this.familyCreateMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (family_create_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.familyCreateGoods cannot be set twice.');
					}
					++family_create_goods$count;
					this.familyCreateGoods = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (change_announcement_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.changeAnnouncementDuration cannot be set twice.');
					}
					++change_announcement_duration$count;
					this.changeAnnouncementDuration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (donate_money_base$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.donateMoneyBase cannot be set twice.');
					}
					++donate_money_base$count;
					this.donateMoneyBase = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (donate_money_give_contribution_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.donateMoneyGiveContributionPoint cannot be set twice.');
					}
					++donate_money_give_contribution_point$count;
					this.donateMoneyGiveContributionPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (donate_goods_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.donateGoodsId cannot be set twice.');
					}
					++donate_goods_id$count;
					this.donateGoodsId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (donate_goods_upgrade_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.donateGoodsUpgradeData cannot be set twice.');
					}
					++donate_goods_upgrade_data$count;
					this.donateGoodsUpgradeData = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.donateGoodsUpgradeData);
					break;
				case 10:
					if (donate_goods_give_contribution_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.donateGoodsGiveContributionPoint cannot be set twice.');
					}
					++donate_goods_give_contribution_point$count;
					this.donateGoodsGiveContributionPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (family_animal_bar_dungeon_start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.familyAnimalBarDungeonStartTime cannot be set twice.');
					}
					++family_animal_bar_dungeon_start_time$count;
					this.familyAnimalBarDungeonStartTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 12:
					if (family_animal_bar_dungeon_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.familyAnimalBarDungeonEndTime cannot be set twice.');
					}
					++family_animal_bar_dungeon_end_time$count;
					this.familyAnimalBarDungeonEndTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 13:
					if (family_animal_bar_dungeon_time_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.familyAnimalBarDungeonTimeLimit cannot be set twice.');
					}
					++family_animal_bar_dungeon_time_limit$count;
					this.familyAnimalBarDungeonTimeLimit = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 14:
					if (normal_family_member_impeach_leader_need_leader_offline_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyMiscProto.normalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration cannot be set twice.');
					}
					++normal_family_member_impeach_leader_need_leader_offline_duration$count;
					this.normalFamilyMemberImpeachLeaderNeedLeaderOfflineDuration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
