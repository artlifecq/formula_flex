package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GuildMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CREATE_COST_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.create_cost_money", "createCostMoney", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var create_cost_money$field:int;

		private var hasField$0:uint = 0;

		public function clearCreateCostMoney():void {
			hasField$0 &= 0xfffffffe;
			create_cost_money$field = new int();
		}

		public function get hasCreateCostMoney():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set createCostMoney(value:int):void {
			hasField$0 |= 0x1;
			create_cost_money$field = value;
		}

		public function get createCostMoney():int {
			return create_cost_money$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_COST_GOODS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.create_cost_goods", "createCostGoods", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var create_cost_goods$field:int;

		public function clearCreateCostGoods():void {
			hasField$0 &= 0xfffffffd;
			create_cost_goods$field = new int();
		}

		public function get hasCreateCostGoods():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set createCostGoods(value:int):void {
			hasField$0 |= 0x2;
			create_cost_goods$field = value;
		}

		public function get createCostGoods():int {
			return create_cost_goods$field;
		}

		/**
		 *  @private
		 */
		public static const JOIN_GUILD_CD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.GuildMiscDataProto.join_guild_cd", "joinGuildCd", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var join_guild_cd$field:Int64;

		public function clearJoinGuildCd():void {
			join_guild_cd$field = null;
		}

		public function get hasJoinGuildCd():Boolean {
			return join_guild_cd$field != null;
		}

		public function set joinGuildCd(value:Int64):void {
			join_guild_cd$field = value;
		}

		public function get joinGuildCd():Int64 {
			return join_guild_cd$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_MONEY_BASE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.donate_money_base", "donateMoneyBase", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var donate_money_base$field:int;

		public function clearDonateMoneyBase():void {
			hasField$0 &= 0xfffffffb;
			donate_money_base$field = new int();
		}

		public function get hasDonateMoneyBase():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set donateMoneyBase(value:int):void {
			hasField$0 |= 0x4;
			donate_money_base$field = value;
		}

		public function get donateMoneyBase():int {
			return donate_money_base$field;
		}

		/**
		 *  @private
		 */
		public static const DONATE_MONEY_GIVE_CONTRIBUTION_POINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.donate_money_give_contribution_point", "donateMoneyGiveContributionPoint", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var donate_money_give_contribution_point$field:int;

		public function clearDonateMoneyGiveContributionPoint():void {
			hasField$0 &= 0xfffffff7;
			donate_money_give_contribution_point$field = new int();
		}

		public function get hasDonateMoneyGiveContributionPoint():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set donateMoneyGiveContributionPoint(value:int):void {
			hasField$0 |= 0x8;
			donate_money_give_contribution_point$field = value;
		}

		public function get donateMoneyGiveContributionPoint():int {
			return donate_money_give_contribution_point$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_DI_WEN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.max_di_wen", "maxDiWen", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_di_wen$field:int;

		public function clearMaxDiWen():void {
			hasField$0 &= 0xffffffef;
			max_di_wen$field = new int();
		}

		public function get hasMaxDiWen():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set maxDiWen(value:int):void {
			hasField$0 |= 0x10;
			max_di_wen$field = value;
		}

		public function get maxDiWen():int {
			return max_di_wen$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_DI_KUANG:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.max_di_kuang", "maxDiKuang", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_di_kuang$field:int;

		public function clearMaxDiKuang():void {
			hasField$0 &= 0xffffffdf;
			max_di_kuang$field = new int();
		}

		public function get hasMaxDiKuang():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set maxDiKuang(value:int):void {
			hasField$0 |= 0x20;
			max_di_kuang$field = value;
		}

		public function get maxDiKuang():int {
			return max_di_kuang$field;
		}

		/**
		 *  @private
		 */
		public static const MIN_GUILD_NAME_LENGTH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.min_guild_name_length", "minGuildNameLength", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var min_guild_name_length$field:int;

		public function clearMinGuildNameLength():void {
			hasField$0 &= 0xffffffbf;
			min_guild_name_length$field = new int();
		}

		public function get hasMinGuildNameLength():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set minGuildNameLength(value:int):void {
			hasField$0 |= 0x40;
			min_guild_name_length$field = value;
		}

		public function get minGuildNameLength():int {
			return min_guild_name_length$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_GUILD_NAME_LENGTH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.GuildMiscDataProto.max_guild_name_length", "maxGuildNameLength", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_guild_name_length$field:int;

		public function clearMaxGuildNameLength():void {
			hasField$0 &= 0xffffff7f;
			max_guild_name_length$field = new int();
		}

		public function get hasMaxGuildNameLength():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set maxGuildNameLength(value:int):void {
			hasField$0 |= 0x80;
			max_guild_name_length$field = value;
		}

		public function get maxGuildNameLength():int {
			return max_guild_name_length$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCreateCostMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, create_cost_money$field);
			}
			if (hasCreateCostGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, create_cost_goods$field);
			}
			if (hasJoinGuildCd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, join_guild_cd$field);
			}
			if (hasDonateMoneyBase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, donate_money_base$field);
			}
			if (hasDonateMoneyGiveContributionPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, donate_money_give_contribution_point$field);
			}
			if (hasMaxDiWen) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_di_wen$field);
			}
			if (hasMaxDiKuang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_di_kuang$field);
			}
			if (hasMinGuildNameLength) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, min_guild_name_length$field);
			}
			if (hasMaxGuildNameLength) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, max_guild_name_length$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var create_cost_money$count:uint = 0;
			var create_cost_goods$count:uint = 0;
			var join_guild_cd$count:uint = 0;
			var donate_money_base$count:uint = 0;
			var donate_money_give_contribution_point$count:uint = 0;
			var max_di_wen$count:uint = 0;
			var max_di_kuang$count:uint = 0;
			var min_guild_name_length$count:uint = 0;
			var max_guild_name_length$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (create_cost_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.createCostMoney cannot be set twice.');
					}
					++create_cost_money$count;
					this.createCostMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (create_cost_goods$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.createCostGoods cannot be set twice.');
					}
					++create_cost_goods$count;
					this.createCostGoods = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (join_guild_cd$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.joinGuildCd cannot be set twice.');
					}
					++join_guild_cd$count;
					this.joinGuildCd = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (donate_money_base$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.donateMoneyBase cannot be set twice.');
					}
					++donate_money_base$count;
					this.donateMoneyBase = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (donate_money_give_contribution_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.donateMoneyGiveContributionPoint cannot be set twice.');
					}
					++donate_money_give_contribution_point$count;
					this.donateMoneyGiveContributionPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (max_di_wen$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.maxDiWen cannot be set twice.');
					}
					++max_di_wen$count;
					this.maxDiWen = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (max_di_kuang$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.maxDiKuang cannot be set twice.');
					}
					++max_di_kuang$count;
					this.maxDiKuang = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (min_guild_name_length$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.minGuildNameLength cannot be set twice.');
					}
					++min_guild_name_length$count;
					this.minGuildNameLength = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (max_guild_name_length$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildMiscDataProto.maxGuildNameLength cannot be set twice.');
					}
					++max_guild_name_length$count;
					this.maxGuildNameLength = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
