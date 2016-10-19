package app.message.FamilyNewsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyNewsProto.MemberIdAndNameProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DonateMoneyProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DONATE_MONEY_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.DonateMoneyProto.donate_money_member", "donateMoneyMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var donate_money_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearDonateMoneyMember():void {
			donate_money_member$field = null;
		}

		public function get hasDonateMoneyMember():Boolean {
			return donate_money_member$field != null;
		}

		public function set donateMoneyMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			donate_money_member$field = value;
		}

		public function get donateMoneyMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return donate_money_member$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.FamilyNewsProto.DonateMoneyProto.money", "money", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:Int64;

		public function clearMoney():void {
			money$field = null;
		}

		public function get hasMoney():Boolean {
			return money$field != null;
		}

		public function set money(value:Int64):void {
			money$field = value;
		}

		public function get money():Int64 {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const CONTRIBUTION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.FamilyNewsProto.DonateMoneyProto.contribution", "contribution", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var contribution$field:int;

		private var hasField$0:uint = 0;

		public function clearContribution():void {
			hasField$0 &= 0xfffffffe;
			contribution$field = new int();
		}

		public function get hasContribution():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set contribution(value:int):void {
			hasField$0 |= 0x1;
			contribution$field = value;
		}

		public function get contribution():int {
			return contribution$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDonateMoneyMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, donate_money_member$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, money$field);
			}
			if (hasContribution) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, contribution$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var donate_money_member$count:uint = 0;
			var money$count:uint = 0;
			var contribution$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (donate_money_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateMoneyProto.donateMoneyMember cannot be set twice.');
					}
					++donate_money_member$count;
					this.donateMoneyMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.donateMoneyMember);
					break;
				case 2:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateMoneyProto.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (contribution$count != 0) {
						throw new flash.errors.IOError('Bad data format: DonateMoneyProto.contribution cannot be set twice.');
					}
					++contribution$count;
					this.contribution = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
