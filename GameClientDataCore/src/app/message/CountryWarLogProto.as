package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryWarLogProto.WarMonsterKilledProto;
	import app.message.CountryWarLogProto.WarEndProto;
	import app.message.CountryWarLogProto.WarStartProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarLogProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarLogProto.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const WAR_START:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarLogProto.war_start", "warStart", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarLogProto.WarStartProto; });

		private var war_start$field:app.message.CountryWarLogProto.WarStartProto;

		public function clearWarStart():void {
			war_start$field = null;
		}

		public function get hasWarStart():Boolean {
			return war_start$field != null;
		}

		public function set warStart(value:app.message.CountryWarLogProto.WarStartProto):void {
			war_start$field = value;
		}

		public function get warStart():app.message.CountryWarLogProto.WarStartProto {
			return war_start$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_END:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarLogProto.war_end", "warEnd", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarLogProto.WarEndProto; });

		private var war_end$field:app.message.CountryWarLogProto.WarEndProto;

		public function clearWarEnd():void {
			war_end$field = null;
		}

		public function get hasWarEnd():Boolean {
			return war_end$field != null;
		}

		public function set warEnd(value:app.message.CountryWarLogProto.WarEndProto):void {
			war_end$field = value;
		}

		public function get warEnd():app.message.CountryWarLogProto.WarEndProto {
			return war_end$field;
		}

		/**
		 *  @private
		 */
		public static const WAR_MONSTER_KILLED:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarLogProto.war_monster_killed", "warMonsterKilled", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarLogProto.WarMonsterKilledProto; });

		private var war_monster_killed$field:app.message.CountryWarLogProto.WarMonsterKilledProto;

		public function clearWarMonsterKilled():void {
			war_monster_killed$field = null;
		}

		public function get hasWarMonsterKilled():Boolean {
			return war_monster_killed$field != null;
		}

		public function set warMonsterKilled(value:app.message.CountryWarLogProto.WarMonsterKilledProto):void {
			war_monster_killed$field = value;
		}

		public function get warMonsterKilled():app.message.CountryWarLogProto.WarMonsterKilledProto {
			return war_monster_killed$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, time$field);
			}
			if (hasWarStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, war_start$field);
			}
			if (hasWarEnd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, war_end$field);
			}
			if (hasWarMonsterKilled) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, war_monster_killed$field);
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
			var war_start$count:uint = 0;
			var war_end$count:uint = 0;
			var war_monster_killed$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarLogProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 10:
					if (war_start$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarLogProto.warStart cannot be set twice.');
					}
					++war_start$count;
					this.warStart = new app.message.CountryWarLogProto.WarStartProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.warStart);
					break;
				case 11:
					if (war_end$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarLogProto.warEnd cannot be set twice.');
					}
					++war_end$count;
					this.warEnd = new app.message.CountryWarLogProto.WarEndProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.warEnd);
					break;
				case 12:
					if (war_monster_killed$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarLogProto.warMonsterKilled cannot be set twice.');
					}
					++war_monster_killed$count;
					this.warMonsterKilled = new app.message.CountryWarLogProto.WarMonsterKilledProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.warMonsterKilled);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
