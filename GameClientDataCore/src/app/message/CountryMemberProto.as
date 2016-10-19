package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ModelProto;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryMemberProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryMemberProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:Int64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:Int64):void {
			id$field = value;
		}

		public function get id():Int64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.CountryMemberProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:flash.utils.ByteArray;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:flash.utils.ByteArray):void {
			name$field = value;
		}

		public function get name():flash.utils.ByteArray {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryMemberProto.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const FIGHTING_AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryMemberProto.fighting_amount", "fightingAmount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fighting_amount$field:Int64;

		public function clearFightingAmount():void {
			fighting_amount$field = null;
		}

		public function get hasFightingAmount():Boolean {
			return fighting_amount$field != null;
		}

		public function set fightingAmount(value:Int64):void {
			fighting_amount$field = value;
		}

		public function get fightingAmount():Int64 {
			return fighting_amount$field;
		}

		/**
		 *  @private
		 */
		public static const MODEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryMemberProto.model", "model", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ModelProto; });

		private var model$field:app.message.ModelProto;

		public function clearModel():void {
			model$field = null;
		}

		public function get hasModel():Boolean {
			return model$field != null;
		}

		public function set model(value:app.message.ModelProto):void {
			model$field = value;
		}

		public function get model():app.message.ModelProto {
			return model$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ONLINE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CountryMemberProto.is_online", "isOnline", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_online$field:Boolean;

		public function clearIsOnline():void {
			hasField$0 &= 0xfffffffd;
			is_online$field = new Boolean();
		}

		public function get hasIsOnline():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isOnline(value:Boolean):void {
			hasField$0 |= 0x2;
			is_online$field = value;
		}

		public function get isOnline():Boolean {
			return is_online$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_OFFLINE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryMemberProto.last_offline_time", "lastOfflineTime", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_offline_time$field:Int64;

		public function clearLastOfflineTime():void {
			last_offline_time$field = null;
		}

		public function get hasLastOfflineTime():Boolean {
			return last_offline_time$field != null;
		}

		public function set lastOfflineTime(value:Int64):void {
			last_offline_time$field = value;
		}

		public function get lastOfflineTime():Int64 {
			return last_offline_time$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryMemberProto.family_name", "familyName", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var family_name$field:String;

		public function clearFamilyName():void {
			family_name$field = null;
		}

		public function get hasFamilyName():Boolean {
			return family_name$field != null;
		}

		public function set familyName(value:String):void {
			family_name$field = value;
		}

		public function get familyName():String {
			return family_name$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryMemberProto.guild_name", "guildName", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guild_name$field:String;

		public function clearGuildName():void {
			guild_name$field = null;
		}

		public function get hasGuildName():Boolean {
			return guild_name$field != null;
		}

		public function set guildName(value:String):void {
			guild_name$field = value;
		}

		public function get guildName():String {
			return guild_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, name$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasFightingAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, fighting_amount$field);
			}
			if (hasModel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, model$field);
			}
			if (hasIsOnline) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_online$field);
			}
			if (hasLastOfflineTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, last_offline_time$field);
			}
			if (hasFamilyName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, family_name$field);
			}
			if (hasGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, guild_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var level$count:uint = 0;
			var fighting_amount$count:uint = 0;
			var model$count:uint = 0;
			var is_online$count:uint = 0;
			var last_offline_time$count:uint = 0;
			var family_name$count:uint = 0;
			var guild_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (fighting_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.fightingAmount cannot be set twice.');
					}
					++fighting_amount$count;
					this.fightingAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 5:
					if (model$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.model cannot be set twice.');
					}
					++model$count;
					this.model = new app.message.ModelProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.model);
					break;
				case 6:
					if (is_online$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.isOnline cannot be set twice.');
					}
					++is_online$count;
					this.isOnline = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (last_offline_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.lastOfflineTime cannot be set twice.');
					}
					++last_offline_time$count;
					this.lastOfflineTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 8:
					if (family_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.familyName cannot be set twice.');
					}
					++family_name$count;
					this.familyName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryMemberProto.guildName cannot be set twice.');
					}
					++guild_name$count;
					this.guildName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
