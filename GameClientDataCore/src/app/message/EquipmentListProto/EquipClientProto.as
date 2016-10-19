package app.message.EquipmentListProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipClientProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentListProto.EquipClientProto.pos", "pos", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pos$field:int;

		private var hasField$0:uint = 0;

		public function clearPos():void {
			hasField$0 &= 0xfffffffe;
			pos$field = new int();
		}

		public function get hasPos():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set pos(value:int):void {
			hasField$0 |= 0x1;
			pos$field = value;
		}

		public function get pos():int {
			return pos$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentListProto.EquipClientProto.equip", "equip", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsProto; });

		private var equip$field:app.message.GoodsProto;

		public function clearEquip():void {
			equip$field = null;
		}

		public function get hasEquip():Boolean {
			return equip$field != null;
		}

		public function set equip(value:app.message.GoodsProto):void {
			equip$field = value;
		}

		public function get equip():app.message.GoodsProto {
			return equip$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, pos$field);
			}
			if (hasEquip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, equip$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pos$count:uint = 0;
			var equip$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipClientProto.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (equip$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipClientProto.equip cannot be set twice.');
					}
					++equip$count;
					this.equip = new app.message.GoodsProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.equip);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
