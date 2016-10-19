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
	public dynamic final class CountryWarAttackFailProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ATTACK_KING_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryHistoryRecordProto.CountryWarAttackFailProto.attack_king_name", "attackKingName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var attack_king_name$field:String;

		public function clearAttackKingName():void {
			attack_king_name$field = null;
		}

		public function get hasAttackKingName():Boolean {
			return attack_king_name$field != null;
		}

		public function set attackKingName(value:String):void {
			attack_king_name$field = value;
		}

		public function get attackKingName():String {
			return attack_king_name$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_COUNTRY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryHistoryRecordProto.CountryWarAttackFailProto.defence_country_type", "defenceCountryType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var defence_country_type$field:int;

		private var hasField$0:uint = 0;

		public function clearDefenceCountryType():void {
			hasField$0 &= 0xfffffffe;
			defence_country_type$field = new int();
		}

		public function get hasDefenceCountryType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set defenceCountryType(value:int):void {
			hasField$0 |= 0x1;
			defence_country_type$field = value;
		}

		public function get defenceCountryType():int {
			return defence_country_type$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryHistoryRecordProto.CountryWarAttackFailProto.war_time", "warTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const KILL_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryHistoryRecordProto.CountryWarAttackFailProto.kill_count", "killCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_count$field:int;

		public function clearKillCount():void {
			hasField$0 &= 0xfffffffd;
			kill_count$field = new int();
		}

		public function get hasKillCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set killCount(value:int):void {
			hasField$0 |= 0x2;
			kill_count$field = value;
		}

		public function get killCount():int {
			return kill_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAttackKingName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, attack_king_name$field);
			}
			if (hasDefenceCountryType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, defence_country_type$field);
			}
			if (hasWarTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, war_time$field);
			}
			if (hasKillCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, kill_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var attack_king_name$count:uint = 0;
			var defence_country_type$count:uint = 0;
			var war_time$count:uint = 0;
			var kill_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (attack_king_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarAttackFailProto.attackKingName cannot be set twice.');
					}
					++attack_king_name$count;
					this.attackKingName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (defence_country_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarAttackFailProto.defenceCountryType cannot be set twice.');
					}
					++defence_country_type$count;
					this.defenceCountryType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (war_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarAttackFailProto.warTime cannot be set twice.');
					}
					++war_time$count;
					this.warTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (kill_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarAttackFailProto.killCount cannot be set twice.');
					}
					++kill_count$count;
					this.killCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
