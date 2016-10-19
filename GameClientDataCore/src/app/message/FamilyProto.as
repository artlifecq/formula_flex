package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilySharedProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SHARED:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyProto.shared", "shared", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilySharedProto; });

		private var shared$field:app.message.FamilySharedProto;

		public function clearShared():void {
			shared$field = null;
		}

		public function get hasShared():Boolean {
			return shared$field != null;
		}

		public function set shared(value:app.message.FamilySharedProto):void {
			shared$field = value;
		}

		public function get shared():app.message.FamilySharedProto {
			return shared$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_REQUEST_JOIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.FamilyProto.has_request_join", "hasRequestJoin", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_request_join$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearHasRequestJoin():void {
			hasField$0 &= 0xfffffffe;
			has_request_join$field = new Boolean();
		}

		public function get hasHasRequestJoin():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set hasRequestJoin(value:Boolean):void {
			hasField$0 |= 0x1;
			has_request_join$field = value;
		}

		public function get hasRequestJoin():Boolean {
			return has_request_join$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasShared) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, shared$field);
			}
			if (hasHasRequestJoin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, has_request_join$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var shared$count:uint = 0;
			var has_request_join$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (shared$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyProto.shared cannot be set twice.');
					}
					++shared$count;
					this.shared = new app.message.FamilySharedProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.shared);
					break;
				case 2:
					if (has_request_join$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyProto.hasRequestJoin cannot be set twice.');
					}
					++has_request_join$count;
					this.hasRequestJoin = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
