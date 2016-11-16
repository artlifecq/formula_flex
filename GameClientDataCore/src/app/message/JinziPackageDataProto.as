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
	public dynamic final class JinziPackageDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COST:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.JinziPackageDataProto.cost", "cost", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost$field:int;

		private var hasField$0:uint = 0;

		public function clearCost():void {
			hasField$0 &= 0xfffffffe;
			cost$field = new int();
		}

		public function get hasCost():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set cost(value:int):void {
			hasField$0 |= 0x1;
			cost$field = value;
		}

		public function get cost():int {
			return cost$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.JinziPackageDataProto.title", "title", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:String;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:String):void {
			title$field = value;
		}

		public function get title():String {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_PRICE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.JinziPackageDataProto.show_price", "showPrice", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_price$field:int;

		public function clearShowPrice():void {
			hasField$0 &= 0xfffffffd;
			show_price$field = new int();
		}

		public function get hasShowPrice():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set showPrice(value:int):void {
			hasField$0 |= 0x2;
			show_price$field = value;
		}

		public function get showPrice():int {
			return show_price$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cost$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, title$field);
			}
			if (hasShowPrice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, show_price$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cost$count:uint = 0;
			var title$count:uint = 0;
			var show_price$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinziPackageDataProto.cost cannot be set twice.');
					}
					++cost$count;
					this.cost = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinziPackageDataProto.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (show_price$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinziPackageDataProto.showPrice cannot be set twice.');
					}
					++show_price$count;
					this.showPrice = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
