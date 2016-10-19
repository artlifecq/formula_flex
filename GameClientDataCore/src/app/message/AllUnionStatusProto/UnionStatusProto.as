package app.message.AllUnionStatusProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AllUnionStatusProto.UnionStatusProto.UnionStatusType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UnionStatusProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.AllUnionStatusProto.UnionStatusProto.status", "status", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.AllUnionStatusProto.UnionStatusProto.UnionStatusType);

		private var status$field:int;

		private var hasField$0:uint = 0;

		public function clearStatus():void {
			hasField$0 &= 0xfffffffe;
			status$field = new int();
		}

		public function get hasStatus():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set status(value:int):void {
			hasField$0 |= 0x1;
			status$field = value;
		}

		public function get status():int {
			return status$field;
		}

		/**
		 *  @private
		 */
		public static const INVITOR_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AllUnionStatusProto.UnionStatusProto.invitor_country", "invitorCountry", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var invitor_country$field:int;

		public function clearInvitorCountry():void {
			hasField$0 &= 0xfffffffd;
			invitor_country$field = new int();
		}

		public function get hasInvitorCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set invitorCountry(value:int):void {
			hasField$0 |= 0x2;
			invitor_country$field = value;
		}

		public function get invitorCountry():int {
			return invitor_country$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_INVITOR_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AllUnionStatusProto.UnionStatusProto.been_invitor_country", "beenInvitorCountry", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var been_invitor_country$field:int;

		public function clearBeenInvitorCountry():void {
			hasField$0 &= 0xfffffffb;
			been_invitor_country$field = new int();
		}

		public function get hasBeenInvitorCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set beenInvitorCountry(value:int):void {
			hasField$0 |= 0x4;
			been_invitor_country$field = value;
		}

		public function get beenInvitorCountry():int {
			return been_invitor_country$field;
		}

		/**
		 *  @private
		 */
		public static const UNION_AMOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AllUnionStatusProto.UnionStatusProto.union_amount", "unionAmount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var union_amount$field:int;

		public function clearUnionAmount():void {
			hasField$0 &= 0xfffffff7;
			union_amount$field = new int();
		}

		public function get hasUnionAmount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set unionAmount(value:int):void {
			hasField$0 |= 0x8;
			union_amount$field = value;
		}

		public function get unionAmount():int {
			return union_amount$field;
		}

		/**
		 *  @private
		 */
		public static const EXPIRE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.AllUnionStatusProto.UnionStatusProto.expire_time", "expireTime", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expire_time$field:Int64;

		public function clearExpireTime():void {
			expire_time$field = null;
		}

		public function get hasExpireTime():Boolean {
			return expire_time$field != null;
		}

		public function set expireTime(value:Int64):void {
			expire_time$field = value;
		}

		public function get expireTime():Int64 {
			return expire_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, status$field);
			}
			if (hasInvitorCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, invitor_country$field);
			}
			if (hasBeenInvitorCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, been_invitor_country$field);
			}
			if (hasUnionAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, union_amount$field);
			}
			if (hasExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, expire_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var status$count:uint = 0;
			var invitor_country$count:uint = 0;
			var been_invitor_country$count:uint = 0;
			var union_amount$count:uint = 0;
			var expire_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (status$count != 0) {
						throw new flash.errors.IOError('Bad data format: UnionStatusProto.status cannot be set twice.');
					}
					++status$count;
					this.status = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 2:
					if (invitor_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: UnionStatusProto.invitorCountry cannot be set twice.');
					}
					++invitor_country$count;
					this.invitorCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (been_invitor_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: UnionStatusProto.beenInvitorCountry cannot be set twice.');
					}
					++been_invitor_country$count;
					this.beenInvitorCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (union_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: UnionStatusProto.unionAmount cannot be set twice.');
					}
					++union_amount$count;
					this.unionAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: UnionStatusProto.expireTime cannot be set twice.');
					}
					++expire_time$count;
					this.expireTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
