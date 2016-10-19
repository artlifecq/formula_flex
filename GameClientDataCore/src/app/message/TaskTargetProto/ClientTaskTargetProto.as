package app.message.TaskTargetProto {
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
	public dynamic final class ClientTaskTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CLIENT_TASK_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskTargetProto.ClientTaskTargetProto.client_task_type", "clientTaskType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client_task_type$field:int;

		private var hasField$0:uint = 0;

		public function clearClientTaskType():void {
			hasField$0 &= 0xfffffffe;
			client_task_type$field = new int();
		}

		public function get hasClientTaskType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clientTaskType(value:int):void {
			hasField$0 |= 0x1;
			client_task_type$field = value;
		}

		public function get clientTaskType():int {
			return client_task_type$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_TASK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.TaskTargetProto.ClientTaskTargetProto.client_task", "clientTask", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var client_task$field:String;

		public function clearClientTask():void {
			client_task$field = null;
		}

		public function get hasClientTask():Boolean {
			return client_task$field != null;
		}

		public function set clientTask(value:String):void {
			client_task$field = value;
		}

		public function get clientTask():String {
			return client_task$field;
		}

		/**
		 *  @private
		 */
		public static const COMPLETE_CLIENT_TASK_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskTargetProto.ClientTaskTargetProto.complete_client_task_times", "completeClientTaskTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var complete_client_task_times$field:int;

		public function clearCompleteClientTaskTimes():void {
			hasField$0 &= 0xfffffffd;
			complete_client_task_times$field = new int();
		}

		public function get hasCompleteClientTaskTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set completeClientTaskTimes(value:int):void {
			hasField$0 |= 0x2;
			complete_client_task_times$field = value;
		}

		public function get completeClientTaskTimes():int {
			return complete_client_task_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasClientTaskType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, client_task_type$field);
			}
			if (hasClientTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, client_task$field);
			}
			if (hasCompleteClientTaskTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, complete_client_task_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var client_task_type$count:uint = 0;
			var client_task$count:uint = 0;
			var complete_client_task_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (client_task_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientTaskTargetProto.clientTaskType cannot be set twice.');
					}
					++client_task_type$count;
					this.clientTaskType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (client_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientTaskTargetProto.clientTask cannot be set twice.');
					}
					++client_task$count;
					this.clientTask = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (complete_client_task_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientTaskTargetProto.completeClientTaskTimes cannot be set twice.');
					}
					++complete_client_task_times$count;
					this.completeClientTaskTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
