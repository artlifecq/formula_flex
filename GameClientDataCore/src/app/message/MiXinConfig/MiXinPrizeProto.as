package app.message.MiXinConfig {
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
	public dynamic final class MiXinPrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MiXinConfig.MiXinPrizeProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.MiXinConfig.MiXinPrizeProto.goods", "goods", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsWrapperProto; });

		[ArrayElementType("app.message.GoodsWrapperProto")]
		public var goods:Array = [];

		/**
		 *  @private
		 */
		public static const BASE_EXP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MiXinConfig.MiXinPrizeProto.base_exp", "baseExp", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var base_exp$field:int;

		public function clearBaseExp():void {
			hasField$0 &= 0xfffffffd;
			base_exp$field = new int();
		}

		public function get hasBaseExp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set baseExp(value:int):void {
			hasField$0 |= 0x2;
			base_exp$field = value;
		}

		public function get baseExp():int {
			return base_exp$field;
		}

		/**
		 *  @private
		 */
		public static const NORMAL_EXP_MULITPLE:RepeatedFieldDescriptor_TYPE_FLOAT = new RepeatedFieldDescriptor_TYPE_FLOAT("app.message.MiXinConfig.MiXinPrizeProto.normal_exp_mulitple", "normalExpMulitple", (4 << 3) | com.netease.protobuf.WireType.FIXED_32_BIT);

		[ArrayElementType("Number")]
		public var normalExpMulitple:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			for (var goods$index:uint = 0; goods$index < this.goods.length; ++goods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.goods[goods$index]);
			}
			if (hasBaseExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, base_exp$field);
			}
			for (var normalExpMulitple$index:uint = 0; normalExpMulitple$index < this.normalExpMulitple.length; ++normalExpMulitple$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_32_BIT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_FLOAT(output, this.normalExpMulitple[normalExpMulitple$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level$count:uint = 0;
			var base_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinPrizeProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					this.goods.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsWrapperProto()));
					break;
				case 3:
					if (base_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiXinPrizeProto.baseExp cannot be set twice.');
					}
					++base_exp$count;
					this.baseExp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_FLOAT, this.normalExpMulitple);
						break;
					}
					this.normalExpMulitple.push(com.netease.protobuf.ReadUtils.read_TYPE_FLOAT(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
