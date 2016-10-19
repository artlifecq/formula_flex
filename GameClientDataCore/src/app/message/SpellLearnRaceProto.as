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
	import app.message.SpellCategoryLearnProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellLearnRaceProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RACE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.SpellLearnRaceProto.race", "race", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.RaceId);

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
		public static const CATEGORIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.SpellLearnRaceProto.categories", "categories", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellCategoryLearnProto; });

		[ArrayElementType("app.message.SpellCategoryLearnProto")]
		public var categories:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRace) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, race$field);
			}
			for (var categories$index:uint = 0; categories$index < this.categories.length; ++categories$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.categories[categories$index]);
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
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (race$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLearnRaceProto.race cannot be set twice.');
					}
					++race$count;
					this.race = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					this.categories.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.SpellCategoryLearnProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
