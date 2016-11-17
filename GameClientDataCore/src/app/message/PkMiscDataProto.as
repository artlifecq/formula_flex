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
	public dynamic final class PkMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RED_NAME_PK_AMOUNT_THRESHOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PkMiscDataProto.red_name_pk_amount_threshold", "redNamePkAmountThreshold", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var red_name_pk_amount_threshold$field:int;

		private var hasField$0:uint = 0;

		public function clearRedNamePkAmountThreshold():void {
			hasField$0 &= 0xfffffffe;
			red_name_pk_amount_threshold$field = new int();
		}

		public function get hasRedNamePkAmountThreshold():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set redNamePkAmountThreshold(value:int):void {
			hasField$0 |= 0x1;
			red_name_pk_amount_threshold$field = value;
		}

		public function get redNamePkAmountThreshold():int {
			return red_name_pk_amount_threshold$field;
		}

		/**
		 *  @private
		 */
		public static const YELLOW_NAME_PK_AMOUNT_THRESHOLD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PkMiscDataProto.yellow_name_pk_amount_threshold", "yellowNamePkAmountThreshold", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var yellow_name_pk_amount_threshold$field:int;

		public function clearYellowNamePkAmountThreshold():void {
			hasField$0 &= 0xfffffffd;
			yellow_name_pk_amount_threshold$field = new int();
		}

		public function get hasYellowNamePkAmountThreshold():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set yellowNamePkAmountThreshold(value:int):void {
			hasField$0 |= 0x2;
			yellow_name_pk_amount_threshold$field = value;
		}

		public function get yellowNamePkAmountThreshold():int {
			return yellow_name_pk_amount_threshold$field;
		}

		/**
		 *  @private
		 */
		public static const PK_MAX_AMOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PkMiscDataProto.pk_max_amount", "pkMaxAmount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pk_max_amount$field:int;

		public function clearPkMaxAmount():void {
			hasField$0 &= 0xfffffffb;
			pk_max_amount$field = new int();
		}

		public function get hasPkMaxAmount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set pkMaxAmount(value:int):void {
			hasField$0 |= 0x4;
			pk_max_amount$field = value;
		}

		public function get pkMaxAmount():int {
			return pk_max_amount$field;
		}

		/**
		 *  @private
		 */
		public static const PK_AMOUNT_REDUCE_INTERVAL:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.PkMiscDataProto.pk_amount_reduce_interval", "pkAmountReduceInterval", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pk_amount_reduce_interval$field:Int64;

		public function clearPkAmountReduceInterval():void {
			pk_amount_reduce_interval$field = null;
		}

		public function get hasPkAmountReduceInterval():Boolean {
			return pk_amount_reduce_interval$field != null;
		}

		public function set pkAmountReduceInterval(value:Int64):void {
			pk_amount_reduce_interval$field = value;
		}

		public function get pkAmountReduceInterval():Int64 {
			return pk_amount_reduce_interval$field;
		}

		/**
		 *  @private
		 */
		public static const PK_AMOUNT_REDUCE_PER_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.PkMiscDataProto.pk_amount_reduce_per_times", "pkAmountReducePerTimes", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pk_amount_reduce_per_times$field:int;

		public function clearPkAmountReducePerTimes():void {
			hasField$0 &= 0xfffffff7;
			pk_amount_reduce_per_times$field = new int();
		}

		public function get hasPkAmountReducePerTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set pkAmountReducePerTimes(value:int):void {
			hasField$0 |= 0x8;
			pk_amount_reduce_per_times$field = value;
		}

		public function get pkAmountReducePerTimes():int {
			return pk_amount_reduce_per_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRedNamePkAmountThreshold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, red_name_pk_amount_threshold$field);
			}
			if (hasYellowNamePkAmountThreshold) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, yellow_name_pk_amount_threshold$field);
			}
			if (hasPkMaxAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, pk_max_amount$field);
			}
			if (hasPkAmountReduceInterval) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, pk_amount_reduce_interval$field);
			}
			if (hasPkAmountReducePerTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, pk_amount_reduce_per_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var red_name_pk_amount_threshold$count:uint = 0;
			var yellow_name_pk_amount_threshold$count:uint = 0;
			var pk_max_amount$count:uint = 0;
			var pk_amount_reduce_interval$count:uint = 0;
			var pk_amount_reduce_per_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (red_name_pk_amount_threshold$count != 0) {
						throw new flash.errors.IOError('Bad data format: PkMiscDataProto.redNamePkAmountThreshold cannot be set twice.');
					}
					++red_name_pk_amount_threshold$count;
					this.redNamePkAmountThreshold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (yellow_name_pk_amount_threshold$count != 0) {
						throw new flash.errors.IOError('Bad data format: PkMiscDataProto.yellowNamePkAmountThreshold cannot be set twice.');
					}
					++yellow_name_pk_amount_threshold$count;
					this.yellowNamePkAmountThreshold = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (pk_max_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: PkMiscDataProto.pkMaxAmount cannot be set twice.');
					}
					++pk_max_amount$count;
					this.pkMaxAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (pk_amount_reduce_interval$count != 0) {
						throw new flash.errors.IOError('Bad data format: PkMiscDataProto.pkAmountReduceInterval cannot be set twice.');
					}
					++pk_amount_reduce_interval$count;
					this.pkAmountReduceInterval = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (pk_amount_reduce_per_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: PkMiscDataProto.pkAmountReducePerTimes cannot be set twice.');
					}
					++pk_amount_reduce_per_times$count;
					this.pkAmountReducePerTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
