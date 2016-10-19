package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.VipProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class VipsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DATA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.VipsProto.data", "data", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.VipProto; });

		[ArrayElementType("app.message.VipProto")]
		public var data:Array = [];

		/**
		 *  @private
		 */
		public static const ADD_VIP_EXP_PER_RECHARGED_GOLD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VipsProto.add_vip_exp_per_recharged_gold", "addVipExpPerRechargedGold", (400 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_vip_exp_per_recharged_gold$field:int;

		private var hasField$0:uint = 0;

		public function clearAddVipExpPerRechargedGold():void {
			hasField$0 &= 0xfffffffe;
			add_vip_exp_per_recharged_gold$field = new int();
		}

		public function get hasAddVipExpPerRechargedGold():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set addVipExpPerRechargedGold(value:int):void {
			hasField$0 |= 0x1;
			add_vip_exp_per_recharged_gold$field = value;
		}

		public function get addVipExpPerRechargedGold():int {
			return add_vip_exp_per_recharged_gold$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var data$index:uint = 0; data$index < this.data.length; ++data$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.data[data$index]);
			}
			if (hasAddVipExpPerRechargedGold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 400);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, add_vip_exp_per_recharged_gold$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var add_vip_exp_per_recharged_gold$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.data.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.VipProto()));
					break;
				case 400:
					if (add_vip_exp_per_recharged_gold$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipsProto.addVipExpPerRechargedGold cannot be set twice.');
					}
					++add_vip_exp_per_recharged_gold$count;
					this.addVipExpPerRechargedGold = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
