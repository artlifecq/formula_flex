package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto;
	import app.message.AllFamilyCollageDatasProto.FamilyCollageLevelDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AllFamilyCollageDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_DATA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.AllFamilyCollageDatasProto.level_data", "levelData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyCollageDatasProto.FamilyCollageLevelDataProto; });

		[ArrayElementType("app.message.AllFamilyCollageDatasProto.FamilyCollageLevelDataProto")]
		public var levelData:Array = [];

		/**
		 *  @private
		 */
		public static const SPELL_DATAS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.AllFamilyCollageDatasProto.spell_datas", "spellDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto; });

		[ArrayElementType("app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto")]
		public var spellDatas:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var levelData$index:uint = 0; levelData$index < this.levelData.length; ++levelData$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.levelData[levelData$index]);
			}
			for (var spellDatas$index:uint = 0; spellDatas$index < this.spellDatas.length; ++spellDatas$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.spellDatas[spellDatas$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.levelData.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.AllFamilyCollageDatasProto.FamilyCollageLevelDataProto()));
					break;
				case 2:
					this.spellDatas.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
