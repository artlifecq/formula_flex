package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BaZhenTuDungeonProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EXP_MULTIPLE_START_IN_TODAY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BaZhenTuDungeonProto.exp_multiple_start_in_today", "expMultipleStartInToday", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp_multiple_start_in_today$field:Int64;

		public function clearExpMultipleStartInToday():void {
			exp_multiple_start_in_today$field = null;
		}

		public function get hasExpMultipleStartInToday():Boolean {
			return exp_multiple_start_in_today$field != null;
		}

		public function set expMultipleStartInToday(value:Int64):void {
			exp_multiple_start_in_today$field = value;
		}

		public function get expMultipleStartInToday():Int64 {
			return exp_multiple_start_in_today$field;
		}

		/**
		 *  @private
		 */
		public static const EXP_MULTIPLE_END_IN_TODAY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BaZhenTuDungeonProto.exp_multiple_end_in_today", "expMultipleEndInToday", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp_multiple_end_in_today$field:Int64;

		public function clearExpMultipleEndInToday():void {
			exp_multiple_end_in_today$field = null;
		}

		public function get hasExpMultipleEndInToday():Boolean {
			return exp_multiple_end_in_today$field != null;
		}

		public function set expMultipleEndInToday(value:Int64):void {
			exp_multiple_end_in_today$field = value;
		}

		public function get expMultipleEndInToday():Int64 {
			return exp_multiple_end_in_today$field;
		}

		/**
		 *  @private
		 */
		public static const EXP_MULTIPLE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BaZhenTuDungeonProto.exp_multiple", "expMultiple", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp_multiple$field:int;

		private var hasField$0:uint = 0;

		public function clearExpMultiple():void {
			hasField$0 &= 0xfffffffe;
			exp_multiple$field = new int();
		}

		public function get hasExpMultiple():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set expMultiple(value:int):void {
			hasField$0 |= 0x1;
			exp_multiple$field = value;
		}

		public function get expMultiple():int {
			return exp_multiple$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_WAVE_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BaZhenTuDungeonProto.max_wave_count", "maxWaveCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_wave_count$field:int;

		public function clearMaxWaveCount():void {
			hasField$0 &= 0xfffffffd;
			max_wave_count$field = new int();
		}

		public function get hasMaxWaveCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set maxWaveCount(value:int):void {
			hasField$0 |= 0x2;
			max_wave_count$field = value;
		}

		public function get maxWaveCount():int {
			return max_wave_count$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_ENTER_TIMES_PER_DAY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BaZhenTuDungeonProto.can_enter_times_per_day", "canEnterTimesPerDay", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_enter_times_per_day$field:int;

		public function clearCanEnterTimesPerDay():void {
			hasField$0 &= 0xfffffffb;
			can_enter_times_per_day$field = new int();
		}

		public function get hasCanEnterTimesPerDay():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set canEnterTimesPerDay(value:int):void {
			hasField$0 |= 0x4;
			can_enter_times_per_day$field = value;
		}

		public function get canEnterTimesPerDay():int {
			return can_enter_times_per_day$field;
		}

		/**
		 *  @private
		 */
		public static const WAVE_MONSTER_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BaZhenTuDungeonProto.wave_monster_count", "waveMonsterCount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var wave_monster_count$field:int;

		public function clearWaveMonsterCount():void {
			hasField$0 &= 0xfffffff7;
			wave_monster_count$field = new int();
		}

		public function get hasWaveMonsterCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set waveMonsterCount(value:int):void {
			hasField$0 |= 0x8;
			wave_monster_count$field = value;
		}

		public function get waveMonsterCount():int {
			return wave_monster_count$field;
		}

		/**
		 *  @private
		 */
		public static const MONSTER_SPELLS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.BaZhenTuDungeonProto.monster_spells", "monsterSpells", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto; });

		[ArrayElementType("app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto")]
		public var monsterSpells:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasExpMultipleStartInToday) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, exp_multiple_start_in_today$field);
			}
			if (hasExpMultipleEndInToday) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, exp_multiple_end_in_today$field);
			}
			if (hasExpMultiple) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, exp_multiple$field);
			}
			if (hasMaxWaveCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_wave_count$field);
			}
			if (hasCanEnterTimesPerDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, can_enter_times_per_day$field);
			}
			if (hasWaveMonsterCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, wave_monster_count$field);
			}
			for (var monsterSpells$index:uint = 0; monsterSpells$index < this.monsterSpells.length; ++monsterSpells$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.monsterSpells[monsterSpells$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var exp_multiple_start_in_today$count:uint = 0;
			var exp_multiple_end_in_today$count:uint = 0;
			var exp_multiple$count:uint = 0;
			var max_wave_count$count:uint = 0;
			var can_enter_times_per_day$count:uint = 0;
			var wave_monster_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (exp_multiple_start_in_today$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuDungeonProto.expMultipleStartInToday cannot be set twice.');
					}
					++exp_multiple_start_in_today$count;
					this.expMultipleStartInToday = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (exp_multiple_end_in_today$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuDungeonProto.expMultipleEndInToday cannot be set twice.');
					}
					++exp_multiple_end_in_today$count;
					this.expMultipleEndInToday = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (exp_multiple$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuDungeonProto.expMultiple cannot be set twice.');
					}
					++exp_multiple$count;
					this.expMultiple = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (max_wave_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuDungeonProto.maxWaveCount cannot be set twice.');
					}
					++max_wave_count$count;
					this.maxWaveCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (can_enter_times_per_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuDungeonProto.canEnterTimesPerDay cannot be set twice.');
					}
					++can_enter_times_per_day$count;
					this.canEnterTimesPerDay = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (wave_monster_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuDungeonProto.waveMonsterCount cannot be set twice.');
					}
					++wave_monster_count$count;
					this.waveMonsterCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					this.monsterSpells.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
