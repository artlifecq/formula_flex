package app.message.BaZhenTuDungeonProto {
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
	public dynamic final class BaZhenTuMonsterSpellProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPELL_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto.spell_id", "spellId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var spell_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSpellId():void {
			hasField$0 &= 0xfffffffe;
			spell_id$field = new int();
		}

		public function get hasSpellId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set spellId(value:int):void {
			hasField$0 |= 0x1;
			spell_id$field = value;
		}

		public function get spellId():int {
			return spell_id$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto.spell_name", "spellName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var spell_name$field:String;

		public function clearSpellName():void {
			spell_name$field = null;
		}

		public function get hasSpellName():Boolean {
			return spell_name$field != null;
		}

		public function set spellName(value:String):void {
			spell_name$field = value;
		}

		public function get spellName():String {
			return spell_name$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto.spell_desc", "spellDesc", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var spell_desc$field:String;

		public function clearSpellDesc():void {
			spell_desc$field = null;
		}

		public function get hasSpellDesc():Boolean {
			return spell_desc$field != null;
		}

		public function set spellDesc(value:String):void {
			spell_desc$field = value;
		}

		public function get spellDesc():String {
			return spell_desc$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto.spell_icon", "spellIcon", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var spell_icon$field:String;

		public function clearSpellIcon():void {
			spell_icon$field = null;
		}

		public function get hasSpellIcon():Boolean {
			return spell_icon$field != null;
		}

		public function set spellIcon(value:String):void {
			spell_icon$field = value;
		}

		public function get spellIcon():String {
			return spell_icon$field;
		}

		/**
		 *  @private
		 */
		public static const MON_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.BaZhenTuDungeonProto.BaZhenTuMonsterSpellProto.mon_count", "monCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mon_count$field:int;

		public function clearMonCount():void {
			hasField$0 &= 0xfffffffd;
			mon_count$field = new int();
		}

		public function get hasMonCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set monCount(value:int):void {
			hasField$0 |= 0x2;
			mon_count$field = value;
		}

		public function get monCount():int {
			return mon_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpellId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, spell_id$field);
			}
			if (hasSpellName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, spell_name$field);
			}
			if (hasSpellDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, spell_desc$field);
			}
			if (hasSpellIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, spell_icon$field);
			}
			if (hasMonCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mon_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var spell_id$count:uint = 0;
			var spell_name$count:uint = 0;
			var spell_desc$count:uint = 0;
			var spell_icon$count:uint = 0;
			var mon_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (spell_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuMonsterSpellProto.spellId cannot be set twice.');
					}
					++spell_id$count;
					this.spellId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (spell_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuMonsterSpellProto.spellName cannot be set twice.');
					}
					++spell_name$count;
					this.spellName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (spell_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuMonsterSpellProto.spellDesc cannot be set twice.');
					}
					++spell_desc$count;
					this.spellDesc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (spell_icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuMonsterSpellProto.spellIcon cannot be set twice.');
					}
					++spell_icon$count;
					this.spellIcon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (mon_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaZhenTuMonsterSpellProto.monCount cannot be set twice.');
					}
					++mon_count$count;
					this.monCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
