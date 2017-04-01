package app.message {
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
	public dynamic final class GoodsWrapperProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GOODS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsWrapperProto.goods", "goods", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsProto; });

		private var goods$field:app.message.GoodsProto;

		public function clearGoods():void {
			goods$field = null;
		}

		public function get hasGoods():Boolean {
			return goods$field != null;
		}

		public function set goods(value:app.message.GoodsProto):void {
			goods$field = value;
		}

		public function get goods():app.message.GoodsProto {
			return goods$field;
		}

		/**
		 *  @private
		 */
		public static const COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsWrapperProto.count", "count", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		private var hasField$0:uint = 0;

		public function clearCount():void {
			hasField$0 &= 0xfffffffe;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x1;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		public static const EXPIRE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GoodsWrapperProto.expire_time", "expireTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expire_time$field:Int64;

		public function clearExpireTime():void {
			expire_time$field = null;
		}

		public function get hasExpireTime():Boolean {
			return expire_time$field != null;
		}

		public function set expireTime(value:Int64):void {
			expire_time$field = value;
		}

		public function get expireTime():Int64 {
			return expire_time$field;
		}

		/**
		 *  @private
		 */
		public static const DURATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsWrapperProto.duration", "duration", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var duration$field:int;

		public function clearDuration():void {
			hasField$0 &= 0xfffffffd;
			duration$field = new int();
		}

		public function get hasDuration():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set duration(value:int):void {
			hasField$0 |= 0x2;
			duration$field = value;
		}

		public function get duration():int {
			return duration$field;
		}

		/**
		 *  @private
		 */
		public static const TAB:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GoodsWrapperProto.tab", "tab", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tab$field:int;

		public function clearTab():void {
			hasField$0 &= 0xfffffffb;
			tab$field = new int();
		}

		public function get hasTab():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set tab(value:int):void {
			hasField$0 |= 0x4;
			tab$field = value;
		}

		public function get tab():int {
			return tab$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, goods$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, count$field);
			}
			if (hasExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, expire_time$field);
			}
			if (hasDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, duration$field);
			}
			if (hasTab) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tab$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var goods$count:uint = 0;
			var count$count:uint = 0;
			var expire_time$count:uint = 0;
			var duration$count:uint = 0;
			var tab$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsWrapperProto.goods cannot be set twice.');
					}
					++goods$count;
					this.goods = new app.message.GoodsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.goods);
					break;
				case 2:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsWrapperProto.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsWrapperProto.expireTime cannot be set twice.');
					}
					++expire_time$count;
					this.expireTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsWrapperProto.duration cannot be set twice.');
					}
					++duration$count;
					this.duration = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (tab$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsWrapperProto.tab cannot be set twice.');
					}
					++tab$count;
					this.tab = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
