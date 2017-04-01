package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpriteStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BloodSkillObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BLOODSKILLID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodSkillObjProto.bloodSkillId", "bloodSkillId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bloodSkillId$field:int;

		private var hasField$0:uint = 0;

		public function clearBloodSkillId():void {
			hasField$0 &= 0xfffffffe;
			bloodSkillId$field = new int();
		}

		public function get hasBloodSkillId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set bloodSkillId(value:int):void {
			hasField$0 |= 0x1;
			bloodSkillId$field = value;
		}

		public function get bloodSkillId():int {
			return bloodSkillId$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOMSCORE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodSkillObjProto.randomScore", "randomScore", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var randomScore$field:int;

		public function clearRandomScore():void {
			hasField$0 &= 0xfffffffd;
			randomScore$field = new int();
		}

		public function get hasRandomScore():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set randomScore(value:int):void {
			hasField$0 |= 0x2;
			randomScore$field = value;
		}

		public function get randomScore():int {
			return randomScore$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOMSTAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.BloodSkillObjProto.randomStat", "randomStat", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var randomStat$field:app.message.SpriteStatProto;

		public function clearRandomStat():void {
			randomStat$field = null;
		}

		public function get hasRandomStat():Boolean {
			return randomStat$field != null;
		}

		public function set randomStat(value:app.message.SpriteStatProto):void {
			randomStat$field = value;
		}

		public function get randomStat():app.message.SpriteStatProto {
			return randomStat$field;
		}

		/**
		 *  @private
		 */
		public static const MINVALUE:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BloodSkillObjProto.minValue", "minValue", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var minValue$field:Int64;

		public function clearMinValue():void {
			minValue$field = null;
		}

		public function get hasMinValue():Boolean {
			return minValue$field != null;
		}

		public function set minValue(value:Int64):void {
			minValue$field = value;
		}

		public function get minValue():Int64 {
			return minValue$field;
		}

		/**
		 *  @private
		 */
		public static const MAXVALUE:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.BloodSkillObjProto.maxValue", "maxValue", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var maxValue$field:Int64;

		public function clearMaxValue():void {
			maxValue$field = null;
		}

		public function get hasMaxValue():Boolean {
			return maxValue$field != null;
		}

		public function set maxValue(value:Int64):void {
			maxValue$field = value;
		}

		public function get maxValue():Int64 {
			return maxValue$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBloodSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, bloodSkillId$field);
			}
			if (hasRandomScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, randomScore$field);
			}
			if (hasRandomStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, randomStat$field);
			}
			if (hasMinValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, minValue$field);
			}
			if (hasMaxValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, maxValue$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var bloodSkillId$count:uint = 0;
			var randomScore$count:uint = 0;
			var randomStat$count:uint = 0;
			var minValue$count:uint = 0;
			var maxValue$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (bloodSkillId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillObjProto.bloodSkillId cannot be set twice.');
					}
					++bloodSkillId$count;
					this.bloodSkillId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (randomScore$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillObjProto.randomScore cannot be set twice.');
					}
					++randomScore$count;
					this.randomScore = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (randomStat$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillObjProto.randomStat cannot be set twice.');
					}
					++randomStat$count;
					this.randomStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.randomStat);
					break;
				case 5:
					if (minValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillObjProto.minValue cannot be set twice.');
					}
					++minValue$count;
					this.minValue = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (maxValue$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillObjProto.maxValue cannot be set twice.');
					}
					++maxValue$count;
					this.maxValue = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
