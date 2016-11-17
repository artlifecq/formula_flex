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
	public dynamic final class PersonalBiaoMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAN_ACESS_PER_DAY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.can_acess_per_day", "canAcessPerDay", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_acess_per_day$field:int;

		private var hasField$0:uint = 0;

		public function clearCanAcessPerDay():void {
			hasField$0 &= 0xfffffffe;
			can_acess_per_day$field = new int();
		}

		public function get hasCanAcessPerDay():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set canAcessPerDay(value:int):void {
			hasField$0 |= 0x1;
			can_acess_per_day$field = value;
		}

		public function get canAcessPerDay():int {
			return can_acess_per_day$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_ADD_BIAO_TIMES_PER_DAY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.can_add_biao_times_per_day", "canAddBiaoTimesPerDay", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_add_biao_times_per_day$field:int;

		public function clearCanAddBiaoTimesPerDay():void {
			hasField$0 &= 0xfffffffd;
			can_add_biao_times_per_day$field = new int();
		}

		public function get hasCanAddBiaoTimesPerDay():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set canAddBiaoTimesPerDay(value:int):void {
			hasField$0 |= 0x2;
			can_add_biao_times_per_day$field = value;
		}

		public function get canAddBiaoTimesPerDay():int {
			return can_add_biao_times_per_day$field;
		}

		/**
		 *  @private
		 */
		public static const DESTROY_ACCUM_MAX_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.destroy_accum_max_times", "destroyAccumMaxTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var destroy_accum_max_times$field:int;

		public function clearDestroyAccumMaxTimes():void {
			hasField$0 &= 0xfffffffb;
			destroy_accum_max_times$field = new int();
		}

		public function get hasDestroyAccumMaxTimes():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set destroyAccumMaxTimes(value:int):void {
			hasField$0 |= 0x4;
			destroy_accum_max_times$field = value;
		}

		public function get destroyAccumMaxTimes():int {
			return destroy_accum_max_times$field;
		}

		/**
		 *  @private
		 */
		public static const BIAO_EXPIRE_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.PersonalBiaoMiscDataProto.biao_expire_duration", "biaoExpireDuration", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var biao_expire_duration$field:Int64;

		public function clearBiaoExpireDuration():void {
			biao_expire_duration$field = null;
		}

		public function get hasBiaoExpireDuration():Boolean {
			return biao_expire_duration$field != null;
		}

		public function set biaoExpireDuration(value:Int64):void {
			biao_expire_duration$field = value;
		}

		public function get biaoExpireDuration():Int64 {
			return biao_expire_duration$field;
		}

		/**
		 *  @private
		 */
		public static const PER_NPC_MAX_CAN_REFRESH_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.per_npc_max_can_refresh_times", "perNpcMaxCanRefreshTimes", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var per_npc_max_can_refresh_times$field:int;

		public function clearPerNpcMaxCanRefreshTimes():void {
			hasField$0 &= 0xfffffff7;
			per_npc_max_can_refresh_times$field = new int();
		}

		public function get hasPerNpcMaxCanRefreshTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set perNpcMaxCanRefreshTimes(value:int):void {
			hasField$0 |= 0x8;
			per_npc_max_can_refresh_times$field = value;
		}

		public function get perNpcMaxCanRefreshTimes():int {
			return per_npc_max_can_refresh_times$field;
		}

		/**
		 *  @private
		 */
		public static const NPC_REFREH_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.PersonalBiaoMiscDataProto.npc_refreh_duration", "npcRefrehDuration", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var npc_refreh_duration$field:Int64;

		public function clearNpcRefrehDuration():void {
			npc_refreh_duration$field = null;
		}

		public function get hasNpcRefrehDuration():Boolean {
			return npc_refreh_duration$field != null;
		}

		public function set npcRefrehDuration(value:Int64):void {
			npc_refreh_duration$field = value;
		}

		public function get npcRefrehDuration():Int64 {
			return npc_refreh_duration$field;
		}

		/**
		 *  @private
		 */
		public static const GUO_YUN_START_MIN_HOUR:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.guo_yun_start_min_hour", "guoYunStartMinHour", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guo_yun_start_min_hour$field:int;

		public function clearGuoYunStartMinHour():void {
			hasField$0 &= 0xffffffef;
			guo_yun_start_min_hour$field = new int();
		}

		public function get hasGuoYunStartMinHour():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set guoYunStartMinHour(value:int):void {
			hasField$0 |= 0x10;
			guo_yun_start_min_hour$field = value;
		}

		public function get guoYunStartMinHour():int {
			return guo_yun_start_min_hour$field;
		}

		/**
		 *  @private
		 */
		public static const GUO_YUN_START_MAX_HOUR:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.guo_yun_start_max_hour", "guoYunStartMaxHour", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guo_yun_start_max_hour$field:int;

		public function clearGuoYunStartMaxHour():void {
			hasField$0 &= 0xffffffdf;
			guo_yun_start_max_hour$field = new int();
		}

		public function get hasGuoYunStartMaxHour():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set guoYunStartMaxHour(value:int):void {
			hasField$0 |= 0x20;
			guo_yun_start_max_hour$field = value;
		}

		public function get guoYunStartMaxHour():int {
			return guo_yun_start_max_hour$field;
		}

		/**
		 *  @private
		 */
		public static const GUO_YUN_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.PersonalBiaoMiscDataProto.guo_yun_duration", "guoYunDuration", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guo_yun_duration$field:Int64;

		public function clearGuoYunDuration():void {
			guo_yun_duration$field = null;
		}

		public function get hasGuoYunDuration():Boolean {
			return guo_yun_duration$field != null;
		}

		public function set guoYunDuration(value:Int64):void {
			guo_yun_duration$field = value;
		}

		public function get guoYunDuration():Int64 {
			return guo_yun_duration$field;
		}

		/**
		 *  @private
		 */
		public static const GUO_YUN_WEAK_PROTECT_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.PersonalBiaoMiscDataProto.guo_yun_weak_protect_time", "guoYunWeakProtectTime", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guo_yun_weak_protect_time$field:Int64;

		public function clearGuoYunWeakProtectTime():void {
			guo_yun_weak_protect_time$field = null;
		}

		public function get hasGuoYunWeakProtectTime():Boolean {
			return guo_yun_weak_protect_time$field != null;
		}

		public function set guoYunWeakProtectTime(value:Int64):void {
			guo_yun_weak_protect_time$field = value;
		}

		public function get guoYunWeakProtectTime():Int64 {
			return guo_yun_weak_protect_time$field;
		}

		/**
		 *  @private
		 */
		public static const GUO_YUN_EXP_ADDITIONAL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.guo_yun_exp_additional", "guoYunExpAdditional", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guo_yun_exp_additional$field:int;

		public function clearGuoYunExpAdditional():void {
			hasField$0 &= 0xffffffbf;
			guo_yun_exp_additional$field = new int();
		}

		public function get hasGuoYunExpAdditional():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set guoYunExpAdditional(value:int):void {
			hasField$0 |= 0x40;
			guo_yun_exp_additional$field = value;
		}

		public function get guoYunExpAdditional():int {
			return guo_yun_exp_additional$field;
		}

		/**
		 *  @private
		 */
		public static const CHECK_BIAO_NPCS:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.check_biao_npcs", "checkBiaoNpcs", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var checkBiaoNpcs:Array = [];

		/**
		 *  @private
		 */
		public static const DESTROY_ADD_EXP_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PersonalBiaoMiscDataProto.destroy_add_exp_percent", "destroyAddExpPercent", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var destroy_add_exp_percent$field:int;

		public function clearDestroyAddExpPercent():void {
			hasField$0 &= 0xffffff7f;
			destroy_add_exp_percent$field = new int();
		}

		public function get hasDestroyAddExpPercent():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set destroyAddExpPercent(value:int):void {
			hasField$0 |= 0x80;
			destroy_add_exp_percent$field = value;
		}

		public function get destroyAddExpPercent():int {
			return destroy_add_exp_percent$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCanAcessPerDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, can_acess_per_day$field);
			}
			if (hasCanAddBiaoTimesPerDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, can_add_biao_times_per_day$field);
			}
			if (hasDestroyAccumMaxTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, destroy_accum_max_times$field);
			}
			if (hasBiaoExpireDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, biao_expire_duration$field);
			}
			if (hasPerNpcMaxCanRefreshTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, per_npc_max_can_refresh_times$field);
			}
			if (hasNpcRefrehDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, npc_refreh_duration$field);
			}
			if (hasGuoYunStartMinHour) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, guo_yun_start_min_hour$field);
			}
			if (hasGuoYunStartMaxHour) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, guo_yun_start_max_hour$field);
			}
			if (hasGuoYunDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, guo_yun_duration$field);
			}
			if (hasGuoYunWeakProtectTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, guo_yun_weak_protect_time$field);
			}
			if (hasGuoYunExpAdditional) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, guo_yun_exp_additional$field);
			}
			for (var checkBiaoNpcs$index:uint = 0; checkBiaoNpcs$index < this.checkBiaoNpcs.length; ++checkBiaoNpcs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.checkBiaoNpcs[checkBiaoNpcs$index]);
			}
			if (hasDestroyAddExpPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, destroy_add_exp_percent$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var can_acess_per_day$count:uint = 0;
			var can_add_biao_times_per_day$count:uint = 0;
			var destroy_accum_max_times$count:uint = 0;
			var biao_expire_duration$count:uint = 0;
			var per_npc_max_can_refresh_times$count:uint = 0;
			var npc_refreh_duration$count:uint = 0;
			var guo_yun_start_min_hour$count:uint = 0;
			var guo_yun_start_max_hour$count:uint = 0;
			var guo_yun_duration$count:uint = 0;
			var guo_yun_weak_protect_time$count:uint = 0;
			var guo_yun_exp_additional$count:uint = 0;
			var destroy_add_exp_percent$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (can_acess_per_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.canAcessPerDay cannot be set twice.');
					}
					++can_acess_per_day$count;
					this.canAcessPerDay = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (can_add_biao_times_per_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.canAddBiaoTimesPerDay cannot be set twice.');
					}
					++can_add_biao_times_per_day$count;
					this.canAddBiaoTimesPerDay = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (destroy_accum_max_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.destroyAccumMaxTimes cannot be set twice.');
					}
					++destroy_accum_max_times$count;
					this.destroyAccumMaxTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (biao_expire_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.biaoExpireDuration cannot be set twice.');
					}
					++biao_expire_duration$count;
					this.biaoExpireDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (per_npc_max_can_refresh_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.perNpcMaxCanRefreshTimes cannot be set twice.');
					}
					++per_npc_max_can_refresh_times$count;
					this.perNpcMaxCanRefreshTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (npc_refreh_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.npcRefrehDuration cannot be set twice.');
					}
					++npc_refreh_duration$count;
					this.npcRefrehDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 7:
					if (guo_yun_start_min_hour$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.guoYunStartMinHour cannot be set twice.');
					}
					++guo_yun_start_min_hour$count;
					this.guoYunStartMinHour = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (guo_yun_start_max_hour$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.guoYunStartMaxHour cannot be set twice.');
					}
					++guo_yun_start_max_hour$count;
					this.guoYunStartMaxHour = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (guo_yun_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.guoYunDuration cannot be set twice.');
					}
					++guo_yun_duration$count;
					this.guoYunDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 10:
					if (guo_yun_weak_protect_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.guoYunWeakProtectTime cannot be set twice.');
					}
					++guo_yun_weak_protect_time$count;
					this.guoYunWeakProtectTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 11:
					if (guo_yun_exp_additional$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.guoYunExpAdditional cannot be set twice.');
					}
					++guo_yun_exp_additional$count;
					this.guoYunExpAdditional = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.checkBiaoNpcs);
						break;
					}
					this.checkBiaoNpcs.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 13:
					if (destroy_add_exp_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalBiaoMiscDataProto.destroyAddExpPercent cannot be set twice.');
					}
					++destroy_add_exp_percent$count;
					this.destroyAddExpPercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
