package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsWrapperProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentDestroyPrizeDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LOWER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentDestroyPrizeDataProto.lower", "lower", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lower$field:int;

		private var hasField$0:uint = 0;

		public function clearLower():void {
			hasField$0 &= 0xfffffffe;
			lower$field = new int();
		}

		public function get hasLower():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set lower(value:int):void {
			hasField$0 |= 0x1;
			lower$field = value;
		}

		public function get lower():int {
			return lower$field;
		}

		/**
		 *  @private
		 */
		public static const UPPER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.EquipmentDestroyPrizeDataProto.upper", "upper", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upper$field:int;

		public function clearUpper():void {
			hasField$0 &= 0xfffffffd;
			upper$field = new int();
		}

		public function get hasUpper():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set upper(value:int):void {
			hasField$0 |= 0x2;
			upper$field = value;
		}

		public function get upper():int {
			return upper$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentDestroyPrizeDataProto.goods", "goods", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		private var goods$field:app.message.GoodsWrapperProto;

		public function clearGoods():void {
			goods$field = null;
		}

		public function get hasGoods():Boolean {
			return goods$field != null;
		}

		public function set goods(value:app.message.GoodsWrapperProto):void {
			goods$field = value;
		}

		public function get goods():app.message.GoodsWrapperProto {
			return goods$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLower) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lower$field);
			}
			if (hasUpper) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, upper$field);
			}
			if (hasGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, goods$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var lower$count:uint = 0;
			var upper$count:uint = 0;
			var goods$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (lower$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDestroyPrizeDataProto.lower cannot be set twice.');
					}
					++lower$count;
					this.lower = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (upper$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDestroyPrizeDataProto.upper cannot be set twice.');
					}
					++upper$count;
					this.upper = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDestroyPrizeDataProto.goods cannot be set twice.');
					}
					++goods$count;
					this.goods = new app.message.GoodsWrapperProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.goods);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
