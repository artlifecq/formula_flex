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
	public dynamic final class BiaoJuMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AUTO_START_TIME_IN_ONE_DAY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BiaoJuMiscDataProto.auto_start_time_in_one_day", "autoStartTimeInOneDay", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var auto_start_time_in_one_day$field:Int64;

		public function clearAutoStartTimeInOneDay():void {
			auto_start_time_in_one_day$field = null;
		}

		public function get hasAutoStartTimeInOneDay():Boolean {
			return auto_start_time_in_one_day$field != null;
		}

		public function set autoStartTimeInOneDay(value:Int64):void {
			auto_start_time_in_one_day$field = value;
		}

		public function get autoStartTimeInOneDay():Int64 {
			return auto_start_time_in_one_day$field;
		}

		/**
		 *  @private
		 */
		public static const DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BiaoJuMiscDataProto.duration", "duration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var duration$field:Int64;

		public function clearDuration():void {
			duration$field = null;
		}

		public function get hasDuration():Boolean {
			return duration$field != null;
		}

		public function set duration(value:Int64):void {
			duration$field = value;
		}

		public function get duration():Int64 {
			return duration$field;
		}

		/**
		 *  @private
		 */
		public static const MANUAL_START_TIME_IN_ONE_DAY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BiaoJuMiscDataProto.manual_start_time_in_one_day", "manualStartTimeInOneDay", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var manual_start_time_in_one_day$field:Int64;

		public function clearManualStartTimeInOneDay():void {
			manual_start_time_in_one_day$field = null;
		}

		public function get hasManualStartTimeInOneDay():Boolean {
			return manual_start_time_in_one_day$field != null;
		}

		public function set manualStartTimeInOneDay(value:Int64):void {
			manual_start_time_in_one_day$field = value;
		}

		public function get manualStartTimeInOneDay():Int64 {
			return manual_start_time_in_one_day$field;
		}

		/**
		 *  @private
		 */
		public static const MANUAL_START_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BiaoJuMiscDataProto.manual_start_duration", "manualStartDuration", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var manual_start_duration$field:Int64;

		public function clearManualStartDuration():void {
			manual_start_duration$field = null;
		}

		public function get hasManualStartDuration():Boolean {
			return manual_start_duration$field != null;
		}

		public function set manualStartDuration(value:Int64):void {
			manual_start_duration$field = value;
		}

		public function get manualStartDuration():Int64 {
			return manual_start_duration$field;
		}

		/**
		 *  @private
		 */
		public static const AUTO_RESET_TIME_IN_ONE_DAY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BiaoJuMiscDataProto.auto_reset_time_in_one_day", "autoResetTimeInOneDay", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var auto_reset_time_in_one_day$field:Int64;

		public function clearAutoResetTimeInOneDay():void {
			auto_reset_time_in_one_day$field = null;
		}

		public function get hasAutoResetTimeInOneDay():Boolean {
			return auto_reset_time_in_one_day$field != null;
		}

		public function set autoResetTimeInOneDay(value:Int64):void {
			auto_reset_time_in_one_day$field = value;
		}

		public function get autoResetTimeInOneDay():Int64 {
			return auto_reset_time_in_one_day$field;
		}

		/**
		 *  @private
		 */
		public static const START_MIN_AMOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoJuMiscDataProto.start_min_amount", "startMinAmount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_min_amount$field:int;

		private var hasField$0:uint = 0;

		public function clearStartMinAmount():void {
			hasField$0 &= 0xfffffffe;
			start_min_amount$field = new int();
		}

		public function get hasStartMinAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set startMinAmount(value:int):void {
			hasField$0 |= 0x1;
			start_min_amount$field = value;
		}

		public function get startMinAmount():int {
			return start_min_amount$field;
		}

		/**
		 *  @private
		 */
		public static const COMPENSATE_PER_DAY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BiaoJuMiscDataProto.compensate_per_day", "compensatePerDay", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var compensate_per_day$field:Int64;

		public function clearCompensatePerDay():void {
			compensate_per_day$field = null;
		}

		public function get hasCompensatePerDay():Boolean {
			return compensate_per_day$field != null;
		}

		public function set compensatePerDay(value:Int64):void {
			compensate_per_day$field = value;
		}

		public function get compensatePerDay():Int64 {
			return compensate_per_day$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_BAO_YA_JIN_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoJuMiscDataProto.tou_bao_ya_jin_percent", "touBaoYaJinPercent", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_bao_ya_jin_percent$field:int;

		public function clearTouBaoYaJinPercent():void {
			hasField$0 &= 0xfffffffd;
			tou_bao_ya_jin_percent$field = new int();
		}

		public function get hasTouBaoYaJinPercent():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set touBaoYaJinPercent(value:int):void {
			hasField$0 |= 0x2;
			tou_bao_ya_jin_percent$field = value;
		}

		public function get touBaoYaJinPercent():int {
			return tou_bao_ya_jin_percent$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_BAO_REPARATION_MULTIPLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoJuMiscDataProto.tou_bao_reparation_multiple", "touBaoReparationMultiple", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_bao_reparation_multiple$field:int;

		public function clearTouBaoReparationMultiple():void {
			hasField$0 &= 0xfffffffb;
			tou_bao_reparation_multiple$field = new int();
		}

		public function get hasTouBaoReparationMultiple():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set touBaoReparationMultiple(value:int):void {
			hasField$0 |= 0x4;
			tou_bao_reparation_multiple$field = value;
		}

		public function get touBaoReparationMultiple():int {
			return tou_bao_reparation_multiple$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_BAO_SYSTEM_REPARATION_MULTIPLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoJuMiscDataProto.tou_bao_system_reparation_multiple", "touBaoSystemReparationMultiple", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_bao_system_reparation_multiple$field:int;

		public function clearTouBaoSystemReparationMultiple():void {
			hasField$0 &= 0xfffffff7;
			tou_bao_system_reparation_multiple$field = new int();
		}

		public function get hasTouBaoSystemReparationMultiple():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set touBaoSystemReparationMultiple(value:int):void {
			hasField$0 |= 0x8;
			tou_bao_system_reparation_multiple$field = value;
		}

		public function get touBaoSystemReparationMultiple():int {
			return tou_bao_system_reparation_multiple$field;
		}

		/**
		 *  @private
		 */
		public static const AUTO_STOP_MIN_MONEY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoJuMiscDataProto.auto_stop_min_money", "autoStopMinMoney", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var auto_stop_min_money$field:int;

		public function clearAutoStopMinMoney():void {
			hasField$0 &= 0xffffffef;
			auto_stop_min_money$field = new int();
		}

		public function get hasAutoStopMinMoney():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set autoStopMinMoney(value:int):void {
			hasField$0 |= 0x10;
			auto_stop_min_money$field = value;
		}

		public function get autoStopMinMoney():int {
			return auto_stop_min_money$field;
		}

		/**
		 *  @private
		 */
		public static const MANUAL_STOP_NEED_START_DURATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoJuMiscDataProto.manual_stop_need_start_duration", "manualStopNeedStartDuration", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var manual_stop_need_start_duration$field:int;

		public function clearManualStopNeedStartDuration():void {
			hasField$0 &= 0xffffffdf;
			manual_stop_need_start_duration$field = new int();
		}

		public function get hasManualStopNeedStartDuration():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set manualStopNeedStartDuration(value:int):void {
			hasField$0 |= 0x20;
			manual_stop_need_start_duration$field = value;
		}

		public function get manualStopNeedStartDuration():int {
			return manual_stop_need_start_duration$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_BAO_BIAO_EXP_ADDITIONAL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoJuMiscDataProto.tou_bao_biao_exp_additional", "touBaoBiaoExpAdditional", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_bao_biao_exp_additional$field:int;

		public function clearTouBaoBiaoExpAdditional():void {
			hasField$0 &= 0xffffffbf;
			tou_bao_biao_exp_additional$field = new int();
		}

		public function get hasTouBaoBiaoExpAdditional():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set touBaoBiaoExpAdditional(value:int):void {
			hasField$0 |= 0x40;
			tou_bao_biao_exp_additional$field = value;
		}

		public function get touBaoBiaoExpAdditional():int {
			return tou_bao_biao_exp_additional$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAutoStartTimeInOneDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, auto_start_time_in_one_day$field);
			}
			if (hasDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, duration$field);
			}
			if (hasManualStartTimeInOneDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, manual_start_time_in_one_day$field);
			}
			if (hasManualStartDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, manual_start_duration$field);
			}
			if (hasAutoResetTimeInOneDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, auto_reset_time_in_one_day$field);
			}
			if (hasStartMinAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, start_min_amount$field);
			}
			if (hasCompensatePerDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, compensate_per_day$field);
			}
			if (hasTouBaoYaJinPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tou_bao_ya_jin_percent$field);
			}
			if (hasTouBaoReparationMultiple) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tou_bao_reparation_multiple$field);
			}
			if (hasTouBaoSystemReparationMultiple) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tou_bao_system_reparation_multiple$field);
			}
			if (hasAutoStopMinMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, auto_stop_min_money$field);
			}
			if (hasManualStopNeedStartDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, manual_stop_need_start_duration$field);
			}
			if (hasTouBaoBiaoExpAdditional) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tou_bao_biao_exp_additional$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var auto_start_time_in_one_day$count:uint = 0;
			var duration$count:uint = 0;
			var manual_start_time_in_one_day$count:uint = 0;
			var manual_start_duration$count:uint = 0;
			var auto_reset_time_in_one_day$count:uint = 0;
			var start_min_amount$count:uint = 0;
			var compensate_per_day$count:uint = 0;
			var tou_bao_ya_jin_percent$count:uint = 0;
			var tou_bao_reparation_multiple$count:uint = 0;
			var tou_bao_system_reparation_multiple$count:uint = 0;
			var auto_stop_min_money$count:uint = 0;
			var manual_stop_need_start_duration$count:uint = 0;
			var tou_bao_biao_exp_additional$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (auto_start_time_in_one_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.autoStartTimeInOneDay cannot be set twice.');
					}
					++auto_start_time_in_one_day$count;
					this.autoStartTimeInOneDay = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.duration cannot be set twice.');
					}
					++duration$count;
					this.duration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (manual_start_time_in_one_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.manualStartTimeInOneDay cannot be set twice.');
					}
					++manual_start_time_in_one_day$count;
					this.manualStartTimeInOneDay = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (manual_start_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.manualStartDuration cannot be set twice.');
					}
					++manual_start_duration$count;
					this.manualStartDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (auto_reset_time_in_one_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.autoResetTimeInOneDay cannot be set twice.');
					}
					++auto_reset_time_in_one_day$count;
					this.autoResetTimeInOneDay = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (start_min_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.startMinAmount cannot be set twice.');
					}
					++start_min_amount$count;
					this.startMinAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (compensate_per_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.compensatePerDay cannot be set twice.');
					}
					++compensate_per_day$count;
					this.compensatePerDay = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 8:
					if (tou_bao_ya_jin_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.touBaoYaJinPercent cannot be set twice.');
					}
					++tou_bao_ya_jin_percent$count;
					this.touBaoYaJinPercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (tou_bao_reparation_multiple$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.touBaoReparationMultiple cannot be set twice.');
					}
					++tou_bao_reparation_multiple$count;
					this.touBaoReparationMultiple = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (tou_bao_system_reparation_multiple$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.touBaoSystemReparationMultiple cannot be set twice.');
					}
					++tou_bao_system_reparation_multiple$count;
					this.touBaoSystemReparationMultiple = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (auto_stop_min_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.autoStopMinMoney cannot be set twice.');
					}
					++auto_stop_min_money$count;
					this.autoStopMinMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (manual_stop_need_start_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.manualStopNeedStartDuration cannot be set twice.');
					}
					++manual_stop_need_start_duration$count;
					this.manualStopNeedStartDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 13:
					if (tou_bao_biao_exp_additional$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuMiscDataProto.touBaoBiaoExpAdditional cannot be set twice.');
					}
					++tou_bao_biao_exp_additional$count;
					this.touBaoBiaoExpAdditional = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
