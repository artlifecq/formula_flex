package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NormalGoodsProto;
	import app.message.MountProto;
	import app.message.PackageProto;
	import app.message.EquipmentProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GoodsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsProto.count", "count", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		public function clearCount():void {
			hasField$0 &= 0xfffffffd;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x2;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		public static const BINDED:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GoodsProto.binded", "binded", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var binded$field:Boolean;

		public function clearBinded():void {
			hasField$0 &= 0xfffffffb;
			binded$field = new Boolean();
		}

		public function get hasBinded():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set binded(value:Boolean):void {
			hasField$0 |= 0x4;
			binded$field = value;
		}

		public function get binded():Boolean {
			return binded$field;
		}

		/**
		 *  @private
		 */
		public static const EXPIRE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GoodsProto.expire_time", "expireTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expire_time$field:Int64;

		public function clearExpireTime():void {
			expire_time$field = null;
		}

		public function get hasExpireTime():Boolean {
			return expire_time$field != null;
		}

		public function set expireTime(value:Int64):void {
			expire_time$field = value;
		}

		public function get expireTime():Int64 {
			return expire_time$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsProto.normal", "normal", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NormalGoodsProto; });

		private var normal$field:app.message.NormalGoodsProto;

		public function clearNormal():void {
			normal$field = null;
		}

		public function get hasNormal():Boolean {
			return normal$field != null;
		}

		public function set normal(value:app.message.NormalGoodsProto):void {
			normal$field = value;
		}

		public function get normal():app.message.NormalGoodsProto {
			return normal$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPMENT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsProto.equipment", "equipment", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentProto; });

		private var equipment$field:app.message.EquipmentProto;

		public function clearEquipment():void {
			equipment$field = null;
		}

		public function get hasEquipment():Boolean {
			return equipment$field != null;
		}

		public function set equipment(value:app.message.EquipmentProto):void {
			equipment$field = value;
		}

		public function get equipment():app.message.EquipmentProto {
			return equipment$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsProto.mount", "mount", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountProto; });

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
		public static const PACKAGE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsProto.package", "__package", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PackageProto; });

		private var package$field:app.message.PackageProto;

		public function clearPackage():void {
			package$field = null;
		}

		public function get hasPackage():Boolean {
			return package$field != null;
		}

		public function set __package(value:app.message.PackageProto):void {
			package$field = value;
		}

		public function get __package():app.message.PackageProto {
			return package$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, count$field);
			}
			if (hasBinded) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, binded$field);
			}
			if (hasExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, expire_time$field);
			}
			if (hasNormal) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, normal$field);
			}
			if (hasEquipment) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, equipment$field);
			}
			if (hasMount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount$field);
			}
			if (hasPackage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, package$field);
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
			var count$count:uint = 0;
			var binded$count:uint = 0;
			var expire_time$count:uint = 0;
			var normal$count:uint = 0;
			var equipment$count:uint = 0;
			var mount$count:uint = 0;
			var package$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (binded$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.binded cannot be set twice.');
					}
					++binded$count;
					this.binded = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.expireTime cannot be set twice.');
					}
					++expire_time$count;
					this.expireTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 10:
					if (normal$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.normal cannot be set twice.');
					}
					++normal$count;
					this.normal = new app.message.NormalGoodsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.normal);
					break;
				case 11:
					if (equipment$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.equipment cannot be set twice.');
					}
					++equipment$count;
					this.equipment = new app.message.EquipmentProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.equipment);
					break;
				case 12:
					if (mount$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.mount cannot be set twice.');
					}
					++mount$count;
					this.mount = new app.message.MountProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mount);
					break;
				case 13:
					if (package$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsProto.__package cannot be set twice.');
					}
					++package$count;
					this.__package = new app.message.PackageProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.__package);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
