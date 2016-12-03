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
	import app.message.SecondWeaponType;
	import app.message.StatType;
	import app.message.SpellProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class RaceDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RACE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.RaceDataProto.race", "race", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.RaceId);

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
		public static const MAIN_STAT:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.RaceDataProto.main_stat", "mainStat", (2 << 3) | com.netease.protobuf.WireType.VARINT, Object);

		private var main_stat$field:int;

		public function clearMainStat():void {
			hasField$0 &= 0xfffffffd;
			main_stat$field = new int();
		}

		public function get hasMainStat():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set mainStat(value:int):void {
			hasField$0 |= 0x2;
			main_stat$field = value;
		}

		public function get mainStat():int {
			return main_stat$field;
		}

		/**
		 *  @private
		 */
		public static const SECOND_STAT:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.RaceDataProto.second_stat", "secondStat", (3 << 3) | com.netease.protobuf.WireType.VARINT, Object);

		private var second_stat$field:int;

		public function clearSecondStat():void {
			hasField$0 &= 0xfffffffb;
			second_stat$field = new int();
		}

		public function get hasSecondStat():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set secondStat(value:int):void {
			hasField$0 |= 0x4;
			second_stat$field = value;
		}

		public function get secondStat():int {
			return second_stat$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_SECOND_WEAPON_TYPES:RepeatedFieldDescriptor_TYPE_ENUM = new RepeatedFieldDescriptor_TYPE_ENUM("app.message.RaceDataProto.can_second_weapon_types", "canSecondWeaponTypes", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.SecondWeaponType);

		[ArrayElementType("int")]
		public var canSecondWeaponTypes:Array = [];

		/**
		 *  @private
		 */
		public static const DEFAULT_SPELL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.RaceDataProto.default_spell", "defaultSpell", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellProto; });

		private var default_spell$field:app.message.SpellProto;

		public function clearDefaultSpell():void {
			default_spell$field = null;
		}

		public function get hasDefaultSpell():Boolean {
			return default_spell$field != null;
		}

		public function set defaultSpell(value:app.message.SpellProto):void {
			default_spell$field = value;
		}

		public function get defaultSpell():app.message.SpellProto {
			return default_spell$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRace) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, race$field);
			}
			if (hasMainStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, main_stat$field);
			}
			if (hasSecondStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, second_stat$field);
			}
			for (var canSecondWeaponTypes$index:uint = 0; canSecondWeaponTypes$index < this.canSecondWeaponTypes.length; ++canSecondWeaponTypes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, this.canSecondWeaponTypes[canSecondWeaponTypes$index]);
			}
			if (hasDefaultSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, default_spell$field);
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
			var main_stat$count:uint = 0;
			var second_stat$count:uint = 0;
			var default_spell$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (race$count != 0) {
						throw new flash.errors.IOError('Bad data format: RaceDataProto.race cannot be set twice.');
					}
					++race$count;
					this.race = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (main_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: RaceDataProto.mainStat cannot be set twice.');
					}
					++main_stat$count;
					this.mainStat = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (second_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: RaceDataProto.secondStat cannot be set twice.');
					}
					++second_stat$count;
					this.secondStat = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_ENUM, this.canSecondWeaponTypes);
						break;
					}
					this.canSecondWeaponTypes.push(com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input));
					break;
				case 5:
					if (default_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: RaceDataProto.defaultSpell cannot be set twice.');
					}
					++default_spell$count;
					this.defaultSpell = new app.message.SpellProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.defaultSpell);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
