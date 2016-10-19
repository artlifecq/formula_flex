package app.message.SceneModuleObjOtherProto {
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
	public dynamic final class OtherHeroPKStatusProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PK_AMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneModuleObjOtherProto.OtherHeroPKStatusProto.pk_amount", "pkAmount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pk_amount$field:int;

		private var hasField$0:uint = 0;

		public function clearPkAmount():void {
			hasField$0 &= 0xfffffffe;
			pk_amount$field = new int();
		}

		public function get hasPkAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set pkAmount(value:int):void {
			hasField$0 |= 0x1;
			pk_amount$field = value;
		}

		public function get pkAmount():int {
			return pk_amount$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPkAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, pk_amount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pk_amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pk_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherHeroPKStatusProto.pkAmount cannot be set twice.');
					}
					++pk_amount$count;
					this.pkAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
