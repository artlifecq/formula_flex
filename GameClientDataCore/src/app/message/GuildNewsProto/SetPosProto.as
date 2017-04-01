package app.message.GuildNewsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GuildOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SetPosProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.GuildNewsProto.SetPosProto.hero_name", "heroName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.GuildNewsProto.SetPosProto.pos", "pos", (2 << 3) | com.netease.protobuf.WireType.VARINT, app.message.GuildOfficerPos);

		private var pos$field:int;

		private var hasField$0:uint = 0;

		public function clearPos():void {
			hasField$0 &= 0xfffffffe;
			pos$field = new int();
		}

		public function get hasPos():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set pos(value:int):void {
			hasField$0 |= 0x1;
			pos$field = value;
		}

		public function get pos():int {
			return pos$field;
		}

		/**
		 *  @private
		 */
		public static const IS_UP:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GuildNewsProto.SetPosProto.is_up", "isUp", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_up$field:Boolean;

		public function clearIsUp():void {
			hasField$0 &= 0xfffffffd;
			is_up$field = new Boolean();
		}

		public function get hasIsUp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isUp(value:Boolean):void {
			hasField$0 |= 0x2;
			is_up$field = value;
		}

		public function get isUp():Boolean {
			return is_up$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, hero_name$field);
			}
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, pos$field);
			}
			if (hasIsUp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_up$field);
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
			var pos$count:uint = 0;
			var is_up$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hero_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: SetPosProto.heroName cannot be set twice.');
					}
					++hero_name$count;
					this.heroName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: SetPosProto.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 3:
					if (is_up$count != 0) {
						throw new flash.errors.IOError('Bad data format: SetPosProto.isUp cannot be set twice.');
					}
					++is_up$count;
					this.isUp = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
