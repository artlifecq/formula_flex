package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TaskProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BranchTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BRANCH_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BranchTaskProto.branch_id", "branchId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var branch_id$field:int;

		private var hasField$0:uint = 0;

		public function clearBranchId():void {
			hasField$0 &= 0xfffffffe;
			branch_id$field = new int();
		}

		public function get hasBranchId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set branchId(value:int):void {
			hasField$0 |= 0x1;
			branch_id$field = value;
		}

		public function get branchId():int {
			return branch_id$field;
		}

		/**
		 *  @private
		 */
		public static const BASE_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.BranchTaskProto.base_task", "baseTask", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskProto; });

		private var base_task$field:app.message.TaskProto;

		public function clearBaseTask():void {
			base_task$field = null;
		}

		public function get hasBaseTask():Boolean {
			return base_task$field != null;
		}

		public function set baseTask(value:app.message.TaskProto):void {
			base_task$field = value;
		}

		public function get baseTask():app.message.TaskProto {
			return base_task$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBranchId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, branch_id$field);
			}
			if (hasBaseTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, base_task$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var branch_id$count:uint = 0;
			var base_task$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (branch_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskProto.branchId cannot be set twice.');
					}
					++branch_id$count;
					this.branchId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (base_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: BranchTaskProto.baseTask cannot be set twice.');
					}
					++base_task$count;
					this.baseTask = new app.message.TaskProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.baseTask);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
