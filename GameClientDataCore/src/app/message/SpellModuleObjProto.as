package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto;
	import app.message.SpellCoolDownProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPELL_COOL_DOWN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SpellModuleObjProto.spell_cool_down", "spellCoolDown", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellCoolDownProto; });

		private var spell_cool_down$field:app.message.SpellCoolDownProto;

		public function clearSpellCoolDown():void {
			spell_cool_down$field = null;
		}

		public function get hasSpellCoolDown():Boolean {
			return spell_cool_down$field != null;
		}

		public function set spellCoolDown(value:app.message.SpellCoolDownProto):void {
			spell_cool_down$field = value;
		}

		public function get spellCoolDown():app.message.SpellCoolDownProto {
			return spell_cool_down$field;
		}

		/**
		 *  @private
		 */
		public static const LEARN_RACE_SPELLS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SpellModuleObjProto.learn_race_spells", "learnRaceSpells", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto; });

		private var learn_race_spells$field:app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto;

		public function clearLearnRaceSpells():void {
			learn_race_spells$field = null;
		}

		public function get hasLearnRaceSpells():Boolean {
			return learn_race_spells$field != null;
		}

		public function set learnRaceSpells(value:app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto):void {
			learn_race_spells$field = value;
		}

		public function get learnRaceSpells():app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto {
			return learn_race_spells$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpellCoolDown) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, spell_cool_down$field);
			}
			if (hasLearnRaceSpells) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, learn_race_spells$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var spell_cool_down$count:uint = 0;
			var learn_race_spells$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (spell_cool_down$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellModuleObjProto.spellCoolDown cannot be set twice.');
					}
					++spell_cool_down$count;
					this.spellCoolDown = new app.message.SpellCoolDownProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.spellCoolDown);
					break;
				case 2:
					if (learn_race_spells$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellModuleObjProto.learnRaceSpells cannot be set twice.');
					}
					++learn_race_spells$count;
					this.learnRaceSpells = new app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.learnRaceSpells);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
