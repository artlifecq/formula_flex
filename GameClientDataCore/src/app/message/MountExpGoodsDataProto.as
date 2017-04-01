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
	public dynamic final class MountExpGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ADD_EXP:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.MountExpGoodsDataProto.add_exp", "addExp", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_exp$field:Int64;

		public function clearAddExp():void {
			add_exp$field = null;
		}

		public function get hasAddExp():Boolean {
			return add_exp$field != null;
		}

		public function set addExp(value:Int64):void {
			add_exp$field = value;
		}

		public function get addExp():Int64 {
			return add_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAddExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, add_exp$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var add_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (add_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountExpGoodsDataProto.addExp cannot be set twice.');
					}
					++add_exp$count;
					this.addExp = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
