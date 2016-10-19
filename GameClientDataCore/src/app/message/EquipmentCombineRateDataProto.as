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
	import app.message.EquipmentQualityEvaluateRateDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentCombineRateDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.EquipmentCombineRateDataProto.quality", "quality", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var quality$field:int;

		private var hasField$0:uint = 0;

		public function clearQuality():void {
			hasField$0 &= 0xfffffffe;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x1;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const POINT_LOWER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentCombineRateDataProto.point_lower", "pointLower", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var point_lower$field:int;

		public function clearPointLower():void {
			hasField$0 &= 0xfffffffd;
			point_lower$field = new int();
		}

		public function get hasPointLower():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set pointLower(value:int):void {
			hasField$0 |= 0x2;
			point_lower$field = value;
		}

		public function get pointLower():int {
			return point_lower$field;
		}

		/**
		 *  @private
		 */
		public static const POINT_UPPER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentCombineRateDataProto.point_upper", "pointUpper", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var point_upper$field:int;

		public function clearPointUpper():void {
			hasField$0 &= 0xfffffffb;
			point_upper$field = new int();
		}

		public function get hasPointUpper():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set pointUpper(value:int):void {
			hasField$0 |= 0x4;
			point_upper$field = value;
		}

		public function get pointUpper():int {
			return point_upper$field;
		}

		/**
		 *  @private
		 */
		public static const RATE_DATAS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.EquipmentCombineRateDataProto.rate_datas", "rateDatas", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentQualityEvaluateRateDataProto; });

		[ArrayElementType("app.message.EquipmentQualityEvaluateRateDataProto")]
		public var rateDatas:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, quality$field);
			}
			if (hasPointLower) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, point_lower$field);
			}
			if (hasPointUpper) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, point_upper$field);
			}
			for (var rateDatas$index:uint = 0; rateDatas$index < this.rateDatas.length; ++rateDatas$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.rateDatas[rateDatas$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var quality$count:uint = 0;
			var point_lower$count:uint = 0;
			var point_upper$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineRateDataProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (point_lower$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineRateDataProto.pointLower cannot be set twice.');
					}
					++point_lower$count;
					this.pointLower = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (point_upper$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineRateDataProto.pointUpper cannot be set twice.');
					}
					++point_upper$count;
					this.pointUpper = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					this.rateDatas.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.EquipmentQualityEvaluateRateDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
