package app.message.GuildNewsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GuildFlagProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CreateGuildProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CREATE_HERO_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.GuildNewsProto.CreateGuildProto.create_hero_name", "createHeroName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var create_hero_name$field:String;

		public function clearCreateHeroName():void {
			create_hero_name$field = null;
		}

		public function get hasCreateHeroName():Boolean {
			return create_hero_name$field != null;
		}

		public function set createHeroName(value:String):void {
			create_hero_name$field = value;
		}

		public function get createHeroName():String {
			return create_hero_name$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_FLAG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildNewsProto.CreateGuildProto.guild_flag", "guildFlag", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildFlagProto; });

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCreateHeroName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, create_hero_name$field);
			}
			if (hasGuildFlag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, guild_flag$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var create_hero_name$count:uint = 0;
			var guild_flag$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (create_hero_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CreateGuildProto.createHeroName cannot be set twice.');
					}
					++create_hero_name$count;
					this.createHeroName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (guild_flag$count != 0) {
						throw new flash.errors.IOError('Bad data format: CreateGuildProto.guildFlag cannot be set twice.');
					}
					++guild_flag$count;
					this.guildFlag = new app.message.GuildFlagProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.guildFlag);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
