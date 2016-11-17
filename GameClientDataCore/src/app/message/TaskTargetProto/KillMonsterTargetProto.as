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
	public dynamic final class KillMonsterTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KILL_MONSTER_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.KillMonsterTargetProto.kill_monster_id", "killMonsterId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_monster_id$field:int;

		private var hasField$0:uint = 0;

		public function clearKillMonsterId():void {
			hasField$0 &= 0xfffffffe;
			kill_monster_id$field = new int();
		}

		public function get hasKillMonsterId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set killMonsterId(value:int):void {
			hasField$0 |= 0x1;
			kill_monster_id$field = value;
		}

		public function get killMonsterId():int {
			return kill_monster_id$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_MONSTER_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TaskTargetProto.KillMonsterTargetProto.kill_monster_count", "killMonsterCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_monster_count$field:int;

		public function clearKillMonsterCount():void {
			hasField$0 &= 0xfffffffd;
			kill_monster_count$field = new int();
		}

		public function get hasKillMonsterCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set killMonsterCount(value:int):void {
			hasField$0 |= 0x2;
			kill_monster_count$field = value;
		}

		public function get killMonsterCount():int {
			return kill_monster_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKillMonsterId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, kill_monster_id$field);
			}
			if (hasKillMonsterCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, kill_monster_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var kill_monster_id$count:uint = 0;
			var kill_monster_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (kill_monster_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: KillMonsterTargetProto.killMonsterId cannot be set twice.');
					}
					++kill_monster_id$count;
					this.killMonsterId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (kill_monster_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: KillMonsterTargetProto.killMonsterCount cannot be set twice.');
					}
					++kill_monster_count$count;
					this.killMonsterCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
