package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ContainerProto.ContainerType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ContainerProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CONTAINER_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.ContainerProto.container_type", "containerType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.ContainerProto.ContainerType);

		private var container_type$field:int;

		private var hasField$0:uint = 0;

		public function clearContainerType():void {
			hasField$0 &= 0xfffffffe;
			container_type$field = new int();
		}

		public function get hasContainerType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set containerType(value:int):void {
			hasField$0 |= 0x1;
			container_type$field = value;
		}

		public function get containerType():int {
			return container_type$field;
		}

		/**
		 *  @private
		 */
		public static const MISC:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ContainerProto.misc", "misc", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var misc$field:int;

		public function clearMisc():void {
			hasField$0 &= 0xfffffffd;
			misc$field = new int();
		}

		public function get hasMisc():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set misc(value:int):void {
			hasField$0 |= 0x2;
			misc$field = value;
		}

		public function get misc():int {
			return misc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasContainerType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, container_type$field);
			}
			if (hasMisc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, misc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var container_type$count:uint = 0;
			var misc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (container_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ContainerProto.containerType cannot be set twice.');
					}
					++container_type$count;
					this.containerType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (misc$count != 0) {
						throw new flash.errors.IOError('Bad data format: ContainerProto.misc cannot be set twice.');
					}
					++misc$count;
					this.misc = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
