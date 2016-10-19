package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GuildOfficeProto;
	import app.message.GuildMemberProto;
	import app.message.GuildFlagProto;
	import app.message.GuildStorageProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GuildProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildProto.country", "country", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		private var hasField$0:uint = 0;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffe;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x1;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.GuildProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_FLAG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GuildProto.guild_flag", "guildFlag", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildFlagProto; });

		private var guild_flag$field:app.message.GuildFlagProto;

		public function clearGuildFlag():void {
			guild_flag$field = null;
		}

		public function get hasGuildFlag():Boolean {
			return guild_flag$field != null;
		}

		public function set guildFlag(value:app.message.GuildFlagProto):void {
			guild_flag$field = value;
		}

		public function get guildFlag():app.message.GuildFlagProto {
			return guild_flag$field;
		}

		/**
		 *  @private
		 */
		public static const ANNOUNCEMENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.GuildProto.announcement", "announcement", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var announcement$field:String;

		public function clearAnnouncement():void {
			announcement$field = null;
		}

		public function get hasAnnouncement():Boolean {
			return announcement$field != null;
		}

		public function set announcement(value:String):void {
			announcement$field = value;
		}

		public function get announcement():String {
			return announcement$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.GuildProto.families", "families", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildMemberProto; });

		[ArrayElementType("app.message.GuildMemberProto")]
		public var families:Array = [];

		/**
		 *  @private
		 */
		public static const OFFICE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GuildProto.office", "office", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildOfficeProto; });

		private var office$field:app.message.GuildOfficeProto;

		public function clearOffice():void {
			office$field = null;
		}

		public function get hasOffice():Boolean {
			return office$field != null;
		}

		public function set office(value:app.message.GuildOfficeProto):void {
			office$field = value;
		}

		public function get office():app.message.GuildOfficeProto {
			return office$field;
		}

		/**
		 *  @private
		 */
		public static const STORAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.GuildProto.storage", "storage", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildStorageProto; });

		private var storage$field:app.message.GuildStorageProto;

		public function clearStorage():void {
			storage$field = null;
		}

		public function get hasStorage():Boolean {
			return storage$field != null;
		}

		public function set storage(value:app.message.GuildStorageProto):void {
			storage$field = value;
		}

		public function get storage():app.message.GuildStorageProto {
			return storage$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildProto.level", "level", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasGuildFlag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, guild_flag$field);
			}
			if (hasAnnouncement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, announcement$field);
			}
			for (var families$index:uint = 0; families$index < this.families.length; ++families$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.families[families$index]);
			}
			if (hasOffice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, office$field);
			}
			if (hasStorage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, storage$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var country$count:uint = 0;
			var name$count:uint = 0;
			var guild_flag$count:uint = 0;
			var announcement$count:uint = 0;
			var office$count:uint = 0;
			var storage$count:uint = 0;
			var level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (guild_flag$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildProto.guildFlag cannot be set twice.');
					}
					++guild_flag$count;
					this.guildFlag = new app.message.GuildFlagProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.guildFlag);
					break;
				case 4:
					if (announcement$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildProto.announcement cannot be set twice.');
					}
					++announcement$count;
					this.announcement = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					this.families.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.GuildMemberProto()));
					break;
				case 6:
					if (office$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildProto.office cannot be set twice.');
					}
					++office$count;
					this.office = new app.message.GuildOfficeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.office);
					break;
				case 7:
					if (storage$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildProto.storage cannot be set twice.');
					}
					++storage$count;
					this.storage = new app.message.GuildStorageProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.storage);
					break;
				case 8:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
