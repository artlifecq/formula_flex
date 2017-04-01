package app.message.AllFamilyCollageDatasProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyCollageSpellDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPELL_DATA:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.spell_data", "spellData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto; });

		[ArrayElementType("app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto")]
		public var spellData:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var spellData$index:uint = 0; spellData$index < this.spellData.length; ++spellData$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.spellData[spellData$index]);
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
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.spellData.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
