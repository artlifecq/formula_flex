package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import app.message.MailProto.MailGoodsProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MailProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEND_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MailProto.send_time", "sendTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var send_time$field:Int64;

		public function clearSendTime():void {
			send_time$field = null;
		}

		public function get hasSendTime():Boolean {
			return send_time$field != null;
		}

		public function set sendTime(value:Int64):void {
			send_time$field = value;
		}

		public function get sendTime():Int64 {
			return send_time$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.MailProto.title", "title", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:flash.utils.ByteArray;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:flash.utils.ByteArray):void {
			title$field = value;
		}

		public function get title():flash.utils.ByteArray {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const CONTENT:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.MailProto.content", "content", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var content$field:flash.utils.ByteArray;

		public function clearContent():void {
			content$field = null;
		}

		public function get hasContent():Boolean {
			return content$field != null;
		}

		public function set content(value:flash.utils.ByteArray):void {
			content$field = value;
		}

		public function get content():flash.utils.ByteArray {
			return content$field;
		}

		/**
		 *  @private
		 */
		public static const SENDER_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MailProto.sender_id", "senderId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sender_id$field:Int64;

		public function clearSenderId():void {
			sender_id$field = null;
		}

		public function get hasSenderId():Boolean {
			return sender_id$field != null;
		}

		public function set senderId(value:Int64):void {
			sender_id$field = value;
		}

		public function get senderId():Int64 {
			return sender_id$field;
		}

		/**
		 *  @private
		 */
		public static const SENDER_NAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.MailProto.sender_name", "senderName", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sender_name$field:flash.utils.ByteArray;

		public function clearSenderName():void {
			sender_name$field = null;
		}

		public function get hasSenderName():Boolean {
			return sender_name$field != null;
		}

		public function set senderName(value:flash.utils.ByteArray):void {
			sender_name$field = value;
		}

		public function get senderName():flash.utils.ByteArray {
			return sender_name$field;
		}

		/**
		 *  @private
		 */
		public static const AMOUNT_VALUE:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.MailProto.amount_value", "amountValue", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var amountValue:Array = [];

		/**
		 *  @private
		 */
		public static const GOODS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.MailProto.goods", "goods", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MailProto.MailGoodsProto; });

		[ArrayElementType("app.message.MailProto.MailGoodsProto")]
		public var goods:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSendTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, send_time$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, title$field);
			}
			if (hasContent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, content$field);
			}
			if (hasSenderId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, sender_id$field);
			}
			if (hasSenderName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, sender_name$field);
			}
			for (var amountValue$index:uint = 0; amountValue$index < this.amountValue.length; ++amountValue$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.amountValue[amountValue$index]);
			}
			for (var goods$index:uint = 0; goods$index < this.goods.length; ++goods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.goods[goods$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var send_time$count:uint = 0;
			var title$count:uint = 0;
			var content$count:uint = 0;
			var sender_id$count:uint = 0;
			var sender_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (send_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailProto.sendTime cannot be set twice.');
					}
					++send_time$count;
					this.sendTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailProto.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 3:
					if (content$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailProto.content cannot be set twice.');
					}
					++content$count;
					this.content = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 4:
					if (sender_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailProto.senderId cannot be set twice.');
					}
					++sender_id$count;
					this.senderId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 5:
					if (sender_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailProto.senderName cannot be set twice.');
					}
					++sender_name$count;
					this.senderName = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 10:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.amountValue);
						break;
					}
					this.amountValue.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 20:
					this.goods.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.MailProto.MailGoodsProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
