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
	public dynamic final class CountryKingWarReplaceProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ATTACK_GUILD_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto.attack_guild_name", "attackGuildName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var attack_guild_name$field:String;

		public function clearAttackGuildName():void {
			attack_guild_name$field = null;
		}

		public function get hasAttackGuildName():Boolean {
			return attack_guild_name$field != null;
		}

		public function set attackGuildName(value:String):void {
			attack_guild_name$field = value;
		}

		public function get attackGuildName():String {
			return attack_guild_name$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_GUILD_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto.defence_guild_name", "defenceGuildName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var defence_guild_name$field:String;

		public function clearDefenceGuildName():void {
			defence_guild_name$field = null;
		}

		public function get hasDefenceGuildName():Boolean {
			return defence_guild_name$field != null;
		}

		public function set defenceGuildName(value:String):void {
			defence_guild_name$field = value;
		}

		public function get defenceGuildName():String {
			return defence_guild_name$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK_GUILD_LEADER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryHistoryRecordProto.CountryKingWarReplaceProto.attack_guild_leader_name", "attackGuildLeaderName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var attack_guild_leader_name$field:String;

		public function clearAttackGuildLeaderName():void {
			attack_guild_leader_name$field = null;
		}

		public function get hasAttackGuildLeaderName():Boolean {
			return attack_guild_leader_name$field != null;
		}

		public function set attackGuildLeaderName(value:String):void {
			attack_guild_leader_name$field = value;
		}

		public function get attackGuildLeaderName():String {
			return attack_guild_leader_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAttackGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, attack_guild_name$field);
			}
			if (hasDefenceGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, defence_guild_name$field);
			}
			if (hasAttackGuildLeaderName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, attack_guild_leader_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var attack_guild_name$count:uint = 0;
			var defence_guild_name$count:uint = 0;
			var attack_guild_leader_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (attack_guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryKingWarReplaceProto.attackGuildName cannot be set twice.');
					}
					++attack_guild_name$count;
					this.attackGuildName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (defence_guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryKingWarReplaceProto.defenceGuildName cannot be set twice.');
					}
					++defence_guild_name$count;
					this.defenceGuildName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (attack_guild_leader_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryKingWarReplaceProto.attackGuildLeaderName cannot be set twice.');
					}
					++attack_guild_leader_name$count;
					this.attackGuildLeaderName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
