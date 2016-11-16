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
	public dynamic final class TouZhuTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAIL_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.TouZhuTaskProto.fail_time", "failTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fail_time$field:Int64;

		public function clearFailTime():void {
			fail_time$field = null;
		}

		public function get hasFailTime():Boolean {
			return fail_time$field != null;
		}

		public function set failTime(value:Int64):void {
			fail_time$field = value;
		}

		public function get failTime():Int64 {
			return fail_time$field;
		}

		/**
		 *  @private
		 */
		public static const ZHU_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TouZhuTaskProto.zhu_id", "zhuId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zhu_id$field:int;

		private var hasField$0:uint = 0;

		public function clearZhuId():void {
			hasField$0 &= 0xfffffffe;
			zhu_id$field = new int();
		}

		public function get hasZhuId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set zhuId(value:int):void {
			hasField$0 |= 0x1;
			zhu_id$field = value;
		}

		public function get zhuId():int {
			return zhu_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFailTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, fail_time$field);
			}
			if (hasZhuId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, zhu_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var fail_time$count:uint = 0;
			var zhu_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (fail_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouZhuTaskProto.failTime cannot be set twice.');
					}
					++fail_time$count;
					this.failTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (zhu_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouZhuTaskProto.zhuId cannot be set twice.');
					}
					++zhu_id$count;
					this.zhuId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
