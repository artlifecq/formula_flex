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
	public dynamic final class VipModuleObjOtherProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VIP_EXP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.VipModuleObjOtherProto.vip_exp", "vipExp", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_exp$field:int;

		private var hasField$0:uint = 0;

		public function clearVipExp():void {
			hasField$0 &= 0xfffffffe;
			vip_exp$field = new int();
		}

		public function get hasVipExp():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set vipExp(value:int):void {
			hasField$0 |= 0x1;
			vip_exp$field = value;
		}

		public function get vipExp():int {
			return vip_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVipExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip_exp$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var vip_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (vip_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipModuleObjOtherProto.vipExp cannot be set twice.');
					}
					++vip_exp$count;
					this.vipExp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
