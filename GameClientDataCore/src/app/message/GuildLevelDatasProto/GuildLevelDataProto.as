package app.message.GuildLevelDatasProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GuildLevelDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		private var hasField$0:uint = 0;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffe;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x1;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const LEADER_COUNT:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.leader_count", "leaderCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var leaderCount:Array = [];

		/**
		 *  @private
		 */
		public static const UPGRADE_COST_MONEY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.upgrade_cost_money", "upgradeCostMoney", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_cost_money$field:int;

		public function clearUpgradeCostMoney():void {
			hasField$0 &= 0xfffffffd;
			upgrade_cost_money$field = new int();
		}

		public function get hasUpgradeCostMoney():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set upgradeCostMoney(value:int):void {
			hasField$0 |= 0x2;
			upgrade_cost_money$field = value;
		}

		public function get upgradeCostMoney():int {
			return upgrade_cost_money$field;
		}

		/**
		 *  @private
		 */
		public static const UPGRADE_COST_FAN_RONG_DU:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.upgrade_cost_fan_rong_du", "upgradeCostFanRongDu", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var upgrade_cost_fan_rong_du$field:int;

		public function clearUpgradeCostFanRongDu():void {
			hasField$0 &= 0xfffffffb;
			upgrade_cost_fan_rong_du$field = new int();
		}

		public function get hasUpgradeCostFanRongDu():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set upgradeCostFanRongDu(value:int):void {
			hasField$0 |= 0x4;
			upgrade_cost_fan_rong_du$field = value;
		}

		public function get upgradeCostFanRongDu():int {
			return upgrade_cost_fan_rong_du$field;
		}

		/**
		 *  @private
		 */
		public static const MAINTAIN_COST_MONEY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.maintain_cost_money", "maintainCostMoney", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var maintain_cost_money$field:int;

		public function clearMaintainCostMoney():void {
			hasField$0 &= 0xfffffff7;
			maintain_cost_money$field = new int();
		}

		public function get hasMaintainCostMoney():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set maintainCostMoney(value:int):void {
			hasField$0 |= 0x8;
			maintain_cost_money$field = value;
		}

		public function get maintainCostMoney():int {
			return maintain_cost_money$field;
		}

		/**
		 *  @private
		 */
		public static const MAINTAIN_COST_FAN_RONG_DU:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.maintain_cost_fan_rong_du", "maintainCostFanRongDu", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var maintain_cost_fan_rong_du$field:int;

		public function clearMaintainCostFanRongDu():void {
			hasField$0 &= 0xffffffef;
			maintain_cost_fan_rong_du$field = new int();
		}

		public function get hasMaintainCostFanRongDu():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set maintainCostFanRongDu(value:int):void {
			hasField$0 |= 0x10;
			maintain_cost_fan_rong_du$field = value;
		}

		public function get maintainCostFanRongDu():int {
			return maintain_cost_fan_rong_du$field;
		}

		/**
		 *  @private
		 */
		public static const DEMOTE_RETURN_MONEY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.demote_return_money", "demoteReturnMoney", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var demote_return_money$field:int;

		public function clearDemoteReturnMoney():void {
			hasField$0 &= 0xffffffdf;
			demote_return_money$field = new int();
		}

		public function get hasDemoteReturnMoney():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set demoteReturnMoney(value:int):void {
			hasField$0 |= 0x20;
			demote_return_money$field = value;
		}

		public function get demoteReturnMoney():int {
			return demote_return_money$field;
		}

		/**
		 *  @private
		 */
		public static const DEMOTE_RETURN_FAN_RONG_DU:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.demote_return_fan_rong_du", "demoteReturnFanRongDu", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var demote_return_fan_rong_du$field:int;

		public function clearDemoteReturnFanRongDu():void {
			hasField$0 &= 0xffffffbf;
			demote_return_fan_rong_du$field = new int();
		}

		public function get hasDemoteReturnFanRongDu():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set demoteReturnFanRongDu(value:int):void {
			hasField$0 |= 0x40;
			demote_return_fan_rong_du$field = value;
		}

		public function get demoteReturnFanRongDu():int {
			return demote_return_fan_rong_du$field;
		}

		/**
		 *  @private
		 */
		public static const CAPACITY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildLevelDatasProto.GuildLevelDataProto.capacity", "capacity", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var capacity$field:int;

		public function clearCapacity():void {
			hasField$0 &= 0xffffff7f;
			capacity$field = new int();
		}

		public function get hasCapacity():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set capacity(value:int):void {
			hasField$0 |= 0x80;
			capacity$field = value;
		}

		public function get capacity():int {
			return capacity$field;
		}

		/**
		 *  @private
		 */
		public static const GUILD_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildLevelDatasProto.GuildLevelDataProto.guild_prize", "guildPrize", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var guild_prize$field:app.message.PrizeProto;

		public function clearGuildPrize():void {
			guild_prize$field = null;
		}

		public function get hasGuildPrize():Boolean {
			return guild_prize$field != null;
		}

		public function set guildPrize(value:app.message.PrizeProto):void {
			guild_prize$field = value;
		}

		public function get guildPrize():app.message.PrizeProto {
			return guild_prize$field;
		}

		/**
		 *  @private
		 */
		public static const KING_GUILD_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildLevelDatasProto.GuildLevelDataProto.king_guild_prize", "kingGuildPrize", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var king_guild_prize$field:app.message.PrizeProto;

		public function clearKingGuildPrize():void {
			king_guild_prize$field = null;
		}

		public function get hasKingGuildPrize():Boolean {
			return king_guild_prize$field != null;
		}

		public function set kingGuildPrize(value:app.message.PrizeProto):void {
			king_guild_prize$field = value;
		}

		public function get kingGuildPrize():app.message.PrizeProto {
			return king_guild_prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			for (var leaderCount$index:uint = 0; leaderCount$index < this.leaderCount.length; ++leaderCount$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.leaderCount[leaderCount$index]);
			}
			if (hasUpgradeCostMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, upgrade_cost_money$field);
			}
			if (hasUpgradeCostFanRongDu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, upgrade_cost_fan_rong_du$field);
			}
			if (hasMaintainCostMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, maintain_cost_money$field);
			}
			if (hasMaintainCostFanRongDu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, maintain_cost_fan_rong_du$field);
			}
			if (hasDemoteReturnMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, demote_return_money$field);
			}
			if (hasDemoteReturnFanRongDu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, demote_return_fan_rong_du$field);
			}
			if (hasCapacity) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, capacity$field);
			}
			if (hasGuildPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, guild_prize$field);
			}
			if (hasKingGuildPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, king_guild_prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level$count:uint = 0;
			var upgrade_cost_money$count:uint = 0;
			var upgrade_cost_fan_rong_du$count:uint = 0;
			var maintain_cost_money$count:uint = 0;
			var maintain_cost_fan_rong_du$count:uint = 0;
			var demote_return_money$count:uint = 0;
			var demote_return_fan_rong_du$count:uint = 0;
			var capacity$count:uint = 0;
			var guild_prize$count:uint = 0;
			var king_guild_prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.leaderCount);
						break;
					}
					this.leaderCount.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 3:
					if (upgrade_cost_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.upgradeCostMoney cannot be set twice.');
					}
					++upgrade_cost_money$count;
					this.upgradeCostMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (upgrade_cost_fan_rong_du$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.upgradeCostFanRongDu cannot be set twice.');
					}
					++upgrade_cost_fan_rong_du$count;
					this.upgradeCostFanRongDu = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (maintain_cost_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.maintainCostMoney cannot be set twice.');
					}
					++maintain_cost_money$count;
					this.maintainCostMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (maintain_cost_fan_rong_du$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.maintainCostFanRongDu cannot be set twice.');
					}
					++maintain_cost_fan_rong_du$count;
					this.maintainCostFanRongDu = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (demote_return_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.demoteReturnMoney cannot be set twice.');
					}
					++demote_return_money$count;
					this.demoteReturnMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (demote_return_fan_rong_du$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.demoteReturnFanRongDu cannot be set twice.');
					}
					++demote_return_fan_rong_du$count;
					this.demoteReturnFanRongDu = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (capacity$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.capacity cannot be set twice.');
					}
					++capacity$count;
					this.capacity = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (guild_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.guildPrize cannot be set twice.');
					}
					++guild_prize$count;
					this.guildPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.guildPrize);
					break;
				case 11:
					if (king_guild_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildLevelDataProto.kingGuildPrize cannot be set twice.');
					}
					++king_guild_prize$count;
					this.kingGuildPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.kingGuildPrize);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
