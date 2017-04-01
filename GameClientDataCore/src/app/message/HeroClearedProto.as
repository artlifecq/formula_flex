package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.DailyTaskProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HeroClearedProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DOING_DAILY_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.HeroClearedProto.doing_daily_task", "doingDailyTask", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.DailyTaskProto; });

		private var doing_daily_task$field:app.message.DailyTaskProto;

		public function clearDoingDailyTask():void {
			doing_daily_task$field = null;
		}

		public function get hasDoingDailyTask():Boolean {
			return doing_daily_task$field != null;
		}

		public function set doingDailyTask(value:app.message.DailyTaskProto):void {
			doing_daily_task$field = value;
		}

		public function get doingDailyTask():app.message.DailyTaskProto {
			return doing_daily_task$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDoingDailyTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, doing_daily_task$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var doing_daily_task$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (doing_daily_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroClearedProto.doingDailyTask cannot be set twice.');
					}
					++doing_daily_task$count;
					this.doingDailyTask = new app.message.DailyTaskProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.doingDailyTask);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
