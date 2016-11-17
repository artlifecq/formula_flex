package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GroupDungeonFinishStatProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TOTAL_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonFinishStatProto.total_time", "totalTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_time$field:int;

		private var hasField$0:uint = 0;

		public function clearTotalTime():void {
			hasField$0 &= 0xfffffffe;
			total_time$field = new int();
		}

		public function get hasTotalTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set totalTime(value:int):void {
			hasField$0 |= 0x1;
			total_time$field = value;
		}

		public function get totalTime():int {
			return total_time$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonFinishStatProto.dead_count", "deadCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_count$field:int;

		public function clearDeadCount():void {
			hasField$0 &= 0xfffffffd;
			dead_count$field = new int();
		}

		public function get hasDeadCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set deadCount(value:int):void {
			hasField$0 |= 0x2;
			dead_count$field = value;
		}

		public function get deadCount():int {
			return dead_count$field;
		}

		/**
		 *  @private
		 */
		public static const MONSTER_EXP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonFinishStatProto.monster_exp", "monsterExp", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var monster_exp$field:int;

		public function clearMonsterExp():void {
			hasField$0 &= 0xfffffffb;
			monster_exp$field = new int();
		}

		public function get hasMonsterExp():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set monsterExp(value:int):void {
			hasField$0 |= 0x4;
			monster_exp$field = value;
		}

		public function get monsterExp():int {
			return monster_exp$field;
		}

		/**
		 *  @private
		 */
		public static const SCORE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonFinishStatProto.score", "score", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var score$field:int;

		public function clearScore():void {
			hasField$0 &= 0xfffffff7;
			score$field = new int();
		}

		public function get hasScore():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set score(value:int):void {
			hasField$0 |= 0x8;
			score$field = value;
		}

		public function get score():int {
			return score$field;
		}

		/**
		 *  @private
		 */
		public static const SCORE_S_PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.GroupDungeonFinishStatProto.score_s_prize", "scoreSPrize", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var scoreSPrize:Array = [];

		/**
		 *  @private
		 */
		public static const VIP_PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.GroupDungeonFinishStatProto.vip_prize", "vipPrize", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var vipPrize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTotalTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, total_time$field);
			}
			if (hasDeadCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_count$field);
			}
			if (hasMonsterExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, monster_exp$field);
			}
			if (hasScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, score$field);
			}
			for (var scoreSPrize$index:uint = 0; scoreSPrize$index < this.scoreSPrize.length; ++scoreSPrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.scoreSPrize[scoreSPrize$index]);
			}
			for (var vipPrize$index:uint = 0; vipPrize$index < this.vipPrize.length; ++vipPrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.vipPrize[vipPrize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var total_time$count:uint = 0;
			var dead_count$count:uint = 0;
			var monster_exp$count:uint = 0;
			var score$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (total_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonFinishStatProto.totalTime cannot be set twice.');
					}
					++total_time$count;
					this.totalTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (dead_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonFinishStatProto.deadCount cannot be set twice.');
					}
					++dead_count$count;
					this.deadCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (monster_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonFinishStatProto.monsterExp cannot be set twice.');
					}
					++monster_exp$count;
					this.monsterExp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (score$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonFinishStatProto.score cannot be set twice.');
					}
					++score$count;
					this.score = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					this.scoreSPrize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				case 6:
					this.vipPrize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
