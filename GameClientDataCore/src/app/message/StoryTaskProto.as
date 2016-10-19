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
	public dynamic final class StoryTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BASE_TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.StoryTaskProto.base_task", "baseTask", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskProto; });

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
			if (hasBaseTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, base_task$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var base_task$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (base_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: StoryTaskProto.baseTask cannot be set twice.');
					}
					++base_task$count;
					this.baseTask = new app.message.TaskProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.baseTask);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
