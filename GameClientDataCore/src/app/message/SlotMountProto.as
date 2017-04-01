package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipedMountProto;
	import app.message.MountStatus;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SlotMountProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IDX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SlotMountProto.idx", "idx", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var idx$field:int;

		private var hasField$0:uint = 0;

		public function clearIdx():void {
			hasField$0 &= 0xfffffffe;
			idx$field = new int();
		}

		public function get hasIdx():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set idx(value:int):void {
			hasField$0 |= 0x1;
			idx$field = value;
		}

		public function get idx():int {
			return idx$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPED_MOUNT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SlotMountProto.equiped_mount", "equipedMount", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipedMountProto; });

		private var equiped_mount$field:app.message.EquipedMountProto;

		public function clearEquipedMount():void {
			equiped_mount$field = null;
		}

		public function get hasEquipedMount():Boolean {
			return equiped_mount$field != null;
		}

		public function set equipedMount(value:app.message.EquipedMountProto):void {
			equiped_mount$field = value;
		}

		public function get equipedMount():app.message.EquipedMountProto {
			return equiped_mount$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_STATUS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.SlotMountProto.mount_status", "mountStatus", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.MountStatus);

		private var mount_status$field:int;

		public function clearMountStatus():void {
			hasField$0 &= 0xfffffffd;
			mount_status$field = new int();
		}

		public function get hasMountStatus():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set mountStatus(value:int):void {
			hasField$0 |= 0x2;
			mount_status$field = value;
		}

		public function get mountStatus():int {
			return mount_status$field;
		}

		/**
		 *  @private
		 */
		public static const IS_RIDING:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SlotMountProto.is_riding", "isRiding", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_riding$field:Boolean;

		public function clearIsRiding():void {
			hasField$0 &= 0xfffffffb;
			is_riding$field = new Boolean();
		}

		public function get hasIsRiding():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isRiding(value:Boolean):void {
			hasField$0 |= 0x4;
			is_riding$field = value;
		}

		public function get isRiding():Boolean {
			return is_riding$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIdx) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, idx$field);
			}
			if (hasEquipedMount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, equiped_mount$field);
			}
			if (hasMountStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, mount_status$field);
			}
			if (hasIsRiding) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_riding$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var idx$count:uint = 0;
			var equiped_mount$count:uint = 0;
			var mount_status$count:uint = 0;
			var is_riding$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (idx$count != 0) {
						throw new flash.errors.IOError('Bad data format: SlotMountProto.idx cannot be set twice.');
					}
					++idx$count;
					this.idx = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (equiped_mount$count != 0) {
						throw new flash.errors.IOError('Bad data format: SlotMountProto.equipedMount cannot be set twice.');
					}
					++equiped_mount$count;
					this.equipedMount = new app.message.EquipedMountProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.equipedMount);
					break;
				case 3:
					if (mount_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: SlotMountProto.mountStatus cannot be set twice.');
					}
					++mount_status$count;
					this.mountStatus = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if (is_riding$count != 0) {
						throw new flash.errors.IOError('Bad data format: SlotMountProto.isRiding cannot be set twice.');
					}
					++is_riding$count;
					this.isRiding = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
