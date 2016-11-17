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
	public dynamic final class OtherCountryWarStatusProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_WIN_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.OtherCountryWarStatusProto.country_war_win_times", "countryWarWinTimes", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_war_win_times$field:int;

		private var hasField$0:uint = 0;

		public function clearCountryWarWinTimes():void {
			hasField$0 &= 0xfffffffe;
			country_war_win_times$field = new int();
		}

		public function get hasCountryWarWinTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set countryWarWinTimes(value:int):void {
			hasField$0 |= 0x1;
			country_war_win_times$field = value;
		}

		public function get countryWarWinTimes():int {
			return country_war_win_times$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_WAR_FAIL_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.OtherCountryWarStatusProto.country_war_fail_times", "countryWarFailTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country_war_fail_times$field:int;

		public function clearCountryWarFailTimes():void {
			hasField$0 &= 0xfffffffd;
			country_war_fail_times$field = new int();
		}

		public function get hasCountryWarFailTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set countryWarFailTimes(value:int):void {
			hasField$0 |= 0x2;
			country_war_fail_times$field = value;
		}

		public function get countryWarFailTimes():int {
			return country_war_fail_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountryWarWinTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, country_war_win_times$field);
			}
			if (hasCountryWarFailTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, country_war_fail_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var country_war_win_times$count:uint = 0;
			var country_war_fail_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country_war_win_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryWarStatusProto.countryWarWinTimes cannot be set twice.');
					}
					++country_war_win_times$count;
					this.countryWarWinTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (country_war_fail_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: OtherCountryWarStatusProto.countryWarFailTimes cannot be set twice.');
					}
					++country_war_fail_times$count;
					this.countryWarFailTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
