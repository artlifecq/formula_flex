package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryOfficerDatasProto;
	import app.message.CountryMiscProto;
	import app.message.CountryNameProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MISC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryConfig.misc", "misc", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryMiscProto; });

		private var misc$field:app.message.CountryMiscProto;

		public function clearMisc():void {
			misc$field = null;
		}

		public function get hasMisc():Boolean {
			return misc$field != null;
		}

		public function set misc(value:app.message.CountryMiscProto):void {
			misc$field = value;
		}

		public function get misc():app.message.CountryMiscProto {
			return misc$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_NAME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryConfig.country_name", "countryName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryNameProto; });

		private var country_name$field:app.message.CountryNameProto;

		public function clearCountryName():void {
			country_name$field = null;
		}

		public function get hasCountryName():Boolean {
			return country_name$field != null;
		}

		public function set countryName(value:app.message.CountryNameProto):void {
			country_name$field = value;
		}

		public function get countryName():app.message.CountryNameProto {
			return country_name$field;
		}

		/**
		 *  @private
		 */
		public static const OFFICER_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryConfig.officer_datas", "officerDatas", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryOfficerDatasProto; });

		private var officer_datas$field:app.message.CountryOfficerDatasProto;

		public function clearOfficerDatas():void {
			officer_datas$field = null;
		}

		public function get hasOfficerDatas():Boolean {
			return officer_datas$field != null;
		}

		public function set officerDatas(value:app.message.CountryOfficerDatasProto):void {
			officer_datas$field = value;
		}

		public function get officerDatas():app.message.CountryOfficerDatasProto {
			return officer_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMisc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, misc$field);
			}
			if (hasCountryName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, country_name$field);
			}
			if (hasOfficerDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, officer_datas$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var misc$count:uint = 0;
			var country_name$count:uint = 0;
			var officer_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (misc$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryConfig.misc cannot be set twice.');
					}
					++misc$count;
					this.misc = new app.message.CountryMiscProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.misc);
					break;
				case 3:
					if (country_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryConfig.countryName cannot be set twice.');
					}
					++country_name$count;
					this.countryName = new app.message.CountryNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.countryName);
					break;
				case 4:
					if (officer_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryConfig.officerDatas cannot be set twice.');
					}
					++officer_datas$count;
					this.officerDatas = new app.message.CountryOfficerDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.officerDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
