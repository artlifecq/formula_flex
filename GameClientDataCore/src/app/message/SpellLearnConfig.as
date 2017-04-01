package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	import app.message.SpellLearnRaceProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellLearnConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RACE_SPELLS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.SpellLearnConfig.race_spells", "raceSpells", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellLearnRaceProto; });

		[ArrayElementType("app.message.SpellLearnRaceProto")]
		public var raceSpells:Array = [];

		/**
		 *  @private
		 */
		public static const CLEAR_SPELL_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellLearnConfig.clear_spell_cost", "clearSpellCost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var clear_spell_cost$field:app.message.UpgradeProto;

		public function clearClearSpellCost():void {
			clear_spell_cost$field = null;
		}

		public function get hasClearSpellCost():Boolean {
			return clear_spell_cost$field != null;
		}

		public function set clearSpellCost(value:app.message.UpgradeProto):void {
			clear_spell_cost$field = value;
		}

		public function get clearSpellCost():app.message.UpgradeProto {
			return clear_spell_cost$field;
		}

		/**
		 *  @private
		 */
		public static const CLEAR_SPELL_FREE_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellLearnConfig.clear_spell_free_level", "clearSpellFreeLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var clear_spell_free_level$field:int;

		private var hasField$0:uint = 0;

		public function clearClearSpellFreeLevel():void {
			hasField$0 &= 0xfffffffe;
			clear_spell_free_level$field = new int();
		}

		public function get hasClearSpellFreeLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set clearSpellFreeLevel(value:int):void {
			hasField$0 |= 0x1;
			clear_spell_free_level$field = value;
		}

		public function get clearSpellFreeLevel():int {
			return clear_spell_free_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var raceSpells$index:uint = 0; raceSpells$index < this.raceSpells.length; ++raceSpells$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.raceSpells[raceSpells$index]);
			}
			if (hasClearSpellCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, clear_spell_cost$field);
			}
			if (hasClearSpellFreeLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, clear_spell_free_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var clear_spell_cost$count:uint = 0;
			var clear_spell_free_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.raceSpells.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.SpellLearnRaceProto()));
					break;
				case 2:
					if (clear_spell_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnConfig.clearSpellCost cannot be set twice.');
					}
					++clear_spell_cost$count;
					this.clearSpellCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.clearSpellCost);
					break;
				case 3:
					if (clear_spell_free_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnConfig.clearSpellFreeLevel cannot be set twice.');
					}
					++clear_spell_free_level$count;
					this.clearSpellFreeLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
