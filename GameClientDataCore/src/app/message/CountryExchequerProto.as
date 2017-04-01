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
	public dynamic final class CountryExchequerProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TAX_RATE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryExchequerProto.tax_rate", "taxRate", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tax_rate$field:int;

		private var hasField$0:uint = 0;

		public function clearTaxRate():void {
			hasField$0 &= 0xfffffffe;
			tax_rate$field = new int();
		}

		public function get hasTaxRate():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set taxRate(value:int):void {
			hasField$0 |= 0x1;
			tax_rate$field = value;
		}

		public function get taxRate():int {
			return tax_rate$field;
		}

		/**
		 *  @private
		 */
		public static const YESTERDAY_INCOME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryExchequerProto.yesterday_income", "yesterdayIncome", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yesterday_income$field:Int64;

		public function clearYesterdayIncome():void {
			yesterday_income$field = null;
		}

		public function get hasYesterdayIncome():Boolean {
			return yesterday_income$field != null;
		}

		public function set yesterdayIncome(value:Int64):void {
			yesterday_income$field = value;
		}

		public function get yesterdayIncome():Int64 {
			return yesterday_income$field;
		}

		/**
		 *  @private
		 */
		public static const TODAY_JIN_WEI_SALARY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryExchequerProto.today_jin_wei_salary", "todayJinWeiSalary", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_jin_wei_salary$field:Int64;

		public function clearTodayJinWeiSalary():void {
			today_jin_wei_salary$field = null;
		}

		public function get hasTodayJinWeiSalary():Boolean {
			return today_jin_wei_salary$field != null;
		}

		public function set todayJinWeiSalary(value:Int64):void {
			today_jin_wei_salary$field = value;
		}

		public function get todayJinWeiSalary():Int64 {
			return today_jin_wei_salary$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTaxRate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, tax_rate$field);
			}
			if (hasYesterdayIncome) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, yesterday_income$field);
			}
			if (hasTodayJinWeiSalary) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, today_jin_wei_salary$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tax_rate$count:uint = 0;
			var yesterday_income$count:uint = 0;
			var today_jin_wei_salary$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tax_rate$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryExchequerProto.taxRate cannot be set twice.');
					}
					++tax_rate$count;
					this.taxRate = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (yesterday_income$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryExchequerProto.yesterdayIncome cannot be set twice.');
					}
					++yesterday_income$count;
					this.yesterdayIncome = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (today_jin_wei_salary$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryExchequerProto.todayJinWeiSalary cannot be set twice.');
					}
					++today_jin_wei_salary$count;
					this.todayJinWeiSalary = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
