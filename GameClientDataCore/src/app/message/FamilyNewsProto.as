package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyNewsProto.MemberBeenKilledByBossProto;
	import app.message.FamilyNewsProto.BuildingUpgradeProto;
	import app.message.FamilyNewsProto.LeaveFamilyProto;
	import app.message.FamilyNewsProto.MemberKillOtherProto;
	import app.message.FamilyNewsProto.CreateFamilyProto;
	import app.message.FamilyNewsProto.MemberKillBossProto;
	import app.message.FamilyNewsProto.ChangePosProto;
	import app.message.FamilyNewsProto.MemberBeenKilledProto;
	import app.message.FamilyNewsProto.DonateMoneyProto;
	import app.message.FamilyNewsProto.FamilyAnimalBarStart;
	import app.message.FamilyNewsProto.ImpeachFamilyLeaderProto;
	import app.message.FamilyNewsProto.AddMemberProto;
	import app.message.FamilyNewsProto.KickMemberProto;
	import app.message.FamilyNewsProto.FamilyBiaoNewsProto;
	import app.message.FamilyNewsProto.DonateFamilyBuildTokenProto;
	import app.message.FamilyNewsProto.KillFamilyAnimalBarBoss;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyNewsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyNewsProto.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ADD_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.add_member", "addMember", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.AddMemberProto; });

		private var add_member$field:app.message.FamilyNewsProto.AddMemberProto;

		public function clearAddMember():void {
			add_member$field = null;
		}

		public function get hasAddMember():Boolean {
			return add_member$field != null;
		}

		public function set addMember(value:app.message.FamilyNewsProto.AddMemberProto):void {
			add_member$field = value;
		}

		public function get addMember():app.message.FamilyNewsProto.AddMemberProto {
			return add_member$field;
		}

		/**
		 *  @private
		 */
		public static const KICK_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.kick_member", "kickMember", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.KickMemberProto; });

		private var kick_member$field:app.message.FamilyNewsProto.KickMemberProto;

		public function clearKickMember():void {
			kick_member$field = null;
		}

		public function get hasKickMember():Boolean {
			return kick_member$field != null;
		}

		public function set kickMember(value:app.message.FamilyNewsProto.KickMemberProto):void {
			kick_member$field = value;
		}

		public function get kickMember():app.message.FamilyNewsProto.KickMemberProto {
			return kick_member$field;
		}

		/**
		 *  @private
		 */
		public static const LEAVE_FAMILY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.leave_family", "leaveFamily", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.LeaveFamilyProto; });

		private var leave_family$field:app.message.FamilyNewsProto.LeaveFamilyProto;

		public function clearLeaveFamily():void {
			leave_family$field = null;
		}

		public function get hasLeaveFamily():Boolean {
			return leave_family$field != null;
		}

		public function set leaveFamily(value:app.message.FamilyNewsProto.LeaveFamilyProto):void {
			leave_family$field = value;
		}

		public function get leaveFamily():app.message.FamilyNewsProto.LeaveFamilyProto {
			return leave_family$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.change_pos", "changePos", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.ChangePosProto; });

		private var change_pos$field:app.message.FamilyNewsProto.ChangePosProto;

		public function clearChangePos():void {
			change_pos$field = null;
		}

		public function get hasChangePos():Boolean {
			return change_pos$field != null;
		}

		public function set changePos(value:app.message.FamilyNewsProto.ChangePosProto):void {
			change_pos$field = value;
		}

		public function get changePos():app.message.FamilyNewsProto.ChangePosProto {
			return change_pos$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_KILLED:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.been_killed", "beenKilled", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberBeenKilledProto; });

		private var been_killed$field:app.message.FamilyNewsProto.MemberBeenKilledProto;

		public function clearBeenKilled():void {
			been_killed$field = null;
		}

		public function get hasBeenKilled():Boolean {
			return been_killed$field != null;
		}

		public function set beenKilled(value:app.message.FamilyNewsProto.MemberBeenKilledProto):void {
			been_killed$field = value;
		}

		public function get beenKilled():app.message.FamilyNewsProto.MemberBeenKilledProto {
			return been_killed$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_OTHER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.kill_other", "killOther", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberKillOtherProto; });

		private var kill_other$field:app.message.FamilyNewsProto.MemberKillOtherProto;

		public function clearKillOther():void {
			kill_other$field = null;
		}

		public function get hasKillOther():Boolean {
			return kill_other$field != null;
		}

		public function set killOther(value:app.message.FamilyNewsProto.MemberKillOtherProto):void {
			kill_other$field = value;
		}

		public function get killOther():app.message.FamilyNewsProto.MemberKillOtherProto {
			return kill_other$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_BOSS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.kill_boss", "killBoss", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberKillBossProto; });

		private var kill_boss$field:app.message.FamilyNewsProto.MemberKillBossProto;

		public function clearKillBoss():void {
			kill_boss$field = null;
		}

		public function get hasKillBoss():Boolean {
			return kill_boss$field != null;
		}

		public function set killBoss(value:app.message.FamilyNewsProto.MemberKillBossProto):void {
			kill_boss$field = value;
		}

		public function get killBoss():app.message.FamilyNewsProto.MemberKillBossProto {
			return kill_boss$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_KILLED_BY_BOSS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.been_killed_by_boss", "beenKilledByBoss", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberBeenKilledByBossProto; });

		private var been_killed_by_boss$field:app.message.FamilyNewsProto.MemberBeenKilledByBossProto;

		public function clearBeenKilledByBoss():void {
			been_killed_by_boss$field = null;
		}

		public function get hasBeenKilledByBoss():Boolean {
			return been_killed_by_boss$field != null;
		}

		public function set beenKilledByBoss(value:app.message.FamilyNewsProto.MemberBeenKilledByBossProto):void {
			been_killed_by_boss$field = value;
		}

		public function get beenKilledByBoss():app.message.FamilyNewsProto.MemberBeenKilledByBossProto {
			return been_killed_by_boss$field;
		}

		/**
		 *  @private
		 */
		public static const BUILDING_UPGRADE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.building_upgrade", "buildingUpgrade", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.BuildingUpgradeProto; });

		private var building_upgrade$field:app.message.FamilyNewsProto.BuildingUpgradeProto;

		public function clearBuildingUpgrade():void {
			building_upgrade$field = null;
		}

		public function get hasBuildingUpgrade():Boolean {
			return building_upgrade$field != null;
		}

		public function set buildingUpgrade(value:app.message.FamilyNewsProto.BuildingUpgradeProto):void {
			building_upgrade$field = value;
		}

		public function get buildingUpgrade():app.message.FamilyNewsProto.BuildingUpgradeProto {
			return building_upgrade$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_BUILD_TOKEN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.donate_build_token", "donateBuildToken", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.DonateFamilyBuildTokenProto; });

		private var donate_build_token$field:app.message.FamilyNewsProto.DonateFamilyBuildTokenProto;

		public function clearDonateBuildToken():void {
			donate_build_token$field = null;
		}

		public function get hasDonateBuildToken():Boolean {
			return donate_build_token$field != null;
		}

		public function set donateBuildToken(value:app.message.FamilyNewsProto.DonateFamilyBuildTokenProto):void {
			donate_build_token$field = value;
		}

		public function get donateBuildToken():app.message.FamilyNewsProto.DonateFamilyBuildTokenProto {
			return donate_build_token$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_MONEY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.donate_money", "donateMoney", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.DonateMoneyProto; });

		private var donate_money$field:app.message.FamilyNewsProto.DonateMoneyProto;

		public function clearDonateMoney():void {
			donate_money$field = null;
		}

		public function get hasDonateMoney():Boolean {
			return donate_money$field != null;
		}

		public function set donateMoney(value:app.message.FamilyNewsProto.DonateMoneyProto):void {
			donate_money$field = value;
		}

		public function get donateMoney():app.message.FamilyNewsProto.DonateMoneyProto {
			return donate_money$field;
		}

		/**
		 *  @private
		 */
		public static const ANIMAL_BAR_START:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.animal_bar_start", "animalBarStart", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.FamilyAnimalBarStart; });

		private var animal_bar_start$field:app.message.FamilyNewsProto.FamilyAnimalBarStart;

		public function clearAnimalBarStart():void {
			animal_bar_start$field = null;
		}

		public function get hasAnimalBarStart():Boolean {
			return animal_bar_start$field != null;
		}

		public function set animalBarStart(value:app.message.FamilyNewsProto.FamilyAnimalBarStart):void {
			animal_bar_start$field = value;
		}

		public function get animalBarStart():app.message.FamilyNewsProto.FamilyAnimalBarStart {
			return animal_bar_start$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_FAMILY_ANIMAL_BAR_BOSS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.kill_family_animal_bar_boss", "killFamilyAnimalBarBoss", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.KillFamilyAnimalBarBoss; });

		private var kill_family_animal_bar_boss$field:app.message.FamilyNewsProto.KillFamilyAnimalBarBoss;

		public function clearKillFamilyAnimalBarBoss():void {
			kill_family_animal_bar_boss$field = null;
		}

		public function get hasKillFamilyAnimalBarBoss():Boolean {
			return kill_family_animal_bar_boss$field != null;
		}

		public function set killFamilyAnimalBarBoss(value:app.message.FamilyNewsProto.KillFamilyAnimalBarBoss):void {
			kill_family_animal_bar_boss$field = value;
		}

		public function get killFamilyAnimalBarBoss():app.message.FamilyNewsProto.KillFamilyAnimalBarBoss {
			return kill_family_animal_bar_boss$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_BIAO_NEWS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.family_biao_news", "familyBiaoNews", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.FamilyBiaoNewsProto; });

		private var family_biao_news$field:app.message.FamilyNewsProto.FamilyBiaoNewsProto;

		public function clearFamilyBiaoNews():void {
			family_biao_news$field = null;
		}

		public function get hasFamilyBiaoNews():Boolean {
			return family_biao_news$field != null;
		}

		public function set familyBiaoNews(value:app.message.FamilyNewsProto.FamilyBiaoNewsProto):void {
			family_biao_news$field = value;
		}

		public function get familyBiaoNews():app.message.FamilyNewsProto.FamilyBiaoNewsProto {
			return family_biao_news$field;
		}

		/**
		 *  @private
		 */
		public static const IMPEACH_LEADER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.impeach_leader", "impeachLeader", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.ImpeachFamilyLeaderProto; });

		private var impeach_leader$field:app.message.FamilyNewsProto.ImpeachFamilyLeaderProto;

		public function clearImpeachLeader():void {
			impeach_leader$field = null;
		}

		public function get hasImpeachLeader():Boolean {
			return impeach_leader$field != null;
		}

		public function set impeachLeader(value:app.message.FamilyNewsProto.ImpeachFamilyLeaderProto):void {
			impeach_leader$field = value;
		}

		public function get impeachLeader():app.message.FamilyNewsProto.ImpeachFamilyLeaderProto {
			return impeach_leader$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_FAMILY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.create_family", "createFamily", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.CreateFamilyProto; });

		private var create_family$field:app.message.FamilyNewsProto.CreateFamilyProto;

		public function clearCreateFamily():void {
			create_family$field = null;
		}

		public function get hasCreateFamily():Boolean {
			return create_family$field != null;
		}

		public function set createFamily(value:app.message.FamilyNewsProto.CreateFamilyProto):void {
			create_family$field = value;
		}

		public function get createFamily():app.message.FamilyNewsProto.CreateFamilyProto {
			return create_family$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, time$field);
			}
			if (hasAddMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, add_member$field);
			}
			if (hasKickMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kick_member$field);
			}
			if (hasLeaveFamily) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, leave_family$field);
			}
			if (hasChangePos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, change_pos$field);
			}
			if (hasBeenKilled) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, been_killed$field);
			}
			if (hasKillOther) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kill_other$field);
			}
			if (hasKillBoss) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kill_boss$field);
			}
			if (hasBeenKilledByBoss) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, been_killed_by_boss$field);
			}
			if (hasBuildingUpgrade) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, building_upgrade$field);
			}
			if (hasDonateBuildToken) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, donate_build_token$field);
			}
			if (hasDonateMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, donate_money$field);
			}
			if (hasAnimalBarStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, animal_bar_start$field);
			}
			if (hasKillFamilyAnimalBarBoss) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kill_family_animal_bar_boss$field);
			}
			if (hasFamilyBiaoNews) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_biao_news$field);
			}
			if (hasImpeachLeader) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, impeach_leader$field);
			}
			if (hasCreateFamily) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, create_family$field);
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
			var add_member$count:uint = 0;
			var kick_member$count:uint = 0;
			var leave_family$count:uint = 0;
			var change_pos$count:uint = 0;
			var been_killed$count:uint = 0;
			var kill_other$count:uint = 0;
			var kill_boss$count:uint = 0;
			var been_killed_by_boss$count:uint = 0;
			var building_upgrade$count:uint = 0;
			var donate_build_token$count:uint = 0;
			var donate_money$count:uint = 0;
			var animal_bar_start$count:uint = 0;
			var kill_family_animal_bar_boss$count:uint = 0;
			var family_biao_news$count:uint = 0;
			var impeach_leader$count:uint = 0;
			var create_family$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 10:
					if (add_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.addMember cannot be set twice.');
					}
					++add_member$count;
					this.addMember = new app.message.FamilyNewsProto.AddMemberProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.addMember);
					break;
				case 11:
					if (kick_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.kickMember cannot be set twice.');
					}
					++kick_member$count;
					this.kickMember = new app.message.FamilyNewsProto.KickMemberProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.kickMember);
					break;
				case 12:
					if (leave_family$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.leaveFamily cannot be set twice.');
					}
					++leave_family$count;
					this.leaveFamily = new app.message.FamilyNewsProto.LeaveFamilyProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.leaveFamily);
					break;
				case 13:
					if (change_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.changePos cannot be set twice.');
					}
					++change_pos$count;
					this.changePos = new app.message.FamilyNewsProto.ChangePosProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.changePos);
					break;
				case 14:
					if (been_killed$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.beenKilled cannot be set twice.');
					}
					++been_killed$count;
					this.beenKilled = new app.message.FamilyNewsProto.MemberBeenKilledProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.beenKilled);
					break;
				case 15:
					if (kill_other$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.killOther cannot be set twice.');
					}
					++kill_other$count;
					this.killOther = new app.message.FamilyNewsProto.MemberKillOtherProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.killOther);
					break;
				case 16:
					if (kill_boss$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.killBoss cannot be set twice.');
					}
					++kill_boss$count;
					this.killBoss = new app.message.FamilyNewsProto.MemberKillBossProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.killBoss);
					break;
				case 17:
					if (been_killed_by_boss$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.beenKilledByBoss cannot be set twice.');
					}
					++been_killed_by_boss$count;
					this.beenKilledByBoss = new app.message.FamilyNewsProto.MemberBeenKilledByBossProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.beenKilledByBoss);
					break;
				case 18:
					if (building_upgrade$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.buildingUpgrade cannot be set twice.');
					}
					++building_upgrade$count;
					this.buildingUpgrade = new app.message.FamilyNewsProto.BuildingUpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.buildingUpgrade);
					break;
				case 19:
					if (donate_build_token$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.donateBuildToken cannot be set twice.');
					}
					++donate_build_token$count;
					this.donateBuildToken = new app.message.FamilyNewsProto.DonateFamilyBuildTokenProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.donateBuildToken);
					break;
				case 20:
					if (donate_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.donateMoney cannot be set twice.');
					}
					++donate_money$count;
					this.donateMoney = new app.message.FamilyNewsProto.DonateMoneyProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.donateMoney);
					break;
				case 21:
					if (animal_bar_start$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.animalBarStart cannot be set twice.');
					}
					++animal_bar_start$count;
					this.animalBarStart = new app.message.FamilyNewsProto.FamilyAnimalBarStart();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.animalBarStart);
					break;
				case 22:
					if (kill_family_animal_bar_boss$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.killFamilyAnimalBarBoss cannot be set twice.');
					}
					++kill_family_animal_bar_boss$count;
					this.killFamilyAnimalBarBoss = new app.message.FamilyNewsProto.KillFamilyAnimalBarBoss();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.killFamilyAnimalBarBoss);
					break;
				case 23:
					if (family_biao_news$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.familyBiaoNews cannot be set twice.');
					}
					++family_biao_news$count;
					this.familyBiaoNews = new app.message.FamilyNewsProto.FamilyBiaoNewsProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyBiaoNews);
					break;
				case 24:
					if (impeach_leader$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.impeachLeader cannot be set twice.');
					}
					++impeach_leader$count;
					this.impeachLeader = new app.message.FamilyNewsProto.ImpeachFamilyLeaderProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.impeachLeader);
					break;
				case 25:
					if (create_family$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyNewsProto.createFamily cannot be set twice.');
					}
					++create_family$count;
					this.createFamily = new app.message.FamilyNewsProto.CreateFamilyProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.createFamily);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
