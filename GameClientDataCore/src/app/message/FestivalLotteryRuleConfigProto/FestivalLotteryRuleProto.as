package app.message.FestivalLotteryRuleConfigProto {
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
	public dynamic final class FestivalLotteryRuleProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FestivalLotteryRuleConfigProto.FestivalLotteryRuleProto.cost", "cost", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost$field:int;

		private var hasField$0:uint = 0;

		public function clearCost():void {
			hasField$0 &= 0xfffffffe;
			cost$field = new int();
		}

		public function get hasCost():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cost(value:int):void {
			hasField$0 |= 0x1;
			cost$field = value;
		}

		public function get cost():int {
			return cost$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FestivalLotteryRuleConfigProto.FestivalLotteryRuleProto.count", "count", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		public function clearCount():void {
			hasField$0 &= 0xfffffffd;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x2;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_GOODS:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.FestivalLotteryRuleConfigProto.FestivalLotteryRuleProto.show_goods", "showGoods", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var showGoods:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cost$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, count$field);
			}
			for (var showGoods$index:uint = 0; showGoods$index < this.showGoods.length; ++showGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.showGoods[showGoods$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cost$count:uint = 0;
			var count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: FestivalLotteryRuleProto.cost cannot be set twice.');
					}
					++cost$count;
					this.cost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: FestivalLotteryRuleProto.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.showGoods);
						break;
					}
					this.showGoods.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
