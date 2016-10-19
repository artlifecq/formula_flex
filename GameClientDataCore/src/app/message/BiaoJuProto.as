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
	public dynamic final class BiaoJuProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BiaoJuProto.country", "country", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		private var hasField$0:uint = 0;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffe;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x1;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.total_money", "totalMoney", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_money$field:Int64;

		public function clearTotalMoney():void {
			total_money$field = null;
		}

		public function get hasTotalMoney():Boolean {
			return total_money$field != null;
		}

		public function set totalMoney(value:Int64):void {
			total_money$field = value;
		}

		public function get totalMoney():Int64 {
			return total_money$field;
		}

		/**
		 *  @private
		 */
		public static const TODAY_PROFIT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.today_profit", "todayProfit", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_profit$field:Int64;

		public function clearTodayProfit():void {
			today_profit$field = null;
		}

		public function get hasTodayProfit():Boolean {
			return today_profit$field != null;
		}

		public function set todayProfit(value:Int64):void {
			today_profit$field = value;
		}

		public function get todayProfit():Int64 {
			return today_profit$field;
		}

		/**
		 *  @private
		 */
		public static const PROFIT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.profit", "profit", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var profit$field:Int64;

		public function clearProfit():void {
			profit$field = null;
		}

		public function get hasProfit():Boolean {
			return profit$field != null;
		}

		public function set profit(value:Int64):void {
			profit$field = value;
		}

		public function get profit():Int64 {
			return profit$field;
		}

		/**
		 *  @private
		 */
		public static const REPARATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.reparation", "reparation", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var reparation$field:Int64;

		public function clearReparation():void {
			reparation$field = null;
		}

		public function get hasReparation():Boolean {
			return reparation$field != null;
		}

		public function set reparation(value:Int64):void {
			reparation$field = value;
		}

		public function get reparation():Int64 {
			return reparation$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_BAO_BIAO_NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BiaoJuProto.tou_bao_biao_num", "touBaoBiaoNum", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_bao_biao_num$field:int;

		public function clearTouBaoBiaoNum():void {
			hasField$0 &= 0xfffffffd;
			tou_bao_biao_num$field = new int();
		}

		public function get hasTouBaoBiaoNum():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set touBaoBiaoNum(value:int):void {
			hasField$0 |= 0x2;
			tou_bao_biao_num$field = value;
		}

		public function get touBaoBiaoNum():int {
			return tou_bao_biao_num$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_BAO_PREPARE_MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.tou_bao_prepare_money", "touBaoPrepareMoney", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_bao_prepare_money$field:Int64;

		public function clearTouBaoPrepareMoney():void {
			tou_bao_prepare_money$field = null;
		}

		public function get hasTouBaoPrepareMoney():Boolean {
			return tou_bao_prepare_money$field != null;
		}

		public function set touBaoPrepareMoney(value:Int64):void {
			tou_bao_prepare_money$field = value;
		}

		public function get touBaoPrepareMoney():Int64 {
			return tou_bao_prepare_money$field;
		}

		/**
		 *  @private
		 */
		public static const LEFT_SYSTEM_COMPENSATE_MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.left_system_compensate_money", "leftSystemCompensateMoney", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var left_system_compensate_money$field:Int64;

		public function clearLeftSystemCompensateMoney():void {
			left_system_compensate_money$field = null;
		}

		public function get hasLeftSystemCompensateMoney():Boolean {
			return left_system_compensate_money$field != null;
		}

		public function set leftSystemCompensateMoney(value:Int64):void {
			left_system_compensate_money$field = value;
		}

		public function get leftSystemCompensateMoney():Int64 {
			return left_system_compensate_money$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_HU_BIAO_SUCCESS_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BiaoJuProto.total_hu_biao_success_times", "totalHuBiaoSuccessTimes", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_hu_biao_success_times$field:int;

		public function clearTotalHuBiaoSuccessTimes():void {
			hasField$0 &= 0xfffffffb;
			total_hu_biao_success_times$field = new int();
		}

		public function get hasTotalHuBiaoSuccessTimes():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set totalHuBiaoSuccessTimes(value:int):void {
			hasField$0 |= 0x4;
			total_hu_biao_success_times$field = value;
		}

		public function get totalHuBiaoSuccessTimes():int {
			return total_hu_biao_success_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_TOU_BIAO_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BiaoJuProto.total_tou_biao_times", "totalTouBiaoTimes", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_tou_biao_times$field:int;

		public function clearTotalTouBiaoTimes():void {
			hasField$0 &= 0xfffffff7;
			total_tou_biao_times$field = new int();
		}

		public function get hasTotalTouBiaoTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set totalTouBiaoTimes(value:int):void {
			hasField$0 |= 0x8;
			total_tou_biao_times$field = value;
		}

		public function get totalTouBiaoTimes():int {
			return total_tou_biao_times$field;
		}

		/**
		 *  @private
		 */
		public static const IS_MANUAL_STOP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.BiaoJuProto.is_manual_stop", "isManualStop", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_manual_stop$field:Boolean;

		public function clearIsManualStop():void {
			hasField$0 &= 0xffffffef;
			is_manual_stop$field = new Boolean();
		}

		public function get hasIsManualStop():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isManualStop(value:Boolean):void {
			hasField$0 |= 0x10;
			is_manual_stop$field = value;
		}

		public function get isManualStop():Boolean {
			return is_manual_stop$field;
		}

		/**
		 *  @private
		 */
		public static const TODAY_ALLOCATE_SALARY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.BiaoJuProto.today_allocate_salary", "todayAllocateSalary", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_allocate_salary$field:Boolean;

		public function clearTodayAllocateSalary():void {
			hasField$0 &= 0xffffffdf;
			today_allocate_salary$field = new Boolean();
		}

		public function get hasTodayAllocateSalary():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set todayAllocateSalary(value:Boolean):void {
			hasField$0 |= 0x20;
			today_allocate_salary$field = value;
		}

		public function get todayAllocateSalary():Boolean {
			return today_allocate_salary$field;
		}

		/**
		 *  @private
		 */
		public static const ACCUM_RECHARGE_MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.accum_recharge_money", "accumRechargeMoney", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accum_recharge_money$field:Int64;

		public function clearAccumRechargeMoney():void {
			accum_recharge_money$field = null;
		}

		public function get hasAccumRechargeMoney():Boolean {
			return accum_recharge_money$field != null;
		}

		public function set accumRechargeMoney(value:Int64):void {
			accum_recharge_money$field = value;
		}

		public function get accumRechargeMoney():Int64 {
			return accum_recharge_money$field;
		}

		/**
		 *  @private
		 */
		public static const ACCUM_SALARY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.accum_salary", "accumSalary", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accum_salary$field:Int64;

		public function clearAccumSalary():void {
			accum_salary$field = null;
		}

		public function get hasAccumSalary():Boolean {
			return accum_salary$field != null;
		}

		public function set accumSalary(value:Int64):void {
			accum_salary$field = value;
		}

		public function get accumSalary():Int64 {
			return accum_salary$field;
		}

		/**
		 *  @private
		 */
		public static const ACCUM_REPARATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.accum_reparation", "accumReparation", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accum_reparation$field:Int64;

		public function clearAccumReparation():void {
			accum_reparation$field = null;
		}

		public function get hasAccumReparation():Boolean {
			return accum_reparation$field != null;
		}

		public function set accumReparation(value:Int64):void {
			accum_reparation$field = value;
		}

		public function get accumReparation():Int64 {
			return accum_reparation$field;
		}

		/**
		 *  @private
		 */
		public static const ACCUM_HU_BIAO_SUCCESS_TIMES:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.accum_hu_biao_success_times", "accumHuBiaoSuccessTimes", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accum_hu_biao_success_times$field:Int64;

		public function clearAccumHuBiaoSuccessTimes():void {
			accum_hu_biao_success_times$field = null;
		}

		public function get hasAccumHuBiaoSuccessTimes():Boolean {
			return accum_hu_biao_success_times$field != null;
		}

		public function set accumHuBiaoSuccessTimes(value:Int64):void {
			accum_hu_biao_success_times$field = value;
		}

		public function get accumHuBiaoSuccessTimes():Int64 {
			return accum_hu_biao_success_times$field;
		}

		/**
		 *  @private
		 */
		public static const ACCUM_TOU_BIAO_TIMES:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuProto.accum_tou_biao_times", "accumTouBiaoTimes", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accum_tou_biao_times$field:Int64;

		public function clearAccumTouBiaoTimes():void {
			accum_tou_biao_times$field = null;
		}

		public function get hasAccumTouBiaoTimes():Boolean {
			return accum_tou_biao_times$field != null;
		}

		public function set accumTouBiaoTimes(value:Int64):void {
			accum_tou_biao_times$field = value;
		}

		public function get accumTouBiaoTimes():Int64 {
			return accum_tou_biao_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			if (hasTotalMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, total_money$field);
			}
			if (hasTodayProfit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, today_profit$field);
			}
			if (hasProfit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, profit$field);
			}
			if (hasReparation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, reparation$field);
			}
			if (hasTouBaoBiaoNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tou_bao_biao_num$field);
			}
			if (hasTouBaoPrepareMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, tou_bao_prepare_money$field);
			}
			if (hasLeftSystemCompensateMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, left_system_compensate_money$field);
			}
			if (hasTotalHuBiaoSuccessTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, total_hu_biao_success_times$field);
			}
			if (hasTotalTouBiaoTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, total_tou_biao_times$field);
			}
			if (hasIsManualStop) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_manual_stop$field);
			}
			if (hasTodayAllocateSalary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, today_allocate_salary$field);
			}
			if (hasAccumRechargeMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, accum_recharge_money$field);
			}
			if (hasAccumSalary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, accum_salary$field);
			}
			if (hasAccumReparation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, accum_reparation$field);
			}
			if (hasAccumHuBiaoSuccessTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, accum_hu_biao_success_times$field);
			}
			if (hasAccumTouBiaoTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, accum_tou_biao_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var country$count:uint = 0;
			var total_money$count:uint = 0;
			var today_profit$count:uint = 0;
			var profit$count:uint = 0;
			var reparation$count:uint = 0;
			var tou_bao_biao_num$count:uint = 0;
			var tou_bao_prepare_money$count:uint = 0;
			var left_system_compensate_money$count:uint = 0;
			var total_hu_biao_success_times$count:uint = 0;
			var total_tou_biao_times$count:uint = 0;
			var is_manual_stop$count:uint = 0;
			var today_allocate_salary$count:uint = 0;
			var accum_recharge_money$count:uint = 0;
			var accum_salary$count:uint = 0;
			var accum_reparation$count:uint = 0;
			var accum_hu_biao_success_times$count:uint = 0;
			var accum_tou_biao_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (total_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.totalMoney cannot be set twice.');
					}
					++total_money$count;
					this.totalMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (today_profit$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.todayProfit cannot be set twice.');
					}
					++today_profit$count;
					this.todayProfit = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (profit$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.profit cannot be set twice.');
					}
					++profit$count;
					this.profit = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 5:
					if (reparation$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.reparation cannot be set twice.');
					}
					++reparation$count;
					this.reparation = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (tou_bao_biao_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.touBaoBiaoNum cannot be set twice.');
					}
					++tou_bao_biao_num$count;
					this.touBaoBiaoNum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (tou_bao_prepare_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.touBaoPrepareMoney cannot be set twice.');
					}
					++tou_bao_prepare_money$count;
					this.touBaoPrepareMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 8:
					if (left_system_compensate_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.leftSystemCompensateMoney cannot be set twice.');
					}
					++left_system_compensate_money$count;
					this.leftSystemCompensateMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 9:
					if (total_hu_biao_success_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.totalHuBiaoSuccessTimes cannot be set twice.');
					}
					++total_hu_biao_success_times$count;
					this.totalHuBiaoSuccessTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (total_tou_biao_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.totalTouBiaoTimes cannot be set twice.');
					}
					++total_tou_biao_times$count;
					this.totalTouBiaoTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (is_manual_stop$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.isManualStop cannot be set twice.');
					}
					++is_manual_stop$count;
					this.isManualStop = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 12:
					if (today_allocate_salary$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.todayAllocateSalary cannot be set twice.');
					}
					++today_allocate_salary$count;
					this.todayAllocateSalary = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 20:
					if (accum_recharge_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.accumRechargeMoney cannot be set twice.');
					}
					++accum_recharge_money$count;
					this.accumRechargeMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 21:
					if (accum_salary$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.accumSalary cannot be set twice.');
					}
					++accum_salary$count;
					this.accumSalary = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 22:
					if (accum_reparation$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.accumReparation cannot be set twice.');
					}
					++accum_reparation$count;
					this.accumReparation = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 23:
					if (accum_hu_biao_success_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.accumHuBiaoSuccessTimes cannot be set twice.');
					}
					++accum_hu_biao_success_times$count;
					this.accumHuBiaoSuccessTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 24:
					if (accum_tou_biao_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuProto.accumTouBiaoTimes cannot be set twice.');
					}
					++accum_tou_biao_times$count;
					this.accumTouBiaoTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
