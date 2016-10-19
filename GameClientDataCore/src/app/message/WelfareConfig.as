package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PhoenixProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class WelfareConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FIRST_RECHARGE_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.WelfareConfig.first_recharge_count", "firstRechargeCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var first_recharge_count$field:int;

		private var hasField$0:uint = 0;

		public function clearFirstRechargeCount():void {
			hasField$0 &= 0xfffffffe;
			first_recharge_count$field = new int();
		}

		public function get hasFirstRechargeCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set firstRechargeCount(value:int):void {
			hasField$0 |= 0x1;
			first_recharge_count$field = value;
		}

		public function get firstRechargeCount():int {
			return first_recharge_count$field;
		}

		/**
		 *  @private
		 */
		public static const LOGIN_PRIZE_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.WelfareConfig.login_prize_count", "loginPrizeCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var login_prize_count$field:int;

		public function clearLoginPrizeCount():void {
			hasField$0 &= 0xfffffffd;
			login_prize_count$field = new int();
		}

		public function get hasLoginPrizeCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set loginPrizeCount(value:int):void {
			hasField$0 |= 0x2;
			login_prize_count$field = value;
		}

		public function get loginPrizeCount():int {
			return login_prize_count$field;
		}

		/**
		 *  @private
		 */
		public static const PHOENIX:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.WelfareConfig.phoenix", "phoenix", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PhoenixProto; });

		private var phoenix$field:app.message.PhoenixProto;

		public function clearPhoenix():void {
			phoenix$field = null;
		}

		public function get hasPhoenix():Boolean {
			return phoenix$field != null;
		}

		public function set phoenix(value:app.message.PhoenixProto):void {
			phoenix$field = value;
		}

		public function get phoenix():app.message.PhoenixProto {
			return phoenix$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFirstRechargeCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, first_recharge_count$field);
			}
			if (hasLoginPrizeCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, login_prize_count$field);
			}
			if (hasPhoenix) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, phoenix$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var first_recharge_count$count:uint = 0;
			var login_prize_count$count:uint = 0;
			var phoenix$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (first_recharge_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareConfig.firstRechargeCount cannot be set twice.');
					}
					++first_recharge_count$count;
					this.firstRechargeCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (login_prize_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareConfig.loginPrizeCount cannot be set twice.');
					}
					++login_prize_count$count;
					this.loginPrizeCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (phoenix$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareConfig.phoenix cannot be set twice.');
					}
					++phoenix$count;
					this.phoenix = new app.message.PhoenixProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.phoenix);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
