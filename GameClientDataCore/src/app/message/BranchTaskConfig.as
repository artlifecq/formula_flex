package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BranchTaskConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BranchTaskConfig.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const BRANCH_TASK_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BranchTaskConfig.branch_task_type", "branchTaskType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var branch_task_type$field:int;

		public function clearBranchTaskType():void {
			hasField$0 &= 0xfffffffd;
			branch_task_type$field = new int();
		}

		public function get hasBranchTaskType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set branchTaskType(value:int):void {
			hasField$0 |= 0x2;
			branch_task_type$field = value;
		}

		public function get branchTaskType():int {
			return branch_task_type$field;
		}

		/**
		 *  @private
		 */
		public static const TASK_DESC:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.BranchTaskConfig.task_desc", "taskDesc", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var task_desc$field:flash.utils.ByteArray;

		public function clearTaskDesc():void {
			task_desc$field = null;
		}

		public function get hasTaskDesc():Boolean {
			return task_desc$field != null;
		}

		public function set taskDesc(value:flash.utils.ByteArray):void {
			task_desc$field = value;
		}

		public function get taskDesc():flash.utils.ByteArray {
			return task_desc$field;
		}

		/**
		 *  @private
		 */
		public static const DUNGEON_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BranchTaskConfig.dungeon_type", "dungeonType", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dungeon_type$field:int;

		public function clearDungeonType():void {
			hasField$0 &= 0xfffffffb;
			dungeon_type$field = new int();
		}

		public function get hasDungeonType():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set dungeonType(value:int):void {
			hasField$0 |= 0x4;
			dungeon_type$field = value;
		}

		public function get dungeonType():int {
			return dungeon_type$field;
		}

		/**
		 *  @private
		 */
		public static const DUNGEON_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BranchTaskConfig.dungeon_id", "dungeonId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dungeon_id$field:int;

		public function clearDungeonId():void {
			hasField$0 &= 0xfffffff7;
			dungeon_id$field = new int();
		}

		public function get hasDungeonId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set dungeonId(value:int):void {
			hasField$0 |= 0x8;
			dungeon_id$field = value;
		}

		public function get dungeonId():int {
			return dungeon_id$field;
		}

		/**
		 *  @private
		 */
		public static const TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BranchTaskConfig.times", "times", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var times$field:int;

		public function clearTimes():void {
			hasField$0 &= 0xffffffef;
			times$field = new int();
		}

		public function get hasTimes():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set times(value:int):void {
			hasField$0 |= 0x10;
			times$field = value;
		}

		public function get times():int {
			return times$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.BranchTaskConfig.prize", "prize", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var prize$field:app.message.PrizeProto;

		public function clearPrize():void {
			prize$field = null;
		}

		public function get hasPrize():Boolean {
			return prize$field != null;
		}

		public function set prize(value:app.message.PrizeProto):void {
			prize$field = value;
		}

		public function get prize():app.message.PrizeProto {
			return prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasBranchTaskType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, branch_task_type$field);
			}
			if (hasTaskDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, task_desc$field);
			}
			if (hasDungeonType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dungeon_type$field);
			}
			if (hasDungeonId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dungeon_id$field);
			}
			if (hasTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, times$field);
			}
			if (hasPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var branch_task_type$count:uint = 0;
			var task_desc$count:uint = 0;
			var dungeon_type$count:uint = 0;
			var dungeon_id$count:uint = 0;
			var times$count:uint = 0;
			var prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskConfig.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (branch_task_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskConfig.branchTaskType cannot be set twice.');
					}
					++branch_task_type$count;
					this.branchTaskType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (task_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskConfig.taskDesc cannot be set twice.');
					}
					++task_desc$count;
					this.taskDesc = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 4:
					if (dungeon_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskConfig.dungeonType cannot be set twice.');
					}
					++dungeon_type$count;
					this.dungeonType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (dungeon_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskConfig.dungeonId cannot be set twice.');
					}
					++dungeon_id$count;
					this.dungeonId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (times$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskConfig.times cannot be set twice.');
					}
					++times$count;
					this.times = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskConfig.prize cannot be set twice.');
					}
					++prize$count;
					this.prize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.prize);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
