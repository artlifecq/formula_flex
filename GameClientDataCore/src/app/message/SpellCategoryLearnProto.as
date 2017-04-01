package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.SpellLearnProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellCategoryLearnProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.SpellCategoryLearnProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const MUTEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellCategoryLearnProto.mutex", "mutex", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mutex$field:int;

		private var hasField$0:uint = 0;

		public function clearMutex():void {
			hasField$0 &= 0xfffffffe;
			mutex$field = new int();
		}

		public function get hasMutex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set mutex(value:int):void {
			hasField$0 |= 0x1;
			mutex$field = value;
		}

		public function get mutex():int {
			return mutex$field;
		}

		/**
		 *  @private
		 */
		public static const SPELLS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.SpellCategoryLearnProto.spells", "spells", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.SpellLearnProto; });

		[ArrayElementType("app.message.SpellLearnProto")]
		public var spells:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasMutex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, mutex$field);
			}
			for (var spells$index:uint = 0; spells$index < this.spells.length; ++spells$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.spells[spells$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var mutex$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellCategoryLearnProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (mutex$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellCategoryLearnProto.mutex cannot be set twice.');
					}
					++mutex$count;
					this.mutex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					this.spells.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.SpellLearnProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
