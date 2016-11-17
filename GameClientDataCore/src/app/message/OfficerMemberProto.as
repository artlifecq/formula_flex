package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryMemberProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class OfficerMemberProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.OfficerMemberProto.data", "data", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryMemberProto; });

		private var data$field:app.message.CountryMemberProto;

		public function clearData():void {
			data$field = null;
		}

		public function get hasData():Boolean {
			return data$field != null;
		}

		public function set data(value:app.message.CountryMemberProto):void {
			data$field = value;
		}

		public function get data():app.message.CountryMemberProto {
			return data$field;
		}

		/**
		 *  @private
		 */
		public static const MEM_IDX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.OfficerMemberProto.mem_idx", "memIdx", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mem_idx$field:int;

		private var hasField$0:uint = 0;

		public function clearMemIdx():void {
			hasField$0 &= 0xfffffffe;
			mem_idx$field = new int();
		}

		public function get hasMemIdx():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set memIdx(value:int):void {
			hasField$0 |= 0x1;
			mem_idx$field = value;
		}

		public function get memIdx():int {
			return mem_idx$field;
		}

		/**
		 *  @private
		 */
		public static const TAKE_OFFICE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.OfficerMemberProto.take_office_time", "takeOfficeTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var take_office_time$field:Int64;

		public function clearTakeOfficeTime():void {
			take_office_time$field = null;
		}

		public function get hasTakeOfficeTime():Boolean {
			return take_office_time$field != null;
		}

		public function set takeOfficeTime(value:Int64):void {
			take_office_time$field = value;
		}

		public function get takeOfficeTime():Int64 {
			return take_office_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, data$field);
			}
			if (hasMemIdx) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mem_idx$field);
			}
			if (hasTakeOfficeTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, take_office_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var data$count:uint = 0;
			var mem_idx$count:uint = 0;
			var take_office_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (data$count != 0) {
						throw new flash.errors.IOError('Bad data format: OfficerMemberProto.data cannot be set twice.');
					}
					++data$count;
					this.data = new app.message.CountryMemberProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.data);
					break;
				case 2:
					if (mem_idx$count != 0) {
						throw new flash.errors.IOError('Bad data format: OfficerMemberProto.memIdx cannot be set twice.');
					}
					++mem_idx$count;
					this.memIdx = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (take_office_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: OfficerMemberProto.takeOfficeTime cannot be set twice.');
					}
					++take_office_time$count;
					this.takeOfficeTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
