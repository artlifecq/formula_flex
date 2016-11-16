package app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	import app.message.SpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyCollageSpellDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const COLLAGE_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto.collage_level", "collageLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collage_level$field:int;

		public function clearCollageLevel():void {
			hasField$0 &= 0xfffffffd;
			collage_level$field = new int();
		}

		public function get hasCollageLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set collageLevel(value:int):void {
			hasField$0 |= 0x2;
			collage_level$field = value;
		}

		public function get collageLevel():int {
			return collage_level$field;
		}

		/**
		 *  @private
		 */
		public static const SPELL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto.spell", "spell", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto; });

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
		public static const UPGRADE_COST:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto.upgrade_cost", "upgradeCost", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var upgrade_cost$field:app.message.UpgradeProto;

		public function clearUpgradeCost():void {
			upgrade_cost$field = null;
		}

		public function get hasUpgradeCost():Boolean {
			return upgrade_cost$field != null;
		}

		public function set upgradeCost(value:app.message.UpgradeProto):void {
			upgrade_cost$field = value;
		}

		public function get upgradeCost():app.message.UpgradeProto {
			return upgrade_cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasCollageLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, collage_level$field);
			}
			if (hasSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, spell$field);
			}
			if (hasUpgradeCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, upgrade_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level$count:uint = 0;
			var collage_level$count:uint = 0;
			var spell$count:uint = 0;
			var upgrade_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyCollageSpellDataProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (collage_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyCollageSpellDataProto.collageLevel cannot be set twice.');
					}
					++collage_level$count;
					this.collageLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyCollageSpellDataProto.spell cannot be set twice.');
					}
					++spell$count;
					this.spell = new app.message.SpellProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.spell);
					break;
				case 4:
					if (upgrade_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyCollageSpellDataProto.upgradeCost cannot be set twice.');
					}
					++upgrade_cost$count;
					this.upgradeCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.upgradeCost);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
