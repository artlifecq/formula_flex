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
	public dynamic final class GuildModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_COLLECT_GUILD_PRIZE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.GuildModuleObjProto.is_collect_guild_prize", "isCollectGuildPrize", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_collect_guild_prize$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsCollectGuildPrize():void {
			hasField$0 &= 0xfffffffe;
			is_collect_guild_prize$field = new Boolean();
		}

		public function get hasIsCollectGuildPrize():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isCollectGuildPrize(value:Boolean):void {
			hasField$0 |= 0x1;
			is_collect_guild_prize$field = value;
		}

		public function get isCollectGuildPrize():Boolean {
			return is_collect_guild_prize$field;
		}

		/**
		 *  @private
		 */
		public static const IS_COLLECT_KING_GUILD_PRIZE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.GuildModuleObjProto.is_collect_king_guild_prize", "isCollectKingGuildPrize", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_collect_king_guild_prize$field:Boolean;

		public function clearIsCollectKingGuildPrize():void {
			hasField$0 &= 0xfffffffd;
			is_collect_king_guild_prize$field = new Boolean();
		}

		public function get hasIsCollectKingGuildPrize():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isCollectKingGuildPrize(value:Boolean):void {
			hasField$0 |= 0x2;
			is_collect_king_guild_prize$field = value;
		}

		public function get isCollectKingGuildPrize():Boolean {
			return is_collect_king_guild_prize$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_CONTRIBUTION_POINT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.GuildModuleObjProto.guild_contribution_point", "guildContributionPoint", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guild_contribution_point$field:Int64;

		public function clearGuildContributionPoint():void {
			guild_contribution_point$field = null;
		}

		public function get hasGuildContributionPoint():Boolean {
			return guild_contribution_point$field != null;
		}

		public function set guildContributionPoint(value:Int64):void {
			guild_contribution_point$field = value;
		}

		public function get guildContributionPoint():Int64 {
			return guild_contribution_point$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsCollectGuildPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_collect_guild_prize$field);
			}
			if (hasIsCollectKingGuildPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_collect_king_guild_prize$field);
			}
			if (hasGuildContributionPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, guild_contribution_point$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_collect_guild_prize$count:uint = 0;
			var is_collect_king_guild_prize$count:uint = 0;
			var guild_contribution_point$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_collect_guild_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildModuleObjProto.isCollectGuildPrize cannot be set twice.');
					}
					++is_collect_guild_prize$count;
					this.isCollectGuildPrize = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 2:
					if (is_collect_king_guild_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildModuleObjProto.isCollectKingGuildPrize cannot be set twice.');
					}
					++is_collect_king_guild_prize$count;
					this.isCollectKingGuildPrize = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 3:
					if (guild_contribution_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildModuleObjProto.guildContributionPoint cannot be set twice.');
					}
					++guild_contribution_point$count;
					this.guildContributionPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
