package app.message.SpellProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	import app.message.SpellProto.NextSpellProto.NextPassiveSpellProto;
	import app.message.SpellProto.NextSpellProto.NextActiveSpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class NextSpellProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CAN_LEARN_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.NextSpellProto.can_learn_level", "canLearnLevel", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_learn_level$field:int;

		private var hasField$0:uint = 0;

		public function clearCanLearnLevel():void {
			hasField$0 &= 0xfffffffe;
			can_learn_level$field = new int();
		}

		public function get hasCanLearnLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set canLearnLevel(value:int):void {
			hasField$0 |= 0x1;
			can_learn_level$field = value;
		}

		public function get canLearnLevel():int {
			return can_learn_level$field;
		}

		/**
		 *  @private
		 */
		public static const LEARN_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellProto.NextSpellProto.learn_cost", "learnCost", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var learn_cost$field:app.message.UpgradeProto;

		public function clearLearnCost():void {
			learn_cost$field = null;
		}

		public function get hasLearnCost():Boolean {
			return learn_cost$field != null;
		}

		public function set learnCost(value:app.message.UpgradeProto):void {
			learn_cost$field = value;
		}

		public function get learnCost():app.message.UpgradeProto {
			return learn_cost$field;
		}

		/**
		 *  @private
		 */
		public static const DESCRIPTION:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SpellProto.NextSpellProto.description", "description", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const ADDITIONAL_ORIGIN_VALUE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.NextSpellProto.additional_origin_value", "additionalOriginValue", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var additional_origin_value$field:int;

		public function clearAdditionalOriginValue():void {
			hasField$0 &= 0xfffffffd;
			additional_origin_value$field = new int();
		}

		public function get hasAdditionalOriginValue():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set additionalOriginValue(value:int):void {
			hasField$0 |= 0x2;
			additional_origin_value$field = value;
		}

		public function get additionalOriginValue():int {
			return additional_origin_value$field;
		}

		/**
		 *  @private
		 */
		public static const NEXT_ACTIVE_SPELL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellProto.NextSpellProto.next_active_spell", "nextActiveSpell", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto.NextSpellProto.NextActiveSpellProto; });

		private var next_active_spell$field:app.message.SpellProto.NextSpellProto.NextActiveSpellProto;

		public function clearNextActiveSpell():void {
			next_active_spell$field = null;
		}

		public function get hasNextActiveSpell():Boolean {
			return next_active_spell$field != null;
		}

		public function set nextActiveSpell(value:app.message.SpellProto.NextSpellProto.NextActiveSpellProto):void {
			next_active_spell$field = value;
		}

		public function get nextActiveSpell():app.message.SpellProto.NextSpellProto.NextActiveSpellProto {
			return next_active_spell$field;
		}

		/**
		 *  @private
		 */
		public static const NEXT_PASSIVE_SPELL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.SpellProto.NextSpellProto.next_passive_spell", "nextPassiveSpell", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto.NextSpellProto.NextPassiveSpellProto; });

		private var next_passive_spell$field:app.message.SpellProto.NextSpellProto.NextPassiveSpellProto;

		public function clearNextPassiveSpell():void {
			next_passive_spell$field = null;
		}

		public function get hasNextPassiveSpell():Boolean {
			return next_passive_spell$field != null;
		}

		public function set nextPassiveSpell(value:app.message.SpellProto.NextSpellProto.NextPassiveSpellProto):void {
			next_passive_spell$field = value;
		}

		public function get nextPassiveSpell():app.message.SpellProto.NextSpellProto.NextPassiveSpellProto {
			return next_passive_spell$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCanLearnLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, can_learn_level$field);
			}
			if (hasLearnCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, learn_cost$field);
			}
			if (hasDescription) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, description$field);
			}
			if (hasAdditionalOriginValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, additional_origin_value$field);
			}
			if (hasNextActiveSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, next_active_spell$field);
			}
			if (hasNextPassiveSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, next_passive_spell$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var can_learn_level$count:uint = 0;
			var learn_cost$count:uint = 0;
			var description$count:uint = 0;
			var additional_origin_value$count:uint = 0;
			var next_active_spell$count:uint = 0;
			var next_passive_spell$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (can_learn_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextSpellProto.canLearnLevel cannot be set twice.');
					}
					++can_learn_level$count;
					this.canLearnLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (learn_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextSpellProto.learnCost cannot be set twice.');
					}
					++learn_cost$count;
					this.learnCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.learnCost);
					break;
				case 3:
					if (description$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextSpellProto.description cannot be set twice.');
					}
					++description$count;
					this.description = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (additional_origin_value$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextSpellProto.additionalOriginValue cannot be set twice.');
					}
					++additional_origin_value$count;
					this.additionalOriginValue = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (next_active_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextSpellProto.nextActiveSpell cannot be set twice.');
					}
					++next_active_spell$count;
					this.nextActiveSpell = new app.message.SpellProto.NextSpellProto.NextActiveSpellProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.nextActiveSpell);
					break;
				case 11:
					if (next_passive_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextSpellProto.nextPassiveSpell cannot be set twice.');
					}
					++next_passive_spell$count;
					this.nextPassiveSpell = new app.message.SpellProto.NextSpellProto.NextPassiveSpellProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.nextPassiveSpell);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
