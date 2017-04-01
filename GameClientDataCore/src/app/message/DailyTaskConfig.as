package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DailyTaskConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DAILY_TASK_MAX_ROUND:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyTaskConfig.daily_task_max_round", "dailyTaskMaxRound", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var daily_task_max_round$field:int;

		private var hasField$0:uint = 0;

		public function clearDailyTaskMaxRound():void {
			hasField$0 &= 0xfffffffe;
			daily_task_max_round$field = new int();
		}

		public function get hasDailyTaskMaxRound():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set dailyTaskMaxRound(value:int):void {
			hasField$0 |= 0x1;
			daily_task_max_round$field = value;
		}

		public function get dailyTaskMaxRound():int {
			return daily_task_max_round$field;
		}

		/**
		 *  @private
		 */
		public static const DAILY_TASK_EXTRA_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.DailyTaskConfig.daily_task_extra_prize", "dailyTaskExtraPrize", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var daily_task_extra_prize$field:app.message.PrizeProto;

		public function clearDailyTaskExtraPrize():void {
			daily_task_extra_prize$field = null;
		}

		public function get hasDailyTaskExtraPrize():Boolean {
			return daily_task_extra_prize$field != null;
		}

		public function set dailyTaskExtraPrize(value:app.message.PrizeProto):void {
			daily_task_extra_prize$field = value;
		}

		public function get dailyTaskExtraPrize():app.message.PrizeProto {
			return daily_task_extra_prize$field;
		}

		/**
		 *  @private
		 */
		public static const DAILY_TASK_REDUCE_DIFFI_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyTaskConfig.daily_task_reduce_diffi_cost", "dailyTaskReduceDiffiCost", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var daily_task_reduce_diffi_cost$field:int;

		public function clearDailyTaskReduceDiffiCost():void {
			hasField$0 &= 0xfffffffd;
			daily_task_reduce_diffi_cost$field = new int();
		}

		public function get hasDailyTaskReduceDiffiCost():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set dailyTaskReduceDiffiCost(value:int):void {
			hasField$0 |= 0x2;
			daily_task_reduce_diffi_cost$field = value;
		}

		public function get dailyTaskReduceDiffiCost():int {
			return daily_task_reduce_diffi_cost$field;
		}

		/**
		 *  @private
		 */
		public static const DAILY_TASK_ADD_PRIZE_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyTaskConfig.daily_task_add_prize_cost", "dailyTaskAddPrizeCost", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var daily_task_add_prize_cost$field:int;

		public function clearDailyTaskAddPrizeCost():void {
			hasField$0 &= 0xfffffffb;
			daily_task_add_prize_cost$field = new int();
		}

		public function get hasDailyTaskAddPrizeCost():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set dailyTaskAddPrizeCost(value:int):void {
			hasField$0 |= 0x4;
			daily_task_add_prize_cost$field = value;
		}

		public function get dailyTaskAddPrizeCost():int {
			return daily_task_add_prize_cost$field;
		}

		/**
		 *  @private
		 */
		public static const DAILY_TASK_AUTO_COMPLETE_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyTaskConfig.daily_task_auto_complete_cost", "dailyTaskAutoCompleteCost", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var daily_task_auto_complete_cost$field:int;

		public function clearDailyTaskAutoCompleteCost():void {
			hasField$0 &= 0xfffffff7;
			daily_task_auto_complete_cost$field = new int();
		}

		public function get hasDailyTaskAutoCompleteCost():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set dailyTaskAutoCompleteCost(value:int):void {
			hasField$0 |= 0x8;
			daily_task_auto_complete_cost$field = value;
		}

		public function get dailyTaskAutoCompleteCost():int {
			return daily_task_auto_complete_cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDailyTaskMaxRound) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, daily_task_max_round$field);
			}
			if (hasDailyTaskExtraPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, daily_task_extra_prize$field);
			}
			if (hasDailyTaskReduceDiffiCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, daily_task_reduce_diffi_cost$field);
			}
			if (hasDailyTaskAddPrizeCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, daily_task_add_prize_cost$field);
			}
			if (hasDailyTaskAutoCompleteCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, daily_task_auto_complete_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var daily_task_max_round$count:uint = 0;
			var daily_task_extra_prize$count:uint = 0;
			var daily_task_reduce_diffi_cost$count:uint = 0;
			var daily_task_add_prize_cost$count:uint = 0;
			var daily_task_auto_complete_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (daily_task_max_round$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskConfig.dailyTaskMaxRound cannot be set twice.');
					}
					++daily_task_max_round$count;
					this.dailyTaskMaxRound = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (daily_task_extra_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskConfig.dailyTaskExtraPrize cannot be set twice.');
					}
					++daily_task_extra_prize$count;
					this.dailyTaskExtraPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.dailyTaskExtraPrize);
					break;
				case 3:
					if (daily_task_reduce_diffi_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskConfig.dailyTaskReduceDiffiCost cannot be set twice.');
					}
					++daily_task_reduce_diffi_cost$count;
					this.dailyTaskReduceDiffiCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (daily_task_add_prize_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskConfig.dailyTaskAddPrizeCost cannot be set twice.');
					}
					++daily_task_add_prize_cost$count;
					this.dailyTaskAddPrizeCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (daily_task_auto_complete_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyTaskConfig.dailyTaskAutoCompleteCost cannot be set twice.');
					}
					++daily_task_auto_complete_cost$count;
					this.dailyTaskAutoCompleteCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
