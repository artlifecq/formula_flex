package app.message.KingWarBroadcastProto {
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
	public dynamic final class ContinueKillingProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GUILD_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.KingWarBroadcastProto.ContinueKillingProto.guild_name", "guildName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.KingWarBroadcastProto.ContinueKillingProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const TARGET_GUILD_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.KingWarBroadcastProto.ContinueKillingProto.target_guild_name", "targetGuildName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var target_guild_name$field:String;

		public function clearTargetGuildName():void {
			target_guild_name$field = null;
		}

		public function get hasTargetGuildName():Boolean {
			return target_guild_name$field != null;
		}

		public function set targetGuildName(value:String):void {
			target_guild_name$field = value;
		}

		public function get targetGuildName():String {
			return target_guild_name$field;
		}

		/**
		 *  @private
		 */
		public static const TARGET_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.KingWarBroadcastProto.ContinueKillingProto.target_name", "targetName", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var target_name$field:String;

		public function clearTargetName():void {
			target_name$field = null;
		}

		public function get hasTargetName():Boolean {
			return target_name$field != null;
		}

		public function set targetName(value:String):void {
			target_name$field = value;
		}

		public function get targetName():String {
			return target_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, guild_name$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasTargetGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, target_guild_name$field);
			}
			if (hasTargetName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, target_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var guild_name$count:uint = 0;
			var name$count:uint = 0;
			var target_guild_name$count:uint = 0;
			var target_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ContinueKillingProto.guildName cannot be set twice.');
					}
					++guild_name$count;
					this.guildName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ContinueKillingProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (target_guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ContinueKillingProto.targetGuildName cannot be set twice.');
					}
					++target_guild_name$count;
					this.targetGuildName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (target_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ContinueKillingProto.targetName cannot be set twice.');
					}
					++target_name$count;
					this.targetName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
