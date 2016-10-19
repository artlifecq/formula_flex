package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellLearnProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PRE_SPELL_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SpellLearnProto.pre_spell_type", "preSpellType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pre_spell_type$field:int;

		private var hasField$0:uint = 0;

		public function clearPreSpellType():void {
			hasField$0 &= 0xfffffffe;
			pre_spell_type$field = new int();
		}

		public function get hasPreSpellType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set preSpellType(value:int):void {
			hasField$0 |= 0x1;
			pre_spell_type$field = value;
		}

		public function get preSpellType():int {
			return pre_spell_type$field;
		}

		/**
		 *  @private
		 */
		public static const PRE_SPELL_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SpellLearnProto.pre_spell_level", "preSpellLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pre_spell_level$field:int;

		public function clearPreSpellLevel():void {
			hasField$0 &= 0xfffffffd;
			pre_spell_level$field = new int();
		}

		public function get hasPreSpellLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set preSpellLevel(value:int):void {
			hasField$0 |= 0x2;
			pre_spell_level$field = value;
		}

		public function get preSpellLevel():int {
			return pre_spell_level$field;
		}

		/**
		 *  @private
		 */
		public static const CATEGORY_COST_SPELL_POINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SpellLearnProto.category_cost_spell_point", "categoryCostSpellPoint", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var category_cost_spell_point$field:int;

		public function clearCategoryCostSpellPoint():void {
			hasField$0 &= 0xfffffffb;
			category_cost_spell_point$field = new int();
		}

		public function get hasCategoryCostSpellPoint():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set categoryCostSpellPoint(value:int):void {
			hasField$0 |= 0x4;
			category_cost_spell_point$field = value;
		}

		public function get categoryCostSpellPoint():int {
			return category_cost_spell_point$field;
		}

		/**
		 *  @private
		 */
		public static const SLOT_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SpellLearnProto.slot_index", "slotIndex", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var slot_index$field:int;

		public function clearSlotIndex():void {
			hasField$0 &= 0xfffffff7;
			slot_index$field = new int();
		}

		public function get hasSlotIndex():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set slotIndex(value:int):void {
			hasField$0 |= 0x8;
			slot_index$field = value;
		}

		public function get slotIndex():int {
			return slot_index$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SpellLearnProto.spell", "spell", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto; });

		private var spell$field:app.message.SpellProto;

		public function clearSpell():void {
			spell$field = null;
		}

		public function get hasSpell():Boolean {
			return spell$field != null;
		}

		public function set spell(value:app.message.SpellProto):void {
			spell$field = value;
		}

		public function get spell():app.message.SpellProto {
			return spell$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPreSpellType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, pre_spell_type$field);
			}
			if (hasPreSpellLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, pre_spell_level$field);
			}
			if (hasCategoryCostSpellPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, category_cost_spell_point$field);
			}
			if (hasSlotIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, slot_index$field);
			}
			if (hasSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, spell$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pre_spell_type$count:uint = 0;
			var pre_spell_level$count:uint = 0;
			var category_cost_spell_point$count:uint = 0;
			var slot_index$count:uint = 0;
			var spell$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pre_spell_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnProto.preSpellType cannot be set twice.');
					}
					++pre_spell_type$count;
					this.preSpellType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (pre_spell_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnProto.preSpellLevel cannot be set twice.');
					}
					++pre_spell_level$count;
					this.preSpellLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (category_cost_spell_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnProto.categoryCostSpellPoint cannot be set twice.');
					}
					++category_cost_spell_point$count;
					this.categoryCostSpellPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (slot_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnProto.slotIndex cannot be set twice.');
					}
					++slot_index$count;
					this.slotIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnProto.spell cannot be set twice.');
					}
					++spell$count;
					this.spell = new app.message.SpellProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.spell);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
