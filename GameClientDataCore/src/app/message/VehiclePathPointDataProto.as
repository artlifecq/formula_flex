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
	public dynamic final class VehiclePathPointDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VehiclePathPointDataProto.x", "x", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var x$field:int;

		private var hasField$0:uint = 0;

		public function clearX():void {
			hasField$0 &= 0xfffffffe;
			x$field = new int();
		}

		public function get hasX():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set x(value:int):void {
			hasField$0 |= 0x1;
			x$field = value;
		}

		public function get x():int {
			return x$field;
		}

		/**
		 *  @private
		 */
		public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VehiclePathPointDataProto.y", "y", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var y$field:int;

		public function clearY():void {
			hasField$0 &= 0xfffffffd;
			y$field = new int();
		}

		public function get hasY():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set y(value:int):void {
			hasField$0 |= 0x2;
			y$field = value;
		}

		public function get y():int {
			return y$field;
		}

		/**
		 *  @private
		 */
		public static const Z:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VehiclePathPointDataProto.z", "z", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var z$field:int;

		public function clearZ():void {
			hasField$0 &= 0xfffffffb;
			z$field = new int();
		}

		public function get hasZ():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set z(value:int):void {
			hasField$0 |= 0x4;
			z$field = value;
		}

		public function get z():int {
			return z$field;
		}

		/**
		 *  @private
		 */
		public static const SPEED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VehiclePathPointDataProto.speed", "speed", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var speed$field:int;

		public function clearSpeed():void {
			hasField$0 &= 0xfffffff7;
			speed$field = new int();
		}

		public function get hasSpeed():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set speed(value:int):void {
			hasField$0 |= 0x8;
			speed$field = value;
		}

		public function get speed():int {
			return speed$field;
		}

		/**
		 *  @private
		 */
		public static const TILT_ANGLE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VehiclePathPointDataProto.tilt_angle", "tiltAngle", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tilt_angle$field:int;

		public function clearTiltAngle():void {
			hasField$0 &= 0xffffffef;
			tilt_angle$field = new int();
		}

		public function get hasTiltAngle():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set tiltAngle(value:int):void {
			hasField$0 |= 0x10;
			tilt_angle$field = value;
		}

		public function get tiltAngle():int {
			return tilt_angle$field;
		}

		/**
		 *  @private
		 */
		public static const BASE_ACTION_SPEED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VehiclePathPointDataProto.base_action_speed", "baseActionSpeed", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var base_action_speed$field:int;

		public function clearBaseActionSpeed():void {
			hasField$0 &= 0xffffffdf;
			base_action_speed$field = new int();
		}

		public function get hasBaseActionSpeed():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set baseActionSpeed(value:int):void {
			hasField$0 |= 0x20;
			base_action_speed$field = value;
		}

		public function get baseActionSpeed():int {
			return base_action_speed$field;
		}

		/**
		 *  @private
		 */
		public static const STATUS_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VehiclePathPointDataProto.status_type", "statusType", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var status_type$field:int;

		public function clearStatusType():void {
			hasField$0 &= 0xffffffbf;
			status_type$field = new int();
		}

		public function get hasStatusType():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set statusType(value:int):void {
			hasField$0 |= 0x40;
			status_type$field = value;
		}

		public function get statusType():int {
			return status_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, x$field);
			}
			if (hasY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, y$field);
			}
			if (hasZ) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, z$field);
			}
			if (hasSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, speed$field);
			}
			if (hasTiltAngle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tilt_angle$field);
			}
			if (hasBaseActionSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, base_action_speed$field);
			}
			if (hasStatusType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, status_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var x$count:uint = 0;
			var y$count:uint = 0;
			var z$count:uint = 0;
			var speed$count:uint = 0;
			var tilt_angle$count:uint = 0;
			var base_action_speed$count:uint = 0;
			var status_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (x$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathPointDataProto.x cannot be set twice.');
					}
					++x$count;
					this.x = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (y$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathPointDataProto.y cannot be set twice.');
					}
					++y$count;
					this.y = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (z$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathPointDataProto.z cannot be set twice.');
					}
					++z$count;
					this.z = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathPointDataProto.speed cannot be set twice.');
					}
					++speed$count;
					this.speed = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (tilt_angle$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathPointDataProto.tiltAngle cannot be set twice.');
					}
					++tilt_angle$count;
					this.tiltAngle = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (base_action_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathPointDataProto.baseActionSpeed cannot be set twice.');
					}
					++base_action_speed$count;
					this.baseActionSpeed = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (status_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: VehiclePathPointDataProto.statusType cannot be set twice.');
					}
					++status_type$count;
					this.statusType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
