package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.StablesBreedType;
	import app.message.StablesBreedSideProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StablesBreedProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.StablesBreedProto.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.StablesBreedType);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const BORN_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.StablesBreedProto.born_time", "bornTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var born_time$field:Int64;

		public function clearBornTime():void {
			born_time$field = null;
		}

		public function get hasBornTime():Boolean {
			return born_time$field != null;
		}

		public function set bornTime(value:Int64):void {
			born_time$field = value;
		}

		public function get bornTime():Int64 {
			return born_time$field;
		}

		/**
		 *  @private
		 */
		public static const INVITE_TARGET_ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.StablesBreedProto.invite_target_id", "inviteTargetId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var invite_target_id$field:Int64;

		public function clearInviteTargetId():void {
			invite_target_id$field = null;
		}

		public function get hasInviteTargetId():Boolean {
			return invite_target_id$field != null;
		}

		public function set inviteTargetId(value:Int64):void {
			invite_target_id$field = value;
		}

		public function get inviteTargetId():Int64 {
			return invite_target_id$field;
		}

		/**
		 *  @private
		 */
		public static const INVITE_EXPIRE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.StablesBreedProto.invite_expire_time", "inviteExpireTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var invite_expire_time$field:Int64;

		public function clearInviteExpireTime():void {
			invite_expire_time$field = null;
		}

		public function get hasInviteExpireTime():Boolean {
			return invite_expire_time$field != null;
		}

		public function set inviteExpireTime(value:Int64):void {
			invite_expire_time$field = value;
		}

		public function get inviteExpireTime():Int64 {
			return invite_expire_time$field;
		}

		/**
		 *  @private
		 */
		public static const INVITOR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.StablesBreedProto.invitor", "invitor", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StablesBreedSideProto; });

		private var invitor$field:app.message.StablesBreedSideProto;

		public function clearInvitor():void {
			invitor$field = null;
		}

		public function get hasInvitor():Boolean {
			return invitor$field != null;
		}

		public function set invitor(value:app.message.StablesBreedSideProto):void {
			invitor$field = value;
		}

		public function get invitor():app.message.StablesBreedSideProto {
			return invitor$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_INVITOR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.StablesBreedProto.been_invitor", "beenInvitor", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.StablesBreedSideProto; });

		private var been_invitor$field:app.message.StablesBreedSideProto;

		public function clearBeenInvitor():void {
			been_invitor$field = null;
		}

		public function get hasBeenInvitor():Boolean {
			return been_invitor$field != null;
		}

		public function set beenInvitor(value:app.message.StablesBreedSideProto):void {
			been_invitor$field = value;
		}

		public function get beenInvitor():app.message.StablesBreedSideProto {
			return been_invitor$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, type$field);
			}
			if (hasBornTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, born_time$field);
			}
			if (hasInviteTargetId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, invite_target_id$field);
			}
			if (hasInviteExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, invite_expire_time$field);
			}
			if (hasInvitor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, invitor$field);
			}
			if (hasBeenInvitor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, been_invitor$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var born_time$count:uint = 0;
			var invite_target_id$count:uint = 0;
			var invite_expire_time$count:uint = 0;
			var invitor$count:uint = 0;
			var been_invitor$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (born_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedProto.bornTime cannot be set twice.');
					}
					++born_time$count;
					this.bornTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (invite_target_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedProto.inviteTargetId cannot be set twice.');
					}
					++invite_target_id$count;
					this.inviteTargetId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (invite_expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedProto.inviteExpireTime cannot be set twice.');
					}
					++invite_expire_time$count;
					this.inviteExpireTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (invitor$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedProto.invitor cannot be set twice.');
					}
					++invitor$count;
					this.invitor = new app.message.StablesBreedSideProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.invitor);
					break;
				case 7:
					if (been_invitor$count != 0) {
						throw new flash.errors.IOError('Bad data format: StablesBreedProto.beenInvitor cannot be set twice.');
					}
					++been_invitor$count;
					this.beenInvitor = new app.message.StablesBreedSideProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.beenInvitor);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
