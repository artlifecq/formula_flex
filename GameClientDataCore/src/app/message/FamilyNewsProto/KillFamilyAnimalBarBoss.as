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
	public dynamic final class KillFamilyAnimalBarBoss extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KILL_BOSS_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.KillFamilyAnimalBarBoss.kill_boss_member", "killBossMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var kill_boss_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearKillBossMember():void {
			kill_boss_member$field = null;
		}

		public function get hasKillBossMember():Boolean {
			return kill_boss_member$field != null;
		}

		public function set killBossMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			kill_boss_member$field = value;
		}

		public function get killBossMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return kill_boss_member$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKillBossMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, kill_boss_member$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var kill_boss_member$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (kill_boss_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: KillFamilyAnimalBarBoss.killBossMember cannot be set twice.');
					}
					++kill_boss_member$count;
					this.killBossMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.killBossMember);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
