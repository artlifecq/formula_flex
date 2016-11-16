package app.message.SpellProto.NextSpellProto {
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
	public dynamic final class NextActiveSpellProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.NextSpellProto.NextActiveSpellProto.cd", "cd", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cd$field:int;

		private var hasField$0:uint = 0;

		public function clearCd():void {
			hasField$0 &= 0xfffffffe;
			cd$field = new int();
		}

		public function get hasCd():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cd(value:int):void {
			hasField$0 |= 0x1;
			cd$field = value;
		}

		public function get cd():int {
			return cd$field;
		}

		/**
		 *  @private
		 */
		public static const MANA_COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellProto.NextSpellProto.NextActiveSpellProto.mana_cost", "manaCost", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mana_cost$field:int;

		public function clearManaCost():void {
			hasField$0 &= 0xfffffffd;
			mana_cost$field = new int();
		}

		public function get hasManaCost():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set manaCost(value:int):void {
			hasField$0 |= 0x2;
			mana_cost$field = value;
		}

		public function get manaCost():int {
			return mana_cost$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cd$field);
			}
			if (hasManaCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mana_cost$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cd$count:uint = 0;
			var mana_cost$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextActiveSpellProto.cd cannot be set twice.');
					}
					++cd$count;
					this.cd = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (mana_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: NextActiveSpellProto.manaCost cannot be set twice.');
					}
					++mana_cost$count;
					this.manaCost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
