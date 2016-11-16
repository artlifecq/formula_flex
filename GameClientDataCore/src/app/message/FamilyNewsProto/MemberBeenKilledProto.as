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
	public dynamic final class MemberBeenKilledProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BEEN_KILL_BY_OTHER_MEMBER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.MemberBeenKilledProto.been_kill_by_other_member", "beenKillByOtherMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var been_kill_by_other_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearBeenKillByOtherMember():void {
			been_kill_by_other_member$field = null;
		}

		public function get hasBeenKillByOtherMember():Boolean {
			return been_kill_by_other_member$field != null;
		}

		public function set beenKillByOtherMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			been_kill_by_other_member$field = value;
		}

		public function get beenKillByOtherMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return been_kill_by_other_member$field;
		}

		/**
		 *  @private
		 */
		public static const OTHER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.MemberBeenKilledProto.other", "other", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var other$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearOther():void {
			other$field = null;
		}

		public function get hasOther():Boolean {
			return other$field != null;
		}

		public function set other(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			other$field = value;
		}

		public function get other():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return other$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_KILL_BY_OTHER_SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyNewsProto.MemberBeenKilledProto.been_kill_by_other_scene_id", "beenKillByOtherSceneId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var been_kill_by_other_scene_id$field:int;

		private var hasField$0:uint = 0;

		public function clearBeenKillByOtherSceneId():void {
			hasField$0 &= 0xfffffffe;
			been_kill_by_other_scene_id$field = new int();
		}

		public function get hasBeenKillByOtherSceneId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set beenKillByOtherSceneId(value:int):void {
			hasField$0 |= 0x1;
			been_kill_by_other_scene_id$field = value;
		}

		public function get beenKillByOtherSceneId():int {
			return been_kill_by_other_scene_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBeenKillByOtherMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, been_kill_by_other_member$field);
			}
			if (hasOther) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, other$field);
			}
			if (hasBeenKillByOtherSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, been_kill_by_other_scene_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var been_kill_by_other_member$count:uint = 0;
			var other$count:uint = 0;
			var been_kill_by_other_scene_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (been_kill_by_other_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberBeenKilledProto.beenKillByOtherMember cannot be set twice.');
					}
					++been_kill_by_other_member$count;
					this.beenKillByOtherMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.beenKillByOtherMember);
					break;
				case 2:
					if (other$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberBeenKilledProto.other cannot be set twice.');
					}
					++other$count;
					this.other = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.other);
					break;
				case 3:
					if (been_kill_by_other_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberBeenKilledProto.beenKillByOtherSceneId cannot be set twice.');
					}
					++been_kill_by_other_scene_id$count;
					this.beenKillByOtherSceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
