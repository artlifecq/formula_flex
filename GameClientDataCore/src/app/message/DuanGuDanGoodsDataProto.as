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
	public dynamic final class DuanGuDanGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ADD_VITALITY_EXP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DuanGuDanGoodsDataProto.add_vitality_exp", "addVitalityExp", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_vitality_exp$field:int;

		private var hasField$0:uint = 0;

		public function clearAddVitalityExp():void {
			hasField$0 &= 0xfffffffe;
			add_vitality_exp$field = new int();
		}

		public function get hasAddVitalityExp():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set addVitalityExp(value:int):void {
			hasField$0 |= 0x1;
			add_vitality_exp$field = value;
		}

		public function get addVitalityExp():int {
			return add_vitality_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAddVitalityExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_vitality_exp$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var add_vitality_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (add_vitality_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: DuanGuDanGoodsDataProto.addVitalityExp cannot be set twice.');
					}
					++add_vitality_exp$count;
					this.addVitalityExp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
