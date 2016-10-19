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
	public dynamic final class OtherUnionStatusProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UNION_CD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.OtherUnionStatusProto.union_cd", "unionCd", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var union_cd$field:Int64;

		public function clearUnionCd():void {
			union_cd$field = null;
		}

		public function get hasUnionCd():Boolean {
			return union_cd$field != null;
		}

		public function set unionCd(value:Int64):void {
			union_cd$field = value;
		}

		public function get unionCd():Int64 {
			return union_cd$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUnionCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, union_cd$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var union_cd$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (union_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherUnionStatusProto.unionCd cannot be set twice.');
					}
					++union_cd$count;
					this.unionCd = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
