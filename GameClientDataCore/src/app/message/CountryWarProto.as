package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryWarType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WAR_TYPE:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.CountryWarProto.war_type", "warType", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryWarType);

		private var war_type$field:int;

		private var hasField$0:uint = 0;

		public function clearWarType():void {
			hasField$0 &= 0xfffffffe;
			war_type$field = new int();
		}

		public function get hasWarType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set warType(value:int):void {
			hasField$0 |= 0x1;
			war_type$field = value;
		}

		public function get warType():int {
			return war_type$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarProto.attack_country", "attackCountry", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_country$field:int;

		public function clearAttackCountry():void {
			hasField$0 &= 0xfffffffd;
			attack_country$field = new int();
		}

		public function get hasAttackCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set attackCountry(value:int):void {
			hasField$0 |= 0x2;
			attack_country$field = value;
		}

		public function get attackCountry():int {
			return attack_country$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarProto.defence_country", "defenceCountry", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var defence_country$field:int;

		public function clearDefenceCountry():void {
			hasField$0 &= 0xfffffffb;
			defence_country$field = new int();
		}

		public function get hasDefenceCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set defenceCountry(value:int):void {
			hasField$0 |= 0x4;
			defence_country$field = value;
		}

		public function get defenceCountry():int {
			return defence_country$field;
		}

		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarProto.start_time", "startTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_time$field:Int64;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:Int64):void {
			start_time$field = value;
		}

		public function get startTime():Int64 {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWarType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, war_type$field);
			}
			if (hasAttackCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, attack_country$field);
			}
			if (hasDefenceCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, defence_country$field);
			}
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, start_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var war_type$count:uint = 0;
			var attack_country$count:uint = 0;
			var defence_country$count:uint = 0;
			var start_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (war_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarProto.warType cannot be set twice.');
					}
					++war_type$count;
					this.warType = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if (attack_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarProto.attackCountry cannot be set twice.');
					}
					++attack_country$count;
					this.attackCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (defence_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarProto.defenceCountry cannot be set twice.');
					}
					++defence_country$count;
					this.defenceCountry = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarProto.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
