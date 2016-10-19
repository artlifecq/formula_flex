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
	public dynamic final class WatchWarCountryOfficeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ATTACK_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.WatchWarCountryOfficeProto.attack_country", "attackCountry", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_country$field:int;

		private var hasField$0:uint = 0;

		public function clearAttackCountry():void {
			hasField$0 &= 0xfffffffe;
			attack_country$field = new int();
		}

		public function get hasAttackCountry():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set attackCountry(value:int):void {
			hasField$0 |= 0x1;
			attack_country$field = value;
		}

		public function get attackCountry():int {
			return attack_country$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK_COUNTRY_OFFICERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.WatchWarCountryOfficeProto.attack_country_officers", "attackCountryOfficers", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryPosOfficersProto; });

		[ArrayElementType("app.message.CountryPosOfficersProto")]
		public var attackCountryOfficers:Array = [];

		/**
		 *  @private
		 */
		public static const DEFENCE_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.WatchWarCountryOfficeProto.defence_country", "defenceCountry", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var defence_country$field:int;

		public function clearDefenceCountry():void {
			hasField$0 &= 0xfffffffd;
			defence_country$field = new int();
		}

		public function get hasDefenceCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set defenceCountry(value:int):void {
			hasField$0 |= 0x2;
			defence_country$field = value;
		}

		public function get defenceCountry():int {
			return defence_country$field;
		}

		/**
		 *  @private
		 */
		public static const DEFENCE_COUNTRY_OFFICERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.WatchWarCountryOfficeProto.defence_country_officers", "defenceCountryOfficers", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryPosOfficersProto; });

		[ArrayElementType("app.message.CountryPosOfficersProto")]
		public var defenceCountryOfficers:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAttackCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, attack_country$field);
			}
			for (var attackCountryOfficers$index:uint = 0; attackCountryOfficers$index < this.attackCountryOfficers.length; ++attackCountryOfficers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.attackCountryOfficers[attackCountryOfficers$index]);
			}
			if (hasDefenceCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, defence_country$field);
			}
			for (var defenceCountryOfficers$index:uint = 0; defenceCountryOfficers$index < this.defenceCountryOfficers.length; ++defenceCountryOfficers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.defenceCountryOfficers[defenceCountryOfficers$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var attack_country$count:uint = 0;
			var defence_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (attack_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: WatchWarCountryOfficeProto.attackCountry cannot be set twice.');
					}
					++attack_country$count;
					this.attackCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					this.attackCountryOfficers.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryPosOfficersProto()));
					break;
				case 3:
					if (defence_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: WatchWarCountryOfficeProto.defenceCountry cannot be set twice.');
					}
					++defence_country$count;
					this.defenceCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					this.defenceCountryOfficers.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryPosOfficersProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
