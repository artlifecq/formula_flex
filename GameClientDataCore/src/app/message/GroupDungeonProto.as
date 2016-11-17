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
	public dynamic final class GroupDungeonProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MIN_HERO_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonProto.min_hero_count", "minHeroCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var min_hero_count$field:int;

		private var hasField$0:uint = 0;

		public function clearMinHeroCount():void {
			hasField$0 &= 0xfffffffe;
			min_hero_count$field = new int();
		}

		public function get hasMinHeroCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set minHeroCount(value:int):void {
			hasField$0 |= 0x1;
			min_hero_count$field = value;
		}

		public function get minHeroCount():int {
			return min_hero_count$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_HERO_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonProto.max_hero_count", "maxHeroCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hero_count$field:int;

		public function clearMaxHeroCount():void {
			hasField$0 &= 0xfffffffd;
			max_hero_count$field = new int();
		}

		public function get hasMaxHeroCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set maxHeroCount(value:int):void {
			hasField$0 |= 0x2;
			max_hero_count$field = value;
		}

		public function get maxHeroCount():int {
			return max_hero_count$field;
		}

		/**
		 *  @private
		 */
		public static const RECOMMENDED_FIGHT_AMOUNT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GroupDungeonProto.recommended_fight_amount", "recommendedFightAmount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var recommended_fight_amount$field:Int64;

		public function clearRecommendedFightAmount():void {
			recommended_fight_amount$field = null;
		}

		public function get hasRecommendedFightAmount():Boolean {
			return recommended_fight_amount$field != null;
		}

		public function set recommendedFightAmount(value:Int64):void {
			recommended_fight_amount$field = value;
		}

		public function get recommendedFightAmount():Int64 {
			return recommended_fight_amount$field;
		}

		/**
		 *  @private
		 */
		public static const REQUIRED_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonProto.required_level", "requiredLevel", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var required_level$field:int;

		public function clearRequiredLevel():void {
			hasField$0 &= 0xfffffffb;
			required_level$field = new int();
		}

		public function get hasRequiredLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set requiredLevel(value:int):void {
			hasField$0 |= 0x4;
			required_level$field = value;
		}

		public function get requiredLevel():int {
			return required_level$field;
		}

		/**
		 *  @private
		 */
		public static const DAILY_ENTER_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonProto.daily_enter_times", "dailyEnterTimes", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var daily_enter_times$field:int;

		public function clearDailyEnterTimes():void {
			hasField$0 &= 0xfffffff7;
			daily_enter_times$field = new int();
		}

		public function get hasDailyEnterTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set dailyEnterTimes(value:int):void {
			hasField$0 |= 0x8;
			daily_enter_times$field = value;
		}

		public function get dailyEnterTimes():int {
			return daily_enter_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMinHeroCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, min_hero_count$field);
			}
			if (hasMaxHeroCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, max_hero_count$field);
			}
			if (hasRecommendedFightAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, recommended_fight_amount$field);
			}
			if (hasRequiredLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, required_level$field);
			}
			if (hasDailyEnterTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, daily_enter_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var min_hero_count$count:uint = 0;
			var max_hero_count$count:uint = 0;
			var recommended_fight_amount$count:uint = 0;
			var required_level$count:uint = 0;
			var daily_enter_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (min_hero_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonProto.minHeroCount cannot be set twice.');
					}
					++min_hero_count$count;
					this.minHeroCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (max_hero_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonProto.maxHeroCount cannot be set twice.');
					}
					++max_hero_count$count;
					this.maxHeroCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (recommended_fight_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonProto.recommendedFightAmount cannot be set twice.');
					}
					++recommended_fight_amount$count;
					this.recommendedFightAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (required_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonProto.requiredLevel cannot be set twice.');
					}
					++required_level$count;
					this.requiredLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (daily_enter_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonProto.dailyEnterTimes cannot be set twice.');
					}
					++daily_enter_times$count;
					this.dailyEnterTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
