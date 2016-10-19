package app.message.P3366LevelDailyGiftInfoProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class P3366LevelDailyGiftDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_MIN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.P3366LevelDailyGiftInfoProto.P3366LevelDailyGiftDataProto.level_min", "levelMin", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_min$field:int;

		private var hasField$0:uint = 0;

		public function clearLevelMin():void {
			hasField$0 &= 0xfffffffe;
			level_min$field = new int();
		}

		public function get hasLevelMin():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set levelMin(value:int):void {
			hasField$0 |= 0x1;
			level_min$field = value;
		}

		public function get levelMin():int {
			return level_min$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.P3366LevelDailyGiftInfoProto.P3366LevelDailyGiftDataProto.prize", "prize", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

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
			if (hasLevelMin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level_min$field);
			}
			if (hasPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level_min$count:uint = 0;
			var prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level_min$count != 0) {
						throw new flash.errors.IOError('Bad data format: P3366LevelDailyGiftDataProto.levelMin cannot be set twice.');
					}
					++level_min$count;
					this.levelMin = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: P3366LevelDailyGiftDataProto.prize cannot be set twice.');
					}
					++prize$count;
					this.prize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.prize);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
