package app.message.SpellModuleObjProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.RaceId;
	import app.message.SpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HeroLearnRaceSpellsProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RACE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto.race", "race", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.RaceId);

		private var race$field:int;

		private var hasField$0:uint = 0;

		public function clearRace():void {
			hasField$0 &= 0xfffffffe;
			race$field = new int();
		}

		public function get hasRace():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set race(value:int):void {
			hasField$0 |= 0x1;
			race$field = value;
		}

		public function get race():int {
			return race$field;
		}

		/**
		 *  @private
		 */
		public static const SPELLS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto.spells", "spells", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto; });

		[ArrayElementType("app.message.SpellProto")]
		public var spells:Array = [];

		/**
		 *  @private
		 */
		public static const OBTAIN_SPELL_POINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SpellModuleObjProto.HeroLearnRaceSpellsProto.obtain_spell_point", "obtainSpellPoint", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var obtain_spell_point$field:int;

		public function clearObtainSpellPoint():void {
			hasField$0 &= 0xfffffffd;
			obtain_spell_point$field = new int();
		}

		public function get hasObtainSpellPoint():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set obtainSpellPoint(value:int):void {
			hasField$0 |= 0x2;
			obtain_spell_point$field = value;
		}

		public function get obtainSpellPoint():int {
			return obtain_spell_point$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRace) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, race$field);
			}
			for (var spells$index:uint = 0; spells$index < this.spells.length; ++spells$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.spells[spells$index]);
			}
			if (hasObtainSpellPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, obtain_spell_point$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var race$count:uint = 0;
			var obtain_spell_point$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (race$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroLearnRaceSpellsProto.race cannot be set twice.');
					}
					++race$count;
					this.race = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					this.spells.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.SpellProto()));
					break;
				case 3:
					if (obtain_spell_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroLearnRaceSpellsProto.obtainSpellPoint cannot be set twice.');
					}
					++obtain_spell_point$count;
					this.obtainSpellPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
