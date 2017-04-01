package app.message.TaskTargetProto {
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
	public dynamic final class FinishStoryDungeonTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ENTER_STORY_DUNGEON_NPC_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.FinishStoryDungeonTargetProto.enter_story_dungeon_npc_id", "enterStoryDungeonNpcId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var enter_story_dungeon_npc_id$field:int;

		private var hasField$0:uint = 0;

		public function clearEnterStoryDungeonNpcId():void {
			hasField$0 &= 0xfffffffe;
			enter_story_dungeon_npc_id$field = new int();
		}

		public function get hasEnterStoryDungeonNpcId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set enterStoryDungeonNpcId(value:int):void {
			hasField$0 |= 0x1;
			enter_story_dungeon_npc_id$field = value;
		}

		public function get enterStoryDungeonNpcId():int {
			return enter_story_dungeon_npc_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEnterStoryDungeonNpcId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, enter_story_dungeon_npc_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var enter_story_dungeon_npc_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (enter_story_dungeon_npc_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: FinishStoryDungeonTargetProto.enterStoryDungeonNpcId cannot be set twice.');
					}
					++enter_story_dungeon_npc_id$count;
					this.enterStoryDungeonNpcId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
