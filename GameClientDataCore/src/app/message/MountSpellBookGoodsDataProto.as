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
	public dynamic final class MountSpellBookGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPELL_GROUP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountSpellBookGoodsDataProto.spell_group", "spellGroup", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var spell_group$field:int;

		private var hasField$0:uint = 0;

		public function clearSpellGroup():void {
			hasField$0 &= 0xfffffffe;
			spell_group$field = new int();
		}

		public function get hasSpellGroup():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set spellGroup(value:int):void {
			hasField$0 |= 0x1;
			spell_group$field = value;
		}

		public function get spellGroup():int {
			return spell_group$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_GROUP_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MountSpellBookGoodsDataProto.spell_group_name", "spellGroupName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var spell_group_name$field:String;

		public function clearSpellGroupName():void {
			spell_group_name$field = null;
		}

		public function get hasSpellGroupName():Boolean {
			return spell_group_name$field != null;
		}

		public function set spellGroupName(value:String):void {
			spell_group_name$field = value;
		}

		public function get spellGroupName():String {
			return spell_group_name$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MountSpellBookGoodsDataProto.spell_level", "spellLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var spell_level$field:int;

		public function clearSpellLevel():void {
			hasField$0 &= 0xfffffffd;
			spell_level$field = new int();
		}

		public function get hasSpellLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set spellLevel(value:int):void {
			hasField$0 |= 0x2;
			spell_level$field = value;
		}

		public function get spellLevel():int {
			return spell_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpellGroup) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, spell_group$field);
			}
			if (hasSpellGroupName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, spell_group_name$field);
			}
			if (hasSpellLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, spell_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var spell_group$count:uint = 0;
			var spell_group_name$count:uint = 0;
			var spell_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (spell_group$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpellBookGoodsDataProto.spellGroup cannot be set twice.');
					}
					++spell_group$count;
					this.spellGroup = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (spell_group_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpellBookGoodsDataProto.spellGroupName cannot be set twice.');
					}
					++spell_group_name$count;
					this.spellGroupName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (spell_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountSpellBookGoodsDataProto.spellLevel cannot be set twice.');
					}
					++spell_level$count;
					this.spellLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
