package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MailConfig.MoneyTaxType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MailConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MAIL_EXPIRE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.MailConfig.mail_expire_time", "mailExpireTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mail_expire_time$field:Int64;

		public function clearMailExpireTime():void {
			mail_expire_time$field = null;
		}

		public function get hasMailExpireTime():Boolean {
			return mail_expire_time$field != null;
		}

		public function set mailExpireTime(value:Int64):void {
			mail_expire_time$field = value;
		}

		public function get mailExpireTime():Int64 {
			return mail_expire_time$field;
		}

		/**
		 *  @private
		 */
		public static const BASE_BAND_MONEY_TAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MailConfig.base_band_money_tax", "baseBandMoneyTax", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var base_band_money_tax$field:int;

		private var hasField$0:uint = 0;

		public function clearBaseBandMoneyTax():void {
			hasField$0 &= 0xfffffffe;
			base_band_money_tax$field = new int();
		}

		public function get hasBaseBandMoneyTax():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set baseBandMoneyTax(value:int):void {
			hasField$0 |= 0x1;
			base_band_money_tax$field = value;
		}

		public function get baseBandMoneyTax():int {
			return base_band_money_tax$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_TAX_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.MailConfig.money_tax_type", "moneyTaxType", (3 << 3) | com.netease.protobuf.WireType.VARINT, app.message.MailConfig.MoneyTaxType);

		private var money_tax_type$field:int;

		public function clearMoneyTaxType():void {
			hasField$0 &= 0xfffffffd;
			money_tax_type$field = new int();
		}

		public function get hasMoneyTaxType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set moneyTaxType(value:int):void {
			hasField$0 |= 0x2;
			money_tax_type$field = value;
		}

		public function get moneyTaxType():int {
			return money_tax_type$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_TAX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MailConfig.money_tax", "moneyTax", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_tax$field:int;

		public function clearMoneyTax():void {
			hasField$0 &= 0xfffffffb;
			money_tax$field = new int();
		}

		public function get hasMoneyTax():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set moneyTax(value:int):void {
			hasField$0 |= 0x4;
			money_tax$field = value;
		}

		public function get moneyTax():int {
			return money_tax$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_TAX:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.MailConfig.goods_tax", "goodsTax", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var goodsTax:Array = [];

		/**
		 *  @private
		 */
		public static const RECENT_MAIL_TARGET_LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MailConfig.recent_mail_target_limit", "recentMailTargetLimit", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var recent_mail_target_limit$field:int;

		public function clearRecentMailTargetLimit():void {
			hasField$0 &= 0xfffffff7;
			recent_mail_target_limit$field = new int();
		}

		public function get hasRecentMailTargetLimit():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set recentMailTargetLimit(value:int):void {
			hasField$0 |= 0x8;
			recent_mail_target_limit$field = value;
		}

		public function get recentMailTargetLimit():int {
			return recent_mail_target_limit$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMailExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, mail_expire_time$field);
			}
			if (hasBaseBandMoneyTax) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, base_band_money_tax$field);
			}
			if (hasMoneyTaxType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, money_tax_type$field);
			}
			if (hasMoneyTax) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, money_tax$field);
			}
			for (var goodsTax$index:uint = 0; goodsTax$index < this.goodsTax.length; ++goodsTax$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.goodsTax[goodsTax$index]);
			}
			if (hasRecentMailTargetLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, recent_mail_target_limit$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var mail_expire_time$count:uint = 0;
			var base_band_money_tax$count:uint = 0;
			var money_tax_type$count:uint = 0;
			var money_tax$count:uint = 0;
			var recent_mail_target_limit$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mail_expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailConfig.mailExpireTime cannot be set twice.');
					}
					++mail_expire_time$count;
					this.mailExpireTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (base_band_money_tax$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailConfig.baseBandMoneyTax cannot be set twice.');
					}
					++base_band_money_tax$count;
					this.baseBandMoneyTax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (money_tax_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailConfig.moneyTaxType cannot be set twice.');
					}
					++money_tax_type$count;
					this.moneyTaxType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 4:
					if (money_tax$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailConfig.moneyTax cannot be set twice.');
					}
					++money_tax$count;
					this.moneyTax = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.goodsTax);
						break;
					}
					this.goodsTax.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 6:
					if (recent_mail_target_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailConfig.recentMailTargetLimit cannot be set twice.');
					}
					++recent_mail_target_limit$count;
					this.recentMailTargetLimit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
