package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MazeLevelPrizeDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NpcMazePrizeAndEnterNextDialogProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.NpcMazePrizeAndEnterNextDialogProto.data", "data", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MazeLevelPrizeDataProto; });

		private var data$field:app.message.MazeLevelPrizeDataProto;

		public function clearData():void {
			data$field = null;
		}

		public function get hasData():Boolean {
			return data$field != null;
		}

		public function set data(value:app.message.MazeLevelPrizeDataProto):void {
			data$field = value;
		}

		public function get data():app.message.MazeLevelPrizeDataProto {
			return data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (data$count != 0) {
						throw new flash.errors.IOError('Bad data format: NpcMazePrizeAndEnterNextDialogProto.data cannot be set twice.');
					}
					++data$count;
					this.data = new app.message.MazeLevelPrizeDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.data);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
