package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.BiaoJuLogProto.BiaoJuLogType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BiaoJuLogProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuLogProto.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:Int64;

		public function clearTime():void {
			time$field = null;
		}

		public function get hasTime():Boolean {
			return time$field != null;
		}

		public function set time(value:Int64):void {
			time$field = value;
		}

		public function get time():Int64 {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const LOG_TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.BiaoJuLogProto.log_type", "logType", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.BiaoJuLogProto.BiaoJuLogType);

		private var log_type$field:int;

		private var hasField$0:uint = 0;

		public function clearLogType():void {
			hasField$0 &= 0xfffffffe;
			log_type$field = new int();
		}

		public function get hasLogType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set logType(value:int):void {
			hasField$0 |= 0x1;
			log_type$field = value;
		}

		public function get logType():int {
			return log_type$field;
		}

		/**
		 *  @private
		 */
		public static const AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.BiaoJuLogProto.amount", "amount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, time$field);
			}
			if (hasLogType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, log_type$field);
			}
			if (hasAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, amount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time$count:uint = 0;
			var log_type$count:uint = 0;
			var amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuLogProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (log_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuLogProto.logType cannot be set twice.');
					}
					++log_type$count;
					this.logType = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoJuLogProto.amount cannot be set twice.');
					}
					++amount$count;
					this.amount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
