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
	public dynamic final class ActiveSpellProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPELL_EFFECT_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.spell_effect_id", "spellEffectId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var spell_effect_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSpellEffectId():void {
			hasField$0 &= 0xfffffffe;
			spell_effect_id$field = new int();
		}

		public function get hasSpellEffectId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set spellEffectId(value:int):void {
			hasField$0 |= 0x1;
			spell_effect_id$field = value;
		}

		public function get spellEffectId():int {
			return spell_effect_id$field;
		}

		/**
		 *  @private
		 */
		public static const CD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.cd", "cd", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cd$field:int;

		public function clearCd():void {
			hasField$0 &= 0xfffffffd;
			cd$field = new int();
		}

		public function get hasCd():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set cd(value:int):void {
			hasField$0 |= 0x2;
			cd$field = value;
		}

		public function get cd():int {
			return cd$field;
		}

		/**
		 *  @private
		 */
		public static const GCD_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.gcd_id", "gcdId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gcd_id$field:int;

		public function clearGcdId():void {
			hasField$0 &= 0xfffffffb;
			gcd_id$field = new int();
		}

		public function get hasGcdId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set gcdId(value:int):void {
			hasField$0 |= 0x4;
			gcd_id$field = value;
		}

		public function get gcdId():int {
			return gcd_id$field;
		}

		/**
		 *  @private
		 */
		public static const CAST_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.cast_time", "castTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cast_time$field:int;

		public function clearCastTime():void {
			hasField$0 &= 0xfffffff7;
			cast_time$field = new int();
		}

		public function get hasCastTime():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set castTime(value:int):void {
			hasField$0 |= 0x8;
			cast_time$field = value;
		}

		public function get castTime():int {
			return cast_time$field;
		}

		/**
		 *  @private
		 */
		public static const MANA_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.mana_cost", "manaCost", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mana_cost$field:int;

		public function clearManaCost():void {
			hasField$0 &= 0xffffffef;
			mana_cost$field = new int();
		}

		public function get hasManaCost():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set manaCost(value:int):void {
			hasField$0 |= 0x10;
			mana_cost$field = value;
		}

		public function get manaCost():int {
			return mana_cost$field;
		}

		/**
		 *  @private
		 */
		public static const TARGET_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.target_type", "targetType", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var target_type$field:int;

		public function clearTargetType():void {
			hasField$0 &= 0xffffffdf;
			target_type$field = new int();
		}

		public function get hasTargetType():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set targetType(value:int):void {
			hasField$0 |= 0x20;
			target_type$field = value;
		}

		public function get targetType():int {
			return target_type$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL_SHAPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.spell_shape", "spellShape", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var spell_shape$field:int;

		public function clearSpellShape():void {
			hasField$0 &= 0xffffffbf;
			spell_shape$field = new int();
		}

		public function get hasSpellShape():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set spellShape(value:int):void {
			hasField$0 |= 0x40;
			spell_shape$field = value;
		}

		public function get spellShape():int {
			return spell_shape$field;
		}

		/**
		 *  @private
		 */
		public static const RELEASE_RANGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.release_range", "releaseRange", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var release_range$field:int;

		public function clearReleaseRange():void {
			hasField$0 &= 0xffffff7f;
			release_range$field = new int();
		}

		public function get hasReleaseRange():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set releaseRange(value:int):void {
			hasField$0 |= 0x80;
			release_range$field = value;
		}

		public function get releaseRange():int {
			return release_range$field;
		}

		/**
		 *  @private
		 */
		public static const HURT_RANGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.hurt_range", "hurtRange", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hurt_range$field:int;

		public function clearHurtRange():void {
			hasField$0 &= 0xfffffeff;
			hurt_range$field = new int();
		}

		public function get hasHurtRange():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set hurtRange(value:int):void {
			hasField$0 |= 0x100;
			hurt_range$field = value;
		}

		public function get hurtRange():int {
			return hurt_range$field;
		}

		/**
		 *  @private
		 */
		public static const ANGLE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ActiveSpellProto.angle", "angle", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var angle$field:int;

		public function clearAngle():void {
			hasField$0 &= 0xfffffdff;
			angle$field = new int();
		}

		public function get hasAngle():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set angle(value:int):void {
			hasField$0 |= 0x200;
			angle$field = value;
		}

		public function get angle():int {
			return angle$field;
		}

		/**
		 *  @private
		 */
		public static const RELATE_SPELLS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.ActiveSpellProto.relate_spells", "relateSpells", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto; });

		[ArrayElementType("app.message.SpellProto")]
		public var relateSpells:Array = [];

		/**
		 *  @private
		 */
		public static const IS_LOCKING_SPELL:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.ActiveSpellProto.is_locking_spell", "isLockingSpell", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_locking_spell$field:Boolean;

		public function clearIsLockingSpell():void {
			hasField$0 &= 0xfffffbff;
			is_locking_spell$field = new Boolean();
		}

		public function get hasIsLockingSpell():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set isLockingSpell(value:Boolean):void {
			hasField$0 |= 0x400;
			is_locking_spell$field = value;
		}

		public function get isLockingSpell():Boolean {
			return is_locking_spell$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ALLOW_AUTO_COMBAT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.ActiveSpellProto.is_allow_auto_combat", "isAllowAutoCombat", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_allow_auto_combat$field:Boolean;

		public function clearIsAllowAutoCombat():void {
			hasField$0 &= 0xfffff7ff;
			is_allow_auto_combat$field = new Boolean();
		}

		public function get hasIsAllowAutoCombat():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set isAllowAutoCombat(value:Boolean):void {
			hasField$0 |= 0x800;
			is_allow_auto_combat$field = value;
		}

		public function get isAllowAutoCombat():Boolean {
			return is_allow_auto_combat$field;
		}

		/**
		 *  @private
		 */
		public static const IS_RELEASE_AT_MOUSE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.ActiveSpellProto.is_release_at_mouse", "isReleaseAtMouse", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_release_at_mouse$field:Boolean;

		public function clearIsReleaseAtMouse():void {
			hasField$0 &= 0xffffefff;
			is_release_at_mouse$field = new Boolean();
		}

		public function get hasIsReleaseAtMouse():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set isReleaseAtMouse(value:Boolean):void {
			hasField$0 |= 0x1000;
			is_release_at_mouse$field = value;
		}

		public function get isReleaseAtMouse():Boolean {
			return is_release_at_mouse$field;
		}

		/**
		 *  @private
		 */
		public static const IS_RELEASE_ONLY_UP_MOUNT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.ActiveSpellProto.is_release_only_up_mount", "isReleaseOnlyUpMount", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_release_only_up_mount$field:Boolean;

		public function clearIsReleaseOnlyUpMount():void {
			hasField$0 &= 0xffffdfff;
			is_release_only_up_mount$field = new Boolean();
		}

		public function get hasIsReleaseOnlyUpMount():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set isReleaseOnlyUpMount(value:Boolean):void {
			hasField$0 |= 0x2000;
			is_release_only_up_mount$field = value;
		}

		public function get isReleaseOnlyUpMount():Boolean {
			return is_release_only_up_mount$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpellEffectId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, spell_effect_id$field);
			}
			if (hasCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cd$field);
			}
			if (hasGcdId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gcd_id$field);
			}
			if (hasCastTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cast_time$field);
			}
			if (hasManaCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mana_cost$field);
			}
			if (hasTargetType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, target_type$field);
			}
			if (hasSpellShape) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, spell_shape$field);
			}
			if (hasReleaseRange) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, release_range$field);
			}
			if (hasHurtRange) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hurt_range$field);
			}
			if (hasAngle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, angle$field);
			}
			for (var relateSpells$index:uint = 0; relateSpells$index < this.relateSpells.length; ++relateSpells$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.relateSpells[relateSpells$index]);
			}
			if (hasIsLockingSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_locking_spell$field);
			}
			if (hasIsAllowAutoCombat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_allow_auto_combat$field);
			}
			if (hasIsReleaseAtMouse) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_release_at_mouse$field);
			}
			if (hasIsReleaseOnlyUpMount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_release_only_up_mount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var spell_effect_id$count:uint = 0;
			var cd$count:uint = 0;
			var gcd_id$count:uint = 0;
			var cast_time$count:uint = 0;
			var mana_cost$count:uint = 0;
			var target_type$count:uint = 0;
			var spell_shape$count:uint = 0;
			var release_range$count:uint = 0;
			var hurt_range$count:uint = 0;
			var angle$count:uint = 0;
			var is_locking_spell$count:uint = 0;
			var is_allow_auto_combat$count:uint = 0;
			var is_release_at_mouse$count:uint = 0;
			var is_release_only_up_mount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (spell_effect_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.spellEffectId cannot be set twice.');
					}
					++spell_effect_id$count;
					this.spellEffectId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.cd cannot be set twice.');
					}
					++cd$count;
					this.cd = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (gcd_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.gcdId cannot be set twice.');
					}
					++gcd_id$count;
					this.gcdId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (cast_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.castTime cannot be set twice.');
					}
					++cast_time$count;
					this.castTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (mana_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.manaCost cannot be set twice.');
					}
					++mana_cost$count;
					this.manaCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (target_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.targetType cannot be set twice.');
					}
					++target_type$count;
					this.targetType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (spell_shape$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.spellShape cannot be set twice.');
					}
					++spell_shape$count;
					this.spellShape = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (release_range$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.releaseRange cannot be set twice.');
					}
					++release_range$count;
					this.releaseRange = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (hurt_range$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.hurtRange cannot be set twice.');
					}
					++hurt_range$count;
					this.hurtRange = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (angle$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.angle cannot be set twice.');
					}
					++angle$count;
					this.angle = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					this.relateSpells.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.SpellProto()));
					break;
				case 13:
					if (is_locking_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.isLockingSpell cannot be set twice.');
					}
					++is_locking_spell$count;
					this.isLockingSpell = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 14:
					if (is_allow_auto_combat$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.isAllowAutoCombat cannot be set twice.');
					}
					++is_allow_auto_combat$count;
					this.isAllowAutoCombat = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 15:
					if (is_release_at_mouse$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.isReleaseAtMouse cannot be set twice.');
					}
					++is_release_at_mouse$count;
					this.isReleaseAtMouse = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 16:
					if (is_release_only_up_mount$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveSpellProto.isReleaseOnlyUpMount cannot be set twice.');
					}
					++is_release_only_up_mount$count;
					this.isReleaseOnlyUpMount = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
