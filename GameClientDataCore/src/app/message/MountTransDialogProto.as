package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MountTransDialogProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TRANS_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountTransDialogProto.trans_cost", "transCost", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var trans_cost$field:app.message.UpgradeProto;

		public function clearTransCost():void {
			trans_cost$field = null;
		}

		public function get hasTransCost():Boolean {
			return trans_cost$field != null;
		}

		public function set transCost(value:app.message.UpgradeProto):void {
			trans_cost$field = value;
		}

		public function get transCost():app.message.UpgradeProto {
			return trans_cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTransCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, trans_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var trans_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (trans_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountTransDialogProto.transCost cannot be set twice.');
					}
					++trans_cost$count;
					this.transCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.transCost);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
