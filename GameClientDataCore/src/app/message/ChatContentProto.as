package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsProto;
	import app.message.ChatContentProto.PosInfoProto;
	import app.message.CountryOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChatContentProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SPEECH:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.ChatContentProto.speech", "speech", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var speech$field:String;

		public function clearSpeech():void {
			speech$field = null;
		}

		public function get hasSpeech():Boolean {
			return speech$field != null;
		}

		public function set speech(value:String):void {
			speech$field = value;
		}

		public function get speech():String {
			return speech$field;
		}

		/**
		 *  @private
		 */
		public static const CHAT_GOODS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ChatContentProto.chat_goods", "chatGoods", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsProto; });

		[ArrayElementType("app.message.GoodsProto")]
		public var chatGoods:Array = [];

		/**
		 *  @private
		 */
		public static const CHECK_SUM:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChatContentProto.check_sum", "checkSum", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var check_sum$field:int;

		private var hasField$0:uint = 0;

		public function clearCheckSum():void {
			hasField$0 &= 0xfffffffe;
			check_sum$field = new int();
		}

		public function get hasCheckSum():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set checkSum(value:int):void {
			hasField$0 |= 0x1;
			check_sum$field = value;
		}

		public function get checkSum():int {
			return check_sum$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.ChatContentProto.hero_id", "heroId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_id$field:Int64;

		public function clearHeroId():void {
			hero_id$field = null;
		}

		public function get hasHeroId():Boolean {
			return hero_id$field != null;
		}

		public function set heroId(value:Int64):void {
			hero_id$field = value;
		}

		public function get heroId():Int64 {
			return hero_id$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.ChatContentProto.hero_name", "heroName", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var hero_name$field:String;

		public function clearHeroName():void {
			hero_name$field = null;
		}

		public function get hasHeroName():Boolean {
			return hero_name$field != null;
		}

		public function set heroName(value:String):void {
			hero_name$field = value;
		}

		public function get heroName():String {
			return hero_name$field;
		}

		/**
		 *  @private
		 */
		public static const COUNTRY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChatContentProto.country", "country", (6 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChatContentProto.level", "level", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffb;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x4;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const POS_INFO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ChatContentProto.pos_info", "posInfo", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ChatContentProto.PosInfoProto; });

		private var pos_info$field:app.message.ChatContentProto.PosInfoProto;

		public function clearPosInfo():void {
			pos_info$field = null;
		}

		public function get hasPosInfo():Boolean {
			return pos_info$field != null;
		}

		public function set posInfo(value:app.message.ChatContentProto.PosInfoProto):void {
			pos_info$field = value;
		}

		public function get posInfo():app.message.ChatContentProto.PosInfoProto {
			return pos_info$field;
		}

		/**
		 *  @private
		 */
		public static const OFFICER_POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.ChatContentProto.officer_pos", "officerPos", (10 << 3) | com.netease.protobuf.WireType.VARINT, app.message.CountryOfficerPos);

		private var officer_pos$field:int;

		public function clearOfficerPos():void {
			hasField$0 &= 0xfffffff7;
			officer_pos$field = new int();
		}

		public function get hasOfficerPos():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set officerPos(value:int):void {
			hasField$0 |= 0x8;
			officer_pos$field = value;
		}

		public function get officerPos():int {
			return officer_pos$field;
		}

		/**
		 *  @private
		 */
		public static const IS_KING_GUILD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.ChatContentProto.is_king_guild", "isKingGuild", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_king_guild$field:Boolean;

		public function clearIsKingGuild():void {
			hasField$0 &= 0xffffffef;
			is_king_guild$field = new Boolean();
		}

		public function get hasIsKingGuild():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isKingGuild(value:Boolean):void {
			hasField$0 |= 0x10;
			is_king_guild$field = value;
		}

		public function get isKingGuild():Boolean {
			return is_king_guild$field;
		}

		/**
		 *  @private
		 */
		public static const IS_EMPEROR_GUILD:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.ChatContentProto.is_emperor_guild", "isEmperorGuild", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_emperor_guild$field:Boolean;

		public function clearIsEmperorGuild():void {
			hasField$0 &= 0xffffffdf;
			is_emperor_guild$field = new Boolean();
		}

		public function get hasIsEmperorGuild():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set isEmperorGuild(value:Boolean):void {
			hasField$0 |= 0x20;
			is_emperor_guild$field = value;
		}

		public function get isEmperorGuild():Boolean {
			return is_emperor_guild$field;
		}

		/**
		 *  @private
		 */
		public static const IS_GM:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.ChatContentProto.is_gm", "isGm", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_gm$field:Boolean;

		public function clearIsGm():void {
			hasField$0 &= 0xffffffbf;
			is_gm$field = new Boolean();
		}

		public function get hasIsGm():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set isGm(value:Boolean):void {
			hasField$0 |= 0x40;
			is_gm$field = value;
		}

		public function get isGm():Boolean {
			return is_gm$field;
		}

		/**
		 *  @private
		 */
		public static const PLATFORM_VIP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChatContentProto.platform_vip", "platformVip", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var platform_vip$field:int;

		public function clearPlatformVip():void {
			hasField$0 &= 0xffffff7f;
			platform_vip$field = new int();
		}

		public function get hasPlatformVip():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set platformVip(value:int):void {
			hasField$0 |= 0x80;
			platform_vip$field = value;
		}

		public function get platformVip():int {
			return platform_vip$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChatContentProto.vip_level", "vipLevel", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_level$field:int;

		public function clearVipLevel():void {
			hasField$0 &= 0xfffffeff;
			vip_level$field = new int();
		}

		public function get hasVipLevel():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set vipLevel(value:int):void {
			hasField$0 |= 0x100;
			vip_level$field = value;
		}

		public function get vipLevel():int {
			return vip_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSpeech) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, speech$field);
			}
			for (var chatGoods$index:uint = 0; chatGoods$index < this.chatGoods.length; ++chatGoods$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.chatGoods[chatGoods$index]);
			}
			if (hasCheckSum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, check_sum$field);
			}
			if (hasHeroId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, hero_id$field);
			}
			if (hasHeroName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, hero_name$field);
			}
			if (hasCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, country$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasPosInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, pos_info$field);
			}
			if (hasOfficerPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, officer_pos$field);
			}
			if (hasIsKingGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_king_guild$field);
			}
			if (hasIsEmperorGuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_emperor_guild$field);
			}
			if (hasIsGm) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_gm$field);
			}
			if (hasPlatformVip) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, platform_vip$field);
			}
			if (hasVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, vip_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var speech$count:uint = 0;
			var check_sum$count:uint = 0;
			var hero_id$count:uint = 0;
			var hero_name$count:uint = 0;
			var country$count:uint = 0;
			var level$count:uint = 0;
			var pos_info$count:uint = 0;
			var officer_pos$count:uint = 0;
			var is_king_guild$count:uint = 0;
			var is_emperor_guild$count:uint = 0;
			var is_gm$count:uint = 0;
			var platform_vip$count:uint = 0;
			var vip_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (speech$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.speech cannot be set twice.');
					}
					++speech$count;
					this.speech = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					this.chatGoods.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GoodsProto()));
					break;
				case 3:
					if (check_sum$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.checkSum cannot be set twice.');
					}
					++check_sum$count;
					this.checkSum = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (hero_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.heroId cannot be set twice.');
					}
					++hero_id$count;
					this.heroId = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (hero_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.heroName cannot be set twice.');
					}
					++hero_name$count;
					this.heroName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 6:
					if (country$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.country cannot be set twice.');
					}
					++country$count;
					this.country = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (pos_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.posInfo cannot be set twice.');
					}
					++pos_info$count;
					this.posInfo = new app.message.ChatContentProto.PosInfoProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.posInfo);
					break;
				case 10:
					if (officer_pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.officerPos cannot be set twice.');
					}
					++officer_pos$count;
					this.officerPos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 11:
					if (is_king_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.isKingGuild cannot be set twice.');
					}
					++is_king_guild$count;
					this.isKingGuild = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 12:
					if (is_emperor_guild$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.isEmperorGuild cannot be set twice.');
					}
					++is_emperor_guild$count;
					this.isEmperorGuild = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 13:
					if (is_gm$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.isGm cannot be set twice.');
					}
					++is_gm$count;
					this.isGm = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 14:
					if (platform_vip$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.platformVip cannot be set twice.');
					}
					++platform_vip$count;
					this.platformVip = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 15:
					if (vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChatContentProto.vipLevel cannot be set twice.');
					}
					++vip_level$count;
					this.vipLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
