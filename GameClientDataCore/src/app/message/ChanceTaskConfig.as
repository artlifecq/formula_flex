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
	public dynamic final class ChanceTaskConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHANCE_TASK_ACCEPTABLE_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.chance_task_acceptable_count", "chanceTaskAcceptableCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_acceptable_count$field:int;

		private var hasField$0:uint = 0;

		public function clearChanceTaskAcceptableCount():void {
			hasField$0 &= 0xfffffffe;
			chance_task_acceptable_count$field = new int();
		}

		public function get hasChanceTaskAcceptableCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set chanceTaskAcceptableCount(value:int):void {
			hasField$0 |= 0x1;
			chance_task_acceptable_count$field = value;
		}

		public function get chanceTaskAcceptableCount():int {
			return chance_task_acceptable_count$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_MAX_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.chance_task_max_count", "chanceTaskMaxCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_max_count$field:int;

		public function clearChanceTaskMaxCount():void {
			hasField$0 &= 0xfffffffd;
			chance_task_max_count$field = new int();
		}

		public function get hasChanceTaskMaxCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set chanceTaskMaxCount(value:int):void {
			hasField$0 |= 0x2;
			chance_task_max_count$field = value;
		}

		public function get chanceTaskMaxCount():int {
			return chance_task_max_count$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_SWALLOWABLE_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.chance_task_swallowable_count", "chanceTaskSwallowableCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_swallowable_count$field:int;

		public function clearChanceTaskSwallowableCount():void {
			hasField$0 &= 0xfffffffb;
			chance_task_swallowable_count$field = new int();
		}

		public function get hasChanceTaskSwallowableCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set chanceTaskSwallowableCount(value:int):void {
			hasField$0 |= 0x4;
			chance_task_swallowable_count$field = value;
		}

		public function get chanceTaskSwallowableCount():int {
			return chance_task_swallowable_count$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_SWALLOWABLE_VIP_ADD_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.chance_task_swallowable_vip_add_count", "chanceTaskSwallowableVipAddCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_swallowable_vip_add_count$field:int;

		public function clearChanceTaskSwallowableVipAddCount():void {
			hasField$0 &= 0xfffffff7;
			chance_task_swallowable_vip_add_count$field = new int();
		}

		public function get hasChanceTaskSwallowableVipAddCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set chanceTaskSwallowableVipAddCount(value:int):void {
			hasField$0 |= 0x8;
			chance_task_swallowable_vip_add_count$field = value;
		}

		public function get chanceTaskSwallowableVipAddCount():int {
			return chance_task_swallowable_vip_add_count$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_SWALLOW_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.chance_task_swallow_cost", "chanceTaskSwallowCost", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_swallow_cost$field:int;

		public function clearChanceTaskSwallowCost():void {
			hasField$0 &= 0xffffffef;
			chance_task_swallow_cost$field = new int();
		}

		public function get hasChanceTaskSwallowCost():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set chanceTaskSwallowCost(value:int):void {
			hasField$0 |= 0x10;
			chance_task_swallow_cost$field = value;
		}

		public function get chanceTaskSwallowCost():int {
			return chance_task_swallow_cost$field;
		}

		/**
		 *  @private
		 */
		public static const AUTO_COMPLETE_COST:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.auto_complete_cost", "autoCompleteCost", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var autoCompleteCost:Array = [];

		/**
		 *  @private
		 */
		public static const AUTO_COMPLETE_LIMIT:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.auto_complete_limit", "autoCompleteLimit", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var autoCompleteLimit:Array = [];

		/**
		 *  @private
		 */
		public static const SWALLOW_MIN_PERCENT:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.swallow_min_percent", "swallowMinPercent", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var swallowMinPercent:Array = [];

		/**
		 *  @private
		 */
		public static const SWALLOW_MAX_PERCENT:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.swallow_max_percent", "swallowMaxPercent", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var swallowMaxPercent:Array = [];

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_COMPLETE_GOODS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskConfig.chance_task_complete_goods", "chanceTaskCompleteGoods", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_complete_goods$field:int;

		public function clearChanceTaskCompleteGoods():void {
			hasField$0 &= 0xffffffdf;
			chance_task_complete_goods$field = new int();
		}

		public function get hasChanceTaskCompleteGoods():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set chanceTaskCompleteGoods(value:int):void {
			hasField$0 |= 0x20;
			chance_task_complete_goods$field = value;
		}

		public function get chanceTaskCompleteGoods():int {
			return chance_task_complete_goods$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChanceTaskAcceptableCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chance_task_acceptable_count$field);
			}
			if (hasChanceTaskMaxCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chance_task_max_count$field);
			}
			if (hasChanceTaskSwallowableCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chance_task_swallowable_count$field);
			}
			if (hasChanceTaskSwallowableVipAddCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chance_task_swallowable_vip_add_count$field);
			}
			if (hasChanceTaskSwallowCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chance_task_swallow_cost$field);
			}
			for (var autoCompleteCost$index:uint = 0; autoCompleteCost$index < this.autoCompleteCost.length; ++autoCompleteCost$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.autoCompleteCost[autoCompleteCost$index]);
			}
			for (var autoCompleteLimit$index:uint = 0; autoCompleteLimit$index < this.autoCompleteLimit.length; ++autoCompleteLimit$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.autoCompleteLimit[autoCompleteLimit$index]);
			}
			for (var swallowMinPercent$index:uint = 0; swallowMinPercent$index < this.swallowMinPercent.length; ++swallowMinPercent$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.swallowMinPercent[swallowMinPercent$index]);
			}
			for (var swallowMaxPercent$index:uint = 0; swallowMaxPercent$index < this.swallowMaxPercent.length; ++swallowMaxPercent$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.swallowMaxPercent[swallowMaxPercent$index]);
			}
			if (hasChanceTaskCompleteGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chance_task_complete_goods$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chance_task_acceptable_count$count:uint = 0;
			var chance_task_max_count$count:uint = 0;
			var chance_task_swallowable_count$count:uint = 0;
			var chance_task_swallowable_vip_add_count$count:uint = 0;
			var chance_task_swallow_cost$count:uint = 0;
			var chance_task_complete_goods$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (chance_task_acceptable_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskConfig.chanceTaskAcceptableCount cannot be set twice.');
					}
					++chance_task_acceptable_count$count;
					this.chanceTaskAcceptableCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (chance_task_max_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskConfig.chanceTaskMaxCount cannot be set twice.');
					}
					++chance_task_max_count$count;
					this.chanceTaskMaxCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (chance_task_swallowable_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskConfig.chanceTaskSwallowableCount cannot be set twice.');
					}
					++chance_task_swallowable_count$count;
					this.chanceTaskSwallowableCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (chance_task_swallowable_vip_add_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskConfig.chanceTaskSwallowableVipAddCount cannot be set twice.');
					}
					++chance_task_swallowable_vip_add_count$count;
					this.chanceTaskSwallowableVipAddCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (chance_task_swallow_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskConfig.chanceTaskSwallowCost cannot be set twice.');
					}
					++chance_task_swallow_cost$count;
					this.chanceTaskSwallowCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.autoCompleteCost);
						break;
					}
					this.autoCompleteCost.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 7:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.autoCompleteLimit);
						break;
					}
					this.autoCompleteLimit.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 8:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.swallowMinPercent);
						break;
					}
					this.swallowMinPercent.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 9:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.swallowMaxPercent);
						break;
					}
					this.swallowMaxPercent.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 10:
					if (chance_task_complete_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskConfig.chanceTaskCompleteGoods cannot be set twice.');
					}
					++chance_task_complete_goods$count;
					this.chanceTaskCompleteGoods = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
