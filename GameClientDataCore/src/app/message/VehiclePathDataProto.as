package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.VehiclePathPointDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class VehiclePathDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.VehiclePathDataProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_RES:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.VehiclePathDataProto.mount_res", "mountRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var mount_res$field:String;

		public function clearMountRes():void {
			mount_res$field = null;
		}

		public function get hasMountRes():Boolean {
			return mount_res$field != null;
		}

		public function set mountRes(value:String):void {
			mount_res$field = value;
		}

		public function get mountRes():String {
			return mount_res$field;
		}

		/**
		 *  @private
		 */
		public static const IS_CLING_GROUND:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.VehiclePathDataProto.is_cling_ground", "isClingGround", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_cling_ground$field:Boolean;

		public function clearIsClingGround():void {
			hasField$0 &= 0xfffffffd;
			is_cling_ground$field = new Boolean();
		}

		public function get hasIsClingGround():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isClingGround(value:Boolean):void {
			hasField$0 |= 0x2;
			is_cling_ground$field = value;
		}

		public function get isClingGround():Boolean {
			return is_cling_ground$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_MODEL_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.VehiclePathDataProto.mount_model_id", "mountModelId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mount_model_id$field:int;

		public function clearMountModelId():void {
			hasField$0 &= 0xfffffffb;
			mount_model_id$field = new int();
		}

		public function get hasMountModelId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set mountModelId(value:int):void {
			hasField$0 |= 0x4;
			mount_model_id$field = value;
		}

		public function get mountModelId():int {
			return mount_model_id$field;
		}

		/**
		 *  @private
		 */
		public static const POINTS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.VehiclePathDataProto.points", "points", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.VehiclePathPointDataProto; });

		[ArrayElementType("app.message.VehiclePathPointDataProto")]
		public var points:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasMountRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, mount_res$field);
			}
			if (hasIsClingGround) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_cling_ground$field);
			}
			if (hasMountModelId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mount_model_id$field);
			}
			for (var points$index:uint = 0; points$index < this.points.length; ++points$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.points[points$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var mount_res$count:uint = 0;
			var is_cling_ground$count:uint = 0;
			var mount_model_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (mount_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathDataProto.mountRes cannot be set twice.');
					}
					++mount_res$count;
					this.mountRes = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (is_cling_ground$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathDataProto.isClingGround cannot be set twice.');
					}
					++is_cling_ground$count;
					this.isClingGround = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (mount_model_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathDataProto.mountModelId cannot be set twice.');
					}
					++mount_model_id$count;
					this.mountModelId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					this.points.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.VehiclePathPointDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
