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
	import app.message.AreaDataProto;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WAR_TIME_DATA:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.CountryWarMiscDataProto.war_time_data", "warTimeData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var war_time_data$field:String;

		public function clearWarTimeData():void {
			war_time_data$field = null;
		}

		public function get hasWarTimeData():Boolean {
			return war_time_data$field != null;
		}

		public function set warTimeData(value:String):void {
			war_time_data$field = value;
		}

		public function get warTimeData():String {
			return war_time_data$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.war_duration", "warDuration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var war_duration$field:Int64;

		public function clearWarDuration():void {
			war_duration$field = null;
		}

		public function get hasWarDuration():Boolean {
			return war_duration$field != null;
		}

		public function set warDuration(value:Int64):void {
			war_duration$field = value;
		}

		public function get warDuration():Int64 {
			return war_duration$field;
		}

		/**
		 *  @private
		 */
		public static const REVENGE_TIME_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.revenge_time_duration", "revengeTimeDuration", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var revenge_time_duration$field:Int64;

		public function clearRevengeTimeDuration():void {
			revenge_time_duration$field = null;
		}

		public function get hasRevengeTimeDuration():Boolean {
			return revenge_time_duration$field != null;
		}

		public function set revengeTimeDuration(value:Int64):void {
			revenge_time_duration$field = value;
		}

		public function get revengeTimeDuration():Int64 {
			return revenge_time_duration$field;
		}

		/**
		 *  @private
		 */
		public static const REVENGE_WAR_START_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.revenge_war_start_duration", "revengeWarStartDuration", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var revenge_war_start_duration$field:Int64;

		public function clearRevengeWarStartDuration():void {
			revenge_war_start_duration$field = null;
		}

		public function get hasRevengeWarStartDuration():Boolean {
			return revenge_war_start_duration$field != null;
		}

		public function set revengeWarStartDuration(value:Int64):void {
			revenge_war_start_duration$field = value;
		}

		public function get revengeWarStartDuration():Int64 {
			return revenge_war_start_duration$field;
		}

		/**
		 *  @private
		 */
		public static const REVENGE_WAR_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.revenge_war_duration", "revengeWarDuration", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var revenge_war_duration$field:Int64;

		public function clearRevengeWarDuration():void {
			revenge_war_duration$field = null;
		}

		public function get hasRevengeWarDuration():Boolean {
			return revenge_war_duration$field != null;
		}

		public function set revengeWarDuration(value:Int64):void {
			revenge_war_duration$field = value;
		}

		public function get revengeWarDuration():Int64 {
			return revenge_war_duration$field;
		}

		/**
		 *  @private
		 */
		public static const START_WAR_DURATION_WHEN_SERVER_START:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.start_war_duration_when_server_start", "startWarDurationWhenServerStart", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_war_duration_when_server_start$field:Int64;

		public function clearStartWarDurationWhenServerStart():void {
			start_war_duration_when_server_start$field = null;
		}

		public function get hasStartWarDurationWhenServerStart():Boolean {
			return start_war_duration_when_server_start$field != null;
		}

		public function set startWarDurationWhenServerStart(value:Int64):void {
			start_war_duration_when_server_start$field = value;
		}

		public function get startWarDurationWhenServerStart():Int64 {
			return start_war_duration_when_server_start$field;
		}

		/**
		 *  @private
		 */
		public static const DECLARE_MONEY_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.declare_money_cost", "declareMoneyCost", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var declare_money_cost$field:int;

		private var hasField$0:uint = 0;

		public function clearDeclareMoneyCost():void {
			hasField$0 &= 0xfffffffe;
			declare_money_cost$field = new int();
		}

		public function get hasDeclareMoneyCost():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set declareMoneyCost(value:int):void {
			hasField$0 |= 0x1;
			declare_money_cost$field = value;
		}

		public function get declareMoneyCost():int {
			return declare_money_cost$field;
		}

		/**
		 *  @private
		 */
		public static const CANDECLARESTARTTIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.canDeclareStartTime", "canDeclareStartTime", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canDeclareStartTime$field:Int64;

		public function clearCanDeclareStartTime():void {
			canDeclareStartTime$field = null;
		}

		public function get hasCanDeclareStartTime():Boolean {
			return canDeclareStartTime$field != null;
		}

		public function set canDeclareStartTime(value:Int64):void {
			canDeclareStartTime$field = value;
		}

		public function get canDeclareStartTime():Int64 {
			return canDeclareStartTime$field;
		}

		/**
		 *  @private
		 */
		public static const CANDECLAREENDTIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.canDeclareEndTime", "canDeclareEndTime", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canDeclareEndTime$field:Int64;

		public function clearCanDeclareEndTime():void {
			canDeclareEndTime$field = null;
		}

		public function get hasCanDeclareEndTime():Boolean {
			return canDeclareEndTime$field != null;
		}

		public function set canDeclareEndTime(value:Int64):void {
			canDeclareEndTime$field = value;
		}

		public function get canDeclareEndTime():Int64 {
			return canDeclareEndTime$field;
		}

		/**
		 *  @private
		 */
		public static const CANADMIRESTARTTIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.canAdmireStartTime", "canAdmireStartTime", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canAdmireStartTime$field:Int64;

		public function clearCanAdmireStartTime():void {
			canAdmireStartTime$field = null;
		}

		public function get hasCanAdmireStartTime():Boolean {
			return canAdmireStartTime$field != null;
		}

		public function set canAdmireStartTime(value:Int64):void {
			canAdmireStartTime$field = value;
		}

		public function get canAdmireStartTime():Int64 {
			return canAdmireStartTime$field;
		}

		/**
		 *  @private
		 */
		public static const CANADMIREENDTIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.canAdmireEndTime", "canAdmireEndTime", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canAdmireEndTime$field:Int64;

		public function clearCanAdmireEndTime():void {
			canAdmireEndTime$field = null;
		}

		public function get hasCanAdmireEndTime():Boolean {
			return canAdmireEndTime$field != null;
		}

		public function set canAdmireEndTime(value:Int64):void {
			canAdmireEndTime$field = value;
		}

		public function get canAdmireEndTime():Int64 {
			return canAdmireEndTime$field;
		}

		/**
		 *  @private
		 */
		public static const DECLARECHANGESTARTTIMEMILLISOFDAY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.declareChangeStartTimeMillisOfDay", "declareChangeStartTimeMillisOfDay", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		private var declareChangeStartTimeMillisOfDay$field:Int64;

		public function clearDeclareChangeStartTimeMillisOfDay():void {
			declareChangeStartTimeMillisOfDay$field = null;
		}

		public function get hasDeclareChangeStartTimeMillisOfDay():Boolean {
			return declareChangeStartTimeMillisOfDay$field != null;
		}

		public function set declareChangeStartTimeMillisOfDay(value:Int64):void {
			declareChangeStartTimeMillisOfDay$field = value;
		}

		public function get declareChangeStartTimeMillisOfDay():Int64 {
			return declareChangeStartTimeMillisOfDay$field;
		}

		/**
		 *  @private
		 */
		public static const STARTBEFOREMILLISOFDAY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.startBeforeMillisOfDay", "startBeforeMillisOfDay", (25 << 3) | com.netease.protobuf.WireType.VARINT);

		private var startBeforeMillisOfDay$field:Int64;

		public function clearStartBeforeMillisOfDay():void {
			startBeforeMillisOfDay$field = null;
		}

		public function get hasStartBeforeMillisOfDay():Boolean {
			return startBeforeMillisOfDay$field != null;
		}

		public function set startBeforeMillisOfDay(value:Int64):void {
			startBeforeMillisOfDay$field = value;
		}

		public function get startBeforeMillisOfDay():Int64 {
			return startBeforeMillisOfDay$field;
		}

		/**
		 *  @private
		 */
		public static const STARTAFTERMILLISOFDAY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.startAfterMillisOfDay", "startAfterMillisOfDay", (26 << 3) | com.netease.protobuf.WireType.VARINT);

		private var startAfterMillisOfDay$field:Int64;

		public function clearStartAfterMillisOfDay():void {
			startAfterMillisOfDay$field = null;
		}

		public function get hasStartAfterMillisOfDay():Boolean {
			return startAfterMillisOfDay$field != null;
		}

		public function set startAfterMillisOfDay(value:Int64):void {
			startAfterMillisOfDay$field = value;
		}

		public function get startAfterMillisOfDay():Int64 {
			return startAfterMillisOfDay$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRYWARKILLMONSTEREXPMULIPLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.countryWarKillMonsterExpMuliple", "countryWarKillMonsterExpMuliple", (27 << 3) | com.netease.protobuf.WireType.VARINT);

		private var countryWarKillMonsterExpMuliple$field:int;

		public function clearCountryWarKillMonsterExpMuliple():void {
			hasField$0 &= 0xfffffffd;
			countryWarKillMonsterExpMuliple$field = new int();
		}

		public function get hasCountryWarKillMonsterExpMuliple():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set countryWarKillMonsterExpMuliple(value:int):void {
			hasField$0 |= 0x2;
			countryWarKillMonsterExpMuliple$field = value;
		}

		public function get countryWarKillMonsterExpMuliple():int {
			return countryWarKillMonsterExpMuliple$field;
		}

		/**
		 *  @private
		 */
		public static const JOINCOUNTRYWARCOST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarMiscDataProto.joinCountryWarCost", "joinCountryWarCost", (28 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var joinCountryWarCost$field:app.message.UpgradeProto;

		public function clearJoinCountryWarCost():void {
			joinCountryWarCost$field = null;
		}

		public function get hasJoinCountryWarCost():Boolean {
			return joinCountryWarCost$field != null;
		}

		public function set joinCountryWarCost(value:app.message.UpgradeProto):void {
			joinCountryWarCost$field = value;
		}

		public function get joinCountryWarCost():app.message.UpgradeProto {
			return joinCountryWarCost$field;
		}

		/**
		 *  @private
		 */
		public static const ADMIRE_SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.admire_scene_id", "admireSceneId", (42 << 3) | com.netease.protobuf.WireType.VARINT);

		private var admire_scene_id$field:int;

		public function clearAdmireSceneId():void {
			hasField$0 &= 0xfffffffb;
			admire_scene_id$field = new int();
		}

		public function get hasAdmireSceneId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set admireSceneId(value:int):void {
			hasField$0 |= 0x4;
			admire_scene_id$field = value;
		}

		public function get admireSceneId():int {
			return admire_scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const WINCOUNTRYADMIREADDSTATE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.winCountryAdmireAddState", "winCountryAdmireAddState", (30 << 3) | com.netease.protobuf.WireType.VARINT);

		private var winCountryAdmireAddState$field:int;

		public function clearWinCountryAdmireAddState():void {
			hasField$0 &= 0xfffffff7;
			winCountryAdmireAddState$field = new int();
		}

		public function get hasWinCountryAdmireAddState():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set winCountryAdmireAddState(value:int):void {
			hasField$0 |= 0x8;
			winCountryAdmireAddState$field = value;
		}

		public function get winCountryAdmireAddState():int {
			return winCountryAdmireAddState$field;
		}

		/**
		 *  @private
		 */
		public static const LOSECOUNTRYADMIREGIVEPRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarMiscDataProto.loseCountryAdmireGivePrize", "loseCountryAdmireGivePrize", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var loseCountryAdmireGivePrize$field:app.message.PrizeProto;

		public function clearLoseCountryAdmireGivePrize():void {
			loseCountryAdmireGivePrize$field = null;
		}

		public function get hasLoseCountryAdmireGivePrize():Boolean {
			return loseCountryAdmireGivePrize$field != null;
		}

		public function set loseCountryAdmireGivePrize(value:app.message.PrizeProto):void {
			loseCountryAdmireGivePrize$field = value;
		}

		public function get loseCountryAdmireGivePrize():app.message.PrizeProto {
			return loseCountryAdmireGivePrize$field;
		}

		/**
		 *  @private
		 */
		public static const VALIDHURTHERODURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.validHurtHeroDuration", "validHurtHeroDuration", (32 << 3) | com.netease.protobuf.WireType.VARINT);

		private var validHurtHeroDuration$field:Int64;

		public function clearValidHurtHeroDuration():void {
			validHurtHeroDuration$field = null;
		}

		public function get hasValidHurtHeroDuration():Boolean {
			return validHurtHeroDuration$field != null;
		}

		public function set validHurtHeroDuration(value:Int64):void {
			validHurtHeroDuration$field = value;
		}

		public function get validHurtHeroDuration():Int64 {
			return validHurtHeroDuration$field;
		}

		/**
		 *  @private
		 */
		public static const VALIDHURTNPCDURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.validHurtNpcDuration", "validHurtNpcDuration", (33 << 3) | com.netease.protobuf.WireType.VARINT);

		private var validHurtNpcDuration$field:Int64;

		public function clearValidHurtNpcDuration():void {
			validHurtNpcDuration$field = null;
		}

		public function get hasValidHurtNpcDuration():Boolean {
			return validHurtNpcDuration$field != null;
		}

		public function set validHurtNpcDuration(value:Int64):void {
			validHurtNpcDuration$field = value;
		}

		public function get validHurtNpcDuration():Int64 {
			return validHurtNpcDuration$field;
		}

		/**
		 *  @private
		 */
		public static const ADDPOINTNEEDHURTNPCAMOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.addPointNeedHurtNpcAmount", "addPointNeedHurtNpcAmount", (34 << 3) | com.netease.protobuf.WireType.VARINT);

		private var addPointNeedHurtNpcAmount$field:int;

		public function clearAddPointNeedHurtNpcAmount():void {
			hasField$0 &= 0xffffffef;
			addPointNeedHurtNpcAmount$field = new int();
		}

		public function get hasAddPointNeedHurtNpcAmount():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set addPointNeedHurtNpcAmount(value:int):void {
			hasField$0 |= 0x10;
			addPointNeedHurtNpcAmount$field = value;
		}

		public function get addPointNeedHurtNpcAmount():int {
			return addPointNeedHurtNpcAmount$field;
		}

		/**
		 *  @private
		 */
		public static const STAYWARSCENEDURATIONADDPOINT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.stayWarSceneDurationAddPoint", "stayWarSceneDurationAddPoint", (35 << 3) | com.netease.protobuf.WireType.VARINT);

		private var stayWarSceneDurationAddPoint$field:Int64;

		public function clearStayWarSceneDurationAddPoint():void {
			stayWarSceneDurationAddPoint$field = null;
		}

		public function get hasStayWarSceneDurationAddPoint():Boolean {
			return stayWarSceneDurationAddPoint$field != null;
		}

		public function set stayWarSceneDurationAddPoint(value:Int64):void {
			stayWarSceneDurationAddPoint$field = value;
		}

		public function get stayWarSceneDurationAddPoint():Int64 {
			return stayWarSceneDurationAddPoint$field;
		}

		/**
		 *  @private
		 */
		public static const KILLHEROADDPOINTCD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.killHeroAddPointCD", "killHeroAddPointCD", (36 << 3) | com.netease.protobuf.WireType.VARINT);

		private var killHeroAddPointCD$field:Int64;

		public function clearKillHeroAddPointCD():void {
			killHeroAddPointCD$field = null;
		}

		public function get hasKillHeroAddPointCD():Boolean {
			return killHeroAddPointCD$field != null;
		}

		public function set killHeroAddPointCD(value:Int64):void {
			killHeroAddPointCD$field = value;
		}

		public function get killHeroAddPointCD():Int64 {
			return killHeroAddPointCD$field;
		}

		/**
		 *  @private
		 */
		public static const MINADMIRENEEDPOINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.minAdmireNeedPoint", "minAdmireNeedPoint", (37 << 3) | com.netease.protobuf.WireType.VARINT);

		private var minAdmireNeedPoint$field:int;

		public function clearMinAdmireNeedPoint():void {
			hasField$0 &= 0xffffffdf;
			minAdmireNeedPoint$field = new int();
		}

		public function get hasMinAdmireNeedPoint():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set minAdmireNeedPoint(value:int):void {
			hasField$0 |= 0x20;
			minAdmireNeedPoint$field = value;
		}

		public function get minAdmireNeedPoint():int {
			return minAdmireNeedPoint$field;
		}

		/**
		 *  @private
		 */
		public static const BEENKILLEDCONTINUEKILLHEROTIMES:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.beenKilledContinueKillHeroTimes", "beenKilledContinueKillHeroTimes", (38 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var beenKilledContinueKillHeroTimes:Array = [];

		/**
		 *  @private
		 */
		public static const WINNERCOUNTRYPRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarMiscDataProto.winnerCountryPrize", "winnerCountryPrize", (39 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var winnerCountryPrize$field:app.message.PrizeProto;

		public function clearWinnerCountryPrize():void {
			winnerCountryPrize$field = null;
		}

		public function get hasWinnerCountryPrize():Boolean {
			return winnerCountryPrize$field != null;
		}

		public function set winnerCountryPrize(value:app.message.PrizeProto):void {
			winnerCountryPrize$field = value;
		}

		public function get winnerCountryPrize():app.message.PrizeProto {
			return winnerCountryPrize$field;
		}

		/**
		 *  @private
		 */
		public static const FAILERCOUNTRYPRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarMiscDataProto.failerCountryPrize", "failerCountryPrize", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var failerCountryPrize$field:app.message.PrizeProto;

		public function clearFailerCountryPrize():void {
			failerCountryPrize$field = null;
		}

		public function get hasFailerCountryPrize():Boolean {
			return failerCountryPrize$field != null;
		}

		public function set failerCountryPrize(value:app.message.PrizeProto):void {
			failerCountryPrize$field = value;
		}

		public function get failerCountryPrize():app.message.PrizeProto {
			return failerCountryPrize$field;
		}

		/**
		 *  @private
		 */
		public static const MINGETCOUNTRYPRIZENEEDPOINT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.minGetCountryPrizeNeedPoint", "minGetCountryPrizeNeedPoint", (41 << 3) | com.netease.protobuf.WireType.VARINT);

		private var minGetCountryPrizeNeedPoint$field:int;

		public function clearMinGetCountryPrizeNeedPoint():void {
			hasField$0 &= 0xffffffbf;
			minGetCountryPrizeNeedPoint$field = new int();
		}

		public function get hasMinGetCountryPrizeNeedPoint():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set minGetCountryPrizeNeedPoint(value:int):void {
			hasField$0 |= 0x40;
			minGetCountryPrizeNeedPoint$field = value;
		}

		public function get minGetCountryPrizeNeedPoint():int {
			return minGetCountryPrizeNeedPoint$field;
		}

		/**
		 *  @private
		 */
		public static const DEFAULT_DEFENCER_RELIVE_SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.default_defencer_relive_scene_id", "defaultDefencerReliveSceneId", (43 << 3) | com.netease.protobuf.WireType.VARINT);

		private var default_defencer_relive_scene_id$field:int;

		public function clearDefaultDefencerReliveSceneId():void {
			hasField$0 &= 0xffffff7f;
			default_defencer_relive_scene_id$field = new int();
		}

		public function get hasDefaultDefencerReliveSceneId():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set defaultDefencerReliveSceneId(value:int):void {
			hasField$0 |= 0x80;
			default_defencer_relive_scene_id$field = value;
		}

		public function get defaultDefencerReliveSceneId():int {
			return default_defencer_relive_scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const DEFAULT_ATTACKER_RELIVE_SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.default_attacker_relive_scene_id", "defaultAttackerReliveSceneId", (44 << 3) | com.netease.protobuf.WireType.VARINT);

		private var default_attacker_relive_scene_id$field:int;

		public function clearDefaultAttackerReliveSceneId():void {
			hasField$0 &= 0xfffffeff;
			default_attacker_relive_scene_id$field = new int();
		}

		public function get hasDefaultAttackerReliveSceneId():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set defaultAttackerReliveSceneId(value:int):void {
			hasField$0 |= 0x100;
			default_attacker_relive_scene_id$field = value;
		}

		public function get defaultAttackerReliveSceneId():int {
			return default_attacker_relive_scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_START_BLOCK_AREAS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.CountryWarMiscDataProto.war_start_block_areas", "warStartBlockAreas", (45 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AreaDataProto; });

		[ArrayElementType("app.message.AreaDataProto")]
		public var warStartBlockAreas:Array = [];

		/**
		 *  @private
		 */
		public static const DAN_MU_CD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.dan_mu_cd", "danMuCd", (46 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dan_mu_cd$field:Int64;

		public function clearDanMuCd():void {
			dan_mu_cd$field = null;
		}

		public function get hasDanMuCd():Boolean {
			return dan_mu_cd$field != null;
		}

		public function set danMuCd(value:Int64):void {
			dan_mu_cd$field = value;
		}

		public function get danMuCd():Int64 {
			return dan_mu_cd$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_POS_CD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.change_pos_cd", "changePosCd", (47 << 3) | com.netease.protobuf.WireType.VARINT);

		private var change_pos_cd$field:Int64;

		public function clearChangePosCd():void {
			change_pos_cd$field = null;
		}

		public function get hasChangePosCd():Boolean {
			return change_pos_cd$field != null;
		}

		public function set changePosCd(value:Int64):void {
			change_pos_cd$field = value;
		}

		public function get changePosCd():Int64 {
			return change_pos_cd$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_POS_MOVE_SPEED:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.change_pos_move_speed", "changePosMoveSpeed", (48 << 3) | com.netease.protobuf.WireType.VARINT);

		private var change_pos_move_speed$field:Int64;

		public function clearChangePosMoveSpeed():void {
			change_pos_move_speed$field = null;
		}

		public function get hasChangePosMoveSpeed():Boolean {
			return change_pos_move_speed$field != null;
		}

		public function set changePosMoveSpeed(value:Int64):void {
			change_pos_move_speed$field = value;
		}

		public function get changePosMoveSpeed():Int64 {
			return change_pos_move_speed$field;
		}

		/**
		 *  @private
		 */
		public static const TAKE_ZHAN_CHE_DISTANCE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.take_zhan_che_distance", "takeZhanCheDistance", (49 << 3) | com.netease.protobuf.WireType.VARINT);

		private var take_zhan_che_distance$field:int;

		public function clearTakeZhanCheDistance():void {
			hasField$0 &= 0xfffffdff;
			take_zhan_che_distance$field = new int();
		}

		public function get hasTakeZhanCheDistance():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set takeZhanCheDistance(value:int):void {
			hasField$0 |= 0x200;
			take_zhan_che_distance$field = value;
		}

		public function get takeZhanCheDistance():int {
			return take_zhan_che_distance$field;
		}

		/**
		 *  @private
		 */
		public static const ZHAN_CHE_SEAT_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarMiscDataProto.zhan_che_seat_count", "zhanCheSeatCount", (50 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zhan_che_seat_count$field:int;

		public function clearZhanCheSeatCount():void {
			hasField$0 &= 0xfffffbff;
			zhan_che_seat_count$field = new int();
		}

		public function get hasZhanCheSeatCount():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set zhanCheSeatCount(value:int):void {
			hasField$0 |= 0x400;
			zhan_che_seat_count$field = value;
		}

		public function get zhanCheSeatCount():int {
			return zhan_che_seat_count$field;
		}

		/**
		 *  @private
		 */
		public static const CONTINUE_KILL_HERO_TIMES:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.CountryWarMiscDataProto.continue_kill_hero_times", "continueKillHeroTimes", (51 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var continueKillHeroTimes:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWarTimeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, war_time_data$field);
			}
			if (hasWarDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, war_duration$field);
			}
			if (hasRevengeTimeDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, revenge_time_duration$field);
			}
			if (hasRevengeWarStartDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, revenge_war_start_duration$field);
			}
			if (hasRevengeWarDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, revenge_war_duration$field);
			}
			if (hasStartWarDurationWhenServerStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, start_war_duration_when_server_start$field);
			}
			if (hasDeclareMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, declare_money_cost$field);
			}
			if (hasCanDeclareStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, canDeclareStartTime$field);
			}
			if (hasCanDeclareEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, canDeclareEndTime$field);
			}
			if (hasCanAdmireStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, canAdmireStartTime$field);
			}
			if (hasCanAdmireEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, canAdmireEndTime$field);
			}
			if (hasDeclareChangeStartTimeMillisOfDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, declareChangeStartTimeMillisOfDay$field);
			}
			if (hasStartBeforeMillisOfDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 25);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, startBeforeMillisOfDay$field);
			}
			if (hasStartAfterMillisOfDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 26);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, startAfterMillisOfDay$field);
			}
			if (hasCountryWarKillMonsterExpMuliple) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 27);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, countryWarKillMonsterExpMuliple$field);
			}
			if (hasJoinCountryWarCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 28);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, joinCountryWarCost$field);
			}
			if (hasAdmireSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 42);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, admire_scene_id$field);
			}
			if (hasWinCountryAdmireAddState) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 30);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, winCountryAdmireAddState$field);
			}
			if (hasLoseCountryAdmireGivePrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, loseCountryAdmireGivePrize$field);
			}
			if (hasValidHurtHeroDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 32);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, validHurtHeroDuration$field);
			}
			if (hasValidHurtNpcDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 33);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, validHurtNpcDuration$field);
			}
			if (hasAddPointNeedHurtNpcAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 34);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, addPointNeedHurtNpcAmount$field);
			}
			if (hasStayWarSceneDurationAddPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 35);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, stayWarSceneDurationAddPoint$field);
			}
			if (hasKillHeroAddPointCD) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 36);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, killHeroAddPointCD$field);
			}
			if (hasMinAdmireNeedPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 37);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, minAdmireNeedPoint$field);
			}
			for (var beenKilledContinueKillHeroTimes$index:uint = 0; beenKilledContinueKillHeroTimes$index < this.beenKilledContinueKillHeroTimes.length; ++beenKilledContinueKillHeroTimes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 38);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.beenKilledContinueKillHeroTimes[beenKilledContinueKillHeroTimes$index]);
			}
			if (hasWinnerCountryPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 39);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, winnerCountryPrize$field);
			}
			if (hasFailerCountryPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, failerCountryPrize$field);
			}
			if (hasMinGetCountryPrizeNeedPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 41);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, minGetCountryPrizeNeedPoint$field);
			}
			if (hasDefaultDefencerReliveSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 43);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, default_defencer_relive_scene_id$field);
			}
			if (hasDefaultAttackerReliveSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 44);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, default_attacker_relive_scene_id$field);
			}
			for (var warStartBlockAreas$index:uint = 0; warStartBlockAreas$index < this.warStartBlockAreas.length; ++warStartBlockAreas$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 45);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.warStartBlockAreas[warStartBlockAreas$index]);
			}
			if (hasDanMuCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 46);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, dan_mu_cd$field);
			}
			if (hasChangePosCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 47);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, change_pos_cd$field);
			}
			if (hasChangePosMoveSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 48);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, change_pos_move_speed$field);
			}
			if (hasTakeZhanCheDistance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 49);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, take_zhan_che_distance$field);
			}
			if (hasZhanCheSeatCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 50);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, zhan_che_seat_count$field);
			}
			for (var continueKillHeroTimes$index:uint = 0; continueKillHeroTimes$index < this.continueKillHeroTimes.length; ++continueKillHeroTimes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 51);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.continueKillHeroTimes[continueKillHeroTimes$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var war_time_data$count:uint = 0;
			var war_duration$count:uint = 0;
			var revenge_time_duration$count:uint = 0;
			var revenge_war_start_duration$count:uint = 0;
			var revenge_war_duration$count:uint = 0;
			var start_war_duration_when_server_start$count:uint = 0;
			var declare_money_cost$count:uint = 0;
			var canDeclareStartTime$count:uint = 0;
			var canDeclareEndTime$count:uint = 0;
			var canAdmireStartTime$count:uint = 0;
			var canAdmireEndTime$count:uint = 0;
			var declareChangeStartTimeMillisOfDay$count:uint = 0;
			var startBeforeMillisOfDay$count:uint = 0;
			var startAfterMillisOfDay$count:uint = 0;
			var countryWarKillMonsterExpMuliple$count:uint = 0;
			var joinCountryWarCost$count:uint = 0;
			var admire_scene_id$count:uint = 0;
			var winCountryAdmireAddState$count:uint = 0;
			var loseCountryAdmireGivePrize$count:uint = 0;
			var validHurtHeroDuration$count:uint = 0;
			var validHurtNpcDuration$count:uint = 0;
			var addPointNeedHurtNpcAmount$count:uint = 0;
			var stayWarSceneDurationAddPoint$count:uint = 0;
			var killHeroAddPointCD$count:uint = 0;
			var minAdmireNeedPoint$count:uint = 0;
			var winnerCountryPrize$count:uint = 0;
			var failerCountryPrize$count:uint = 0;
			var minGetCountryPrizeNeedPoint$count:uint = 0;
			var default_defencer_relive_scene_id$count:uint = 0;
			var default_attacker_relive_scene_id$count:uint = 0;
			var dan_mu_cd$count:uint = 0;
			var change_pos_cd$count:uint = 0;
			var change_pos_move_speed$count:uint = 0;
			var take_zhan_che_distance$count:uint = 0;
			var zhan_che_seat_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (war_time_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.warTimeData cannot be set twice.');
					}
					++war_time_data$count;
					this.warTimeData = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (war_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.warDuration cannot be set twice.');
					}
					++war_duration$count;
					this.warDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (revenge_time_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.revengeTimeDuration cannot be set twice.');
					}
					++revenge_time_duration$count;
					this.revengeTimeDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (revenge_war_start_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.revengeWarStartDuration cannot be set twice.');
					}
					++revenge_war_start_duration$count;
					this.revengeWarStartDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 7:
					if (revenge_war_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.revengeWarDuration cannot be set twice.');
					}
					++revenge_war_duration$count;
					this.revengeWarDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 8:
					if (start_war_duration_when_server_start$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.startWarDurationWhenServerStart cannot be set twice.');
					}
					++start_war_duration_when_server_start$count;
					this.startWarDurationWhenServerStart = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 14:
					if (declare_money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.declareMoneyCost cannot be set twice.');
					}
					++declare_money_cost$count;
					this.declareMoneyCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 20:
					if (canDeclareStartTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.canDeclareStartTime cannot be set twice.');
					}
					++canDeclareStartTime$count;
					this.canDeclareStartTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 21:
					if (canDeclareEndTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.canDeclareEndTime cannot be set twice.');
					}
					++canDeclareEndTime$count;
					this.canDeclareEndTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 22:
					if (canAdmireStartTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.canAdmireStartTime cannot be set twice.');
					}
					++canAdmireStartTime$count;
					this.canAdmireStartTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 23:
					if (canAdmireEndTime$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.canAdmireEndTime cannot be set twice.');
					}
					++canAdmireEndTime$count;
					this.canAdmireEndTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 24:
					if (declareChangeStartTimeMillisOfDay$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.declareChangeStartTimeMillisOfDay cannot be set twice.');
					}
					++declareChangeStartTimeMillisOfDay$count;
					this.declareChangeStartTimeMillisOfDay = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 25:
					if (startBeforeMillisOfDay$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.startBeforeMillisOfDay cannot be set twice.');
					}
					++startBeforeMillisOfDay$count;
					this.startBeforeMillisOfDay = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 26:
					if (startAfterMillisOfDay$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.startAfterMillisOfDay cannot be set twice.');
					}
					++startAfterMillisOfDay$count;
					this.startAfterMillisOfDay = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 27:
					if (countryWarKillMonsterExpMuliple$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.countryWarKillMonsterExpMuliple cannot be set twice.');
					}
					++countryWarKillMonsterExpMuliple$count;
					this.countryWarKillMonsterExpMuliple = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 28:
					if (joinCountryWarCost$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.joinCountryWarCost cannot be set twice.');
					}
					++joinCountryWarCost$count;
					this.joinCountryWarCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.joinCountryWarCost);
					break;
				case 42:
					if (admire_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.admireSceneId cannot be set twice.');
					}
					++admire_scene_id$count;
					this.admireSceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 30:
					if (winCountryAdmireAddState$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.winCountryAdmireAddState cannot be set twice.');
					}
					++winCountryAdmireAddState$count;
					this.winCountryAdmireAddState = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 31:
					if (loseCountryAdmireGivePrize$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.loseCountryAdmireGivePrize cannot be set twice.');
					}
					++loseCountryAdmireGivePrize$count;
					this.loseCountryAdmireGivePrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.loseCountryAdmireGivePrize);
					break;
				case 32:
					if (validHurtHeroDuration$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.validHurtHeroDuration cannot be set twice.');
					}
					++validHurtHeroDuration$count;
					this.validHurtHeroDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 33:
					if (validHurtNpcDuration$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.validHurtNpcDuration cannot be set twice.');
					}
					++validHurtNpcDuration$count;
					this.validHurtNpcDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 34:
					if (addPointNeedHurtNpcAmount$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.addPointNeedHurtNpcAmount cannot be set twice.');
					}
					++addPointNeedHurtNpcAmount$count;
					this.addPointNeedHurtNpcAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 35:
					if (stayWarSceneDurationAddPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.stayWarSceneDurationAddPoint cannot be set twice.');
					}
					++stayWarSceneDurationAddPoint$count;
					this.stayWarSceneDurationAddPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 36:
					if (killHeroAddPointCD$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.killHeroAddPointCD cannot be set twice.');
					}
					++killHeroAddPointCD$count;
					this.killHeroAddPointCD = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 37:
					if (minAdmireNeedPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.minAdmireNeedPoint cannot be set twice.');
					}
					++minAdmireNeedPoint$count;
					this.minAdmireNeedPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 38:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.beenKilledContinueKillHeroTimes);
						break;
					}
					this.beenKilledContinueKillHeroTimes.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				case 39:
					if (winnerCountryPrize$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.winnerCountryPrize cannot be set twice.');
					}
					++winnerCountryPrize$count;
					this.winnerCountryPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.winnerCountryPrize);
					break;
				case 40:
					if (failerCountryPrize$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.failerCountryPrize cannot be set twice.');
					}
					++failerCountryPrize$count;
					this.failerCountryPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.failerCountryPrize);
					break;
				case 41:
					if (minGetCountryPrizeNeedPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.minGetCountryPrizeNeedPoint cannot be set twice.');
					}
					++minGetCountryPrizeNeedPoint$count;
					this.minGetCountryPrizeNeedPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 43:
					if (default_defencer_relive_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.defaultDefencerReliveSceneId cannot be set twice.');
					}
					++default_defencer_relive_scene_id$count;
					this.defaultDefencerReliveSceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 44:
					if (default_attacker_relive_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.defaultAttackerReliveSceneId cannot be set twice.');
					}
					++default_attacker_relive_scene_id$count;
					this.defaultAttackerReliveSceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 45:
					this.warStartBlockAreas.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.AreaDataProto()));
					break;
				case 46:
					if (dan_mu_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.danMuCd cannot be set twice.');
					}
					++dan_mu_cd$count;
					this.danMuCd = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 47:
					if (change_pos_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.changePosCd cannot be set twice.');
					}
					++change_pos_cd$count;
					this.changePosCd = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 48:
					if (change_pos_move_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.changePosMoveSpeed cannot be set twice.');
					}
					++change_pos_move_speed$count;
					this.changePosMoveSpeed = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 49:
					if (take_zhan_che_distance$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.takeZhanCheDistance cannot be set twice.');
					}
					++take_zhan_che_distance$count;
					this.takeZhanCheDistance = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 50:
					if (zhan_che_seat_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarMiscDataProto.zhanCheSeatCount cannot be set twice.');
					}
					++zhan_che_seat_count$count;
					this.zhanCheSeatCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 51:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.continueKillHeroTimes);
						break;
					}
					this.continueKillHeroTimes.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
