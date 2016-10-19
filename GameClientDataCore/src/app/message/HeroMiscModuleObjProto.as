package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ClientConfigsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HeroMiscModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const JINZI:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.jinzi", "jinzi", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jinzi$field:Int64;

		public function clearJinzi():void {
			jinzi$field = null;
		}

		public function get hasJinzi():Boolean {
			return jinzi$field != null;
		}

		public function set jinzi(value:Int64):void {
			jinzi$field = value;
		}

		public function get jinzi():Int64 {
			return jinzi$field;
		}

		/**
		 *  @private
		 */
		public static const BAND_JINZI:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.band_jinzi", "bandJinzi", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var band_jinzi$field:Int64;

		public function clearBandJinzi():void {
			band_jinzi$field = null;
		}

		public function get hasBandJinzi():Boolean {
			return band_jinzi$field != null;
		}

		public function set bandJinzi(value:Int64):void {
			band_jinzi$field = value;
		}

		public function get bandJinzi():Int64 {
			return band_jinzi$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.money", "money", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:Int64;

		public function clearMoney():void {
			money$field = null;
		}

		public function get hasMoney():Boolean {
			return money$field != null;
		}

		public function set money(value:Int64):void {
			money$field = value;
		}

		public function get money():Int64 {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const BAND_MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.band_money", "bandMoney", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var band_money$field:Int64;

		public function clearBandMoney():void {
			band_money$field = null;
		}

		public function get hasBandMoney():Boolean {
			return band_money$field != null;
		}

		public function set bandMoney(value:Int64):void {
			band_money$field = value;
		}

		public function get bandMoney():Int64 {
			return band_money$field;
		}

		/**
		 *  @private
		 */
		public static const HONOR:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.honor", "honor", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var honor$field:Int64;

		public function clearHonor():void {
			honor$field = null;
		}

		public function get hasHonor():Boolean {
			return honor$field != null;
		}

		public function set honor(value:Int64):void {
			honor$field = value;
		}

		public function get honor():Int64 {
			return honor$field;
		}

		/**
		 *  @private
		 */
		public static const GONG_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.gong_xun", "gongXun", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gong_xun$field:Int64;

		public function clearGongXun():void {
			gong_xun$field = null;
		}

		public function get hasGongXun():Boolean {
			return gong_xun$field != null;
		}

		public function set gongXun(value:Int64):void {
			gong_xun$field = value;
		}

		public function get gongXun():Int64 {
			return gong_xun$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_CONFIGS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroMiscModuleObjProto.client_configs", "clientConfigs", (200 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ClientConfigsProto; });

		private var client_configs$field:app.message.ClientConfigsProto;

		public function clearClientConfigs():void {
			client_configs$field = null;
		}

		public function get hasClientConfigs():Boolean {
			return client_configs$field != null;
		}

		public function set clientConfigs(value:app.message.ClientConfigsProto):void {
			client_configs$field = value;
		}

		public function get clientConfigs():app.message.ClientConfigsProto {
			return client_configs$field;
		}

		/**
		 *  @private
		 */
		public static const FUNC_BITS:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.func_bits", "funcBits", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var func_bits$field:Int64;

		public function clearFuncBits():void {
			func_bits$field = null;
		}

		public function get hasFuncBits():Boolean {
			return func_bits$field != null;
		}

		public function set funcBits(value:Int64):void {
			func_bits$field = value;
		}

		public function get funcBits():Int64 {
			return func_bits$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_FUNC_BITS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.HeroMiscModuleObjProto.client_func_bits", "clientFuncBits", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client_func_bits$field:int;

		private var hasField$0:uint = 0;

		public function clearClientFuncBits():void {
			hasField$0 &= 0xfffffffe;
			client_func_bits$field = new int();
		}

		public function get hasClientFuncBits():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clientFuncBits(value:int):void {
			hasField$0 |= 0x1;
			client_func_bits$field = value;
		}

		public function get clientFuncBits():int {
			return client_func_bits$field;
		}

		/**
		 *  @private
		 */
		public static const NEXT_CAN_CHANGE_NAME_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.next_can_change_name_time", "nextCanChangeNameTime", (35 << 3) | com.netease.protobuf.WireType.VARINT);

		private var next_can_change_name_time$field:Int64;

		public function clearNextCanChangeNameTime():void {
			next_can_change_name_time$field = null;
		}

		public function get hasNextCanChangeNameTime():Boolean {
			return next_can_change_name_time$field != null;
		}

		public function set nextCanChangeNameTime(value:Int64):void {
			next_can_change_name_time$field = value;
		}

		public function get nextCanChangeNameTime():Int64 {
			return next_can_change_name_time$field;
		}

		/**
		 *  @private
		 */
		public static const LOGIN_DAY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.HeroMiscModuleObjProto.login_day", "loginDay", (25 << 3) | com.netease.protobuf.WireType.VARINT);

		private var login_day$field:int;

		public function clearLoginDay():void {
			hasField$0 &= 0xfffffffd;
			login_day$field = new int();
		}

		public function get hasLoginDay():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set loginDay(value:int):void {
			hasField$0 |= 0x2;
			login_day$field = value;
		}

		public function get loginDay():int {
			return login_day$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_LOGOUT_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.last_logout_time", "lastLogoutTime", (26 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_logout_time$field:Int64;

		public function clearLastLogoutTime():void {
			last_logout_time$field = null;
		}

		public function get hasLastLogoutTime():Boolean {
			return last_logout_time$field != null;
		}

		public function set lastLogoutTime(value:Int64):void {
			last_logout_time$field = value;
		}

		public function get lastLogoutTime():Int64 {
			return last_logout_time$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ONLINE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.total_online_time", "totalOnlineTime", (27 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_online_time$field:Int64;

		public function clearTotalOnlineTime():void {
			total_online_time$field = null;
		}

		public function get hasTotalOnlineTime():Boolean {
			return total_online_time$field != null;
		}

		public function set totalOnlineTime(value:Int64):void {
			total_online_time$field = value;
		}

		public function get totalOnlineTime():Int64 {
			return total_online_time$field;
		}

		/**
		 *  @private
		 */
		public static const DAILY_ONLINE_ACC_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.daily_online_acc_time", "dailyOnlineAccTime", (28 << 3) | com.netease.protobuf.WireType.VARINT);

		private var daily_online_acc_time$field:Int64;

		public function clearDailyOnlineAccTime():void {
			daily_online_acc_time$field = null;
		}

		public function get hasDailyOnlineAccTime():Boolean {
			return daily_online_acc_time$field != null;
		}

		public function set dailyOnlineAccTime(value:Int64):void {
			daily_online_acc_time$field = value;
		}

		public function get dailyOnlineAccTime():Int64 {
			return daily_online_acc_time$field;
		}

		/**
		 *  @private
		 */
		public static const ACCUMULATED_OFFLINE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.accumulated_offline_time", "accumulatedOfflineTime", (29 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accumulated_offline_time$field:Int64;

		public function clearAccumulatedOfflineTime():void {
			accumulated_offline_time$field = null;
		}

		public function get hasAccumulatedOfflineTime():Boolean {
			return accumulated_offline_time$field != null;
		}

		public function set accumulatedOfflineTime(value:Int64):void {
			accumulated_offline_time$field = value;
		}

		public function get accumulatedOfflineTime():Int64 {
			return accumulated_offline_time$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_RECHARGE_JINZI:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroMiscModuleObjProto.total_recharge_jinzi", "totalRechargeJinzi", (30 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_recharge_jinzi$field:Int64;

		public function clearTotalRechargeJinzi():void {
			total_recharge_jinzi$field = null;
		}

		public function get hasTotalRechargeJinzi():Boolean {
			return total_recharge_jinzi$field != null;
		}

		public function set totalRechargeJinzi(value:Int64):void {
			total_recharge_jinzi$field = value;
		}

		public function get totalRechargeJinzi():Int64 {
			return total_recharge_jinzi$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_RECHARGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.HeroMiscModuleObjProto.has_recharge", "hasRecharge", (31 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_recharge$field:Boolean;

		public function clearHasRecharge():void {
			hasField$0 &= 0xfffffffb;
			has_recharge$field = new Boolean();
		}

		public function get hasHasRecharge():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set hasRecharge(value:Boolean):void {
			hasField$0 |= 0x4;
			has_recharge$field = value;
		}

		public function get hasRecharge():Boolean {
			return has_recharge$field;
		}

		/**
		 *  @private
		 */
		public static const IS_CM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.HeroMiscModuleObjProto.is_cm", "isCm", (36 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_cm$field:Boolean;

		public function clearIsCm():void {
			hasField$0 &= 0xfffffff7;
			is_cm$field = new Boolean();
		}

		public function get hasIsCm():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isCm(value:Boolean):void {
			hasField$0 |= 0x8;
			is_cm$field = value;
		}

		public function get isCm():Boolean {
			return is_cm$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasJinzi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, jinzi$field);
			}
			if (hasBandJinzi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, band_jinzi$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, money$field);
			}
			if (hasBandMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, band_money$field);
			}
			if (hasHonor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, honor$field);
			}
			if (hasGongXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, gong_xun$field);
			}
			if (hasClientConfigs) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 200);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, client_configs$field);
			}
			if (hasFuncBits) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, func_bits$field);
			}
			if (hasClientFuncBits) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, client_func_bits$field);
			}
			if (hasNextCanChangeNameTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 35);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, next_can_change_name_time$field);
			}
			if (hasLoginDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, login_day$field);
			}
			if (hasLastLogoutTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, last_logout_time$field);
			}
			if (hasTotalOnlineTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, total_online_time$field);
			}
			if (hasDailyOnlineAccTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, daily_online_acc_time$field);
			}
			if (hasAccumulatedOfflineTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 29);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, accumulated_offline_time$field);
			}
			if (hasTotalRechargeJinzi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, total_recharge_jinzi$field);
			}
			if (hasHasRecharge) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, has_recharge$field);
			}
			if (hasIsCm) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 36);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_cm$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var jinzi$count:uint = 0;
			var band_jinzi$count:uint = 0;
			var money$count:uint = 0;
			var band_money$count:uint = 0;
			var honor$count:uint = 0;
			var gong_xun$count:uint = 0;
			var client_configs$count:uint = 0;
			var func_bits$count:uint = 0;
			var client_func_bits$count:uint = 0;
			var next_can_change_name_time$count:uint = 0;
			var login_day$count:uint = 0;
			var last_logout_time$count:uint = 0;
			var total_online_time$count:uint = 0;
			var daily_online_acc_time$count:uint = 0;
			var accumulated_offline_time$count:uint = 0;
			var total_recharge_jinzi$count:uint = 0;
			var has_recharge$count:uint = 0;
			var is_cm$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (jinzi$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.jinzi cannot be set twice.');
					}
					++jinzi$count;
					this.jinzi = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (band_jinzi$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.bandJinzi cannot be set twice.');
					}
					++band_jinzi$count;
					this.bandJinzi = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (band_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.bandMoney cannot be set twice.');
					}
					++band_money$count;
					this.bandMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 5:
					if (honor$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.honor cannot be set twice.');
					}
					++honor$count;
					this.honor = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (gong_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.gongXun cannot be set twice.');
					}
					++gong_xun$count;
					this.gongXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 200:
					if (client_configs$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.clientConfigs cannot be set twice.');
					}
					++client_configs$count;
					this.clientConfigs = new app.message.ClientConfigsProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.clientConfigs);
					break;
				case 20:
					if (func_bits$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.funcBits cannot be set twice.');
					}
					++func_bits$count;
					this.funcBits = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 21:
					if (client_func_bits$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.clientFuncBits cannot be set twice.');
					}
					++client_func_bits$count;
					this.clientFuncBits = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 35:
					if (next_can_change_name_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.nextCanChangeNameTime cannot be set twice.');
					}
					++next_can_change_name_time$count;
					this.nextCanChangeNameTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 25:
					if (login_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.loginDay cannot be set twice.');
					}
					++login_day$count;
					this.loginDay = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 26:
					if (last_logout_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.lastLogoutTime cannot be set twice.');
					}
					++last_logout_time$count;
					this.lastLogoutTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 27:
					if (total_online_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.totalOnlineTime cannot be set twice.');
					}
					++total_online_time$count;
					this.totalOnlineTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 28:
					if (daily_online_acc_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.dailyOnlineAccTime cannot be set twice.');
					}
					++daily_online_acc_time$count;
					this.dailyOnlineAccTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 29:
					if (accumulated_offline_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.accumulatedOfflineTime cannot be set twice.');
					}
					++accumulated_offline_time$count;
					this.accumulatedOfflineTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 30:
					if (total_recharge_jinzi$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.totalRechargeJinzi cannot be set twice.');
					}
					++total_recharge_jinzi$count;
					this.totalRechargeJinzi = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 31:
					if (has_recharge$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.hasRecharge cannot be set twice.');
					}
					++has_recharge$count;
					this.hasRecharge = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 36:
					if (is_cm$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroMiscModuleObjProto.isCm cannot be set twice.');
					}
					++is_cm$count;
					this.isCm = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
