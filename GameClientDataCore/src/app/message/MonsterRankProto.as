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
	public dynamic final class MonsterRankProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RANK_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MonsterRankProto.rank_count", "rankCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank_count$field:int;

		private var hasField$0:uint = 0;

		public function clearRankCount():void {
			hasField$0 &= 0xfffffffe;
			rank_count$field = new int();
		}

		public function get hasRankCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set rankCount(value:int):void {
			hasField$0 |= 0x1;
			rank_count$field = value;
		}

		public function get rankCount():int {
			return rank_count$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_START_POS:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.MonsterRankProto.rank_start_pos", "rankStartPos", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var rankStartPos:Array = [];

		/**
		 *  @private
		 */
		public static const RANK_END_POS:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.MonsterRankProto.rank_end_pos", "rankEndPos", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var rankEndPos:Array = [];

		/**
		 *  @private
		 */
		public static const RANK_GOODS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.MonsterRankProto.rank_goods", "rankGoods", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var rankGoods:Array = [];

		/**
		 *  @private
		 */
		public static const RANK_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MonsterRankProto.rank_type", "rankType", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank_type$field:int;

		public function clearRankType():void {
			hasField$0 &= 0xfffffffd;
			rank_type$field = new int();
		}

		public function get hasRankType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set rankType(value:int):void {
			hasField$0 |= 0x2;
			rank_type$field = value;
		}

		public function get rankType():int {
			return rank_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRankCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, rank_count$field);
			}
			for (var rankStartPos$index:uint = 0; rankStartPos$index < this.rankStartPos.length; ++rankStartPos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.rankStartPos[rankStartPos$index]);
			}
			for (var rankEndPos$index:uint = 0; rankEndPos$index < this.rankEndPos.length; ++rankEndPos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.rankEndPos[rankEndPos$index]);
			}
			for (var rankGoods$index:uint = 0; rankGoods$index < this.rankGoods.length; ++rankGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.rankGoods[rankGoods$index]);
			}
			if (hasRankType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, rank_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var rank_count$count:uint = 0;
			var rank_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rank_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterRankProto.rankCount cannot be set twice.');
					}
					++rank_count$count;
					this.rankCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.rankStartPos);
						break;
					}
					this.rankStartPos.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.rankEndPos);
						break;
					}
					this.rankEndPos.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 4:
					this.rankGoods.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				case 5:
					if (rank_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MonsterRankProto.rankType cannot be set twice.');
					}
					++rank_type$count;
					this.rankType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
