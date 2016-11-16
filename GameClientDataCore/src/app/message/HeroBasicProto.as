package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ModelProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HeroBasicProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.HeroBasicProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.HeroBasicProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroBasicProto.country", "country", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var country$field:int;

		private var hasField$0:uint = 0;

		public function clearCountry():void {
			hasField$0 &= 0xfffffffe;
			country$field = new int();
		}

		public function get hasCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set country(value:int):void {
			hasField$0 |= 0x1;
			country$field = value;
		}

		public function get country():int {
			return country$field;
		}

		/**
		 *  @private
		 */
		public static const IS_MALE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.HeroBasicProto.is_male", "isMale", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_male$field:Boolean;

		public function clearIsMale():void {
			hasField$0 &= 0xfffffffd;
			is_male$field = new Boolean();
		}

		public function get hasIsMale():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isMale(value:Boolean):void {
			hasField$0 |= 0x2;
			is_male$field = value;
		}

		public function get isMale():Boolean {
			return is_male$field;
		}

		/**
		 *  @private
		 */
		public static const HEAD:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.HeroBasicProto.head", "head", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var head$field:int;

		public function clearHead():void {
			hasField$0 &= 0xfffffffb;
			head$field = new int();
		}

		public function get hasHead():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set head(value:int):void {
			hasField$0 |= 0x4;
			head$field = value;
		}

		public function get head():int {
			return head$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.HeroBasicProto.create_time", "createTime", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var create_time$field:Int64;

		public function clearCreateTime():void {
			create_time$field = null;
		}

		public function get hasCreateTime():Boolean {
			return create_time$field != null;
		}

		public function set createTime(value:Int64):void {
			create_time$field = value;
		}

		public function get createTime():Int64 {
			return create_time$field;
		}

		/**
		 *  @private
		 */
		public static const MODEL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.HeroBasicProto.model", "model", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ModelProto; });

		private var model$field:app.message.ModelProto;

		public function clearModel():void {
			model$field = null;
		}

		public function get hasModel():Boolean {
			return model$field != null;
		}

		public function set model(value:app.message.ModelProto):void {
			model$field = value;
		}

		public function get model():app.message.ModelProto {
			return model$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, country$field);
			}
			if (hasIsMale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_male$field);
			}
			if (hasHead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, head$field);
			}
			if (hasCreateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, create_time$field);
			}
			if (hasModel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, model$field);
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
			var country$count:uint = 0;
			var is_male$count:uint = 0;
			var head$count:uint = 0;
			var create_time$count:uint = 0;
			var model$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (is_male$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicProto.isMale cannot be set twice.');
					}
					++is_male$count;
					this.isMale = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 5:
					if (head$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicProto.head cannot be set twice.');
					}
					++head$count;
					this.head = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (create_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicProto.createTime cannot be set twice.');
					}
					++create_time$count;
					this.createTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 7:
					if (model$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicProto.model cannot be set twice.');
					}
					++model$count;
					this.model = new app.message.ModelProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.model);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
