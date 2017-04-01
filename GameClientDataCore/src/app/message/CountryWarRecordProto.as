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
	public dynamic final class CountryWarRecordProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ATTACK_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarRecordProto.attack_country", "attackCountry", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_country$field:int;

		private var hasField$0:uint = 0;

		public function clearAttackCountry():void {
			hasField$0 &= 0xfffffffe;
			attack_country$field = new int();
		}

		public function get hasAttackCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set attackCountry(value:int):void {
			hasField$0 |= 0x1;
			attack_country$field = value;
		}

		public function get attackCountry():int {
			return attack_country$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarRecordProto.defence_country", "defenceCountry", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var defence_country$field:int;

		public function clearDefenceCountry():void {
			hasField$0 &= 0xfffffffd;
			defence_country$field = new int();
		}

		public function get hasDefenceCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set defenceCountry(value:int):void {
			hasField$0 |= 0x2;
			defence_country$field = value;
		}

		public function get defenceCountry():int {
			return defence_country$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarRecordProto.time", "time", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const WIN_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarRecordProto.win_country", "winCountry", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var win_country$field:int;

		public function clearWinCountry():void {
			hasField$0 &= 0xfffffffb;
			win_country$field = new int();
		}

		public function get hasWinCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set winCountry(value:int):void {
			hasField$0 |= 0x4;
			win_country$field = value;
		}

		public function get winCountry():int {
			return win_country$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAttackCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, attack_country$field);
			}
			if (hasDefenceCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, defence_country$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, time$field);
			}
			if (hasWinCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, win_country$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var attack_country$count:uint = 0;
			var defence_country$count:uint = 0;
			var time$count:uint = 0;
			var win_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (attack_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarRecordProto.attackCountry cannot be set twice.');
					}
					++attack_country$count;
					this.attackCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (defence_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarRecordProto.defenceCountry cannot be set twice.');
					}
					++defence_country$count;
					this.defenceCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarRecordProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (win_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarRecordProto.winCountry cannot be set twice.');
					}
					++win_country$count;
					this.winCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
