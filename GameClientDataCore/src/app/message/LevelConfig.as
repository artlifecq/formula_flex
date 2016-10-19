package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.LevelDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LevelConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DATA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.LevelConfig.data", "data", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.LevelDataProto; });

		[ArrayElementType("app.message.LevelDataProto")]
		public var data:Array = [];

		/**
		 *  @private
		 */
		public static const HERO_MAX_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.LevelConfig.hero_max_level", "heroMaxLevel", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_max_level$field:int;

		private var hasField$0:uint = 0;

		public function clearHeroMaxLevel():void {
			hasField$0 &= 0xfffffffe;
			hero_max_level$field = new int();
		}

		public function get hasHeroMaxLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set heroMaxLevel(value:int):void {
			hasField$0 |= 0x1;
			hero_max_level$field = value;
		}

		public function get heroMaxLevel():int {
			return hero_max_level$field;
		}

		/**
		 *  @private
		 */
		public static const NEW_HERO_PROTECT_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.LevelConfig.new_hero_protect_level", "newHeroProtectLevel", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var new_hero_protect_level$field:int;

		public function clearNewHeroProtectLevel():void {
			hasField$0 &= 0xfffffffd;
			new_hero_protect_level$field = new int();
		}

		public function get hasNewHeroProtectLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set newHeroProtectLevel(value:int):void {
			hasField$0 |= 0x2;
			new_hero_protect_level$field = value;
		}

		public function get newHeroProtectLevel():int {
			return new_hero_protect_level$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_LEVEL_DIFF_PROTECT_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.LevelConfig.hero_level_diff_protect_level", "heroLevelDiffProtectLevel", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_level_diff_protect_level$field:int;

		public function clearHeroLevelDiffProtectLevel():void {
			hasField$0 &= 0xfffffffb;
			hero_level_diff_protect_level$field = new int();
		}

		public function get hasHeroLevelDiffProtectLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set heroLevelDiffProtectLevel(value:int):void {
			hasField$0 |= 0x4;
			hero_level_diff_protect_level$field = value;
		}

		public function get heroLevelDiffProtectLevel():int {
			return hero_level_diff_protect_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var data$index:uint = 0; data$index < this.data.length; ++data$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.data[data$index]);
			}
			if (hasHeroMaxLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hero_max_level$field);
			}
			if (hasNewHeroProtectLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, new_hero_protect_level$field);
			}
			if (hasHeroLevelDiffProtectLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hero_level_diff_protect_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hero_max_level$count:uint = 0;
			var new_hero_protect_level$count:uint = 0;
			var hero_level_diff_protect_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.data.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.LevelDataProto()));
					break;
				case 10:
					if (hero_max_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: LevelConfig.heroMaxLevel cannot be set twice.');
					}
					++hero_max_level$count;
					this.heroMaxLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (new_hero_protect_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: LevelConfig.newHeroProtectLevel cannot be set twice.');
					}
					++new_hero_protect_level$count;
					this.newHeroProtectLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (hero_level_diff_protect_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: LevelConfig.heroLevelDiffProtectLevel cannot be set twice.');
					}
					++hero_level_diff_protect_level$count;
					this.heroLevelDiffProtectLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
