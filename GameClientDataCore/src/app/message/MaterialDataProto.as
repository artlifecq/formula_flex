package app.message {
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
	public dynamic final class MaterialDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GROUP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MaterialDataProto.group", "group", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var group$field:int;

		private var hasField$0:uint = 0;

		public function clearGroup():void {
			hasField$0 &= 0xfffffffe;
			group$field = new int();
		}

		public function get hasGroup():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set group(value:int):void {
			hasField$0 |= 0x1;
			group$field = value;
		}

		public function get group():int {
			return group$field;
		}

		/**
		 *  @private
		 */
		public static const GROUP_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.MaterialDataProto.group_name", "groupName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var group_name$field:String;

		public function clearGroupName():void {
			group_name$field = null;
		}

		public function get hasGroupName():Boolean {
			return group_name$field != null;
		}

		public function set groupName(value:String):void {
			group_name$field = value;
		}

		public function get groupName():String {
			return group_name$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MaterialDataProto.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGroup) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, group$field);
			}
			if (hasGroupName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, group_name$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var group$count:uint = 0;
			var group_name$count:uint = 0;
			var level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (group$count != 0) {
						throw new flash.errors.IOError('Bad data format: MaterialDataProto.group cannot be set twice.');
					}
					++group$count;
					this.group = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (group_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MaterialDataProto.groupName cannot be set twice.');
					}
					++group_name$count;
					this.groupName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MaterialDataProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
