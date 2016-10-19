package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AchievementGroupProto.AchievementDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AchievementGroupProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AchievementGroupProto.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const FIRST_TITLE_RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AchievementGroupProto.first_title_res", "firstTitleRes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var first_title_res$field:String;

		public function clearFirstTitleRes():void {
			first_title_res$field = null;
		}

		public function get hasFirstTitleRes():Boolean {
			return first_title_res$field != null;
		}

		public function set firstTitleRes(value:String):void {
			first_title_res$field = value;
		}

		public function get firstTitleRes():String {
			return first_title_res$field;
		}

		/**
		 *  @private
		 */
		public static const FIRST_TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AchievementGroupProto.first_title", "firstTitle", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var first_title$field:String;

		public function clearFirstTitle():void {
			first_title$field = null;
		}

		public function get hasFirstTitle():Boolean {
			return first_title$field != null;
		}

		public function set firstTitle(value:String):void {
			first_title$field = value;
		}

		public function get firstTitle():String {
			return first_title$field;
		}

		/**
		 *  @private
		 */
		public static const SECOND_TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.AchievementGroupProto.second_title", "secondTitle", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var second_title$field:String;

		public function clearSecondTitle():void {
			second_title$field = null;
		}

		public function get hasSecondTitle():Boolean {
			return second_title$field != null;
		}

		public function set secondTitle(value:String):void {
			second_title$field = value;
		}

		public function get secondTitle():String {
			return second_title$field;
		}

		/**
		 *  @private
		 */
		public static const IS_DAILY_RESET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.AchievementGroupProto.is_daily_reset", "isDailyReset", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_daily_reset$field:Boolean;

		public function clearIsDailyReset():void {
			hasField$0 &= 0xfffffffd;
			is_daily_reset$field = new Boolean();
		}

		public function get hasIsDailyReset():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isDailyReset(value:Boolean):void {
			hasField$0 |= 0x2;
			is_daily_reset$field = value;
		}

		public function get isDailyReset():Boolean {
			return is_daily_reset$field;
		}

		/**
		 *  @private
		 */
		public static const ACHIEVEMENTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.AchievementGroupProto.achievements", "achievements", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AchievementGroupProto.AchievementDataProto; });

		[ArrayElementType("app.message.AchievementGroupProto.AchievementDataProto")]
		public var achievements:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type$field);
			}
			if (hasFirstTitleRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, first_title_res$field);
			}
			if (hasFirstTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, first_title$field);
			}
			if (hasSecondTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, second_title$field);
			}
			if (hasIsDailyReset) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_daily_reset$field);
			}
			for (var achievements$index:uint = 0; achievements$index < this.achievements.length; ++achievements$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.achievements[achievements$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var first_title_res$count:uint = 0;
			var first_title$count:uint = 0;
			var second_title$count:uint = 0;
			var is_daily_reset$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementGroupProto.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (first_title_res$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementGroupProto.firstTitleRes cannot be set twice.');
					}
					++first_title_res$count;
					this.firstTitleRes = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (first_title$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementGroupProto.firstTitle cannot be set twice.');
					}
					++first_title$count;
					this.firstTitle = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (second_title$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementGroupProto.secondTitle cannot be set twice.');
					}
					++second_title$count;
					this.secondTitle = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (is_daily_reset$count != 0) {
						throw new flash.errors.IOError('Bad data format: AchievementGroupProto.isDailyReset cannot be set twice.');
					}
					++is_daily_reset$count;
					this.isDailyReset = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 6:
					this.achievements.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.AchievementGroupProto.AchievementDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
