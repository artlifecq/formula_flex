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
	public dynamic final class HeroBasicOtherProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.HeroBasicOtherProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.HeroBasicOtherProto.name", "name", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.HeroBasicOtherProto.country", "country", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const HEAD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.HeroBasicOtherProto.head", "head", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var head$field:int;

		public function clearHead():void {
			hasField$0 &= 0xfffffffd;
			head$field = new int();
		}

		public function get hasHead():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set head(value:int):void {
			hasField$0 |= 0x2;
			head$field = value;
		}

		public function get head():int {
			return head$field;
		}

		/**
		 *  @private
		 */
		public static const MODEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroBasicOtherProto.model", "model", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ModelProto; });

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
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, id$field);
			}
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, name$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, country$field);
			}
			if (hasHead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, head$field);
			}
			if (hasModel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, model$field);
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
			var head$count:uint = 0;
			var model$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicOtherProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicOtherProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicOtherProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (head$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicOtherProto.head cannot be set twice.');
					}
					++head$count;
					this.head = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (model$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroBasicOtherProto.model cannot be set twice.');
					}
					++model$count;
					this.model = new app.message.ModelProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.model);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
