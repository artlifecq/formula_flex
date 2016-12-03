package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.StatType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SingleStatProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STAT_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.SingleStatProto.stat_type", "statType", (1 << 3) | com.netease.protobuf.WireType.VARINT, Object);

		private var stat_type$field:int;

		private var hasField$0:uint = 0;

		public function clearStatType():void {
			hasField$0 &= 0xfffffffe;
			stat_type$field = new int();
		}

		public function get hasStatType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set statType(value:int):void {
			hasField$0 |= 0x1;
			stat_type$field = value;
		}

		public function get statType():int {
			return stat_type$field;
		}

		/**
		 *  @private
		 */
		public static const VALUE:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SingleStatProto.value", "value", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var value$field:Int64;

		public function clearValue():void {
			value$field = null;
		}

		public function get hasValue():Boolean {
			return value$field != null;
		}

		public function set value(value:Int64):void {
			value$field = value;
		}

		public function get value():Int64 {
			return value$field;
		}

		/**
		 *  @private
		 */
		public static const PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SingleStatProto.percent", "percent", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var percent$field:int;

		public function clearPercent():void {
			hasField$0 &= 0xfffffffd;
			percent$field = new int();
		}

		public function get hasPercent():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set percent(value:int):void {
			hasField$0 |= 0x2;
			percent$field = value;
		}

		public function get percent():int {
			return percent$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStatType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, stat_type$field);
			}
			if (hasValue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, value$field);
			}
			if (hasPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, percent$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var stat_type$count:uint = 0;
			var value$count:uint = 0;
			var percent$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (stat_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleStatProto.statType cannot be set twice.');
					}
					++stat_type$count;
					this.statType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (value$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleStatProto.value cannot be set twice.');
					}
					++value$count;
					this.value = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleStatProto.percent cannot be set twice.');
					}
					++percent$count;
					this.percent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
