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
	public dynamic final class TradeModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TRADE_AUTO_REJECT_INVITE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.TradeModuleObjProto.trade_auto_reject_invite", "tradeAutoRejectInvite", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var trade_auto_reject_invite$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearTradeAutoRejectInvite():void {
			hasField$0 &= 0xfffffffe;
			trade_auto_reject_invite$field = new Boolean();
		}

		public function get hasTradeAutoRejectInvite():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set tradeAutoRejectInvite(value:Boolean):void {
			hasField$0 |= 0x1;
			trade_auto_reject_invite$field = value;
		}

		public function get tradeAutoRejectInvite():Boolean {
			return trade_auto_reject_invite$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTradeAutoRejectInvite) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, trade_auto_reject_invite$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var trade_auto_reject_invite$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (trade_auto_reject_invite$count != 0) {
						throw new flash.errors.IOError('Bad data format: TradeModuleObjProto.tradeAutoRejectInvite cannot be set twice.');
					}
					++trade_auto_reject_invite$count;
					this.tradeAutoRejectInvite = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
