package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentDestroyPrizeDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentRefineDestoryDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REFINE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentRefineDestoryDataProto.refine_times", "refineTimes", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refine_times$field:int;

		private var hasField$0:uint = 0;

		public function clearRefineTimes():void {
			hasField$0 &= 0xfffffffe;
			refine_times$field = new int();
		}

		public function get hasRefineTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set refineTimes(value:int):void {
			hasField$0 |= 0x1;
			refine_times$field = value;
		}

		public function get refineTimes():int {
			return refine_times$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentRefineDestoryDataProto.money_cost", "moneyCost", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_cost$field:int;

		public function clearMoneyCost():void {
			hasField$0 &= 0xfffffffd;
			money_cost$field = new int();
		}

		public function get hasMoneyCost():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set moneyCost(value:int):void {
			hasField$0 |= 0x2;
			money_cost$field = value;
		}

		public function get moneyCost():int {
			return money_cost$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.EquipmentRefineDestoryDataProto.prize", "prize", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentDestroyPrizeDataProto; });

		[ArrayElementType("app.message.EquipmentDestroyPrizeDataProto")]
		public var prize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRefineTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, refine_times$field);
			}
			if (hasMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, money_cost$field);
			}
			for (var prize$index:uint = 0; prize$index < this.prize.length; ++prize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.prize[prize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var refine_times$count:uint = 0;
			var money_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (refine_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineDestoryDataProto.refineTimes cannot be set twice.');
					}
					++refine_times$count;
					this.refineTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineDestoryDataProto.moneyCost cannot be set twice.');
					}
					++money_cost$count;
					this.moneyCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					this.prize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.EquipmentDestroyPrizeDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
