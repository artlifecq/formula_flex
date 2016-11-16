package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SingleRelation;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ClientRelationDetail extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DETAIL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ClientRelationDetail.detail", "detail", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SingleRelation; });

		private var detail$field:app.message.SingleRelation;

		public function clearDetail():void {
			detail$field = null;
		}

		public function get hasDetail():Boolean {
			return detail$field != null;
		}

		public function set detail(value:app.message.SingleRelation):void {
			detail$field = value;
		}

		public function get detail():app.message.SingleRelation {
			return detail$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ONLINE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.ClientRelationDetail.is_online", "isOnline", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_online$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsOnline():void {
			hasField$0 &= 0xfffffffe;
			is_online$field = new Boolean();
		}

		public function get hasIsOnline():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isOnline(value:Boolean):void {
			hasField$0 |= 0x1;
			is_online$field = value;
		}

		public function get isOnline():Boolean {
			return is_online$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDetail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, detail$field);
			}
			if (hasIsOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_online$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var detail$count:uint = 0;
			var is_online$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (detail$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientRelationDetail.detail cannot be set twice.');
					}
					++detail$count;
					this.detail = new app.message.SingleRelation();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.detail);
					break;
				case 2:
					if (is_online$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientRelationDetail.isOnline cannot be set twice.');
					}
					++is_online$count;
					this.isOnline = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
