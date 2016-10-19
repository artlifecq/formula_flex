package app.message.TaskTargetProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DropGoodsTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DROP_GOODS_MONSTER_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskTargetProto.DropGoodsTargetProto.drop_goods_monster_id", "dropGoodsMonsterId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var drop_goods_monster_id$field:int;

		private var hasField$0:uint = 0;

		public function clearDropGoodsMonsterId():void {
			hasField$0 &= 0xfffffffe;
			drop_goods_monster_id$field = new int();
		}

		public function get hasDropGoodsMonsterId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set dropGoodsMonsterId(value:int):void {
			hasField$0 |= 0x1;
			drop_goods_monster_id$field = value;
		}

		public function get dropGoodsMonsterId():int {
			return drop_goods_monster_id$field;
		}

		/**
		 *  @private
		 */
		public static const DROP_GOODS_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskTargetProto.DropGoodsTargetProto.drop_goods_count", "dropGoodsCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var drop_goods_count$field:int;

		public function clearDropGoodsCount():void {
			hasField$0 &= 0xfffffffd;
			drop_goods_count$field = new int();
		}

		public function get hasDropGoodsCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set dropGoodsCount(value:int):void {
			hasField$0 |= 0x2;
			drop_goods_count$field = value;
		}

		public function get dropGoodsCount():int {
			return drop_goods_count$field;
		}

		/**
		 *  @private
		 */
		public static const DROP_GOODS_NAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.TaskTargetProto.DropGoodsTargetProto.drop_goods_name", "dropGoodsName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var drop_goods_name$field:flash.utils.ByteArray;

		public function clearDropGoodsName():void {
			drop_goods_name$field = null;
		}

		public function get hasDropGoodsName():Boolean {
			return drop_goods_name$field != null;
		}

		public function set dropGoodsName(value:flash.utils.ByteArray):void {
			drop_goods_name$field = value;
		}

		public function get dropGoodsName():flash.utils.ByteArray {
			return drop_goods_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDropGoodsMonsterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, drop_goods_monster_id$field);
			}
			if (hasDropGoodsCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, drop_goods_count$field);
			}
			if (hasDropGoodsName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, drop_goods_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var drop_goods_monster_id$count:uint = 0;
			var drop_goods_count$count:uint = 0;
			var drop_goods_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (drop_goods_monster_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: DropGoodsTargetProto.dropGoodsMonsterId cannot be set twice.');
					}
					++drop_goods_monster_id$count;
					this.dropGoodsMonsterId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (drop_goods_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: DropGoodsTargetProto.dropGoodsCount cannot be set twice.');
					}
					++drop_goods_count$count;
					this.dropGoodsCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (drop_goods_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: DropGoodsTargetProto.dropGoodsName cannot be set twice.');
					}
					++drop_goods_name$count;
					this.dropGoodsName = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
