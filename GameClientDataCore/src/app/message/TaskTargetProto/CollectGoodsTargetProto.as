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
	public dynamic final class CollectGoodsTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COLLECT_GOODS_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskTargetProto.CollectGoodsTargetProto.collect_goods_type", "collectGoodsType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collect_goods_type$field:int;

		private var hasField$0:uint = 0;

		public function clearCollectGoodsType():void {
			hasField$0 &= 0xfffffffe;
			collect_goods_type$field = new int();
		}

		public function get hasCollectGoodsType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set collectGoodsType(value:int):void {
			hasField$0 |= 0x1;
			collect_goods_type$field = value;
		}

		public function get collectGoodsType():int {
			return collect_goods_type$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_GOODS_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskTargetProto.CollectGoodsTargetProto.collect_goods_count", "collectGoodsCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collect_goods_count$field:int;

		public function clearCollectGoodsCount():void {
			hasField$0 &= 0xfffffffd;
			collect_goods_count$field = new int();
		}

		public function get hasCollectGoodsCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set collectGoodsCount(value:int):void {
			hasField$0 |= 0x2;
			collect_goods_count$field = value;
		}

		public function get collectGoodsCount():int {
			return collect_goods_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCollectGoodsType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, collect_goods_type$field);
			}
			if (hasCollectGoodsCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, collect_goods_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var collect_goods_type$count:uint = 0;
			var collect_goods_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (collect_goods_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectGoodsTargetProto.collectGoodsType cannot be set twice.');
					}
					++collect_goods_type$count;
					this.collectGoodsType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (collect_goods_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectGoodsTargetProto.collectGoodsCount cannot be set twice.');
					}
					++collect_goods_count$count;
					this.collectGoodsCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
