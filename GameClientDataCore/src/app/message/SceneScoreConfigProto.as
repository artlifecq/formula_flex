package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SceneScoreConfigProto.ScoreType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SceneScoreConfigProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SCORE_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.SceneScoreConfigProto.score_type", "scoreType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.SceneScoreConfigProto.ScoreType);

		private var score_type$field:int;

		private var hasField$0:uint = 0;

		public function clearScoreType():void {
			hasField$0 &= 0xfffffffe;
			score_type$field = new int();
		}

		public function get hasScoreType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set scoreType(value:int):void {
			hasField$0 |= 0x1;
			score_type$field = value;
		}

		public function get scoreType():int {
			return score_type$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SceneScoreConfigProto.time", "time", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:Int64;

		public function clearTime():void {
			time$field = null;
		}

		public function get hasTime():Boolean {
			return time$field != null;
		}

		public function set time(value:Int64):void {
			time$field = value;
		}

		public function get time():Int64 {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const LEFT_LIFE_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SceneScoreConfigProto.left_life_percent", "leftLifePercent", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var left_life_percent$field:int;

		public function clearLeftLifePercent():void {
			hasField$0 &= 0xfffffffd;
			left_life_percent$field = new int();
		}

		public function get hasLeftLifePercent():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set leftLifePercent(value:int):void {
			hasField$0 |= 0x2;
			left_life_percent$field = value;
		}

		public function get leftLifePercent():int {
			return left_life_percent$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_ATTACK_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SceneScoreConfigProto.been_attack_times", "beenAttackTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var been_attack_times$field:int;

		public function clearBeenAttackTimes():void {
			hasField$0 &= 0xfffffffb;
			been_attack_times$field = new int();
		}

		public function get hasBeenAttackTimes():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set beenAttackTimes(value:int):void {
			hasField$0 |= 0x4;
			been_attack_times$field = value;
		}

		public function get beenAttackTimes():int {
			return been_attack_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_HURT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SceneScoreConfigProto.total_hurt", "totalHurt", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_hurt$field:int;

		public function clearTotalHurt():void {
			hasField$0 &= 0xfffffff7;
			total_hurt$field = new int();
		}

		public function get hasTotalHurt():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set totalHurt(value:int):void {
			hasField$0 |= 0x8;
			total_hurt$field = value;
		}

		public function get totalHurt():int {
			return total_hurt$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasScoreType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, score_type$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, time$field);
			}
			if (hasLeftLifePercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, left_life_percent$field);
			}
			if (hasBeenAttackTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, been_attack_times$field);
			}
			if (hasTotalHurt) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, total_hurt$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var score_type$count:uint = 0;
			var time$count:uint = 0;
			var left_life_percent$count:uint = 0;
			var been_attack_times$count:uint = 0;
			var total_hurt$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (score_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneScoreConfigProto.scoreType cannot be set twice.');
					}
					++score_type$count;
					this.scoreType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneScoreConfigProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (left_life_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneScoreConfigProto.leftLifePercent cannot be set twice.');
					}
					++left_life_percent$count;
					this.leftLifePercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (been_attack_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneScoreConfigProto.beenAttackTimes cannot be set twice.');
					}
					++been_attack_times$count;
					this.beenAttackTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (total_hurt$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneScoreConfigProto.totalHurt cannot be set twice.');
					}
					++total_hurt$count;
					this.totalHurt = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
