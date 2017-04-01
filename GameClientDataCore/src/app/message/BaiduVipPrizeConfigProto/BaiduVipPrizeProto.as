package app.message.BaiduVipPrizeConfigProto {
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
	public dynamic final class BaiduVipPrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BaiduVipPrizeConfigProto.BaiduVipPrizeProto.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const SUB_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BaiduVipPrizeConfigProto.BaiduVipPrizeProto.sub_type", "subType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sub_type$field:int;

		public function clearSubType():void {
			hasField$0 &= 0xfffffffd;
			sub_type$field = new int();
		}

		public function get hasSubType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set subType(value:int):void {
			hasField$0 |= 0x2;
			sub_type$field = value;
		}

		public function get subType():int {
			return sub_type$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.BaiduVipPrizeConfigProto.BaiduVipPrizeProto.prize", "prize", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var prize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, type$field);
			}
			if (hasSubType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sub_type$field);
			}
			for (var prize$index:uint = 0; prize$index < this.prize.length; ++prize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.prize[prize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var sub_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaiduVipPrizeProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (sub_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BaiduVipPrizeProto.subType cannot be set twice.');
					}
					++sub_type$count;
					this.subType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					this.prize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
