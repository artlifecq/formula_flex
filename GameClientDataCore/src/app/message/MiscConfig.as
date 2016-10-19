package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MiscConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PAID_CHAT_GOODS_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiscConfig.paid_chat_goods_id", "paidChatGoodsId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var paid_chat_goods_id$field:int;

		private var hasField$0:uint = 0;

		public function clearPaidChatGoodsId():void {
			hasField$0 &= 0xfffffffe;
			paid_chat_goods_id$field = new int();
		}

		public function get hasPaidChatGoodsId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set paidChatGoodsId(value:int):void {
			hasField$0 |= 0x1;
			paid_chat_goods_id$field = value;
		}

		public function get paidChatGoodsId():int {
			return paid_chat_goods_id$field;
		}

		/**
		 *  @private
		 */
		public static const OFFLINE_EXP_3_JINZI:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiscConfig.offline_exp_3_jinzi", "offlineExp_3Jinzi", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var offline_exp_3_jinzi$field:int;

		public function clearOfflineExp_3Jinzi():void {
			hasField$0 &= 0xfffffffd;
			offline_exp_3_jinzi$field = new int();
		}

		public function get hasOfflineExp_3Jinzi():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set offlineExp_3Jinzi(value:int):void {
			hasField$0 |= 0x2;
			offline_exp_3_jinzi$field = value;
		}

		public function get offlineExp_3Jinzi():int {
			return offline_exp_3_jinzi$field;
		}

		/**
		 *  @private
		 */
		public static const TIME_OFFSET:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MiscConfig.time_offset", "timeOffset", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time_offset$field:Int64;

		public function clearTimeOffset():void {
			time_offset$field = null;
		}

		public function get hasTimeOffset():Boolean {
			return time_offset$field != null;
		}

		public function set timeOffset(value:Int64):void {
			time_offset$field = value;
		}

		public function get timeOffset():Int64 {
			return time_offset$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_PER_PAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiscConfig.rank_per_page", "rankPerPage", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank_per_page$field:int;

		public function clearRankPerPage():void {
			hasField$0 &= 0xfffffffb;
			rank_per_page$field = new int();
		}

		public function get hasRankPerPage():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set rankPerPage(value:int):void {
			hasField$0 |= 0x4;
			rank_per_page$field = value;
		}

		public function get rankPerPage():int {
			return rank_per_page$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_ADMIRE_MAX_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiscConfig.rank_admire_max_times", "rankAdmireMaxTimes", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank_admire_max_times$field:int;

		public function clearRankAdmireMaxTimes():void {
			hasField$0 &= 0xfffffff7;
			rank_admire_max_times$field = new int();
		}

		public function get hasRankAdmireMaxTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set rankAdmireMaxTimes(value:int):void {
			hasField$0 |= 0x8;
			rank_admire_max_times$field = value;
		}

		public function get rankAdmireMaxTimes():int {
			return rank_admire_max_times$field;
		}

		/**
		 *  @private
		 */
		public static const RANK_SEARCH_INTERVAL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.MiscConfig.rank_search_interval", "rankSearchInterval", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank_search_interval$field:int;

		public function clearRankSearchInterval():void {
			hasField$0 &= 0xffffffef;
			rank_search_interval$field = new int();
		}

		public function get hasRankSearchInterval():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set rankSearchInterval(value:int):void {
			hasField$0 |= 0x10;
			rank_search_interval$field = value;
		}

		public function get rankSearchInterval():int {
			return rank_search_interval$field;
		}

		/**
		 *  @private
		 */
		public static const TRANSPORT_COST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MiscConfig.transport_cost", "transportCost", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var transport_cost$field:app.message.UpgradeProto;

		public function clearTransportCost():void {
			transport_cost$field = null;
		}

		public function get hasTransportCost():Boolean {
			return transport_cost$field != null;
		}

		public function set transportCost(value:app.message.UpgradeProto):void {
			transport_cost$field = value;
		}

		public function get transportCost():app.message.UpgradeProto {
			return transport_cost$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_NAME_UPGRADE_PROTO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MiscConfig.change_name_upgrade_proto", "changeNameUpgradeProto", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var change_name_upgrade_proto$field:app.message.UpgradeProto;

		public function clearChangeNameUpgradeProto():void {
			change_name_upgrade_proto$field = null;
		}

		public function get hasChangeNameUpgradeProto():Boolean {
			return change_name_upgrade_proto$field != null;
		}

		public function set changeNameUpgradeProto(value:app.message.UpgradeProto):void {
			change_name_upgrade_proto$field = value;
		}

		public function get changeNameUpgradeProto():app.message.UpgradeProto {
			return change_name_upgrade_proto$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_COUNTRY_UPGRADE_PROTO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.MiscConfig.change_country_upgrade_proto", "changeCountryUpgradeProto", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var change_country_upgrade_proto$field:app.message.UpgradeProto;

		public function clearChangeCountryUpgradeProto():void {
			change_country_upgrade_proto$field = null;
		}

		public function get hasChangeCountryUpgradeProto():Boolean {
			return change_country_upgrade_proto$field != null;
		}

		public function set changeCountryUpgradeProto(value:app.message.UpgradeProto):void {
			change_country_upgrade_proto$field = value;
		}

		public function get changeCountryUpgradeProto():app.message.UpgradeProto {
			return change_country_upgrade_proto$field;
		}

		/**
		 *  @private
		 */
		public static const NIGHT_AUTO_COMBAT_PREPARE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.MiscConfig.night_auto_combat_prepare_time", "nightAutoCombatPrepareTime", (201 << 3) | com.netease.protobuf.WireType.VARINT);

		private var night_auto_combat_prepare_time$field:Int64;

		public function clearNightAutoCombatPrepareTime():void {
			night_auto_combat_prepare_time$field = null;
		}

		public function get hasNightAutoCombatPrepareTime():Boolean {
			return night_auto_combat_prepare_time$field != null;
		}

		public function set nightAutoCombatPrepareTime(value:Int64):void {
			night_auto_combat_prepare_time$field = value;
		}

		public function get nightAutoCombatPrepareTime():Int64 {
			return night_auto_combat_prepare_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPaidChatGoodsId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, paid_chat_goods_id$field);
			}
			if (hasOfflineExp_3Jinzi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, offline_exp_3_jinzi$field);
			}
			if (hasTimeOffset) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, time_offset$field);
			}
			if (hasRankPerPage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank_per_page$field);
			}
			if (hasRankAdmireMaxTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank_admire_max_times$field);
			}
			if (hasRankSearchInterval) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank_search_interval$field);
			}
			if (hasTransportCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, transport_cost$field);
			}
			if (hasChangeNameUpgradeProto) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, change_name_upgrade_proto$field);
			}
			if (hasChangeCountryUpgradeProto) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, change_country_upgrade_proto$field);
			}
			if (hasNightAutoCombatPrepareTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 201);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, night_auto_combat_prepare_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var paid_chat_goods_id$count:uint = 0;
			var offline_exp_3_jinzi$count:uint = 0;
			var time_offset$count:uint = 0;
			var rank_per_page$count:uint = 0;
			var rank_admire_max_times$count:uint = 0;
			var rank_search_interval$count:uint = 0;
			var transport_cost$count:uint = 0;
			var change_name_upgrade_proto$count:uint = 0;
			var change_country_upgrade_proto$count:uint = 0;
			var night_auto_combat_prepare_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (paid_chat_goods_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.paidChatGoodsId cannot be set twice.');
					}
					++paid_chat_goods_id$count;
					this.paidChatGoodsId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (offline_exp_3_jinzi$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.offlineExp_3Jinzi cannot be set twice.');
					}
					++offline_exp_3_jinzi$count;
					this.offlineExp_3Jinzi = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (time_offset$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.timeOffset cannot be set twice.');
					}
					++time_offset$count;
					this.timeOffset = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 10:
					if (rank_per_page$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.rankPerPage cannot be set twice.');
					}
					++rank_per_page$count;
					this.rankPerPage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (rank_admire_max_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.rankAdmireMaxTimes cannot be set twice.');
					}
					++rank_admire_max_times$count;
					this.rankAdmireMaxTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (rank_search_interval$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.rankSearchInterval cannot be set twice.');
					}
					++rank_search_interval$count;
					this.rankSearchInterval = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 20:
					if (transport_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.transportCost cannot be set twice.');
					}
					++transport_cost$count;
					this.transportCost = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.transportCost);
					break;
				case 25:
					if (change_name_upgrade_proto$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.changeNameUpgradeProto cannot be set twice.');
					}
					++change_name_upgrade_proto$count;
					this.changeNameUpgradeProto = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.changeNameUpgradeProto);
					break;
				case 26:
					if (change_country_upgrade_proto$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.changeCountryUpgradeProto cannot be set twice.');
					}
					++change_country_upgrade_proto$count;
					this.changeCountryUpgradeProto = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.changeCountryUpgradeProto);
					break;
				case 201:
					if (night_auto_combat_prepare_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MiscConfig.nightAutoCombatPrepareTime cannot be set twice.');
					}
					++night_auto_combat_prepare_time$count;
					this.nightAutoCombatPrepareTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
