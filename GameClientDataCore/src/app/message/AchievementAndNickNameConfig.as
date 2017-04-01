package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AchievementsProto;
	import app.message.NicknamesProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AchievementAndNickNameConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACHIEVEMENTS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AchievementAndNickNameConfig.achievements", "achievements", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AchievementsProto; });

		private var achievements$field:app.message.AchievementsProto;

		public function clearAchievements():void {
			achievements$field = null;
		}

		public function get hasAchievements():Boolean {
			return achievements$field != null;
		}

		public function set achievements(value:app.message.AchievementsProto):void {
			achievements$field = value;
		}

		public function get achievements():app.message.AchievementsProto {
			return achievements$field;
		}

		/**
		 *  @private
		 */
		public static const NICKNAMES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AchievementAndNickNameConfig.nicknames", "nicknames", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NicknamesProto; });

		private var nicknames$field:app.message.NicknamesProto;

		public function clearNicknames():void {
			nicknames$field = null;
		}

		public function get hasNicknames():Boolean {
			return nicknames$field != null;
		}

		public function set nicknames(value:app.message.NicknamesProto):void {
			nicknames$field = value;
		}

		public function get nicknames():app.message.NicknamesProto {
			return nicknames$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAchievements) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, achievements$field);
			}
			if (hasNicknames) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, nicknames$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var achievements$count:uint = 0;
			var nicknames$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (achievements$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementAndNickNameConfig.achievements cannot be set twice.');
					}
					++achievements$count;
					this.achievements = new app.message.AchievementsProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.achievements);
					break;
				case 2:
					if (nicknames$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementAndNickNameConfig.nicknames cannot be set twice.');
					}
					++nicknames$count;
					this.nicknames = new app.message.NicknamesProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.nicknames);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
