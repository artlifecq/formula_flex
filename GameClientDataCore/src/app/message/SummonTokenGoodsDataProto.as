package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SummonTokenGoodsDataProto.TokenType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SummonTokenGoodsDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TOKEN_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.SummonTokenGoodsDataProto.token_type", "tokenType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.SummonTokenGoodsDataProto.TokenType);

		private var token_type$field:int;

		private var hasField$0:uint = 0;

		public function clearTokenType():void {
			hasField$0 &= 0xfffffffe;
			token_type$field = new int();
		}

		public function get hasTokenType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set tokenType(value:int):void {
			hasField$0 |= 0x1;
			token_type$field = value;
		}

		public function get tokenType():int {
			return token_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTokenType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, token_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var token_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (token_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SummonTokenGoodsDataProto.tokenType cannot be set twice.');
					}
					++token_type$count;
					this.tokenType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
