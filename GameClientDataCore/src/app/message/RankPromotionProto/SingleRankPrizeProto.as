package app.message.RankPromotionProto {
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
	public dynamic final class SingleRankPrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GOODS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.RankPromotionProto.SingleRankPrizeProto.goods", "goods", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var goods:Array = [];

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.RankPromotionProto.SingleRankPrizeProto.level", "level", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const MIN_RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.RankPromotionProto.SingleRankPrizeProto.min_rank", "minRank", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var min_rank$field:int;

		public function clearMinRank():void {
			hasField$0 &= 0xfffffffd;
			min_rank$field = new int();
		}

		public function get hasMinRank():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set minRank(value:int):void {
			hasField$0 |= 0x2;
			min_rank$field = value;
		}

		public function get minRank():int {
			return min_rank$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.RankPromotionProto.SingleRankPrizeProto.max_rank", "maxRank", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_rank$field:int;

		public function clearMaxRank():void {
			hasField$0 &= 0xfffffffb;
			max_rank$field = new int();
		}

		public function get hasMaxRank():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set maxRank(value:int):void {
			hasField$0 |= 0x4;
			max_rank$field = value;
		}

		public function get maxRank():int {
			return max_rank$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var goods$index:uint = 0; goods$index < this.goods.length; ++goods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.goods[goods$index]);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasMinRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, min_rank$field);
			}
			if (hasMaxRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_rank$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level$count:uint = 0;
			var min_rank$count:uint = 0;
			var max_rank$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.goods.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				case 2:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRankPrizeProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (min_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRankPrizeProto.minRank cannot be set twice.');
					}
					++min_rank$count;
					this.minRank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (max_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRankPrizeProto.maxRank cannot be set twice.');
					}
					++max_rank$count;
					this.maxRank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
