package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellBookGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPELL_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SpellBookGoodsDataProto.spell_type", "spellType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpellType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, spell_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var spell_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (spell_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellBookGoodsDataProto.spellType cannot be set twice.');
					}
					++spell_type$count;
					this.spellType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
