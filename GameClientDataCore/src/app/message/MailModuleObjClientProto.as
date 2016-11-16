package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Int64StringPairProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MailModuleObjClientProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RECENT_MAIL_TARGETS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.MailModuleObjClientProto.recent_mail_targets", "recentMailTargets", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Int64StringPairProto; });

		[ArrayElementType("app.message.Int64StringPairProto")]
		public var recentMailTargets:Array = [];

		/**
		 *  @private
		 */
		public static const IS_REFUSE_RECEIVE_MAIL:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.MailModuleObjClientProto.is_refuse_receive_mail", "isRefuseReceiveMail", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_refuse_receive_mail$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsRefuseReceiveMail():void {
			hasField$0 &= 0xfffffffe;
			is_refuse_receive_mail$field = new Boolean();
		}

		public function get hasIsRefuseReceiveMail():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isRefuseReceiveMail(value:Boolean):void {
			hasField$0 |= 0x1;
			is_refuse_receive_mail$field = value;
		}

		public function get isRefuseReceiveMail():Boolean {
			return is_refuse_receive_mail$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var recentMailTargets$index:uint = 0; recentMailTargets$index < this.recentMailTargets.length; ++recentMailTargets$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.recentMailTargets[recentMailTargets$index]);
			}
			if (hasIsRefuseReceiveMail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_refuse_receive_mail$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_refuse_receive_mail$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.recentMailTargets.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.Int64StringPairProto()));
					break;
				case 2:
					if (is_refuse_receive_mail$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailModuleObjClientProto.isRefuseReceiveMail cannot be set twice.');
					}
					++is_refuse_receive_mail$count;
					this.isRefuseReceiveMail = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
