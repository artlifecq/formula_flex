package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentListProto;
	import app.message.MountProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipedMountProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MOUNT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipedMountProto.mount", "mount", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountProto; });

		private var mount$field:app.message.MountProto;

		public function clearMount():void {
			mount$field = null;
		}

		public function get hasMount():Boolean {
			return mount$field != null;
		}

		public function set mount(value:app.message.MountProto):void {
			mount$field = value;
		}

		public function get mount():app.message.MountProto {
			return mount$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_EQUIPMENTS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipedMountProto.mount_equipments", "mountEquipments", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentListProto; });

		private var mount_equipments$field:app.message.EquipmentListProto;

		public function clearMountEquipments():void {
			mount_equipments$field = null;
		}

		public function get hasMountEquipments():Boolean {
			return mount_equipments$field != null;
		}

		public function set mountEquipments(value:app.message.EquipmentListProto):void {
			mount_equipments$field = value;
		}

		public function get mountEquipments():app.message.EquipmentListProto {
			return mount_equipments$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mount$field);
			}
			if (hasMountEquipments) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mount_equipments$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var mount$count:uint = 0;
			var mount_equipments$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mount$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipedMountProto.mount cannot be set twice.');
					}
					++mount$count;
					this.mount = new app.message.MountProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mount);
					break;
				case 2:
					if (mount_equipments$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipedMountProto.mountEquipments cannot be set twice.');
					}
					++mount_equipments$count;
					this.mountEquipments = new app.message.EquipmentListProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mountEquipments);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
