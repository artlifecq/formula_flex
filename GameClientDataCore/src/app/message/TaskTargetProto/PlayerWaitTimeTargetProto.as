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
	public dynamic final class PlayerWaitTimeTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLAYER_WAIT_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.TaskTargetProto.PlayerWaitTimeTargetProto.player_wait_time", "playerWaitTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var player_wait_time$field:Int64;

		public function clearPlayerWaitTime():void {
			player_wait_time$field = null;
		}

		public function get hasPlayerWaitTime():Boolean {
			return player_wait_time$field != null;
		}

		public function set playerWaitTime(value:Int64):void {
			player_wait_time$field = value;
		}

		public function get playerWaitTime():Int64 {
			return player_wait_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPlayerWaitTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, player_wait_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var player_wait_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (player_wait_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerWaitTimeTargetProto.playerWaitTime cannot be set twice.');
					}
					++player_wait_time$count;
					this.playerWaitTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
