package app.message.FamilyNewsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyNewsProto.MemberIdAndNameProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MemberBeenKilledByBossProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BEEN_KILL_BY_BOSS_MEMBER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.MemberBeenKilledByBossProto.been_kill_by_boss_member", "beenKillByBossMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var been_kill_by_boss_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearBeenKillByBossMember():void {
			been_kill_by_boss_member$field = null;
		}

		public function get hasBeenKillByBossMember():Boolean {
			return been_kill_by_boss_member$field != null;
		}

		public function set beenKillByBossMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			been_kill_by_boss_member$field = value;
		}

		public function get beenKillByBossMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return been_kill_by_boss_member$field;
		}

		/**
		 *  @private
		 */
		public static const BOSS_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.FamilyNewsProto.MemberBeenKilledByBossProto.boss_name", "bossName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var boss_name$field:String;

		public function clearBossName():void {
			boss_name$field = null;
		}

		public function get hasBossName():Boolean {
			return boss_name$field != null;
		}

		public function set bossName(value:String):void {
			boss_name$field = value;
		}

		public function get bossName():String {
			return boss_name$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_KILL_BY_BOSS_SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyNewsProto.MemberBeenKilledByBossProto.been_kill_by_boss_scene_id", "beenKillByBossSceneId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var been_kill_by_boss_scene_id$field:int;

		private var hasField$0:uint = 0;

		public function clearBeenKillByBossSceneId():void {
			hasField$0 &= 0xfffffffe;
			been_kill_by_boss_scene_id$field = new int();
		}

		public function get hasBeenKillByBossSceneId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set beenKillByBossSceneId(value:int):void {
			hasField$0 |= 0x1;
			been_kill_by_boss_scene_id$field = value;
		}

		public function get beenKillByBossSceneId():int {
			return been_kill_by_boss_scene_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBeenKillByBossMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, been_kill_by_boss_member$field);
			}
			if (hasBossName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, boss_name$field);
			}
			if (hasBeenKillByBossSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, been_kill_by_boss_scene_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var been_kill_by_boss_member$count:uint = 0;
			var boss_name$count:uint = 0;
			var been_kill_by_boss_scene_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (been_kill_by_boss_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberBeenKilledByBossProto.beenKillByBossMember cannot be set twice.');
					}
					++been_kill_by_boss_member$count;
					this.beenKillByBossMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.beenKillByBossMember);
					break;
				case 2:
					if (boss_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberBeenKilledByBossProto.bossName cannot be set twice.');
					}
					++boss_name$count;
					this.bossName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (been_kill_by_boss_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberBeenKilledByBossProto.beenKillByBossSceneId cannot be set twice.');
					}
					++been_kill_by_boss_scene_id$count;
					this.beenKillByBossSceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
