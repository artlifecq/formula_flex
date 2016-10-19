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
	public dynamic final class FamilyModuleObjOtherProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAMILY_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.FamilyModuleObjOtherProto.family_name", "familyName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const GUILD_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.FamilyModuleObjOtherProto.guild_name", "guildName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if (hasFamilyName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, family_name$field);
			}
			if (hasGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
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
			var family_name$count:uint = 0;
			var guild_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (family_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjOtherProto.familyName cannot be set twice.');
					}
					++family_name$count;
					this.familyName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyModuleObjOtherProto.guildName cannot be set twice.');
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
