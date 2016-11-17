package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpriteStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentGeneralTaozAddStatProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TAOZ_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentGeneralTaozAddStatProto.taoz_count", "taozCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var taoz_count$field:int;

		private var hasField$0:uint = 0;

		public function clearTaozCount():void {
			hasField$0 &= 0xfffffffe;
			taoz_count$field = new int();
		}

		public function get hasTaozCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set taozCount(value:int):void {
			hasField$0 |= 0x1;
			taoz_count$field = value;
		}

		public function get taozCount():int {
			return taoz_count$field;
		}

		/**
		 *  @private
		 */
		public static const ADD_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentGeneralTaozAddStatProto.add_stat", "addStat", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpriteStatProto; });

		private var add_stat$field:app.message.SpriteStatProto;

		public function clearAddStat():void {
			add_stat$field = null;
		}

		public function get hasAddStat():Boolean {
			return add_stat$field != null;
		}

		public function set addStat(value:app.message.SpriteStatProto):void {
			add_stat$field = value;
		}

		public function get addStat():app.message.SpriteStatProto {
			return add_stat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTaozCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, taoz_count$field);
			}
			if (hasAddStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, add_stat$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var taoz_count$count:uint = 0;
			var add_stat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (taoz_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralTaozAddStatProto.taozCount cannot be set twice.');
					}
					++taoz_count$count;
					this.taozCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (add_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralTaozAddStatProto.addStat cannot be set twice.');
					}
					++add_stat$count;
					this.addStat = new app.message.SpriteStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.addStat);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
