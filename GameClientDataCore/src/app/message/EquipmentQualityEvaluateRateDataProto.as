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
	import app.message.Evaluate;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentQualityEvaluateRateDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentQualityEvaluateRateDataProto.quality", "quality", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

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
		public static const EVALUATE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.EquipmentQualityEvaluateRateDataProto.evaluate", "evaluate", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Evaluate);

		private var evaluate$field:int;

		public function clearEvaluate():void {
			hasField$0 &= 0xfffffffd;
			evaluate$field = new int();
		}

		public function get hasEvaluate():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set evaluate(value:int):void {
			hasField$0 |= 0x2;
			evaluate$field = value;
		}

		public function get evaluate():int {
			return evaluate$field;
		}

		/**
		 *  @private
		 */
		public static const RATE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentQualityEvaluateRateDataProto.rate", "rate", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rate$field:int;

		public function clearRate():void {
			hasField$0 &= 0xfffffffb;
			rate$field = new int();
		}

		public function get hasRate():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set rate(value:int):void {
			hasField$0 |= 0x4;
			rate$field = value;
		}

		public function get rate():int {
			return rate$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, quality$field);
			}
			if (hasEvaluate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, evaluate$field);
			}
			if (hasRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, rate$field);
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
			var evaluate$count:uint = 0;
			var rate$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentQualityEvaluateRateDataProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (evaluate$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentQualityEvaluateRateDataProto.evaluate cannot be set twice.');
					}
					++evaluate$count;
					this.evaluate = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (rate$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentQualityEvaluateRateDataProto.rate cannot be set twice.');
					}
					++rate$count;
					this.rate = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
