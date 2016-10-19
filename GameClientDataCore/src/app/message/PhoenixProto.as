package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PhoenixDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class PhoenixProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PHOENIX_MONEY_REFINE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.PhoenixProto.phoenix_money_refine", "phoenixMoneyRefine", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PhoenixDataProto; });

		[ArrayElementType("app.message.PhoenixDataProto")]
		public var phoenixMoneyRefine:Array = [];

		/**
		 *  @private
		 */
		public static const PHOENIX_EXP_REFINE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.PhoenixProto.phoenix_exp_refine", "phoenixExpRefine", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PhoenixDataProto; });

		[ArrayElementType("app.message.PhoenixDataProto")]
		public var phoenixExpRefine:Array = [];

		/**
		 *  @private
		 */
		public static const PHOENIX_MONEY_REFINE_MAX_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.PhoenixProto.phoenix_money_refine_max_times", "phoenixMoneyRefineMaxTimes", (71 << 3) | com.netease.protobuf.WireType.VARINT);

		private var phoenix_money_refine_max_times$field:int;

		private var hasField$0:uint = 0;

		public function clearPhoenixMoneyRefineMaxTimes():void {
			hasField$0 &= 0xfffffffe;
			phoenix_money_refine_max_times$field = new int();
		}

		public function get hasPhoenixMoneyRefineMaxTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set phoenixMoneyRefineMaxTimes(value:int):void {
			hasField$0 |= 0x1;
			phoenix_money_refine_max_times$field = value;
		}

		public function get phoenixMoneyRefineMaxTimes():int {
			return phoenix_money_refine_max_times$field;
		}

		/**
		 *  @private
		 */
		public static const PHOENIX_EXP_REFINE_MAX_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.PhoenixProto.phoenix_exp_refine_max_times", "phoenixExpRefineMaxTimes", (75 << 3) | com.netease.protobuf.WireType.VARINT);

		private var phoenix_exp_refine_max_times$field:int;

		public function clearPhoenixExpRefineMaxTimes():void {
			hasField$0 &= 0xfffffffd;
			phoenix_exp_refine_max_times$field = new int();
		}

		public function get hasPhoenixExpRefineMaxTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set phoenixExpRefineMaxTimes(value:int):void {
			hasField$0 |= 0x2;
			phoenix_exp_refine_max_times$field = value;
		}

		public function get phoenixExpRefineMaxTimes():int {
			return phoenix_exp_refine_max_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var phoenixMoneyRefine$index:uint = 0; phoenixMoneyRefine$index < this.phoenixMoneyRefine.length; ++phoenixMoneyRefine$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.phoenixMoneyRefine[phoenixMoneyRefine$index]);
			}
			for (var phoenixExpRefine$index:uint = 0; phoenixExpRefine$index < this.phoenixExpRefine.length; ++phoenixExpRefine$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.phoenixExpRefine[phoenixExpRefine$index]);
			}
			if (hasPhoenixMoneyRefineMaxTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 71);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, phoenix_money_refine_max_times$field);
			}
			if (hasPhoenixExpRefineMaxTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 75);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, phoenix_exp_refine_max_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var phoenix_money_refine_max_times$count:uint = 0;
			var phoenix_exp_refine_max_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.phoenixMoneyRefine.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.PhoenixDataProto()));
					break;
				case 2:
					this.phoenixExpRefine.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.PhoenixDataProto()));
					break;
				case 71:
					if (phoenix_money_refine_max_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixProto.phoenixMoneyRefineMaxTimes cannot be set twice.');
					}
					++phoenix_money_refine_max_times$count;
					this.phoenixMoneyRefineMaxTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 75:
					if (phoenix_exp_refine_max_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: PhoenixProto.phoenixExpRefineMaxTimes cannot be set twice.');
					}
					++phoenix_exp_refine_max_times$count;
					this.phoenixExpRefineMaxTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
