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
	public dynamic final class BloodSkillProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SKILL_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodSkillProto.skill_id", "skillId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSkillId():void {
			hasField$0 &= 0xfffffffe;
			skill_id$field = new int();
		}

		public function get hasSkillId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set skillId(value:int):void {
			hasField$0 |= 0x1;
			skill_id$field = value;
		}

		public function get skillId():int {
			return skill_id$field;
		}

		/**
		 *  @private
		 */
		public static const ICON:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.BloodSkillProto.icon", "icon", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var icon$field:String;

		public function clearIcon():void {
			icon$field = null;
		}

		public function get hasIcon():Boolean {
			return icon$field != null;
		}

		public function set icon(value:String):void {
			icon$field = value;
		}

		public function get icon():String {
			return icon$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.BloodSkillProto.name", "name", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_QUALITY:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.BloodSkillProto.skill_quality", "skillQuality", (8 << 3) | com.netease.protobuf.WireType.VARINT, app.message.Quality);

		private var skill_quality$field:int;

		public function clearSkillQuality():void {
			hasField$0 &= 0xfffffffd;
			skill_quality$field = new int();
		}

		public function get hasSkillQuality():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set skillQuality(value:int):void {
			hasField$0 |= 0x2;
			skill_quality$field = value;
		}

		public function get skillQuality():int {
			return skill_quality$field;
		}

		/**
		 *  @private
		 */
		public static const SKILL_BASE_SCORE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BloodSkillProto.skill_base_score", "skillBaseScore", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skill_base_score$field:int;

		public function clearSkillBaseScore():void {
			hasField$0 &= 0xfffffffb;
			skill_base_score$field = new int();
		}

		public function get hasSkillBaseScore():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set skillBaseScore(value:int):void {
			hasField$0 |= 0x4;
			skill_base_score$field = value;
		}

		public function get skillBaseScore():int {
			return skill_base_score$field;
		}

		/**
		 *  @private
		 */
		public static const DESC:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.BloodSkillProto.desc", "desc", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, skill_id$field);
			}
			if (hasIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, icon$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasSkillQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, skill_quality$field);
			}
			if (hasSkillBaseScore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, skill_base_score$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, desc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var skill_id$count:uint = 0;
			var icon$count:uint = 0;
			var name$count:uint = 0;
			var skill_quality$count:uint = 0;
			var skill_base_score$count:uint = 0;
			var desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (skill_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillProto.skillId cannot be set twice.');
					}
					++skill_id$count;
					this.skillId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillProto.icon cannot be set twice.');
					}
					++icon$count;
					this.icon = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 8:
					if (skill_quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillProto.skillQuality cannot be set twice.');
					}
					++skill_quality$count;
					this.skillQuality = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 9:
					if (skill_base_score$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillProto.skillBaseScore cannot be set twice.');
					}
					++skill_base_score$count;
					this.skillBaseScore = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: BloodSkillProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
