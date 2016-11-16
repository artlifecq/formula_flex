package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryOfficerDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.CountryOfficerDataProto.pos", "pos", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryOfficerPos);

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
		public static const POS_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.CountryOfficerDataProto.pos_name", "posName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const OFFICER_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryOfficerDataProto.officer_count", "officerCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var officer_count$field:int;

		public function clearOfficerCount():void {
			hasField$0 &= 0xfffffffd;
			officer_count$field = new int();
		}

		public function get hasOfficerCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set officerCount(value:int):void {
			hasField$0 |= 0x2;
			officer_count$field = value;
		}

		public function get officerCount():int {
			return officer_count$field;
		}

		/**
		 *  @private
		 */
		public static const STRONG_SALARY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryOfficerDataProto.strong_salary", "strongSalary", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var strong_salary$field:int;

		public function clearStrongSalary():void {
			hasField$0 &= 0xfffffffb;
			strong_salary$field = new int();
		}

		public function get hasStrongSalary():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set strongSalary(value:int):void {
			hasField$0 |= 0x4;
			strong_salary$field = value;
		}

		public function get strongSalary():int {
			return strong_salary$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_SALARY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryOfficerDataProto.normal_salary", "normalSalary", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var normal_salary$field:int;

		public function clearNormalSalary():void {
			hasField$0 &= 0xfffffff7;
			normal_salary$field = new int();
		}

		public function get hasNormalSalary():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set normalSalary(value:int):void {
			hasField$0 |= 0x8;
			normal_salary$field = value;
		}

		public function get normalSalary():int {
			return normal_salary$field;
		}

		/**
		 *  @private
		 */
		public static const WEAK_SALARY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryOfficerDataProto.weak_salary", "weakSalary", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var weak_salary$field:int;

		public function clearWeakSalary():void {
			hasField$0 &= 0xffffffef;
			weak_salary$field = new int();
		}

		public function get hasWeakSalary():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set weakSalary(value:int):void {
			hasField$0 |= 0x10;
			weak_salary$field = value;
		}

		public function get weakSalary():int {
			return weak_salary$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_DECLARE_WAR:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_declare_war", "canDeclareWar", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_declare_war$field:Boolean;

		public function clearCanDeclareWar():void {
			hasField$0 &= 0xffffffdf;
			can_declare_war$field = new Boolean();
		}

		public function get hasCanDeclareWar():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canDeclareWar(value:Boolean):void {
			hasField$0 |= 0x20;
			can_declare_war$field = value;
		}

		public function get canDeclareWar():Boolean {
			return can_declare_war$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_PUBLISH_COUNTRY_TASK:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_publish_country_task", "canPublishCountryTask", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_publish_country_task$field:Boolean;

		public function clearCanPublishCountryTask():void {
			hasField$0 &= 0xffffffbf;
			can_publish_country_task$field = new Boolean();
		}

		public function get hasCanPublishCountryTask():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set canPublishCountryTask(value:Boolean):void {
			hasField$0 |= 0x40;
			can_publish_country_task$field = value;
		}

		public function get canPublishCountryTask():Boolean {
			return can_publish_country_task$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SET_OFFICER:RepeatedFieldDescriptor_TYPE_ENUM = new RepeatedFieldDescriptor_TYPE_ENUM("app.message.CountryOfficerDataProto.can_set_officer", "canSetOfficer", (9 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryOfficerPos);

		[ArrayElementType("int")]
		public var canSetOfficer:Array = [];

		/**
		 *  @private
		 */
		public static const CAN_SET_DONT_TALK_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryOfficerDataProto.can_set_dont_talk_times", "canSetDontTalkTimes", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_set_dont_talk_times$field:int;

		public function clearCanSetDontTalkTimes():void {
			hasField$0 &= 0xffffff7f;
			can_set_dont_talk_times$field = new int();
		}

		public function get hasCanSetDontTalkTimes():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set canSetDontTalkTimes(value:int):void {
			hasField$0 |= 0x80;
			can_set_dont_talk_times$field = value;
		}

		public function get canSetDontTalkTimes():int {
			return can_set_dont_talk_times$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_CAPTIVITY_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryOfficerDataProto.can_captivity_times", "canCaptivityTimes", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_captivity_times$field:int;

		public function clearCanCaptivityTimes():void {
			hasField$0 &= 0xfffffeff;
			can_captivity_times$field = new int();
		}

		public function get hasCanCaptivityTimes():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set canCaptivityTimes(value:int):void {
			hasField$0 |= 0x100;
			can_captivity_times$field = value;
		}

		public function get canCaptivityTimes():int {
			return can_captivity_times$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_USE_WANG_ZHE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_use_wang_zhe", "canUseWangZhe", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_use_wang_zhe$field:Boolean;

		public function clearCanUseWangZhe():void {
			hasField$0 &= 0xfffffdff;
			can_use_wang_zhe$field = new Boolean();
		}

		public function get hasCanUseWangZhe():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set canUseWangZhe(value:Boolean):void {
			hasField$0 |= 0x200;
			can_use_wang_zhe$field = value;
		}

		public function get canUseWangZhe():Boolean {
			return can_use_wang_zhe$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_USE_KING:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_use_king", "canUseKing", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_use_king$field:Boolean;

		public function clearCanUseKing():void {
			hasField$0 &= 0xfffffbff;
			can_use_king$field = new Boolean();
		}

		public function get hasCanUseKing():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set canUseKing(value:Boolean):void {
			hasField$0 |= 0x400;
			can_use_king$field = value;
		}

		public function get canUseKing():Boolean {
			return can_use_king$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_USE_HU_FU:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_use_hu_fu", "canUseHuFu", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_use_hu_fu$field:Boolean;

		public function clearCanUseHuFu():void {
			hasField$0 &= 0xfffff7ff;
			can_use_hu_fu$field = new Boolean();
		}

		public function get hasCanUseHuFu():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set canUseHuFu(value:Boolean):void {
			hasField$0 |= 0x800;
			can_use_hu_fu$field = value;
		}

		public function get canUseHuFu():Boolean {
			return can_use_hu_fu$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_USE_JIN_WEI_FU:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_use_jin_wei_fu", "canUseJinWeiFu", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_use_jin_wei_fu$field:Boolean;

		public function clearCanUseJinWeiFu():void {
			hasField$0 &= 0xffffefff;
			can_use_jin_wei_fu$field = new Boolean();
		}

		public function get hasCanUseJinWeiFu():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set canUseJinWeiFu(value:Boolean):void {
			hasField$0 |= 0x1000;
			can_use_jin_wei_fu$field = value;
		}

		public function get canUseJinWeiFu():Boolean {
			return can_use_jin_wei_fu$field;
		}

		/**
		 *  @private
		 */
		public static const IS_PK_NOT_RED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.is_pk_not_red", "isPkNotRed", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_pk_not_red$field:Boolean;

		public function clearIsPkNotRed():void {
			hasField$0 &= 0xffffdfff;
			is_pk_not_red$field = new Boolean();
		}

		public function get hasIsPkNotRed():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set isPkNotRed(value:Boolean):void {
			hasField$0 |= 0x2000;
			is_pk_not_red$field = value;
		}

		public function get isPkNotRed():Boolean {
			return is_pk_not_red$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_CHANGE_TAX_RATE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_change_tax_rate", "canChangeTaxRate", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_change_tax_rate$field:Boolean;

		public function clearCanChangeTaxRate():void {
			hasField$0 &= 0xffffbfff;
			can_change_tax_rate$field = new Boolean();
		}

		public function get hasCanChangeTaxRate():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set canChangeTaxRate(value:Boolean):void {
			hasField$0 |= 0x4000;
			can_change_tax_rate$field = value;
		}

		public function get canChangeTaxRate():Boolean {
			return can_change_tax_rate$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_CHANGE_MILITARY:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_change_military", "canChangeMilitary", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_change_military$field:Boolean;

		public function clearCanChangeMilitary():void {
			hasField$0 &= 0xffff7fff;
			can_change_military$field = new Boolean();
		}

		public function get hasCanChangeMilitary():Boolean {
			return (hasField$0 & 0x8000) != 0;
		}

		public function set canChangeMilitary(value:Boolean):void {
			hasField$0 |= 0x8000;
			can_change_military$field = value;
		}

		public function get canChangeMilitary():Boolean {
			return can_change_military$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_UNION_AND_LIFT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_union_and_lift", "canUnionAndLift", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_union_and_lift$field:Boolean;

		public function clearCanUnionAndLift():void {
			hasField$0 &= 0xfffeffff;
			can_union_and_lift$field = new Boolean();
		}

		public function get hasCanUnionAndLift():Boolean {
			return (hasField$0 & 0x10000) != 0;
		}

		public function set canUnionAndLift(value:Boolean):void {
			hasField$0 |= 0x10000;
			can_union_and_lift$field = value;
		}

		public function get canUnionAndLift():Boolean {
			return can_union_and_lift$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_COUNTRY_DONATE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_country_donate", "canCountryDonate", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_country_donate$field:Boolean;

		public function clearCanCountryDonate():void {
			hasField$0 &= 0xfffdffff;
			can_country_donate$field = new Boolean();
		}

		public function get hasCanCountryDonate():Boolean {
			return (hasField$0 & 0x20000) != 0;
		}

		public function set canCountryDonate(value:Boolean):void {
			hasField$0 |= 0x20000;
			can_country_donate$field = value;
		}

		public function get canCountryDonate():Boolean {
			return can_country_donate$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_START_DUO_JING:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_start_duo_jing", "canStartDuoJing", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_start_duo_jing$field:Boolean;

		public function clearCanStartDuoJing():void {
			hasField$0 &= 0xfffbffff;
			can_start_duo_jing$field = new Boolean();
		}

		public function get hasCanStartDuoJing():Boolean {
			return (hasField$0 & 0x40000) != 0;
		}

		public function set canStartDuoJing(value:Boolean):void {
			hasField$0 |= 0x40000;
			can_start_duo_jing$field = value;
		}

		public function get canStartDuoJing():Boolean {
			return can_start_duo_jing$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_START_MI_XIN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_start_mi_xin", "canStartMiXin", (25 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_start_mi_xin$field:Boolean;

		public function clearCanStartMiXin():void {
			hasField$0 &= 0xfff7ffff;
			can_start_mi_xin$field = new Boolean();
		}

		public function get hasCanStartMiXin():Boolean {
			return (hasField$0 & 0x80000) != 0;
		}

		public function set canStartMiXin(value:Boolean):void {
			hasField$0 |= 0x80000;
			can_start_mi_xin$field = value;
		}

		public function get canStartMiXin():Boolean {
			return can_start_mi_xin$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SET_JIN_WEI_ANNOUNCEMENT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_set_jin_wei_announcement", "canSetJinWeiAnnouncement", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_set_jin_wei_announcement$field:Boolean;

		public function clearCanSetJinWeiAnnouncement():void {
			hasField$0 &= 0xffefffff;
			can_set_jin_wei_announcement$field = new Boolean();
		}

		public function get hasCanSetJinWeiAnnouncement():Boolean {
			return (hasField$0 & 0x100000) != 0;
		}

		public function set canSetJinWeiAnnouncement(value:Boolean):void {
			hasField$0 |= 0x100000;
			can_set_jin_wei_announcement$field = value;
		}

		public function get canSetJinWeiAnnouncement():Boolean {
			return can_set_jin_wei_announcement$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SET_COUNTRY_ANNOUNCEMENT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_set_country_announcement", "canSetCountryAnnouncement", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_set_country_announcement$field:Boolean;

		public function clearCanSetCountryAnnouncement():void {
			hasField$0 &= 0xffdfffff;
			can_set_country_announcement$field = new Boolean();
		}

		public function get hasCanSetCountryAnnouncement():Boolean {
			return (hasField$0 & 0x200000) != 0;
		}

		public function set canSetCountryAnnouncement(value:Boolean):void {
			hasField$0 |= 0x200000;
			can_set_country_announcement$field = value;
		}

		public function get canSetCountryAnnouncement():Boolean {
			return can_set_country_announcement$field;
		}

		/**
		 *  @private
		 */
		public static const SEAL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryOfficerDataProto.seal", "seal", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		private var seal$field:int;

		public function clearSeal():void {
			hasField$0 &= 0xffbfffff;
			seal$field = new int();
		}

		public function get hasSeal():Boolean {
			return (hasField$0 & 0x400000) != 0;
		}

		public function set seal(value:int):void {
			hasField$0 |= 0x400000;
			seal$field = value;
		}

		public function get seal():int {
			return seal$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_START_GUO_YUN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.CountryOfficerDataProto.can_start_guo_yun", "canStartGuoYun", (26 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_start_guo_yun$field:Boolean;

		public function clearCanStartGuoYun():void {
			hasField$0 &= 0xff7fffff;
			can_start_guo_yun$field = new Boolean();
		}

		public function get hasCanStartGuoYun():Boolean {
			return (hasField$0 & 0x800000) != 0;
		}

		public function set canStartGuoYun(value:Boolean):void {
			hasField$0 |= 0x800000;
			can_start_guo_yun$field = value;
		}

		public function get canStartGuoYun():Boolean {
			return can_start_guo_yun$field;
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
			if (hasOfficerCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, officer_count$field);
			}
			if (hasStrongSalary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, strong_salary$field);
			}
			if (hasNormalSalary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, normal_salary$field);
			}
			if (hasWeakSalary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, weak_salary$field);
			}
			if (hasCanDeclareWar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_declare_war$field);
			}
			if (hasCanPublishCountryTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_publish_country_task$field);
			}
			for (var canSetOfficer$index:uint = 0; canSetOfficer$index < this.canSetOfficer.length; ++canSetOfficer$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.canSetOfficer[canSetOfficer$index]);
			}
			if (hasCanSetDontTalkTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, can_set_dont_talk_times$field);
			}
			if (hasCanCaptivityTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, can_captivity_times$field);
			}
			if (hasCanUseWangZhe) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_use_wang_zhe$field);
			}
			if (hasCanUseKing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_use_king$field);
			}
			if (hasCanUseHuFu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_use_hu_fu$field);
			}
			if (hasCanUseJinWeiFu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_use_jin_wei_fu$field);
			}
			if (hasIsPkNotRed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_pk_not_red$field);
			}
			if (hasCanChangeTaxRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_change_tax_rate$field);
			}
			if (hasCanChangeMilitary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_change_military$field);
			}
			if (hasCanUnionAndLift) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_union_and_lift$field);
			}
			if (hasCanCountryDonate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_country_donate$field);
			}
			if (hasCanStartDuoJing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_start_duo_jing$field);
			}
			if (hasCanStartMiXin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 25);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_start_mi_xin$field);
			}
			if (hasCanSetJinWeiAnnouncement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_set_jin_wei_announcement$field);
			}
			if (hasCanSetCountryAnnouncement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_set_country_announcement$field);
			}
			if (hasSeal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, seal$field);
			}
			if (hasCanStartGuoYun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 26);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_start_guo_yun$field);
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
			var officer_count$count:uint = 0;
			var strong_salary$count:uint = 0;
			var normal_salary$count:uint = 0;
			var weak_salary$count:uint = 0;
			var can_declare_war$count:uint = 0;
			var can_publish_country_task$count:uint = 0;
			var can_set_dont_talk_times$count:uint = 0;
			var can_captivity_times$count:uint = 0;
			var can_use_wang_zhe$count:uint = 0;
			var can_use_king$count:uint = 0;
			var can_use_hu_fu$count:uint = 0;
			var can_use_jin_wei_fu$count:uint = 0;
			var is_pk_not_red$count:uint = 0;
			var can_change_tax_rate$count:uint = 0;
			var can_change_military$count:uint = 0;
			var can_union_and_lift$count:uint = 0;
			var can_country_donate$count:uint = 0;
			var can_start_duo_jing$count:uint = 0;
			var can_start_mi_xin$count:uint = 0;
			var can_set_jin_wei_announcement$count:uint = 0;
			var can_set_country_announcement$count:uint = 0;
			var seal$count:uint = 0;
			var can_start_guo_yun$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (pos_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.posName cannot be set twice.');
					}
					++pos_name$count;
					this.posName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (officer_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.officerCount cannot be set twice.');
					}
					++officer_count$count;
					this.officerCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (strong_salary$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.strongSalary cannot be set twice.');
					}
					++strong_salary$count;
					this.strongSalary = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (normal_salary$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.normalSalary cannot be set twice.');
					}
					++normal_salary$count;
					this.normalSalary = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (weak_salary$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.weakSalary cannot be set twice.');
					}
					++weak_salary$count;
					this.weakSalary = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (can_declare_war$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canDeclareWar cannot be set twice.');
					}
					++can_declare_war$count;
					this.canDeclareWar = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 8:
					if (can_publish_country_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canPublishCountryTask cannot be set twice.');
					}
					++can_publish_country_task$count;
					this.canPublishCountryTask = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 9:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_ENUM, this.canSetOfficer);
						break;
					}
					this.canSetOfficer.push(com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input));
					break;
				case 10:
					if (can_set_dont_talk_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canSetDontTalkTimes cannot be set twice.');
					}
					++can_set_dont_talk_times$count;
					this.canSetDontTalkTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (can_captivity_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canCaptivityTimes cannot be set twice.');
					}
					++can_captivity_times$count;
					this.canCaptivityTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (can_use_wang_zhe$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canUseWangZhe cannot be set twice.');
					}
					++can_use_wang_zhe$count;
					this.canUseWangZhe = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 22:
					if (can_use_king$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canUseKing cannot be set twice.');
					}
					++can_use_king$count;
					this.canUseKing = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 23:
					if (can_use_hu_fu$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canUseHuFu cannot be set twice.');
					}
					++can_use_hu_fu$count;
					this.canUseHuFu = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 13:
					if (can_use_jin_wei_fu$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canUseJinWeiFu cannot be set twice.');
					}
					++can_use_jin_wei_fu$count;
					this.canUseJinWeiFu = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 14:
					if (is_pk_not_red$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.isPkNotRed cannot be set twice.');
					}
					++is_pk_not_red$count;
					this.isPkNotRed = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 15:
					if (can_change_tax_rate$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canChangeTaxRate cannot be set twice.');
					}
					++can_change_tax_rate$count;
					this.canChangeTaxRate = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 16:
					if (can_change_military$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canChangeMilitary cannot be set twice.');
					}
					++can_change_military$count;
					this.canChangeMilitary = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 17:
					if (can_union_and_lift$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canUnionAndLift cannot be set twice.');
					}
					++can_union_and_lift$count;
					this.canUnionAndLift = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 18:
					if (can_country_donate$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canCountryDonate cannot be set twice.');
					}
					++can_country_donate$count;
					this.canCountryDonate = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 24:
					if (can_start_duo_jing$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canStartDuoJing cannot be set twice.');
					}
					++can_start_duo_jing$count;
					this.canStartDuoJing = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 25:
					if (can_start_mi_xin$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canStartMiXin cannot be set twice.');
					}
					++can_start_mi_xin$count;
					this.canStartMiXin = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 19:
					if (can_set_jin_wei_announcement$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canSetJinWeiAnnouncement cannot be set twice.');
					}
					++can_set_jin_wei_announcement$count;
					this.canSetJinWeiAnnouncement = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 20:
					if (can_set_country_announcement$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canSetCountryAnnouncement cannot be set twice.');
					}
					++can_set_country_announcement$count;
					this.canSetCountryAnnouncement = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 21:
					if (seal$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.seal cannot be set twice.');
					}
					++seal$count;
					this.seal = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 26:
					if (can_start_guo_yun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficerDataProto.canStartGuoYun cannot be set twice.');
					}
					++can_start_guo_yun$count;
					this.canStartGuoYun = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
