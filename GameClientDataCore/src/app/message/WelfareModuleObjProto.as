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
	public dynamic final class WelfareModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PHOENIX_MONEY_REFINE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.WelfareModuleObjProto.phoenix_money_refine_times", "phoenixMoneyRefineTimes", (115 << 3) | com.netease.protobuf.WireType.VARINT);

		private var phoenix_money_refine_times$field:int;

		private var hasField$0:uint = 0;

		public function clearPhoenixMoneyRefineTimes():void {
			hasField$0 &= 0xfffffffe;
			phoenix_money_refine_times$field = new int();
		}

		public function get hasPhoenixMoneyRefineTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set phoenixMoneyRefineTimes(value:int):void {
			hasField$0 |= 0x1;
			phoenix_money_refine_times$field = value;
		}

		public function get phoenixMoneyRefineTimes():int {
			return phoenix_money_refine_times$field;
		}

		/**
		 *  @private
		 */
		public static const PHOENIX_EXP_REFINE_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.WelfareModuleObjProto.phoenix_exp_refine_times", "phoenixExpRefineTimes", (117 << 3) | com.netease.protobuf.WireType.VARINT);

		private var phoenix_exp_refine_times$field:int;

		public function clearPhoenixExpRefineTimes():void {
			hasField$0 &= 0xfffffffd;
			phoenix_exp_refine_times$field = new int();
		}

		public function get hasPhoenixExpRefineTimes():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set phoenixExpRefineTimes(value:int):void {
			hasField$0 |= 0x2;
			phoenix_exp_refine_times$field = value;
		}

		public function get phoenixExpRefineTimes():int {
			return phoenix_exp_refine_times$field;
		}

		/**
		 *  @private
		 */
		public static const FIRST_RECHARGE_COLLECT_INDEX:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.WelfareModuleObjProto.first_recharge_collect_index", "firstRechargeCollectIndex", (138 << 3) | com.netease.protobuf.WireType.VARINT);

		private var first_recharge_collect_index$field:int;

		public function clearFirstRechargeCollectIndex():void {
			hasField$0 &= 0xfffffffb;
			first_recharge_collect_index$field = new int();
		}

		public function get hasFirstRechargeCollectIndex():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set firstRechargeCollectIndex(value:int):void {
			hasField$0 |= 0x4;
			first_recharge_collect_index$field = value;
		}

		public function get firstRechargeCollectIndex():int {
			return first_recharge_collect_index$field;
		}

		/**
		 *  @private
		 */
		public static const IS_COLLECT_WEIXIN_PACKAGE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.WelfareModuleObjProto.is_collect_weixin_package", "isCollectWeixinPackage", (167 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_collect_weixin_package$field:Boolean;

		public function clearIsCollectWeixinPackage():void {
			hasField$0 &= 0xfffffff7;
			is_collect_weixin_package$field = new Boolean();
		}

		public function get hasIsCollectWeixinPackage():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set isCollectWeixinPackage(value:Boolean):void {
			hasField$0 |= 0x8;
			is_collect_weixin_package$field = value;
		}

		public function get isCollectWeixinPackage():Boolean {
			return is_collect_weixin_package$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECTED_ONLINE_PRIZE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.WelfareModuleObjProto.collected_online_prize", "collectedOnlinePrize", (572 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collected_online_prize$field:Boolean;

		public function clearCollectedOnlinePrize():void {
			hasField$0 &= 0xffffffef;
			collected_online_prize$field = new Boolean();
		}

		public function get hasCollectedOnlinePrize():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set collectedOnlinePrize(value:Boolean):void {
			hasField$0 |= 0x10;
			collected_online_prize$field = value;
		}

		public function get collectedOnlinePrize():Boolean {
			return collected_online_prize$field;
		}

		/**
		 *  @private
		 */
		public static const ONLINE_PRIZE_BEGIN_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.WelfareModuleObjProto.online_prize_begin_time", "onlinePrizeBeginTime", (576 << 3) | com.netease.protobuf.WireType.VARINT);

		private var online_prize_begin_time$field:int;

		public function clearOnlinePrizeBeginTime():void {
			hasField$0 &= 0xffffffdf;
			online_prize_begin_time$field = new int();
		}

		public function get hasOnlinePrizeBeginTime():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set onlinePrizeBeginTime(value:int):void {
			hasField$0 |= 0x20;
			online_prize_begin_time$field = value;
		}

		public function get onlinePrizeBeginTime():int {
			return online_prize_begin_time$field;
		}

		/**
		 *  @private
		 */
		public static const LOGIN_PRIZE_INFO:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.WelfareModuleObjProto.login_prize_info", "loginPrizeInfo", (140 << 3) | com.netease.protobuf.WireType.VARINT);

		private var login_prize_info$field:int;

		public function clearLoginPrizeInfo():void {
			hasField$0 &= 0xffffffbf;
			login_prize_info$field = new int();
		}

		public function get hasLoginPrizeInfo():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set loginPrizeInfo(value:int):void {
			hasField$0 |= 0x40;
			login_prize_info$field = value;
		}

		public function get loginPrizeInfo():int {
			return login_prize_info$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_HERO_LEVEL_PRIZE:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.WelfareModuleObjProto.collect_hero_level_prize", "collectHeroLevelPrize", (172 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var collectHeroLevelPrize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPhoenixMoneyRefineTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 115);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, phoenix_money_refine_times$field);
			}
			if (hasPhoenixExpRefineTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 117);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, phoenix_exp_refine_times$field);
			}
			if (hasFirstRechargeCollectIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 138);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, first_recharge_collect_index$field);
			}
			if (hasIsCollectWeixinPackage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 167);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_collect_weixin_package$field);
			}
			if (hasCollectedOnlinePrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 572);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, collected_online_prize$field);
			}
			if (hasOnlinePrizeBeginTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 576);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, online_prize_begin_time$field);
			}
			if (hasLoginPrizeInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 140);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, login_prize_info$field);
			}
			for (var collectHeroLevelPrize$index:uint = 0; collectHeroLevelPrize$index < this.collectHeroLevelPrize.length; ++collectHeroLevelPrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 172);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.collectHeroLevelPrize[collectHeroLevelPrize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var phoenix_money_refine_times$count:uint = 0;
			var phoenix_exp_refine_times$count:uint = 0;
			var first_recharge_collect_index$count:uint = 0;
			var is_collect_weixin_package$count:uint = 0;
			var collected_online_prize$count:uint = 0;
			var online_prize_begin_time$count:uint = 0;
			var login_prize_info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 115:
					if (phoenix_money_refine_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareModuleObjProto.phoenixMoneyRefineTimes cannot be set twice.');
					}
					++phoenix_money_refine_times$count;
					this.phoenixMoneyRefineTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 117:
					if (phoenix_exp_refine_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareModuleObjProto.phoenixExpRefineTimes cannot be set twice.');
					}
					++phoenix_exp_refine_times$count;
					this.phoenixExpRefineTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 138:
					if (first_recharge_collect_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareModuleObjProto.firstRechargeCollectIndex cannot be set twice.');
					}
					++first_recharge_collect_index$count;
					this.firstRechargeCollectIndex = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 167:
					if (is_collect_weixin_package$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareModuleObjProto.isCollectWeixinPackage cannot be set twice.');
					}
					++is_collect_weixin_package$count;
					this.isCollectWeixinPackage = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 572:
					if (collected_online_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareModuleObjProto.collectedOnlinePrize cannot be set twice.');
					}
					++collected_online_prize$count;
					this.collectedOnlinePrize = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 576:
					if (online_prize_begin_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareModuleObjProto.onlinePrizeBeginTime cannot be set twice.');
					}
					++online_prize_begin_time$count;
					this.onlinePrizeBeginTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 140:
					if (login_prize_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: WelfareModuleObjProto.loginPrizeInfo cannot be set twice.');
					}
					++login_prize_info$count;
					this.loginPrizeInfo = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 172:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.collectHeroLevelPrize);
						break;
					}
					this.collectHeroLevelPrize.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
