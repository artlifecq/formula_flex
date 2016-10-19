package app.message.CountryHistoryRecordProto {
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
	public dynamic final class PersonalCountryWarFirstProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto.hero_name", "heroName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var hero_name$field:String;

		public function clearHeroName():void {
			hero_name$field = null;
		}

		public function get hasHeroName():Boolean {
			return hero_name$field != null;
		}

		public function set heroName(value:String):void {
			hero_name$field = value;
		}

		public function get heroName():String {
			return hero_name$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryHistoryRecordProto.PersonalCountryWarFirstProto.kill_count", "killCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_count$field:int;

		private var hasField$0:uint = 0;

		public function clearKillCount():void {
			hasField$0 &= 0xfffffffe;
			kill_count$field = new int();
		}

		public function get hasKillCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set killCount(value:int):void {
			hasField$0 |= 0x1;
			kill_count$field = value;
		}

		public function get killCount():int {
			return kill_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, hero_name$field);
			}
			if (hasKillCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, kill_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hero_name$count:uint = 0;
			var kill_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hero_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalCountryWarFirstProto.heroName cannot be set twice.');
					}
					++hero_name$count;
					this.heroName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (kill_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: PersonalCountryWarFirstProto.killCount cannot be set twice.');
					}
					++kill_count$count;
					this.killCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
