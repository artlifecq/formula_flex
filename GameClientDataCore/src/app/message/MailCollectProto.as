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
	public dynamic final class MailCollectProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_COLLECT_AMOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MailCollectProto.is_collect_amount", "isCollectAmount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_collect_amount$field:int;

		private var hasField$0:uint = 0;

		public function clearIsCollectAmount():void {
			hasField$0 &= 0xfffffffe;
			is_collect_amount$field = new int();
		}

		public function get hasIsCollectAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isCollectAmount(value:int):void {
			hasField$0 |= 0x1;
			is_collect_amount$field = value;
		}

		public function get isCollectAmount():int {
			return is_collect_amount$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_GOODS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MailCollectProto.collect_goods", "collectGoods", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collect_goods$field:int;

		public function clearCollectGoods():void {
			hasField$0 &= 0xfffffffd;
			collect_goods$field = new int();
		}

		public function get hasCollectGoods():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set collectGoods(value:int):void {
			hasField$0 |= 0x2;
			collect_goods$field = value;
		}

		public function get collectGoods():int {
			return collect_goods$field;
		}

		/**
		 *  @private
		 */
		public static const ISREAD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.MailCollectProto.isRead", "isRead", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var isRead$field:Boolean;

		public function clearIsRead():void {
			hasField$0 &= 0xfffffffb;
			isRead$field = new Boolean();
		}

		public function get hasIsRead():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isRead(value:Boolean):void {
			hasField$0 |= 0x4;
			isRead$field = value;
		}

		public function get isRead():Boolean {
			return isRead$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsCollectAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, is_collect_amount$field);
			}
			if (hasCollectGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, collect_goods$field);
			}
			if (hasIsRead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, isRead$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_collect_amount$count:uint = 0;
			var collect_goods$count:uint = 0;
			var isRead$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_collect_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailCollectProto.isCollectAmount cannot be set twice.');
					}
					++is_collect_amount$count;
					this.isCollectAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (collect_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailCollectProto.collectGoods cannot be set twice.');
					}
					++collect_goods$count;
					this.collectGoods = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (isRead$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailCollectProto.isRead cannot be set twice.');
					}
					++isRead$count;
					this.isRead = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
