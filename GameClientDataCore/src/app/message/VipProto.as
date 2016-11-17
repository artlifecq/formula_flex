package app.message {
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
	public dynamic final class VipProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.VipProto.level", "level", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const DESC:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.VipProto.desc", "desc", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_BROWSE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.VipProto.total_browse", "totalBrowse", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var total_browse$field:String;

		public function clearTotalBrowse():void {
			total_browse$field = null;
		}

		public function get hasTotalBrowse():Boolean {
			return total_browse$field != null;
		}

		public function set totalBrowse(value:String):void {
			total_browse$field = value;
		}

		public function get totalBrowse():String {
			return total_browse$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.VipProto.title", "title", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:String;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:String):void {
			title$field = value;
		}

		public function get title():String {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const ICON_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.VipProto.icon_name", "iconName", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var icon_name$field:String;

		public function clearIconName():void {
			icon_name$field = null;
		}

		public function get hasIconName():Boolean {
			return icon_name$field != null;
		}

		public function set iconName(value:String):void {
			icon_name$field = value;
		}

		public function get iconName():String {
			return icon_name$field;
		}

		/**
		 *  @private
		 */
		public static const CHAT_ICON_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.VipProto.chat_icon_name", "chatIconName", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chat_icon_name$field:String;

		public function clearChatIconName():void {
			chat_icon_name$field = null;
		}

		public function get hasChatIconName():Boolean {
			return chat_icon_name$field != null;
		}

		public function set chatIconName(value:String):void {
			chat_icon_name$field = value;
		}

		public function get chatIconName():String {
			return chat_icon_name$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.VipProto.exp", "exp", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:int;

		public function clearExp():void {
			hasField$0 &= 0xfffffffd;
			exp$field = new int();
		}

		public function get hasExp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set exp(value:int):void {
			hasField$0 |= 0x2;
			exp$field = value;
		}

		public function get exp():int {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_AUTO_FINISH_DUNGEON:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.VipProto.can_auto_finish_dungeon", "canAutoFinishDungeon", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_auto_finish_dungeon$field:Boolean;

		public function clearCanAutoFinishDungeon():void {
			hasField$0 &= 0xfffffffb;
			can_auto_finish_dungeon$field = new Boolean();
		}

		public function get hasCanAutoFinishDungeon():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set canAutoFinishDungeon(value:Boolean):void {
			hasField$0 |= 0x4;
			can_auto_finish_dungeon$field = value;
		}

		public function get canAutoFinishDungeon():Boolean {
			return can_auto_finish_dungeon$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_AUTO_FINISH_DUNGEON_MORE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.VipProto.can_auto_finish_dungeon_more", "canAutoFinishDungeonMore", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_auto_finish_dungeon_more$field:Boolean;

		public function clearCanAutoFinishDungeonMore():void {
			hasField$0 &= 0xfffffff7;
			can_auto_finish_dungeon_more$field = new Boolean();
		}

		public function get hasCanAutoFinishDungeonMore():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set canAutoFinishDungeonMore(value:Boolean):void {
			hasField$0 |= 0x8;
			can_auto_finish_dungeon_more$field = value;
		}

		public function get canAutoFinishDungeonMore():Boolean {
			return can_auto_finish_dungeon_more$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_MAP_TRANSPORT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.VipProto.can_map_transport", "canMapTransport", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_map_transport$field:Boolean;

		public function clearCanMapTransport():void {
			hasField$0 &= 0xffffffef;
			can_map_transport$field = new Boolean();
		}

		public function get hasCanMapTransport():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set canMapTransport(value:Boolean):void {
			hasField$0 |= 0x10;
			can_map_transport$field = value;
		}

		public function get canMapTransport():Boolean {
			return can_map_transport$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_FREE_CHAT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.VipProto.can_free_chat", "canFreeChat", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_free_chat$field:Boolean;

		public function clearCanFreeChat():void {
			hasField$0 &= 0xffffffdf;
			can_free_chat$field = new Boolean();
		}

		public function get hasCanFreeChat():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set canFreeChat(value:Boolean):void {
			hasField$0 |= 0x20;
			can_free_chat$field = value;
		}

		public function get canFreeChat():Boolean {
			return can_free_chat$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.VipProto.vip_prize", "vipPrize", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var vip_prize$field:app.message.PrizeProto;

		public function clearVipPrize():void {
			vip_prize$field = null;
		}

		public function get hasVipPrize():Boolean {
			return vip_prize$field != null;
		}

		public function set vipPrize(value:app.message.PrizeProto):void {
			vip_prize$field = value;
		}

		public function get vipPrize():app.message.PrizeProto {
			return vip_prize$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_PRIZE_DAILY:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.VipProto.vip_prize_daily", "vipPrizeDaily", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		[ArrayElementType("app.message.PrizeProto")]
		public var vipPrizeDaily:Array = [];

		/**
		 *  @private
		 */
		public static const REPLENISH_SIGN_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.VipProto.replenish_sign_times", "replenishSignTimes", (30 << 3) | com.netease.protobuf.WireType.VARINT);

		private var replenish_sign_times$field:int;

		public function clearReplenishSignTimes():void {
			hasField$0 &= 0xffffffbf;
			replenish_sign_times$field = new int();
		}

		public function get hasReplenishSignTimes():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set replenishSignTimes(value:int):void {
			hasField$0 |= 0x40;
			replenish_sign_times$field = value;
		}

		public function get replenishSignTimes():int {
			return replenish_sign_times$field;
		}

		/**
		 *  @private
		 */
		public static const EXP_EXTRA_INT_MULTIPLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.VipProto.exp_extra_int_multiple", "expExtraIntMultiple", (31 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp_extra_int_multiple$field:int;

		public function clearExpExtraIntMultiple():void {
			hasField$0 &= 0xffffff7f;
			exp_extra_int_multiple$field = new int();
		}

		public function get hasExpExtraIntMultiple():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set expExtraIntMultiple(value:int):void {
			hasField$0 |= 0x80;
			exp_extra_int_multiple$field = value;
		}

		public function get expExtraIntMultiple():int {
			return exp_extra_int_multiple$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, level$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, desc$field);
			}
			if (hasTotalBrowse) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, total_browse$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, title$field);
			}
			if (hasIconName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, icon_name$field);
			}
			if (hasChatIconName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, chat_icon_name$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, exp$field);
			}
			if (hasCanAutoFinishDungeon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_auto_finish_dungeon$field);
			}
			if (hasCanAutoFinishDungeonMore) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_auto_finish_dungeon_more$field);
			}
			if (hasCanMapTransport) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_map_transport$field);
			}
			if (hasCanFreeChat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_free_chat$field);
			}
			if (hasVipPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, vip_prize$field);
			}
			for (var vipPrizeDaily$index:uint = 0; vipPrizeDaily$index < this.vipPrizeDaily.length; ++vipPrizeDaily$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.vipPrizeDaily[vipPrizeDaily$index]);
			}
			if (hasReplenishSignTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 30);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, replenish_sign_times$field);
			}
			if (hasExpExtraIntMultiple) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 31);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, exp_extra_int_multiple$field);
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
			var desc$count:uint = 0;
			var total_browse$count:uint = 0;
			var title$count:uint = 0;
			var icon_name$count:uint = 0;
			var chat_icon_name$count:uint = 0;
			var exp$count:uint = 0;
			var can_auto_finish_dungeon$count:uint = 0;
			var can_auto_finish_dungeon_more$count:uint = 0;
			var can_map_transport$count:uint = 0;
			var can_free_chat$count:uint = 0;
			var vip_prize$count:uint = 0;
			var replenish_sign_times$count:uint = 0;
			var exp_extra_int_multiple$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (total_browse$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.totalBrowse cannot be set twice.');
					}
					++total_browse$count;
					this.totalBrowse = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 5:
					if (icon_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.iconName cannot be set twice.');
					}
					++icon_name$count;
					this.iconName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 6:
					if (chat_icon_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.chatIconName cannot be set twice.');
					}
					++chat_icon_name$count;
					this.chatIconName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 7:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (can_auto_finish_dungeon$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.canAutoFinishDungeon cannot be set twice.');
					}
					++can_auto_finish_dungeon$count;
					this.canAutoFinishDungeon = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 9:
					if (can_auto_finish_dungeon_more$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.canAutoFinishDungeonMore cannot be set twice.');
					}
					++can_auto_finish_dungeon_more$count;
					this.canAutoFinishDungeonMore = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 15:
					if (can_map_transport$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.canMapTransport cannot be set twice.');
					}
					++can_map_transport$count;
					this.canMapTransport = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 16:
					if (can_free_chat$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.canFreeChat cannot be set twice.');
					}
					++can_free_chat$count;
					this.canFreeChat = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 24:
					if (vip_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.vipPrize cannot be set twice.');
					}
					++vip_prize$count;
					this.vipPrize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.vipPrize);
					break;
				case 25:
					this.vipPrizeDaily.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.PrizeProto()));
					break;
				case 30:
					if (replenish_sign_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.replenishSignTimes cannot be set twice.');
					}
					++replenish_sign_times$count;
					this.replenishSignTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 31:
					if (exp_extra_int_multiple$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipProto.expExtraIntMultiple cannot be set twice.');
					}
					++exp_extra_int_multiple$count;
					this.expExtraIntMultiple = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
