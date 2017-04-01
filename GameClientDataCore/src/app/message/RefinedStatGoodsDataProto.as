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
	public dynamic final class RefinedStatGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REFINED_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RefinedStatGoodsDataProto.refined_type", "refinedType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refined_type$field:int;

		private var hasField$0:uint = 0;

		public function clearRefinedType():void {
			hasField$0 &= 0xfffffffe;
			refined_type$field = new int();
		}

		public function get hasRefinedType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set refinedType(value:int):void {
			hasField$0 |= 0x1;
			refined_type$field = value;
		}

		public function get refinedType():int {
			return refined_type$field;
		}

		/**
		 *  @private
		 */
		public static const REQUIRED_OBJECT_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.RefinedStatGoodsDataProto.required_object_level", "requiredObjectLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var required_object_level$field:int;

		public function clearRequiredObjectLevel():void {
			hasField$0 &= 0xfffffffd;
			required_object_level$field = new int();
		}

		public function get hasRequiredObjectLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set requiredObjectLevel(value:int):void {
			hasField$0 |= 0x2;
			required_object_level$field = value;
		}

		public function get requiredObjectLevel():int {
			return required_object_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRefinedType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, refined_type$field);
			}
			if (hasRequiredObjectLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, required_object_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var refined_type$count:uint = 0;
			var required_object_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (refined_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: RefinedStatGoodsDataProto.refinedType cannot be set twice.');
					}
					++refined_type$count;
					this.refinedType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (required_object_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: RefinedStatGoodsDataProto.requiredObjectLevel cannot be set twice.');
					}
					++required_object_level$count;
					this.requiredObjectLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
