package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsContainerProto.DepotGoodsContainerProto;
	import app.message.GoodsContainerProto.StorageGoodsContainerProto;
	import app.message.GoodsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GoodsContainerProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INIT_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsContainerProto.init_count", "initCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var init_count$field:int;

		private var hasField$0:uint = 0;

		public function clearInitCount():void {
			hasField$0 &= 0xfffffffe;
			init_count$field = new int();
		}

		public function get hasInitCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set initCount(value:int):void {
			hasField$0 |= 0x1;
			init_count$field = value;
		}

		public function get initCount():int {
			return init_count$field;
		}

		/**
		 *  @private
		 */
		public static const SIZE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsContainerProto.size", "size", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var size$field:int;

		public function clearSize():void {
			hasField$0 &= 0xfffffffd;
			size$field = new int();
		}

		public function get hasSize():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set size(value:int):void {
			hasField$0 |= 0x2;
			size$field = value;
		}

		public function get size():int {
			return size$field;
		}

		/**
		 *  @private
		 */
		public static const POS_LIST:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.GoodsContainerProto.pos_list", "posList", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var posList:Array = [];

		/**
		 *  @private
		 */
		public static const GOODS_LIST:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.GoodsContainerProto.goods_list", "goodsList", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsProto; });

		[ArrayElementType("app.message.GoodsProto")]
		public var goodsList:Array = [];

		/**
		 *  @private
		 */
		public static const DEPOT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsContainerProto.depot", "depot", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsContainerProto.DepotGoodsContainerProto; });

		private var depot$field:app.message.GoodsContainerProto.DepotGoodsContainerProto;

		public function clearDepot():void {
			depot$field = null;
		}

		public function get hasDepot():Boolean {
			return depot$field != null;
		}

		public function set depot(value:app.message.GoodsContainerProto.DepotGoodsContainerProto):void {
			depot$field = value;
		}

		public function get depot():app.message.GoodsContainerProto.DepotGoodsContainerProto {
			return depot$field;
		}

		/**
		 *  @private
		 */
		public static const STORAGE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsContainerProto.storage", "storage", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsContainerProto.StorageGoodsContainerProto; });

		private var storage$field:app.message.GoodsContainerProto.StorageGoodsContainerProto;

		public function clearStorage():void {
			storage$field = null;
		}

		public function get hasStorage():Boolean {
			return storage$field != null;
		}

		public function set storage(value:app.message.GoodsContainerProto.StorageGoodsContainerProto):void {
			storage$field = value;
		}

		public function get storage():app.message.GoodsContainerProto.StorageGoodsContainerProto {
			return storage$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasInitCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, init_count$field);
			}
			if (hasSize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, size$field);
			}
			for (var posList$index:uint = 0; posList$index < this.posList.length; ++posList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.posList[posList$index]);
			}
			for (var goodsList$index:uint = 0; goodsList$index < this.goodsList.length; ++goodsList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.goodsList[goodsList$index]);
			}
			if (hasDepot) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, depot$field);
			}
			if (hasStorage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, storage$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var init_count$count:uint = 0;
			var size$count:uint = 0;
			var depot$count:uint = 0;
			var storage$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (init_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsContainerProto.initCount cannot be set twice.');
					}
					++init_count$count;
					this.initCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (size$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsContainerProto.size cannot be set twice.');
					}
					++size$count;
					this.size = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.posList);
						break;
					}
					this.posList.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 4:
					this.goodsList.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsProto()));
					break;
				case 10:
					if (depot$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsContainerProto.depot cannot be set twice.');
					}
					++depot$count;
					this.depot = new app.message.GoodsContainerProto.DepotGoodsContainerProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.depot);
					break;
				case 11:
					if (storage$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsContainerProto.storage cannot be set twice.');
					}
					++storage$count;
					this.storage = new app.message.GoodsContainerProto.StorageGoodsContainerProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.storage);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
