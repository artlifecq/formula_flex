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
	public dynamic final class KingWarModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HAS_COLLECT_KING_GUILD_PRIZE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.KingWarModuleObjProto.has_collect_king_guild_prize", "hasCollectKingGuildPrize", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_collect_king_guild_prize$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearHasCollectKingGuildPrize():void {
			hasField$0 &= 0xfffffffe;
			has_collect_king_guild_prize$field = new Boolean();
		}

		public function get hasHasCollectKingGuildPrize():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set hasCollectKingGuildPrize(value:Boolean):void {
			hasField$0 |= 0x1;
			has_collect_king_guild_prize$field = value;
		}

		public function get hasCollectKingGuildPrize():Boolean {
			return has_collect_king_guild_prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHasCollectKingGuildPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, has_collect_king_guild_prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var has_collect_king_guild_prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (has_collect_king_guild_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: KingWarModuleObjProto.hasCollectKingGuildPrize cannot be set twice.');
					}
					++has_collect_king_guild_prize$count;
					this.hasCollectKingGuildPrize = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
