package app.message.TaskTargetProto {
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
	public dynamic final class DepotGoodsTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DEPOT_GOODS_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.DepotGoodsTargetProto.depot_goods_id", "depotGoodsId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var depot_goods_id$field:int;

		private var hasField$0:uint = 0;

		public function clearDepotGoodsId():void {
			hasField$0 &= 0xfffffffe;
			depot_goods_id$field = new int();
		}

		public function get hasDepotGoodsId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set depotGoodsId(value:int):void {
			hasField$0 |= 0x1;
			depot_goods_id$field = value;
		}

		public function get depotGoodsId():int {
			return depot_goods_id$field;
		}

		/**
		 *  @private
		 */
		public static const DEPOT_GOODS_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.DepotGoodsTargetProto.depot_goods_count", "depotGoodsCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var depot_goods_count$field:int;

		public function clearDepotGoodsCount():void {
			hasField$0 &= 0xfffffffd;
			depot_goods_count$field = new int();
		}

		public function get hasDepotGoodsCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set depotGoodsCount(value:int):void {
			hasField$0 |= 0x2;
			depot_goods_count$field = value;
		}

		public function get depotGoodsCount():int {
			return depot_goods_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDepotGoodsId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, depot_goods_id$field);
			}
			if (hasDepotGoodsCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, depot_goods_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var depot_goods_id$count:uint = 0;
			var depot_goods_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (depot_goods_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: DepotGoodsTargetProto.depotGoodsId cannot be set twice.');
					}
					++depot_goods_id$count;
					this.depotGoodsId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (depot_goods_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: DepotGoodsTargetProto.depotGoodsCount cannot be set twice.');
					}
					++depot_goods_count$count;
					this.depotGoodsCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
