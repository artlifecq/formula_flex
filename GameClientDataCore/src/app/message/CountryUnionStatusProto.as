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
	public dynamic final class CountryUnionStatusProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UNION_CD:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryUnionStatusProto.union_cd", "unionCd", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var union_cd$field:Int64;

		public function clearUnionCd():void {
			union_cd$field = null;
		}

		public function get hasUnionCd():Boolean {
			return union_cd$field != null;
		}

		public function set unionCd(value:Int64):void {
			union_cd$field = value;
		}

		public function get unionCd():Int64 {
			return union_cd$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_UNION_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryUnionStatusProto.last_union_time", "lastUnionTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_union_time$field:Int64;

		public function clearLastUnionTime():void {
			last_union_time$field = null;
		}

		public function get hasLastUnionTime():Boolean {
			return last_union_time$field != null;
		}

		public function set lastUnionTime(value:Int64):void {
			last_union_time$field = value;
		}

		public function get lastUnionTime():Int64 {
			return last_union_time$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_UNION_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryUnionStatusProto.last_union_country", "lastUnionCountry", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_union_country$field:int;

		private var hasField$0:uint = 0;

		public function clearLastUnionCountry():void {
			hasField$0 &= 0xfffffffe;
			last_union_country$field = new int();
		}

		public function get hasLastUnionCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set lastUnionCountry(value:int):void {
			hasField$0 |= 0x1;
			last_union_country$field = value;
		}

		public function get lastUnionCountry():int {
			return last_union_country$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUnionCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, union_cd$field);
			}
			if (hasLastUnionTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, last_union_time$field);
			}
			if (hasLastUnionCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, last_union_country$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var union_cd$count:uint = 0;
			var last_union_time$count:uint = 0;
			var last_union_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (union_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryUnionStatusProto.unionCd cannot be set twice.');
					}
					++union_cd$count;
					this.unionCd = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (last_union_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryUnionStatusProto.lastUnionTime cannot be set twice.');
					}
					++last_union_time$count;
					this.lastUnionTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (last_union_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryUnionStatusProto.lastUnionCountry cannot be set twice.');
					}
					++last_union_country$count;
					this.lastUnionCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
