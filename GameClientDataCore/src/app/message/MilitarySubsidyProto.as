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
	public dynamic final class MilitarySubsidyProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MilitarySubsidyProto.amount", "amount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var amount$field:Int64;

		public function clearAmount():void {
			amount$field = null;
		}

		public function get hasAmount():Boolean {
			return amount$field != null;
		}

		public function set amount(value:Int64):void {
			amount$field = value;
		}

		public function get amount():Int64 {
			return amount$field;
		}

		/**
		 *  @private
		 */
		public static const LEFT_AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MilitarySubsidyProto.left_amount", "leftAmount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var left_amount$field:Int64;

		public function clearLeftAmount():void {
			left_amount$field = null;
		}

		public function get hasLeftAmount():Boolean {
			return left_amount$field != null;
		}

		public function set leftAmount(value:Int64):void {
			left_amount$field = value;
		}

		public function get leftAmount():Int64 {
			return left_amount$field;
		}

		/**
		 *  @private
		 */
		public static const SUBSIDY_PER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MilitarySubsidyProto.subsidy_per", "subsidyPer", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var subsidy_per$field:int;

		private var hasField$0:uint = 0;

		public function clearSubsidyPer():void {
			hasField$0 &= 0xfffffffe;
			subsidy_per$field = new int();
		}

		public function get hasSubsidyPer():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set subsidyPer(value:int):void {
			hasField$0 |= 0x1;
			subsidy_per$field = value;
		}

		public function get subsidyPer():int {
			return subsidy_per$field;
		}

		/**
		 *  @private
		 */
		public static const SUBSIDY_UPPER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MilitarySubsidyProto.subsidy_upper", "subsidyUpper", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var subsidy_upper$field:int;

		public function clearSubsidyUpper():void {
			hasField$0 &= 0xfffffffd;
			subsidy_upper$field = new int();
		}

		public function get hasSubsidyUpper():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set subsidyUpper(value:int):void {
			hasField$0 |= 0x2;
			subsidy_upper$field = value;
		}

		public function get subsidyUpper():int {
			return subsidy_upper$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, amount$field);
			}
			if (hasLeftAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, left_amount$field);
			}
			if (hasSubsidyPer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, subsidy_per$field);
			}
			if (hasSubsidyUpper) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, subsidy_upper$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var amount$count:uint = 0;
			var left_amount$count:uint = 0;
			var subsidy_per$count:uint = 0;
			var subsidy_upper$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: MilitarySubsidyProto.amount cannot be set twice.');
					}
					++amount$count;
					this.amount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (left_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: MilitarySubsidyProto.leftAmount cannot be set twice.');
					}
					++left_amount$count;
					this.leftAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (subsidy_per$count != 0) {
						throw new flash.errors.IOError('Bad data format: MilitarySubsidyProto.subsidyPer cannot be set twice.');
					}
					++subsidy_per$count;
					this.subsidyPer = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (subsidy_upper$count != 0) {
						throw new flash.errors.IOError('Bad data format: MilitarySubsidyProto.subsidyUpper cannot be set twice.');
					}
					++subsidy_upper$count;
					this.subsidyUpper = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
