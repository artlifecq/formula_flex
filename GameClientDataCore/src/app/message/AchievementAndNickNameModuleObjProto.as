package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AchievementProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AchievementAndNickNameModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACHIEVED:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.AchievementAndNickNameModuleObjProto.achieved", "achieved", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AchievementProto; });

		[ArrayElementType("app.message.AchievementProto")]
		public var achieved:Array = [];

		/**
		 *  @private
		 */
		public static const ACHIEVEMENT_POINTS:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AchievementAndNickNameModuleObjProto.achievement_points", "achievementPoints", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var achievement_points$field:int;

		private var hasField$0:uint = 0;

		public function clearAchievementPoints():void {
			hasField$0 &= 0xfffffffe;
			achievement_points$field = new int();
		}

		public function get hasAchievementPoints():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set achievementPoints(value:int):void {
			hasField$0 |= 0x1;
			achievement_points$field = value;
		}

		public function get achievementPoints():int {
			return achievement_points$field;
		}

		/**
		 *  @private
		 */
		public static const NICKNAME_ID:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.AchievementAndNickNameModuleObjProto.nickname_id", "nicknameId", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var nicknameId:Array = [];

		/**
		 *  @private
		 */
		public static const USING_NICKNAME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AchievementAndNickNameModuleObjProto.using_nickname", "usingNickname", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var using_nickname$field:int;

		public function clearUsingNickname():void {
			hasField$0 &= 0xfffffffd;
			using_nickname$field = new int();
		}

		public function get hasUsingNickname():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set usingNickname(value:int):void {
			hasField$0 |= 0x2;
			using_nickname$field = value;
		}

		public function get usingNickname():int {
			return using_nickname$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var achieved$index:uint = 0; achieved$index < this.achieved.length; ++achieved$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.achieved[achieved$index]);
			}
			if (hasAchievementPoints) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, achievement_points$field);
			}
			for (var nicknameId$index:uint = 0; nicknameId$index < this.nicknameId.length; ++nicknameId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.nicknameId[nicknameId$index]);
			}
			if (hasUsingNickname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, using_nickname$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var achievement_points$count:uint = 0;
			var using_nickname$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.achieved.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.AchievementProto()));
					break;
				case 2:
					if (achievement_points$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementAndNickNameModuleObjProto.achievementPoints cannot be set twice.');
					}
					++achievement_points$count;
					this.achievementPoints = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 21:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.nicknameId);
						break;
					}
					this.nicknameId.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 22:
					if (using_nickname$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementAndNickNameModuleObjProto.usingNickname cannot be set twice.');
					}
					++using_nickname$count;
					this.usingNickname = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
