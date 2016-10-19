package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.P3366LevelDailyGiftInfoProto.P3366LevelDailyGiftDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class P3366LevelDailyGiftInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_LEVEL_PRIZE_COLLECTED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.P3366LevelDailyGiftInfoProto.is_level_prize_collected", "isLevelPrizeCollected", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_level_prize_collected$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsLevelPrizeCollected():void {
			hasField$0 &= 0xfffffffe;
			is_level_prize_collected$field = new Boolean();
		}

		public function get hasIsLevelPrizeCollected():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isLevelPrizeCollected(value:Boolean):void {
			hasField$0 |= 0x1;
			is_level_prize_collected$field = value;
		}

		public function get isLevelPrizeCollected():Boolean {
			return is_level_prize_collected$field;
		}

		/**
		 *  @private
		 */
		public static const P3366_LEVEL_DAILY_PRIZES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.P3366LevelDailyGiftInfoProto.p3366_level_daily_prizes", "p3366LevelDailyPrizes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.P3366LevelDailyGiftInfoProto.P3366LevelDailyGiftDataProto; });

		[ArrayElementType("app.message.P3366LevelDailyGiftInfoProto.P3366LevelDailyGiftDataProto")]
		public var p3366LevelDailyPrizes:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsLevelPrizeCollected) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_level_prize_collected$field);
			}
			for (var p3366LevelDailyPrizes$index:uint = 0; p3366LevelDailyPrizes$index < this.p3366LevelDailyPrizes.length; ++p3366LevelDailyPrizes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.p3366LevelDailyPrizes[p3366LevelDailyPrizes$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_level_prize_collected$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_level_prize_collected$count != 0) {
						throw new flash.errors.IOError('Bad data format: P3366LevelDailyGiftInfoProto.isLevelPrizeCollected cannot be set twice.');
					}
					++is_level_prize_collected$count;
					this.isLevelPrizeCollected = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					this.p3366LevelDailyPrizes.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.P3366LevelDailyGiftInfoProto.P3366LevelDailyGiftDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
