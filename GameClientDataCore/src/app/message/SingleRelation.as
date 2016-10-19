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
	public dynamic final class SingleRelation extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.SingleRelation.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:Int64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:Int64):void {
			id$field = value;
		}

		public function get id():Int64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.SingleRelation.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SingleRelation.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SingleRelation.country", "country", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffd;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x2;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const IS_MALE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.SingleRelation.is_male", "isMale", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_male$field:Boolean;

		public function clearIsMale():void {
			hasField$0 &= 0xfffffffb;
			is_male$field = new Boolean();
		}

		public function get hasIsMale():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isMale(value:Boolean):void {
			hasField$0 |= 0x4;
			is_male$field = value;
		}

		public function get isMale():Boolean {
			return is_male$field;
		}

		/**
		 *  @private
		 */
		public static const HEAD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SingleRelation.head", "head", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var head$field:int;

		public function clearHead():void {
			hasField$0 &= 0xfffffff7;
			head$field = new int();
		}

		public function get hasHead():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set head(value:int):void {
			hasField$0 |= 0x8;
			head$field = value;
		}

		public function get head():int {
			return head$field;
		}

		/**
		 *  @private
		 */
		public static const MOOD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.SingleRelation.mood", "mood", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var mood$field:String;

		public function clearMood():void {
			mood$field = null;
		}

		public function get hasMood():Boolean {
			return mood$field != null;
		}

		public function set mood(value:String):void {
			mood$field = value;
		}

		public function get mood():String {
			return mood$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			if (hasIsMale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_male$field);
			}
			if (hasHead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, head$field);
			}
			if (hasMood) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, mood$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var name$count:uint = 0;
			var level$count:uint = 0;
			var country$count:uint = 0;
			var is_male$count:uint = 0;
			var head$count:uint = 0;
			var mood$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRelation.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRelation.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRelation.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRelation.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (is_male$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRelation.isMale cannot be set twice.');
					}
					++is_male$count;
					this.isMale = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (head$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRelation.head cannot be set twice.');
					}
					++head$count;
					this.head = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (mood$count != 0) {
						throw new flash.errors.IOError('Bad data format: SingleRelation.mood cannot be set twice.');
					}
					++mood$count;
					this.mood = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
