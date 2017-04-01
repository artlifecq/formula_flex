package app.message.FamilyModuleObjProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import app.message.FamilyOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAMILY_NAME:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.FamilyModuleObjProto.FamilyInfoProto.family_name", "familyName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var family_name$field:flash.utils.ByteArray;

		public function clearFamilyName():void {
			family_name$field = null;
		}

		public function get hasFamilyName():Boolean {
			return family_name$field != null;
		}

		public function set familyName(value:flash.utils.ByteArray):void {
			family_name$field = value;
		}

		public function get familyName():flash.utils.ByteArray {
			return family_name$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyModuleObjProto.FamilyInfoProto.family_level", "familyLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_level$field:int;

		private var hasField$0:uint = 0;

		public function clearFamilyLevel():void {
			hasField$0 &= 0xfffffffe;
			family_level$field = new int();
		}

		public function get hasFamilyLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set familyLevel(value:int):void {
			hasField$0 |= 0x1;
			family_level$field = value;
		}

		public function get familyLevel():int {
			return family_level$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_CONTRIBUTION:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyModuleObjProto.FamilyInfoProto.family_contribution", "familyContribution", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_contribution$field:Int64;

		public function clearFamilyContribution():void {
			family_contribution$field = null;
		}

		public function get hasFamilyContribution():Boolean {
			return family_contribution$field != null;
		}

		public function set familyContribution(value:Int64):void {
			family_contribution$field = value;
		}

		public function get familyContribution():Int64 {
			return family_contribution$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_MASK:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyModuleObjProto.FamilyInfoProto.family_mask", "familyMask", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var family_mask$field:int;

		public function clearFamilyMask():void {
			hasField$0 &= 0xfffffffd;
			family_mask$field = new int();
		}

		public function get hasFamilyMask():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set familyMask(value:int):void {
			hasField$0 |= 0x2;
			family_mask$field = value;
		}

		public function get familyMask():int {
			return family_mask$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.FamilyModuleObjProto.FamilyInfoProto.cur_pos", "curPos", (7 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FamilyOfficerPos);

		private var cur_pos$field:int;

		public function clearCurPos():void {
			hasField$0 &= 0xfffffffb;
			cur_pos$field = new int();
		}

		public function get hasCurPos():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set curPos(value:int):void {
			hasField$0 |= 0x4;
			cur_pos$field = value;
		}

		public function get curPos():int {
			return cur_pos$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFamilyName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, family_name$field);
			}
			if (hasFamilyLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, family_level$field);
			}
			if (hasFamilyContribution) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, family_contribution$field);
			}
			if (hasFamilyMask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, family_mask$field);
			}
			if (hasCurPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, cur_pos$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var family_name$count:uint = 0;
			var family_level$count:uint = 0;
			var family_contribution$count:uint = 0;
			var family_mask$count:uint = 0;
			var cur_pos$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (family_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInfoProto.familyName cannot be set twice.');
					}
					++family_name$count;
					this.familyName = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 2:
					if (family_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInfoProto.familyLevel cannot be set twice.');
					}
					++family_level$count;
					this.familyLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (family_contribution$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInfoProto.familyContribution cannot be set twice.');
					}
					++family_contribution$count;
					this.familyContribution = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 6:
					if (family_mask$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInfoProto.familyMask cannot be set twice.');
					}
					++family_mask$count;
					this.familyMask = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (cur_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyInfoProto.curPos cannot be set twice.');
					}
					++cur_pos$count;
					this.curPos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
