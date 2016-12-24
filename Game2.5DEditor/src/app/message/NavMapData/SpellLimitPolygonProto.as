package app.message.NavMapData {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NavMapData.PolygonProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellLimitPolygonProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POLY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.NavMapData.SpellLimitPolygonProto.poly", "poly", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.PolygonProto; });

		private var poly$field:app.message.NavMapData.PolygonProto;

		public function clearPoly():void {
			poly$field = null;
		}

		public function get hasPoly():Boolean {
			return poly$field != null;
		}

		public function set poly(value:app.message.NavMapData.PolygonProto):void {
			poly$field = value;
		}

		public function get poly():app.message.NavMapData.PolygonProto {
			return poly$field;
		}

		/**
		 *  @private
		 */
		public static const UNLIMIT_SPELL_TYPE:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.NavMapData.SpellLimitPolygonProto.unlimit_spell_type", "unlimitSpellType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var unlimitSpellType:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPoly) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, poly$field);
			}
			for (var unlimitSpellType$index:uint = 0; unlimitSpellType$index < this.unlimitSpellType.length; ++unlimitSpellType$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.unlimitSpellType[unlimitSpellType$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var poly$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (poly$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellLimitPolygonProto.poly cannot be set twice.');
					}
					++poly$count;
					this.poly = new app.message.NavMapData.PolygonProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.poly);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.unlimitSpellType);
						break;
					}
					this.unlimitSpellType.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
