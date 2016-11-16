package app.message.CountryHistoryRecordProto {
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
	public dynamic final class CountryWarDefenceFailProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ATTACK_COUNTRY_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto.attack_country_type", "attackCountryType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_country_type$field:int;

		private var hasField$0:uint = 0;

		public function clearAttackCountryType():void {
			hasField$0 &= 0xfffffffe;
			attack_country_type$field = new int();
		}

		public function get hasAttackCountryType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set attackCountryType(value:int):void {
			hasField$0 |= 0x1;
			attack_country_type$field = value;
		}

		public function get attackCountryType():int {
			return attack_country_type$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_KING_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto.defence_king_name", "defenceKingName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var defence_king_name$field:String;

		public function clearDefenceKingName():void {
			defence_king_name$field = null;
		}

		public function get hasDefenceKingName():Boolean {
			return defence_king_name$field != null;
		}

		public function set defenceKingName(value:String):void {
			defence_king_name$field = value;
		}

		public function get defenceKingName():String {
			return defence_king_name$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryHistoryRecordProto.CountryWarDefenceFailProto.war_time", "warTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var war_time$field:Int64;

		public function clearWarTime():void {
			war_time$field = null;
		}

		public function get hasWarTime():Boolean {
			return war_time$field != null;
		}

		public function set warTime(value:Int64):void {
			war_time$field = value;
		}

		public function get warTime():Int64 {
			return war_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAttackCountryType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, attack_country_type$field);
			}
			if (hasDefenceKingName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, defence_king_name$field);
			}
			if (hasWarTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, war_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var attack_country_type$count:uint = 0;
			var defence_king_name$count:uint = 0;
			var war_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (attack_country_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarDefenceFailProto.attackCountryType cannot be set twice.');
					}
					++attack_country_type$count;
					this.attackCountryType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (defence_king_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarDefenceFailProto.defenceKingName cannot be set twice.');
					}
					++defence_king_name$count;
					this.defenceKingName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (war_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarDefenceFailProto.warTime cannot be set twice.');
					}
					++war_time$count;
					this.warTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
