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
	public dynamic final class MemberKillOtherProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KILL_OTHER_MEMBER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.MemberKillOtherProto.kill_other_member", "killOtherMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var kill_other_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearKillOtherMember():void {
			kill_other_member$field = null;
		}

		public function get hasKillOtherMember():Boolean {
			return kill_other_member$field != null;
		}

		public function set killOtherMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			kill_other_member$field = value;
		}

		public function get killOtherMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return kill_other_member$field;
		}

		/**
		 *  @private
		 */
		public static const OTHER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.MemberKillOtherProto.other", "other", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

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
		public static const KILL_OTHER_SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilyNewsProto.MemberKillOtherProto.kill_other_scene_id", "killOtherSceneId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_other_scene_id$field:int;

		private var hasField$0:uint = 0;

		public function clearKillOtherSceneId():void {
			hasField$0 &= 0xfffffffe;
			kill_other_scene_id$field = new int();
		}

		public function get hasKillOtherSceneId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set killOtherSceneId(value:int):void {
			hasField$0 |= 0x1;
			kill_other_scene_id$field = value;
		}

		public function get killOtherSceneId():int {
			return kill_other_scene_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKillOtherMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, kill_other_member$field);
			}
			if (hasOther) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, other$field);
			}
			if (hasKillOtherSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, kill_other_scene_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var kill_other_member$count:uint = 0;
			var other$count:uint = 0;
			var kill_other_scene_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (kill_other_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberKillOtherProto.killOtherMember cannot be set twice.');
					}
					++kill_other_member$count;
					this.killOtherMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.killOtherMember);
					break;
				case 2:
					if (other$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberKillOtherProto.other cannot be set twice.');
					}
					++other$count;
					this.other = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.other);
					break;
				case 3:
					if (kill_other_scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MemberKillOtherProto.killOtherSceneId cannot be set twice.');
					}
					++kill_other_scene_id$count;
					this.killOtherSceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
