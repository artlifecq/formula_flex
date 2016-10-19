package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TaxType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TaxConfigProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_OPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.TaxConfigProto.is_open", "isOpen", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_open$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsOpen():void {
			hasField$0 &= 0xfffffffe;
			is_open$field = new Boolean();
		}

		public function get hasIsOpen():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isOpen(value:Boolean):void {
			hasField$0 |= 0x1;
			is_open$field = value;
		}

		public function get isOpen():Boolean {
			return is_open$field;
		}

		/**
		 *  @private
		 */
		public static const IS_INCOME_COUNTRY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.TaxConfigProto.is_income_country", "isIncomeCountry", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_income_country$field:Boolean;

		public function clearIsIncomeCountry():void {
			hasField$0 &= 0xfffffffd;
			is_income_country$field = new Boolean();
		}

		public function get hasIsIncomeCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isIncomeCountry(value:Boolean):void {
			hasField$0 |= 0x2;
			is_income_country$field = value;
		}

		public function get isIncomeCountry():Boolean {
			return is_income_country$field;
		}

		/**
		 *  @private
		 */
		public static const FIXED_TAX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaxConfigProto.fixed_tax", "fixedTax", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fixed_tax$field:int;

		public function clearFixedTax():void {
			hasField$0 &= 0xfffffffb;
			fixed_tax$field = new int();
		}

		public function get hasFixedTax():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set fixedTax(value:int):void {
			hasField$0 |= 0x4;
			fixed_tax$field = value;
		}

		public function get fixedTax():int {
			return fixed_tax$field;
		}

		/**
		 *  @private
		 */
		public static const TAX_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.TaxConfigProto.tax_type", "taxType", (4 << 3) | com.netease.protobuf.WireType.VARINT, app.message.TaxType);

		private var tax_type$field:int;

		public function clearTaxType():void {
			hasField$0 &= 0xfffffff7;
			tax_type$field = new int();
		}

		public function get hasTaxType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set taxType(value:int):void {
			hasField$0 |= 0x8;
			tax_type$field = value;
		}

		public function get taxType():int {
			return tax_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsOpen) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_open$field);
			}
			if (hasIsIncomeCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_income_country$field);
			}
			if (hasFixedTax) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, fixed_tax$field);
			}
			if (hasTaxType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, tax_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_open$count:uint = 0;
			var is_income_country$count:uint = 0;
			var fixed_tax$count:uint = 0;
			var tax_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_open$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaxConfigProto.isOpen cannot be set twice.');
					}
					++is_open$count;
					this.isOpen = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (is_income_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaxConfigProto.isIncomeCountry cannot be set twice.');
					}
					++is_income_country$count;
					this.isIncomeCountry = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (fixed_tax$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaxConfigProto.fixedTax cannot be set twice.');
					}
					++fixed_tax$count;
					this.fixedTax = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (tax_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaxConfigProto.taxType cannot be set twice.');
					}
					++tax_type$count;
					this.taxType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
