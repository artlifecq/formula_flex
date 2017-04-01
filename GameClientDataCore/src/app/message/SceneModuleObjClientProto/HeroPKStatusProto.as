package app.message.SceneModuleObjClientProto {
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
	public dynamic final class HeroPKStatusProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NEXT_REDUCE_PK_AMOUNT_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SceneModuleObjClientProto.HeroPKStatusProto.next_reduce_pk_amount_time", "nextReducePkAmountTime", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var next_reduce_pk_amount_time$field:Int64;

		public function clearNextReducePkAmountTime():void {
			next_reduce_pk_amount_time$field = null;
		}

		public function get hasNextReducePkAmountTime():Boolean {
			return next_reduce_pk_amount_time$field != null;
		}

		public function set nextReducePkAmountTime(value:Int64):void {
			next_reduce_pk_amount_time$field = value;
		}

		public function get nextReducePkAmountTime():Int64 {
			return next_reduce_pk_amount_time$field;
		}

		/**
		 *  @private
		 */
		public static const PK_AMOUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SceneModuleObjClientProto.HeroPKStatusProto.pk_amount", "pkAmount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pk_amount$field:int;

		private var hasField$0:uint = 0;

		public function clearPkAmount():void {
			hasField$0 &= 0xfffffffe;
			pk_amount$field = new int();
		}

		public function get hasPkAmount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set pkAmount(value:int):void {
			hasField$0 |= 0x1;
			pk_amount$field = value;
		}

		public function get pkAmount():int {
			return pk_amount$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasNextReducePkAmountTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, next_reduce_pk_amount_time$field);
			}
			if (hasPkAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, pk_amount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var next_reduce_pk_amount_time$count:uint = 0;
			var pk_amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (next_reduce_pk_amount_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroPKStatusProto.nextReducePkAmountTime cannot be set twice.');
					}
					++next_reduce_pk_amount_time$count;
					this.nextReducePkAmountTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (pk_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroPKStatusProto.pkAmount cannot be set twice.');
					}
					++pk_amount$count;
					this.pkAmount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
