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
	public dynamic final class ClientFriendProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FRIEND_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.ClientFriendProto.friend_id", "friendId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var friend_id$field:Int64;

		public function clearFriendId():void {
			friend_id$field = null;
		}

		public function get hasFriendId():Boolean {
			return friend_id$field != null;
		}

		public function set friendId(value:Int64):void {
			friend_id$field = value;
		}

		public function get friendId():Int64 {
			return friend_id$field;
		}

		/**
		 *  @private
		 */
		public static const FRIEND_DEGREE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ClientFriendProto.friend_degree", "friendDegree", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var friend_degree$field:int;

		private var hasField$0:uint = 0;

		public function clearFriendDegree():void {
			hasField$0 &= 0xfffffffe;
			friend_degree$field = new int();
		}

		public function get hasFriendDegree():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set friendDegree(value:int):void {
			hasField$0 |= 0x1;
			friend_degree$field = value;
		}

		public function get friendDegree():int {
			return friend_degree$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFriendId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, friend_id$field);
			}
			if (hasFriendDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, friend_degree$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var friend_id$count:uint = 0;
			var friend_degree$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (friend_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientFriendProto.friendId cannot be set twice.');
					}
					++friend_id$count;
					this.friendId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (friend_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientFriendProto.friendDegree cannot be set twice.');
					}
					++friend_degree$count;
					this.friendDegree = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
