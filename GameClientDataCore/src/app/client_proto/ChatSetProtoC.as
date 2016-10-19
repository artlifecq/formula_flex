package app.client_proto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.client_proto.ChatSetTabProtoC;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public final class ChatSetProtoC extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NONDEFAULT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.client_proto.ChatSetProtoC.nonDefault", "nonDefault", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var nonDefault$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearNonDefault():void {
			hasField$0 &= 0xfffffffe;
			nonDefault$field = new Boolean();
		}

		public function get hasNonDefault():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set nonDefault(value:Boolean):void {
			hasField$0 |= 0x1;
			nonDefault$field = value;
		}

		public function get nonDefault():Boolean {
			return nonDefault$field;
		}

		/**
		 *  @private
		 */
		public static const TABARR:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.client_proto.ChatSetProtoC.tabArr", "tabArr", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.client_proto.ChatSetTabProtoC; });

		[ArrayElementType("app.client_proto.ChatSetTabProtoC")]
		public var tabArr:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNonDefault) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, nonDefault$field);
			}
			for (var tabArr$index:uint = 0; tabArr$index < this.tabArr.length; ++tabArr$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.tabArr[tabArr$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var nonDefault$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (nonDefault$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatSetProtoC.nonDefault cannot be set twice.');
					}
					++nonDefault$count;
					this.nonDefault = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					this.tabArr.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.client_proto.ChatSetTabProtoC()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
