package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.RaceId;
	import app.message.ActiveSpellProto;
	import app.message.SpellProto.NextSpellProto;
	import app.message.SecondWeaponType;
	import app.message.PassiveSpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SpellProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const SPELL_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.spell_type", "spellType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var spell_type$field:int;

		private var hasField$0:uint = 0;

		public function clearSpellType():void {
			hasField$0 &= 0xfffffffe;
			spell_type$field = new int();
		}

		public function get hasSpellType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set spellType(value:int):void {
			hasField$0 |= 0x1;
			spell_type$field = value;
		}

		public function get spellType():int {
			return spell_type$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.spell_level", "spellLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const RACE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.SpellProto.race", "race", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.RaceId);

		private var race$field:int;

		public function clearRace():void {
			hasField$0 &= 0xfffffffb;
			race$field = new int();
		}

		public function get hasRace():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set race(value:int):void {
			hasField$0 |= 0x4;
			race$field = value;
		}

		public function get race():int {
			return race$field;
		}

		/**
		 *  @private
		 */
		public static const SECOND_WEAPON_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.SpellProto.second_weapon_type", "secondWeaponType", (5 << 3) | com.netease.protobuf.WireType.VARINT, app.message.SecondWeaponType);

		private var second_weapon_type$field:int;

		public function clearSecondWeaponType():void {
			hasField$0 &= 0xfffffff7;
			second_weapon_type$field = new int();
		}

		public function get hasSecondWeaponType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set secondWeaponType(value:int):void {
			hasField$0 |= 0x8;
			second_weapon_type$field = value;
		}

		public function get secondWeaponType():int {
			return second_weapon_type$field;
		}

		/**
		 *  @private
		 */
		public static const LEARN_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.learn_level", "learnLevel", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var learn_level$field:int;

		public function clearLearnLevel():void {
			hasField$0 &= 0xffffffef;
			learn_level$field = new int();
		}

		public function get hasLearnLevel():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set learnLevel(value:int):void {
			hasField$0 |= 0x10;
			learn_level$field = value;
		}

		public function get learnLevel():int {
			return learn_level$field;
		}

		/**
		 *  @private
		 */
		public static const DESCRIPTION:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SpellProto.description", "description", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var description$field:String;

		public function clearDescription():void {
			description$field = null;
		}

		public function get hasDescription():Boolean {
			return description$field != null;
		}

		public function set description(value:String):void {
			description$field = value;
		}

		public function get description():String {
			return description$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHTING_AMOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.fighting_amount", "fightingAmount", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fighting_amount$field:int;

		public function clearFightingAmount():void {
			hasField$0 &= 0xffffffdf;
			fighting_amount$field = new int();
		}

		public function get hasFightingAmount():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set fightingAmount(value:int):void {
			hasField$0 |= 0x20;
			fighting_amount$field = value;
		}

		public function get fightingAmount():int {
			return fighting_amount$field;
		}

		/**
		 *  @private
		 */
		public static const ICON:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SpellProto.icon", "icon", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const IMAGE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SpellProto.image", "image", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var image$field:String;

		public function clearImage():void {
			image$field = null;
		}

		public function get hasImage():Boolean {
			return image$field != null;
		}

		public function set image(value:String):void {
			image$field = value;
		}

		public function get image():String {
			return image$field;
		}

		/**
		 *  @private
		 */
		public static const VIDEO:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SpellProto.video", "video", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var video$field:String;

		public function clearVideo():void {
			video$field = null;
		}

		public function get hasVideo():Boolean {
			return video$field != null;
		}

		public function set video(value:String):void {
			video$field = value;
		}

		public function get video():String {
			return video$field;
		}

		/**
		 *  @private
		 */
		public static const AFFECT_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.affect_type", "affectType", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var affect_type$field:int;

		public function clearAffectType():void {
			hasField$0 &= 0xffffffbf;
			affect_type$field = new int();
		}

		public function get hasAffectType():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set affectType(value:int):void {
			hasField$0 |= 0x40;
			affect_type$field = value;
		}

		public function get affectType():int {
			return affect_type$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_ADDITIONAL_SPELL_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.been_additional_spell_type", "beenAdditionalSpellType", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var been_additional_spell_type$field:int;

		public function clearBeenAdditionalSpellType():void {
			hasField$0 &= 0xffffff7f;
			been_additional_spell_type$field = new int();
		}

		public function get hasBeenAdditionalSpellType():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set beenAdditionalSpellType(value:int):void {
			hasField$0 |= 0x80;
			been_additional_spell_type$field = value;
		}

		public function get beenAdditionalSpellType():int {
			return been_additional_spell_type$field;
		}

		/**
		 *  @private
		 */
		public static const ADDITIONAL_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.additional_percent", "additionalPercent", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var additional_percent$field:int;

		public function clearAdditionalPercent():void {
			hasField$0 &= 0xfffffeff;
			additional_percent$field = new int();
		}

		public function get hasAdditionalPercent():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set additionalPercent(value:int):void {
			hasField$0 |= 0x100;
			additional_percent$field = value;
		}

		public function get additionalPercent():int {
			return additional_percent$field;
		}

		/**
		 *  @private
		 */
		public static const ADDITIONAL_ORIGIN_VALUE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.additional_origin_value", "additionalOriginValue", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var additional_origin_value$field:int;

		public function clearAdditionalOriginValue():void {
			hasField$0 &= 0xfffffdff;
			additional_origin_value$field = new int();
		}

		public function get hasAdditionalOriginValue():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set additionalOriginValue(value:int):void {
			hasField$0 |= 0x200;
			additional_origin_value$field = value;
		}

		public function get additionalOriginValue():int {
			return additional_origin_value$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_SHOW_SPELL_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.client_show_spell_type", "clientShowSpellType", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var client_show_spell_type$field:int;

		public function clearClientShowSpellType():void {
			hasField$0 &= 0xfffffbff;
			client_show_spell_type$field = new int();
		}

		public function get hasClientShowSpellType():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set clientShowSpellType(value:int):void {
			hasField$0 |= 0x400;
			client_show_spell_type$field = value;
		}

		public function get clientShowSpellType():int {
			return client_show_spell_type$field;
		}

		/**
		 *  @private
		 */
		public static const CLIENT_SUGGEST_SPELL_ID:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.SpellProto.client_suggest_spell_id", "clientSuggestSpellId", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var clientSuggestSpellId:Array = [];

		/**
		 *  @private
		 */
		public static const ACTIVE_SPELL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellProto.active_spell", "activeSpell", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ActiveSpellProto; });

		private var active_spell$field:app.message.ActiveSpellProto;

		public function clearActiveSpell():void {
			active_spell$field = null;
		}

		public function get hasActiveSpell():Boolean {
			return active_spell$field != null;
		}

		public function set activeSpell(value:app.message.ActiveSpellProto):void {
			active_spell$field = value;
		}

		public function get activeSpell():app.message.ActiveSpellProto {
			return active_spell$field;
		}

		/**
		 *  @private
		 */
		public static const PASSIVE_SPELL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellProto.passive_spell", "passiveSpell", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PassiveSpellProto; });

		private var passive_spell$field:app.message.PassiveSpellProto;

		public function clearPassiveSpell():void {
			passive_spell$field = null;
		}

		public function get hasPassiveSpell():Boolean {
			return passive_spell$field != null;
		}

		public function set passiveSpell(value:app.message.PassiveSpellProto):void {
			passive_spell$field = value;
		}

		public function get passiveSpell():app.message.PassiveSpellProto {
			return passive_spell$field;
		}

		/**
		 *  @private
		 */
		public static const NEXT_SPELL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellProto.next_spell", "nextSpell", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto.NextSpellProto; });

		private var next_spell$field:app.message.SpellProto.NextSpellProto;

		public function clearNextSpell():void {
			next_spell$field = null;
		}

		public function get hasNextSpell():Boolean {
			return next_spell$field != null;
		}

		public function set nextSpell(value:app.message.SpellProto.NextSpellProto):void {
			next_spell$field = value;
		}

		public function get nextSpell():app.message.SpellProto.NextSpellProto {
			return next_spell$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasSpellType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, spell_type$field);
			}
			if (hasSpellLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, spell_level$field);
			}
			if (hasRace) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, race$field);
			}
			if (hasSecondWeaponType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, second_weapon_type$field);
			}
			if (hasLearnLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, learn_level$field);
			}
			if (hasDescription) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, description$field);
			}
			if (hasFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fighting_amount$field);
			}
			if (hasIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, icon$field);
			}
			if (hasImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, image$field);
			}
			if (hasVideo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, video$field);
			}
			if (hasAffectType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, affect_type$field);
			}
			if (hasBeenAdditionalSpellType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, been_additional_spell_type$field);
			}
			if (hasAdditionalPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, additional_percent$field);
			}
			if (hasAdditionalOriginValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, additional_origin_value$field);
			}
			if (hasClientShowSpellType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, client_show_spell_type$field);
			}
			for (var clientSuggestSpellId$index:uint = 0; clientSuggestSpellId$index < this.clientSuggestSpellId.length; ++clientSuggestSpellId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.clientSuggestSpellId[clientSuggestSpellId$index]);
			}
			if (hasActiveSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, active_spell$field);
			}
			if (hasPassiveSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, passive_spell$field);
			}
			if (hasNextSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, next_spell$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var spell_type$count:uint = 0;
			var spell_level$count:uint = 0;
			var race$count:uint = 0;
			var second_weapon_type$count:uint = 0;
			var learn_level$count:uint = 0;
			var description$count:uint = 0;
			var fighting_amount$count:uint = 0;
			var icon$count:uint = 0;
			var image$count:uint = 0;
			var video$count:uint = 0;
			var affect_type$count:uint = 0;
			var been_additional_spell_type$count:uint = 0;
			var additional_percent$count:uint = 0;
			var additional_origin_value$count:uint = 0;
			var client_show_spell_type$count:uint = 0;
			var active_spell$count:uint = 0;
			var passive_spell$count:uint = 0;
			var next_spell$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (spell_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.spellType cannot be set twice.');
					}
					++spell_type$count;
					this.spellType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (spell_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.spellLevel cannot be set twice.');
					}
					++spell_level$count;
					this.spellLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (race$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.race cannot be set twice.');
					}
					++race$count;
					this.race = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 5:
					if (second_weapon_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.secondWeaponType cannot be set twice.');
					}
					++second_weapon_type$count;
					this.secondWeaponType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 6:
					if (learn_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.learnLevel cannot be set twice.');
					}
					++learn_level$count;
					this.learnLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (description$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.description cannot be set twice.');
					}
					++description$count;
					this.description = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 8:
					if (fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.fightingAmount cannot be set twice.');
					}
					++fighting_amount$count;
					this.fightingAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.icon cannot be set twice.');
					}
					++icon$count;
					this.icon = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 10:
					if (image$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.image cannot be set twice.');
					}
					++image$count;
					this.image = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 11:
					if (video$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.video cannot be set twice.');
					}
					++video$count;
					this.video = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 12:
					if (affect_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.affectType cannot be set twice.');
					}
					++affect_type$count;
					this.affectType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 15:
					if (been_additional_spell_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.beenAdditionalSpellType cannot be set twice.');
					}
					++been_additional_spell_type$count;
					this.beenAdditionalSpellType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 16:
					if (additional_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.additionalPercent cannot be set twice.');
					}
					++additional_percent$count;
					this.additionalPercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 17:
					if (additional_origin_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.additionalOriginValue cannot be set twice.');
					}
					++additional_origin_value$count;
					this.additionalOriginValue = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 20:
					if (client_show_spell_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.clientShowSpellType cannot be set twice.');
					}
					++client_show_spell_type$count;
					this.clientShowSpellType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 21:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.clientSuggestSpellId);
						break;
					}
					this.clientSuggestSpellId.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 30:
					if (active_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.activeSpell cannot be set twice.');
					}
					++active_spell$count;
					this.activeSpell = new app.message.ActiveSpellProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.activeSpell);
					break;
				case 31:
					if (passive_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.passiveSpell cannot be set twice.');
					}
					++passive_spell$count;
					this.passiveSpell = new app.message.PassiveSpellProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.passiveSpell);
					break;
				case 40:
					if (next_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellProto.nextSpell cannot be set twice.');
					}
					++next_spell$count;
					this.nextSpell = new app.message.SpellProto.NextSpellProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.nextSpell);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
