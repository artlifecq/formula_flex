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
	public dynamic final class CountryMiscProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TAX_RATE_LOWER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.tax_rate_lower", "taxRateLower", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tax_rate_lower$field:int;

		private var hasField$0:uint = 0;

		public function clearTaxRateLower():void {
			hasField$0 &= 0xfffffffe;
			tax_rate_lower$field = new int();
		}

		public function get hasTaxRateLower():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set taxRateLower(value:int):void {
			hasField$0 |= 0x1;
			tax_rate_lower$field = value;
		}

		public function get taxRateLower():int {
			return tax_rate_lower$field;
		}

		/**
		 *  @private
		 */
		public static const TAX_RATE_UPPER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.tax_rate_upper", "taxRateUpper", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tax_rate_upper$field:int;

		public function clearTaxRateUpper():void {
			hasField$0 &= 0xfffffffd;
			tax_rate_upper$field = new int();
		}

		public function get hasTaxRateUpper():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set taxRateUpper(value:int):void {
			hasField$0 |= 0x2;
			tax_rate_upper$field = value;
		}

		public function get taxRateUpper():int {
			return tax_rate_upper$field;
		}

		/**
		 *  @private
		 */
		public static const MILITARY_SUBSIDY_LOWER:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryMiscProto.military_subsidy_lower", "militarySubsidyLower", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var military_subsidy_lower$field:Int64;

		public function clearMilitarySubsidyLower():void {
			military_subsidy_lower$field = null;
		}

		public function get hasMilitarySubsidyLower():Boolean {
			return military_subsidy_lower$field != null;
		}

		public function set militarySubsidyLower(value:Int64):void {
			military_subsidy_lower$field = value;
		}

		public function get militarySubsidyLower():Int64 {
			return military_subsidy_lower$field;
		}

		/**
		 *  @private
		 */
		public static const MILITARY_SUBSIDY_PER_IN_TOTAL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.military_subsidy_per_in_total", "militarySubsidyPerInTotal", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var military_subsidy_per_in_total$field:int;

		public function clearMilitarySubsidyPerInTotal():void {
			hasField$0 &= 0xfffffffb;
			military_subsidy_per_in_total$field = new int();
		}

		public function get hasMilitarySubsidyPerInTotal():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set militarySubsidyPerInTotal(value:int):void {
			hasField$0 |= 0x4;
			military_subsidy_per_in_total$field = value;
		}

		public function get militarySubsidyPerInTotal():int {
			return military_subsidy_per_in_total$field;
		}

		/**
		 *  @private
		 */
		public static const MILITARY_SUBSIDY_PER_LOWER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.military_subsidy_per_lower", "militarySubsidyPerLower", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var military_subsidy_per_lower$field:int;

		public function clearMilitarySubsidyPerLower():void {
			hasField$0 &= 0xfffffff7;
			military_subsidy_per_lower$field = new int();
		}

		public function get hasMilitarySubsidyPerLower():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set militarySubsidyPerLower(value:int):void {
			hasField$0 |= 0x8;
			military_subsidy_per_lower$field = value;
		}

		public function get militarySubsidyPerLower():int {
			return military_subsidy_per_lower$field;
		}

		/**
		 *  @private
		 */
		public static const MILITARY_SUBSIDY_PER_UPPER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.military_subsidy_per_upper", "militarySubsidyPerUpper", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var military_subsidy_per_upper$field:int;

		public function clearMilitarySubsidyPerUpper():void {
			hasField$0 &= 0xffffffef;
			military_subsidy_per_upper$field = new int();
		}

		public function get hasMilitarySubsidyPerUpper():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set militarySubsidyPerUpper(value:int):void {
			hasField$0 |= 0x10;
			military_subsidy_per_upper$field = value;
		}

		public function get militarySubsidyPerUpper():int {
			return military_subsidy_per_upper$field;
		}

		/**
		 *  @private
		 */
		public static const MILITARY_SUBSIDY_UPPER_PER_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.military_subsidy_upper_per_times", "militarySubsidyUpperPerTimes", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var military_subsidy_upper_per_times$field:int;

		public function clearMilitarySubsidyUpperPerTimes():void {
			hasField$0 &= 0xffffffdf;
			military_subsidy_upper_per_times$field = new int();
		}

		public function get hasMilitarySubsidyUpperPerTimes():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set militarySubsidyUpperPerTimes(value:int):void {
			hasField$0 |= 0x20;
			military_subsidy_upper_per_times$field = value;
		}

		public function get militarySubsidyUpperPerTimes():int {
			return military_subsidy_upper_per_times$field;
		}

		/**
		 *  @private
		 */
		public static const STRONG_MAINTAIN_FEE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.strong_maintain_fee", "strongMaintainFee", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var strong_maintain_fee$field:int;

		public function clearStrongMaintainFee():void {
			hasField$0 &= 0xffffffbf;
			strong_maintain_fee$field = new int();
		}

		public function get hasStrongMaintainFee():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set strongMaintainFee(value:int):void {
			hasField$0 |= 0x40;
			strong_maintain_fee$field = value;
		}

		public function get strongMaintainFee():int {
			return strong_maintain_fee$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_MAINTAIN_FEE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.normal_maintain_fee", "normalMaintainFee", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var normal_maintain_fee$field:int;

		public function clearNormalMaintainFee():void {
			hasField$0 &= 0xffffff7f;
			normal_maintain_fee$field = new int();
		}

		public function get hasNormalMaintainFee():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set normalMaintainFee(value:int):void {
			hasField$0 |= 0x80;
			normal_maintain_fee$field = value;
		}

		public function get normalMaintainFee():int {
			return normal_maintain_fee$field;
		}

		/**
		 *  @private
		 */
		public static const WEAK_MAINTAIN_FEE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.weak_maintain_fee", "weakMaintainFee", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var weak_maintain_fee$field:int;

		public function clearWeakMaintainFee():void {
			hasField$0 &= 0xfffffeff;
			weak_maintain_fee$field = new int();
		}

		public function get hasWeakMaintainFee():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set weakMaintainFee(value:int):void {
			hasField$0 |= 0x100;
			weak_maintain_fee$field = value;
		}

		public function get weakMaintainFee():int {
			return weak_maintain_fee$field;
		}

		/**
		 *  @private
		 */
		public static const STRONG_RELIVE_COST_PERCENT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.strong_relive_cost_percent", "strongReliveCostPercent", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var strong_relive_cost_percent$field:int;

		public function clearStrongReliveCostPercent():void {
			hasField$0 &= 0xfffffdff;
			strong_relive_cost_percent$field = new int();
		}

		public function get hasStrongReliveCostPercent():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set strongReliveCostPercent(value:int):void {
			hasField$0 |= 0x200;
			strong_relive_cost_percent$field = value;
		}

		public function get strongReliveCostPercent():int {
			return strong_relive_cost_percent$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_RELIVE_COST_PERCENT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.normal_relive_cost_percent", "normalReliveCostPercent", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var normal_relive_cost_percent$field:int;

		public function clearNormalReliveCostPercent():void {
			hasField$0 &= 0xfffffbff;
			normal_relive_cost_percent$field = new int();
		}

		public function get hasNormalReliveCostPercent():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set normalReliveCostPercent(value:int):void {
			hasField$0 |= 0x400;
			normal_relive_cost_percent$field = value;
		}

		public function get normalReliveCostPercent():int {
			return normal_relive_cost_percent$field;
		}

		/**
		 *  @private
		 */
		public static const WEAK_RELIVE_COST_PERCENT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.weak_relive_cost_percent", "weakReliveCostPercent", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var weak_relive_cost_percent$field:int;

		public function clearWeakReliveCostPercent():void {
			hasField$0 &= 0xfffff7ff;
			weak_relive_cost_percent$field = new int();
		}

		public function get hasWeakReliveCostPercent():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set weakReliveCostPercent(value:int):void {
			hasField$0 |= 0x800;
			weak_relive_cost_percent$field = value;
		}

		public function get weakReliveCostPercent():int {
			return weak_relive_cost_percent$field;
		}

		/**
		 *  @private
		 */
		public static const UNION_NEED_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.union_need_money", "unionNeedMoney", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var union_need_money$field:int;

		public function clearUnionNeedMoney():void {
			hasField$0 &= 0xffffefff;
			union_need_money$field = new int();
		}

		public function get hasUnionNeedMoney():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set unionNeedMoney(value:int):void {
			hasField$0 |= 0x1000;
			union_need_money$field = value;
		}

		public function get unionNeedMoney():int {
			return union_need_money$field;
		}

		/**
		 *  @private
		 */
		public static const JIN_WEI_APPLICANT_UPPER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.jin_wei_applicant_upper", "jinWeiApplicantUpper", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jin_wei_applicant_upper$field:int;

		public function clearJinWeiApplicantUpper():void {
			hasField$0 &= 0xffffdfff;
			jin_wei_applicant_upper$field = new int();
		}

		public function get hasJinWeiApplicantUpper():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set jinWeiApplicantUpper(value:int):void {
			hasField$0 |= 0x2000;
			jin_wei_applicant_upper$field = value;
		}

		public function get jinWeiApplicantUpper():int {
			return jin_wei_applicant_upper$field;
		}

		/**
		 *  @private
		 */
		public static const WAIT_UNION_REPLY_CD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryMiscProto.wait_union_reply_cd", "waitUnionReplyCd", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var wait_union_reply_cd$field:Int64;

		public function clearWaitUnionReplyCd():void {
			wait_union_reply_cd$field = null;
		}

		public function get hasWaitUnionReplyCd():Boolean {
			return wait_union_reply_cd$field != null;
		}

		public function set waitUnionReplyCd(value:Int64):void {
			wait_union_reply_cd$field = value;
		}

		public function get waitUnionReplyCd():Int64 {
			return wait_union_reply_cd$field;
		}

		/**
		 *  @private
		 */
		public static const AUTO_REDUCE_UNION_AMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.auto_reduce_union_amount", "autoReduceUnionAmount", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var auto_reduce_union_amount$field:int;

		public function clearAutoReduceUnionAmount():void {
			hasField$0 &= 0xffffbfff;
			auto_reduce_union_amount$field = new int();
		}

		public function get hasAutoReduceUnionAmount():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set autoReduceUnionAmount(value:int):void {
			hasField$0 |= 0x4000;
			auto_reduce_union_amount$field = value;
		}

		public function get autoReduceUnionAmount():int {
			return auto_reduce_union_amount$field;
		}

		/**
		 *  @private
		 */
		public static const LIFT_UNION_CD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryMiscProto.lift_union_cd", "liftUnionCd", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lift_union_cd$field:Int64;

		public function clearLiftUnionCd():void {
			lift_union_cd$field = null;
		}

		public function get hasLiftUnionCd():Boolean {
			return lift_union_cd$field != null;
		}

		public function set liftUnionCd(value:Int64):void {
			lift_union_cd$field = value;
		}

		public function get liftUnionCd():Int64 {
			return lift_union_cd$field;
		}

		/**
		 *  @private
		 */
		public static const UNTALK_TIME_DURATION:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("app.message.CountryMiscProto.untalk_time_duration", "untalkTimeDuration", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var untalkTimeDuration:Array = [];

		/**
		 *  @private
		 */
		public static const CAPTIVITY_DURATION:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("app.message.CountryMiscProto.captivity_duration", "captivityDuration", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var captivityDuration:Array = [];

		/**
		 *  @private
		 */
		public static const VOTE_TIME_DATA:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryMiscProto.vote_time_data", "voteTimeData", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var vote_time_data$field:String;

		public function clearVoteTimeData():void {
			vote_time_data$field = null;
		}

		public function get hasVoteTimeData():Boolean {
			return vote_time_data$field != null;
		}

		public function set voteTimeData(value:String):void {
			vote_time_data$field = value;
		}

		public function get voteTimeData():String {
			return vote_time_data$field;
		}

		/**
		 *  @private
		 */
		public static const VOTE_DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryMiscProto.vote_duration", "voteDuration", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vote_duration$field:Int64;

		public function clearVoteDuration():void {
			vote_duration$field = null;
		}

		public function get hasVoteDuration():Boolean {
			return vote_duration$field != null;
		}

		public function set voteDuration(value:Int64):void {
			vote_duration$field = value;
		}

		public function get voteDuration():Int64 {
			return vote_duration$field;
		}

		/**
		 *  @private
		 */
		public static const VOTE_EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMiscProto.vote_exp", "voteExp", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vote_exp$field:int;

		public function clearVoteExp():void {
			hasField$0 &= 0xffff7fff;
			vote_exp$field = new int();
		}

		public function get hasVoteExp():Boolean {
			return (hasField$0 & 0x8000) != 0;
		}

		public function set voteExp(value:int):void {
			hasField$0 |= 0x8000;
			vote_exp$field = value;
		}

		public function get voteExp():int {
			return vote_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTaxRateLower) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tax_rate_lower$field);
			}
			if (hasTaxRateUpper) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tax_rate_upper$field);
			}
			if (hasMilitarySubsidyLower) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, military_subsidy_lower$field);
			}
			if (hasMilitarySubsidyPerInTotal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, military_subsidy_per_in_total$field);
			}
			if (hasMilitarySubsidyPerLower) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, military_subsidy_per_lower$field);
			}
			if (hasMilitarySubsidyPerUpper) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, military_subsidy_per_upper$field);
			}
			if (hasMilitarySubsidyUpperPerTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, military_subsidy_upper_per_times$field);
			}
			if (hasStrongMaintainFee) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, strong_maintain_fee$field);
			}
			if (hasNormalMaintainFee) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, normal_maintain_fee$field);
			}
			if (hasWeakMaintainFee) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, weak_maintain_fee$field);
			}
			if (hasStrongReliveCostPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, strong_relive_cost_percent$field);
			}
			if (hasNormalReliveCostPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, normal_relive_cost_percent$field);
			}
			if (hasWeakReliveCostPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, weak_relive_cost_percent$field);
			}
			if (hasUnionNeedMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, union_need_money$field);
			}
			if (hasJinWeiApplicantUpper) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jin_wei_applicant_upper$field);
			}
			if (hasWaitUnionReplyCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, wait_union_reply_cd$field);
			}
			if (hasAutoReduceUnionAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, auto_reduce_union_amount$field);
			}
			if (hasLiftUnionCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, lift_union_cd$field);
			}
			for (var untalkTimeDuration$index:uint = 0; untalkTimeDuration$index < this.untalkTimeDuration.length; ++untalkTimeDuration$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.untalkTimeDuration[untalkTimeDuration$index]);
			}
			for (var captivityDuration$index:uint = 0; captivityDuration$index < this.captivityDuration.length; ++captivityDuration$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.captivityDuration[captivityDuration$index]);
			}
			if (hasVoteTimeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, vote_time_data$field);
			}
			if (hasVoteDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, vote_duration$field);
			}
			if (hasVoteExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vote_exp$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tax_rate_lower$count:uint = 0;
			var tax_rate_upper$count:uint = 0;
			var military_subsidy_lower$count:uint = 0;
			var military_subsidy_per_in_total$count:uint = 0;
			var military_subsidy_per_lower$count:uint = 0;
			var military_subsidy_per_upper$count:uint = 0;
			var military_subsidy_upper_per_times$count:uint = 0;
			var strong_maintain_fee$count:uint = 0;
			var normal_maintain_fee$count:uint = 0;
			var weak_maintain_fee$count:uint = 0;
			var strong_relive_cost_percent$count:uint = 0;
			var normal_relive_cost_percent$count:uint = 0;
			var weak_relive_cost_percent$count:uint = 0;
			var union_need_money$count:uint = 0;
			var jin_wei_applicant_upper$count:uint = 0;
			var wait_union_reply_cd$count:uint = 0;
			var auto_reduce_union_amount$count:uint = 0;
			var lift_union_cd$count:uint = 0;
			var vote_time_data$count:uint = 0;
			var vote_duration$count:uint = 0;
			var vote_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tax_rate_lower$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.taxRateLower cannot be set twice.');
					}
					++tax_rate_lower$count;
					this.taxRateLower = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (tax_rate_upper$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.taxRateUpper cannot be set twice.');
					}
					++tax_rate_upper$count;
					this.taxRateUpper = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (military_subsidy_lower$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.militarySubsidyLower cannot be set twice.');
					}
					++military_subsidy_lower$count;
					this.militarySubsidyLower = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (military_subsidy_per_in_total$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.militarySubsidyPerInTotal cannot be set twice.');
					}
					++military_subsidy_per_in_total$count;
					this.militarySubsidyPerInTotal = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (military_subsidy_per_lower$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.militarySubsidyPerLower cannot be set twice.');
					}
					++military_subsidy_per_lower$count;
					this.militarySubsidyPerLower = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (military_subsidy_per_upper$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.militarySubsidyPerUpper cannot be set twice.');
					}
					++military_subsidy_per_upper$count;
					this.militarySubsidyPerUpper = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (military_subsidy_upper_per_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.militarySubsidyUpperPerTimes cannot be set twice.');
					}
					++military_subsidy_upper_per_times$count;
					this.militarySubsidyUpperPerTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (strong_maintain_fee$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.strongMaintainFee cannot be set twice.');
					}
					++strong_maintain_fee$count;
					this.strongMaintainFee = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (normal_maintain_fee$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.normalMaintainFee cannot be set twice.');
					}
					++normal_maintain_fee$count;
					this.normalMaintainFee = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (weak_maintain_fee$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.weakMaintainFee cannot be set twice.');
					}
					++weak_maintain_fee$count;
					this.weakMaintainFee = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (strong_relive_cost_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.strongReliveCostPercent cannot be set twice.');
					}
					++strong_relive_cost_percent$count;
					this.strongReliveCostPercent = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (normal_relive_cost_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.normalReliveCostPercent cannot be set twice.');
					}
					++normal_relive_cost_percent$count;
					this.normalReliveCostPercent = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (weak_relive_cost_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.weakReliveCostPercent cannot be set twice.');
					}
					++weak_relive_cost_percent$count;
					this.weakReliveCostPercent = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (union_need_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.unionNeedMoney cannot be set twice.');
					}
					++union_need_money$count;
					this.unionNeedMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (jin_wei_applicant_upper$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.jinWeiApplicantUpper cannot be set twice.');
					}
					++jin_wei_applicant_upper$count;
					this.jinWeiApplicantUpper = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 16:
					if (wait_union_reply_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.waitUnionReplyCd cannot be set twice.');
					}
					++wait_union_reply_cd$count;
					this.waitUnionReplyCd = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 17:
					if (auto_reduce_union_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.autoReduceUnionAmount cannot be set twice.');
					}
					++auto_reduce_union_amount$count;
					this.autoReduceUnionAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 18:
					if (lift_union_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.liftUnionCd cannot be set twice.');
					}
					++lift_union_cd$count;
					this.liftUnionCd = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 19:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT64, this.untalkTimeDuration);
						break;
					}
					this.untalkTimeDuration.push(com.netease.protobuf.ReadUtils.read$TYPE_INT64(input));
					break;
				case 20:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT64, this.captivityDuration);
						break;
					}
					this.captivityDuration.push(com.netease.protobuf.ReadUtils.read$TYPE_INT64(input));
					break;
				case 21:
					if (vote_time_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.voteTimeData cannot be set twice.');
					}
					++vote_time_data$count;
					this.voteTimeData = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 22:
					if (vote_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.voteDuration cannot be set twice.');
					}
					++vote_duration$count;
					this.voteDuration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 23:
					if (vote_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMiscProto.voteExp cannot be set twice.');
					}
					++vote_exp$count;
					this.voteExp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
