package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryPosOfficersProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryOfficeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OFFICERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryOfficeProto.officers", "officers", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryPosOfficersProto; });

		[ArrayElementType("app.message.CountryPosOfficersProto")]
		public var officers:Array = [];

		/**
		 *  @private
		 */
		public static const TONG_ZHI_LI:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryOfficeProto.tong_zhi_li", "tongZhiLi", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tong_zhi_li$field:int;

		private var hasField$0:uint = 0;

		public function clearTongZhiLi():void {
			hasField$0 &= 0xfffffffe;
			tong_zhi_li$field = new int();
		}

		public function get hasTongZhiLi():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set tongZhiLi(value:int):void {
			hasField$0 |= 0x1;
			tong_zhi_li$field = value;
		}

		public function get tongZhiLi():int {
			return tong_zhi_li$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY_ANNOUNCEMENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryOfficeProto.country_announcement", "countryAnnouncement", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var country_announcement$field:String;

		public function clearCountryAnnouncement():void {
			country_announcement$field = null;
		}

		public function get hasCountryAnnouncement():Boolean {
			return country_announcement$field != null;
		}

		public function set countryAnnouncement(value:String):void {
			country_announcement$field = value;
		}

		public function get countryAnnouncement():String {
			return country_announcement$field;
		}

		/**
		 *  @private
		 */
		public static const JIN_WEI_ANNOUNCEMENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CountryOfficeProto.jin_wei_announcement", "jinWeiAnnouncement", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var jin_wei_announcement$field:String;

		public function clearJinWeiAnnouncement():void {
			jin_wei_announcement$field = null;
		}

		public function get hasJinWeiAnnouncement():Boolean {
			return jin_wei_announcement$field != null;
		}

		public function set jinWeiAnnouncement(value:String):void {
			jin_wei_announcement$field = value;
		}

		public function get jinWeiAnnouncement():String {
			return jin_wei_announcement$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var officers$index:uint = 0; officers$index < this.officers.length; ++officers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.officers[officers$index]);
			}
			if (hasTongZhiLi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tong_zhi_li$field);
			}
			if (hasCountryAnnouncement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, country_announcement$field);
			}
			if (hasJinWeiAnnouncement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, jin_wei_announcement$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tong_zhi_li$count:uint = 0;
			var country_announcement$count:uint = 0;
			var jin_wei_announcement$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.officers.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryPosOfficersProto()));
					break;
				case 2:
					if (tong_zhi_li$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficeProto.tongZhiLi cannot be set twice.');
					}
					++tong_zhi_li$count;
					this.tongZhiLi = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (country_announcement$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficeProto.countryAnnouncement cannot be set twice.');
					}
					++country_announcement$count;
					this.countryAnnouncement = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (jin_wei_announcement$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryOfficeProto.jinWeiAnnouncement cannot be set twice.');
					}
					++jin_wei_announcement$count;
					this.jinWeiAnnouncement = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
