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
	public dynamic final class TouJingTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TouJingTaskProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const QUALITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.TouJingTaskProto.quality", "quality", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		public function clearQuality():void {
			hasField$0 &= 0xfffffffd;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x2;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TOU_SUCCESS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.TouJingTaskProto.is_tou_success", "isTouSuccess", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_tou_success$field:Boolean;

		public function clearIsTouSuccess():void {
			hasField$0 &= 0xfffffffb;
			is_tou_success$field = new Boolean();
		}

		public function get hasIsTouSuccess():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isTouSuccess(value:Boolean):void {
			hasField$0 |= 0x4;
			is_tou_success$field = value;
		}

		public function get isTouSuccess():Boolean {
			return is_tou_success$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_SEQUENCE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TouJingTaskProto.country_sequence", "countrySequence", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_sequence$field:int;

		public function clearCountrySequence():void {
			hasField$0 &= 0xfffffff7;
			country_sequence$field = new int();
		}

		public function get hasCountrySequence():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set countrySequence(value:int):void {
			hasField$0 |= 0x8;
			country_sequence$field = value;
		}

		public function get countrySequence():int {
			return country_sequence$field;
		}

		/**
		 *  @private
		 */
		public static const IS_IN_TOU_JING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.TouJingTaskProto.is_in_tou_jing", "isInTouJing", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_in_tou_jing$field:Boolean;

		public function clearIsInTouJing():void {
			hasField$0 &= 0xffffffef;
			is_in_tou_jing$field = new Boolean();
		}

		public function get hasIsInTouJing():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isInTouJing(value:Boolean):void {
			hasField$0 |= 0x10;
			is_in_tou_jing$field = value;
		}

		public function get isInTouJing():Boolean {
			return is_in_tou_jing$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, quality$field);
			}
			if (hasIsTouSuccess) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_tou_success$field);
			}
			if (hasCountrySequence) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country_sequence$field);
			}
			if (hasIsInTouJing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_in_tou_jing$field);
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
			var quality$count:uint = 0;
			var is_tou_success$count:uint = 0;
			var country_sequence$count:uint = 0;
			var is_in_tou_jing$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingTaskProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingTaskProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (is_tou_success$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingTaskProto.isTouSuccess cannot be set twice.');
					}
					++is_tou_success$count;
					this.isTouSuccess = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if (country_sequence$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingTaskProto.countrySequence cannot be set twice.');
					}
					++country_sequence$count;
					this.countrySequence = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (is_in_tou_jing$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouJingTaskProto.isInTouJing cannot be set twice.');
					}
					++is_in_tou_jing$count;
					this.isInTouJing = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
