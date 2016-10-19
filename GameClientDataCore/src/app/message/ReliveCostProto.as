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
	public dynamic final class ReliveCostProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RELIVE_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ReliveCostProto.relive_times", "reliveTimes", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var relive_times$field:int;

		private var hasField$0:uint = 0;

		public function clearReliveTimes():void {
			hasField$0 &= 0xfffffffe;
			relive_times$field = new int();
		}

		public function get hasReliveTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set reliveTimes(value:int):void {
			hasField$0 |= 0x1;
			relive_times$field = value;
		}

		public function get reliveTimes():int {
			return relive_times$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ReliveCostProto.money_cost", "moneyCost", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasReliveTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, relive_times$field);
			}
			if (hasMoneyCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var relive_times$count:uint = 0;
			var money_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (relive_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReliveCostProto.reliveTimes cannot be set twice.');
					}
					++relive_times$count;
					this.reliveTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (money_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: ReliveCostProto.moneyCost cannot be set twice.');
					}
					++money_cost$count;
					this.moneyCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
