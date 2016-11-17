package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Quality;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MiXinTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MiXinTaskProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MiXinTaskProto.accept_times", "acceptTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accept_times$field:int;

		public function clearAcceptTimes():void {
			hasField$0 &= 0xfffffffd;
			accept_times$field = new int();
		}

		public function get hasAcceptTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set acceptTimes(value:int):void {
			hasField$0 |= 0x2;
			accept_times$field = value;
		}

		public function get acceptTimes():int {
			return accept_times$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.MiXinTaskProto.quality", "quality", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		public function clearQuality():void {
			hasField$0 &= 0xfffffffb;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x4;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const NEXT_RANDOM_MI_XIN_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.MiXinTaskProto.next_random_mi_xin_time", "nextRandomMiXinTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var next_random_mi_xin_time$field:Int64;

		public function clearNextRandomMiXinTime():void {
			next_random_mi_xin_time$field = null;
		}

		public function get hasNextRandomMiXinTime():Boolean {
			return next_random_mi_xin_time$field != null;
		}

		public function set nextRandomMiXinTime(value:Int64):void {
			next_random_mi_xin_time$field = value;
		}

		public function get nextRandomMiXinTime():Int64 {
			return next_random_mi_xin_time$field;
		}

		/**
		 *  @private
		 */
		public static const IS_IN_MI_XIN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.MiXinTaskProto.is_in_mi_xin", "isInMiXin", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_in_mi_xin$field:Boolean;

		public function clearIsInMiXin():void {
			hasField$0 &= 0xfffffff7;
			is_in_mi_xin$field = new Boolean();
		}

		public function get hasIsInMiXin():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isInMiXin(value:Boolean):void {
			hasField$0 |= 0x8;
			is_in_mi_xin$field = value;
		}

		public function get isInMiXin():Boolean {
			return is_in_mi_xin$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasAcceptTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, accept_times$field);
			}
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, quality$field);
			}
			if (hasNextRandomMiXinTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, next_random_mi_xin_time$field);
			}
			if (hasIsInMiXin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_in_mi_xin$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level$count:uint = 0;
			var accept_times$count:uint = 0;
			var quality$count:uint = 0;
			var next_random_mi_xin_time$count:uint = 0;
			var is_in_mi_xin$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinTaskProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (accept_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinTaskProto.acceptTimes cannot be set twice.');
					}
					++accept_times$count;
					this.acceptTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinTaskProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if (next_random_mi_xin_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinTaskProto.nextRandomMiXinTime cannot be set twice.');
					}
					++next_random_mi_xin_time$count;
					this.nextRandomMiXinTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (is_in_mi_xin$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinTaskProto.isInMiXin cannot be set twice.');
					}
					++is_in_mi_xin$count;
					this.isInMiXin = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
