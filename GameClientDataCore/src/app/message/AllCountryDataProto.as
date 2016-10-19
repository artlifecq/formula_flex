package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.OtherCountryDataProto;
	import app.message.CountryDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AllCountryDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SELF_COUNTRY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.AllCountryDataProto.self_country", "selfCountry", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryDataProto; });

		private var self_country$field:app.message.CountryDataProto;

		public function clearSelfCountry():void {
			self_country$field = null;
		}

		public function get hasSelfCountry():Boolean {
			return self_country$field != null;
		}

		public function set selfCountry(value:app.message.CountryDataProto):void {
			self_country$field = value;
		}

		public function get selfCountry():app.message.CountryDataProto {
			return self_country$field;
		}

		/**
		 *  @private
		 */
		public static const OTHER_COUNTRIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.AllCountryDataProto.other_countries", "otherCountries", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.OtherCountryDataProto; });

		[ArrayElementType("app.message.OtherCountryDataProto")]
		public var otherCountries:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSelfCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, self_country$field);
			}
			for (var otherCountries$index:uint = 0; otherCountries$index < this.otherCountries.length; ++otherCountries$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.otherCountries[otherCountries$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var self_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (self_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: AllCountryDataProto.selfCountry cannot be set twice.');
					}
					++self_country$count;
					this.selfCountry = new app.message.CountryDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.selfCountry);
					break;
				case 2:
					this.otherCountries.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.OtherCountryDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
