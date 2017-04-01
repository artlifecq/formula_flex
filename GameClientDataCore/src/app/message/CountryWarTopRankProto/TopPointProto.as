package app.message.CountryWarTopRankProto {
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
	public dynamic final class TopPointProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POINT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarTopRankProto.TopPointProto.point", "point", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var point$field:Int64;

		public function clearPoint():void {
			point$field = null;
		}

		public function get hasPoint():Boolean {
			return point$field != null;
		}

		public function set point(value:Int64):void {
			point$field = value;
		}

		public function get point():Int64 {
			return point$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, point$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var point$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (point$count != 0) {
						throw new flash.errors.IOError('Bad data format: TopPointProto.point cannot be set twice.');
					}
					++point$count;
					this.point = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
