package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EnemyProto;
	import app.message.ClientFriendProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ClientRelation extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FRIENDS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ClientRelation.friends", "friends", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ClientFriendProto; });

		[ArrayElementType("app.message.ClientFriendProto")]
		public var friends:Array = [];

		/**
		 *  @private
		 */
		public static const BLACK_ID:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.ClientRelation.black_id", "blackId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var blackId:Array = [];

		/**
		 *  @private
		 */
		public static const ENEMYLIST:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ClientRelation.enemyList", "enemyList", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EnemyProto; });

		[ArrayElementType("app.message.EnemyProto")]
		public var enemyList:Array = [];

		/**
		 *  @private
		 */
		public static const FORBID_BEEN_ADDED_AS_FRIEND:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.ClientRelation.forbid_been_added_as_friend", "forbidBeenAddedAsFriend", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var forbid_been_added_as_friend$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearForbidBeenAddedAsFriend():void {
			hasField$0 &= 0xfffffffe;
			forbid_been_added_as_friend$field = new Boolean();
		}

		public function get hasForbidBeenAddedAsFriend():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set forbidBeenAddedAsFriend(value:Boolean):void {
			hasField$0 |= 0x1;
			forbid_been_added_as_friend$field = value;
		}

		public function get forbidBeenAddedAsFriend():Boolean {
			return forbid_been_added_as_friend$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var friends$index:uint = 0; friends$index < this.friends.length; ++friends$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.friends[friends$index]);
			}
			for (var blackId$index:uint = 0; blackId$index < this.blackId.length; ++blackId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.blackId[blackId$index]);
			}
			for (var enemyList$index:uint = 0; enemyList$index < this.enemyList.length; ++enemyList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.enemyList[enemyList$index]);
			}
			if (hasForbidBeenAddedAsFriend) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, forbid_been_added_as_friend$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var forbid_been_added_as_friend$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.friends.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.ClientFriendProto()));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.blackId);
						break;
					}
					this.blackId.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				case 3:
					this.enemyList.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.EnemyProto()));
					break;
				case 5:
					if (forbid_been_added_as_friend$count != 0) {
						throw new flash.errors.IOError('Bad data format: ClientRelation.forbidBeenAddedAsFriend cannot be set twice.');
					}
					++forbid_been_added_as_friend$count;
					this.forbidBeenAddedAsFriend = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
