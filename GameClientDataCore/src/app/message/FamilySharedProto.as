package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyAnnoucementProto;
	import app.message.FamilyOfficeProto;
	import flash.utils.ByteArray;
	import app.message.FamilyMemberProto;
	import app.message.FamilyStorageStatProto;
	import app.message.FamilyAnimalBarStatProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilySharedProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAMILY_NAME:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.FamilySharedProto.family_name", "familyName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var family_name$field:flash.utils.ByteArray;

		public function clearFamilyName():void {
			family_name$field = null;
		}

		public function get hasFamilyName():Boolean {
			return family_name$field != null;
		}

		public function set familyName(value:flash.utils.ByteArray):void {
			family_name$field = value;
		}

		public function get familyName():flash.utils.ByteArray {
			return family_name$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilySharedProto.country", "country", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const HALL_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilySharedProto.hall_level", "hallLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hall_level$field:int;

		public function clearHallLevel():void {
			hasField$0 &= 0xfffffffd;
			hall_level$field = new int();
		}

		public function get hasHallLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set hallLevel(value:int):void {
			hasField$0 |= 0x2;
			hall_level$field = value;
		}

		public function get hallLevel():int {
			return hall_level$field;
		}

		/**
		 *  @private
		 */
		public static const COLLAGE_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilySharedProto.collage_level", "collageLevel", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collage_level$field:int;

		public function clearCollageLevel():void {
			hasField$0 &= 0xfffffffb;
			collage_level$field = new int();
		}

		public function get hasCollageLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set collageLevel(value:int):void {
			hasField$0 |= 0x4;
			collage_level$field = value;
		}

		public function get collageLevel():int {
			return collage_level$field;
		}

		/**
		 *  @private
		 */
		public static const BIAO_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilySharedProto.biao_level", "biaoLevel", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var biao_level$field:int;

		public function clearBiaoLevel():void {
			hasField$0 &= 0xfffffff7;
			biao_level$field = new int();
		}

		public function get hasBiaoLevel():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set biaoLevel(value:int):void {
			hasField$0 |= 0x8;
			biao_level$field = value;
		}

		public function get biaoLevel():int {
			return biao_level$field;
		}

		/**
		 *  @private
		 */
		public static const ANIMAL_BAR_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FamilySharedProto.animal_bar_level", "animalBarLevel", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var animal_bar_level$field:int;

		public function clearAnimalBarLevel():void {
			hasField$0 &= 0xffffffef;
			animal_bar_level$field = new int();
		}

		public function get hasAnimalBarLevel():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set animalBarLevel(value:int):void {
			hasField$0 |= 0x10;
			animal_bar_level$field = value;
		}

		public function get animalBarLevel():int {
			return animal_bar_level$field;
		}

		/**
		 *  @private
		 */
		public static const ANIMAL_BAR_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilySharedProto.animal_bar_stat", "animalBarStat", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyAnimalBarStatProto; });

		private var animal_bar_stat$field:app.message.FamilyAnimalBarStatProto;

		public function clearAnimalBarStat():void {
			animal_bar_stat$field = null;
		}

		public function get hasAnimalBarStat():Boolean {
			return animal_bar_stat$field != null;
		}

		public function set animalBarStat(value:app.message.FamilyAnimalBarStatProto):void {
			animal_bar_stat$field = value;
		}

		public function get animalBarStat():app.message.FamilyAnimalBarStatProto {
			return animal_bar_stat$field;
		}

		/**
		 *  @private
		 */
		public static const STORAGE_STAT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilySharedProto.storage_stat", "storageStat", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyStorageStatProto; });

		private var storage_stat$field:app.message.FamilyStorageStatProto;

		public function clearStorageStat():void {
			storage_stat$field = null;
		}

		public function get hasStorageStat():Boolean {
			return storage_stat$field != null;
		}

		public function set storageStat(value:app.message.FamilyStorageStatProto):void {
			storage_stat$field = value;
		}

		public function get storageStat():app.message.FamilyStorageStatProto {
			return storage_stat$field;
		}

		/**
		 *  @private
		 */
		public static const IS_AUTO_ACCEPT_JOIN_REQUEST:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.FamilySharedProto.is_auto_accept_join_request", "isAutoAcceptJoinRequest", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_auto_accept_join_request$field:Boolean;

		public function clearIsAutoAcceptJoinRequest():void {
			hasField$0 &= 0xffffffdf;
			is_auto_accept_join_request$field = new Boolean();
		}

		public function get hasIsAutoAcceptJoinRequest():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isAutoAcceptJoinRequest(value:Boolean):void {
			hasField$0 |= 0x20;
			is_auto_accept_join_request$field = value;
		}

		public function get isAutoAcceptJoinRequest():Boolean {
			return is_auto_accept_join_request$field;
		}

		/**
		 *  @private
		 */
		public static const MEMBERS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.FamilySharedProto.members", "members", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyMemberProto; });

		[ArrayElementType("app.message.FamilyMemberProto")]
		public var members:Array = [];

		/**
		 *  @private
		 */
		public static const OFFICE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilySharedProto.office", "office", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyOfficeProto; });

		private var office$field:app.message.FamilyOfficeProto;

		public function clearOffice():void {
			office$field = null;
		}

		public function get hasOffice():Boolean {
			return office$field != null;
		}

		public function set office(value:app.message.FamilyOfficeProto):void {
			office$field = value;
		}

		public function get office():app.message.FamilyOfficeProto {
			return office$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilySharedProto.create_time", "createTime", (12 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ANNOUNCEMENT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilySharedProto.announcement", "announcement", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyAnnoucementProto; });

		private var announcement$field:app.message.FamilyAnnoucementProto;

		public function clearAnnouncement():void {
			announcement$field = null;
		}

		public function get hasAnnouncement():Boolean {
			return announcement$field != null;
		}

		public function set announcement(value:app.message.FamilyAnnoucementProto):void {
			announcement$field = value;
		}

		public function get announcement():app.message.FamilyAnnoucementProto {
			return announcement$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.FamilySharedProto.guild_name", "guildName", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guild_name$field:String;

		public function clearGuildName():void {
			guild_name$field = null;
		}

		public function get hasGuildName():Boolean {
			return guild_name$field != null;
		}

		public function set guildName(value:String):void {
			guild_name$field = value;
		}

		public function get guildName():String {
			return guild_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFamilyName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, family_name$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, country$field);
			}
			if (hasHallLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hall_level$field);
			}
			if (hasCollageLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, collage_level$field);
			}
			if (hasBiaoLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, biao_level$field);
			}
			if (hasAnimalBarLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, animal_bar_level$field);
			}
			if (hasAnimalBarStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, animal_bar_stat$field);
			}
			if (hasStorageStat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, storage_stat$field);
			}
			if (hasIsAutoAcceptJoinRequest) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_auto_accept_join_request$field);
			}
			for (var members$index:uint = 0; members$index < this.members.length; ++members$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.members[members$index]);
			}
			if (hasOffice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, office$field);
			}
			if (hasCreateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, create_time$field);
			}
			if (hasAnnouncement) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, announcement$field);
			}
			if (hasGuildName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, guild_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var family_name$count:uint = 0;
			var country$count:uint = 0;
			var hall_level$count:uint = 0;
			var collage_level$count:uint = 0;
			var biao_level$count:uint = 0;
			var animal_bar_level$count:uint = 0;
			var animal_bar_stat$count:uint = 0;
			var storage_stat$count:uint = 0;
			var is_auto_accept_join_request$count:uint = 0;
			var office$count:uint = 0;
			var create_time$count:uint = 0;
			var announcement$count:uint = 0;
			var guild_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (family_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.familyName cannot be set twice.');
					}
					++family_name$count;
					this.familyName = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 2:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (hall_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.hallLevel cannot be set twice.');
					}
					++hall_level$count;
					this.hallLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (collage_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.collageLevel cannot be set twice.');
					}
					++collage_level$count;
					this.collageLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (biao_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.biaoLevel cannot be set twice.');
					}
					++biao_level$count;
					this.biaoLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (animal_bar_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.animalBarLevel cannot be set twice.');
					}
					++animal_bar_level$count;
					this.animalBarLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (animal_bar_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.animalBarStat cannot be set twice.');
					}
					++animal_bar_stat$count;
					this.animalBarStat = new app.message.FamilyAnimalBarStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.animalBarStat);
					break;
				case 8:
					if (storage_stat$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.storageStat cannot be set twice.');
					}
					++storage_stat$count;
					this.storageStat = new app.message.FamilyStorageStatProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.storageStat);
					break;
				case 9:
					if (is_auto_accept_join_request$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.isAutoAcceptJoinRequest cannot be set twice.');
					}
					++is_auto_accept_join_request$count;
					this.isAutoAcceptJoinRequest = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 10:
					this.members.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.FamilyMemberProto()));
					break;
				case 11:
					if (office$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.office cannot be set twice.');
					}
					++office$count;
					this.office = new app.message.FamilyOfficeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.office);
					break;
				case 12:
					if (create_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.createTime cannot be set twice.');
					}
					++create_time$count;
					this.createTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 13:
					if (announcement$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.announcement cannot be set twice.');
					}
					++announcement$count;
					this.announcement = new app.message.FamilyAnnoucementProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.announcement);
					break;
				case 14:
					if (guild_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilySharedProto.guildName cannot be set twice.');
					}
					++guild_name$count;
					this.guildName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
