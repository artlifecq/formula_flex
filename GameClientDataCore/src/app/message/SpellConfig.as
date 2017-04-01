package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AnimationConfig;
	import app.message.GcdGroupsConfig;
	import app.message.SpellEffectConfig;
	import app.message.StateConfig;
	import app.message.SpellLearnConfig;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GCD_GROUPS_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellConfig.gcd_groups_config", "gcdGroupsConfig", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GcdGroupsConfig; });

		private var gcd_groups_config$field:app.message.GcdGroupsConfig;

		public function clearGcdGroupsConfig():void {
			gcd_groups_config$field = null;
		}

		public function get hasGcdGroupsConfig():Boolean {
			return gcd_groups_config$field != null;
		}

		public function set gcdGroupsConfig(value:app.message.GcdGroupsConfig):void {
			gcd_groups_config$field = value;
		}

		public function get gcdGroupsConfig():app.message.GcdGroupsConfig {
			return gcd_groups_config$field;
		}

		/**
		 *  @private
		 */
		public static const ANIMATION_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellConfig.animation_config", "animationConfig", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AnimationConfig; });

		private var animation_config$field:app.message.AnimationConfig;

		public function clearAnimationConfig():void {
			animation_config$field = null;
		}

		public function get hasAnimationConfig():Boolean {
			return animation_config$field != null;
		}

		public function set animationConfig(value:app.message.AnimationConfig):void {
			animation_config$field = value;
		}

		public function get animationConfig():app.message.AnimationConfig {
			return animation_config$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_EFFECT_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellConfig.spell_effect_config", "spellEffectConfig", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellEffectConfig; });

		private var spell_effect_config$field:app.message.SpellEffectConfig;

		public function clearSpellEffectConfig():void {
			spell_effect_config$field = null;
		}

		public function get hasSpellEffectConfig():Boolean {
			return spell_effect_config$field != null;
		}

		public function set spellEffectConfig(value:app.message.SpellEffectConfig):void {
			spell_effect_config$field = value;
		}

		public function get spellEffectConfig():app.message.SpellEffectConfig {
			return spell_effect_config$field;
		}

		/**
		 *  @private
		 */
		public static const STATE_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellConfig.state_config", "stateConfig", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StateConfig; });

		private var state_config$field:app.message.StateConfig;

		public function clearStateConfig():void {
			state_config$field = null;
		}

		public function get hasStateConfig():Boolean {
			return state_config$field != null;
		}

		public function set stateConfig(value:app.message.StateConfig):void {
			state_config$field = value;
		}

		public function get stateConfig():app.message.StateConfig {
			return state_config$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_LEARN_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellConfig.spell_learn_config", "spellLearnConfig", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellLearnConfig; });

		private var spell_learn_config$field:app.message.SpellLearnConfig;

		public function clearSpellLearnConfig():void {
			spell_learn_config$field = null;
		}

		public function get hasSpellLearnConfig():Boolean {
			return spell_learn_config$field != null;
		}

		public function set spellLearnConfig(value:app.message.SpellLearnConfig):void {
			spell_learn_config$field = value;
		}

		public function get spellLearnConfig():app.message.SpellLearnConfig {
			return spell_learn_config$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGcdGroupsConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, gcd_groups_config$field);
			}
			if (hasAnimationConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, animation_config$field);
			}
			if (hasSpellEffectConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, spell_effect_config$field);
			}
			if (hasStateConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, state_config$field);
			}
			if (hasSpellLearnConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, spell_learn_config$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gcd_groups_config$count:uint = 0;
			var animation_config$count:uint = 0;
			var spell_effect_config$count:uint = 0;
			var state_config$count:uint = 0;
			var spell_learn_config$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gcd_groups_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellConfig.gcdGroupsConfig cannot be set twice.');
					}
					++gcd_groups_config$count;
					this.gcdGroupsConfig = new app.message.GcdGroupsConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.gcdGroupsConfig);
					break;
				case 2:
					if (animation_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellConfig.animationConfig cannot be set twice.');
					}
					++animation_config$count;
					this.animationConfig = new app.message.AnimationConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.animationConfig);
					break;
				case 3:
					if (spell_effect_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellConfig.spellEffectConfig cannot be set twice.');
					}
					++spell_effect_config$count;
					this.spellEffectConfig = new app.message.SpellEffectConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.spellEffectConfig);
					break;
				case 4:
					if (state_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellConfig.stateConfig cannot be set twice.');
					}
					++state_config$count;
					this.stateConfig = new app.message.StateConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.stateConfig);
					break;
				case 5:
					if (spell_learn_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellConfig.spellLearnConfig cannot be set twice.');
					}
					++spell_learn_config$count;
					this.spellLearnConfig = new app.message.SpellLearnConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.spellLearnConfig);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
