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
	public dynamic final class ChatConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHAT_FREQUENCY_PER_CHAT:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.ChatConfig.chat_frequency_per_chat", "chatFrequencyPerChat", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var chatFrequencyPerChat:Array = [];

		/**
		 *  @private
		 */
		public static const CHAT_LEVEL:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.ChatConfig.chat_level", "chatLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var chatLevel:Array = [];

		/**
		 *  @private
		 */
		public static const CHAT_FREQUENCY_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChatConfig.chat_frequency_times", "chatFrequencyTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chat_frequency_times$field:int;

		private var hasField$0:uint = 0;

		public function clearChatFrequencyTimes():void {
			hasField$0 &= 0xfffffffe;
			chat_frequency_times$field = new int();
		}

		public function get hasChatFrequencyTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set chatFrequencyTimes(value:int):void {
			hasField$0 |= 0x1;
			chat_frequency_times$field = value;
		}

		public function get chatFrequencyTimes():int {
			return chat_frequency_times$field;
		}

		/**
		 *  @private
		 */
		public static const BROADCAST_MOOD_DURATION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.ChatConfig.broadcast_mood_duration", "broadcastMoodDuration", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var broadcast_mood_duration$field:Int64;

		public function clearBroadcastMoodDuration():void {
			broadcast_mood_duration$field = null;
		}

		public function get hasBroadcastMoodDuration():Boolean {
			return broadcast_mood_duration$field != null;
		}

		public function set broadcastMoodDuration(value:Int64):void {
			broadcast_mood_duration$field = value;
		}

		public function get broadcastMoodDuration():Int64 {
			return broadcast_mood_duration$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var chatFrequencyPerChat$index:uint = 0; chatFrequencyPerChat$index < this.chatFrequencyPerChat.length; ++chatFrequencyPerChat$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.chatFrequencyPerChat[chatFrequencyPerChat$index]);
			}
			for (var chatLevel$index:uint = 0; chatLevel$index < this.chatLevel.length; ++chatLevel$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.chatLevel[chatLevel$index]);
			}
			if (hasChatFrequencyTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chat_frequency_times$field);
			}
			if (hasBroadcastMoodDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, broadcast_mood_duration$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chat_frequency_times$count:uint = 0;
			var broadcast_mood_duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.chatFrequencyPerChat);
						break;
					}
					this.chatFrequencyPerChat.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.chatLevel);
						break;
					}
					this.chatLevel.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 3:
					if (chat_frequency_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatConfig.chatFrequencyTimes cannot be set twice.');
					}
					++chat_frequency_times$count;
					this.chatFrequencyTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (broadcast_mood_duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatConfig.broadcastMoodDuration cannot be set twice.');
					}
					++broadcast_mood_duration$count;
					this.broadcastMoodDuration = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
