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
	public dynamic final class VipModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const VIP_EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VipModuleObjProto.vip_exp", "vipExp", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_exp$field:int;

		private var hasField$0:uint = 0;

		public function clearVipExp():void {
			hasField$0 &= 0xfffffffe;
			vip_exp$field = new int();
		}

		public function get hasVipExp():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set vipExp(value:int):void {
			hasField$0 |= 0x1;
			vip_exp$field = value;
		}

		public function get vipExp():int {
			return vip_exp$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECTED_VIP_PRIZE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.VipModuleObjProto.collected_vip_prize", "collectedVipPrize", (30 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collected_vip_prize$field:int;

		public function clearCollectedVipPrize():void {
			hasField$0 &= 0xfffffffd;
			collected_vip_prize$field = new int();
		}

		public function get hasCollectedVipPrize():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set collectedVipPrize(value:int):void {
			hasField$0 |= 0x2;
			collected_vip_prize$field = value;
		}

		public function get collectedVipPrize():int {
			return collected_vip_prize$field;
		}

		/**
		 *  @private
		 */
		public static const NEXT_COLLECT_VIP_WEEKLY_PRIZE_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.VipModuleObjProto.next_collect_vip_weekly_prize_time", "nextCollectVipWeeklyPrizeTime", (31 << 3) | com.netease.protobuf.WireType.VARINT);

		private var next_collect_vip_weekly_prize_time$field:Int64;

		public function clearNextCollectVipWeeklyPrizeTime():void {
			next_collect_vip_weekly_prize_time$field = null;
		}

		public function get hasNextCollectVipWeeklyPrizeTime():Boolean {
			return next_collect_vip_weekly_prize_time$field != null;
		}

		public function set nextCollectVipWeeklyPrizeTime(value:Int64):void {
			next_collect_vip_weekly_prize_time$field = value;
		}

		public function get nextCollectVipWeeklyPrizeTime():Int64 {
			return next_collect_vip_weekly_prize_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasVipExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vip_exp$field);
			}
			if (hasCollectedVipPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, collected_vip_prize$field);
			}
			if (hasNextCollectVipWeeklyPrizeTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, next_collect_vip_weekly_prize_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var vip_exp$count:uint = 0;
			var collected_vip_prize$count:uint = 0;
			var next_collect_vip_weekly_prize_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (vip_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipModuleObjProto.vipExp cannot be set twice.');
					}
					++vip_exp$count;
					this.vipExp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 30:
					if (collected_vip_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipModuleObjProto.collectedVipPrize cannot be set twice.');
					}
					++collected_vip_prize$count;
					this.collectedVipPrize = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 31:
					if (next_collect_vip_weekly_prize_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: VipModuleObjProto.nextCollectVipWeeklyPrizeTime cannot be set twice.');
					}
					++next_collect_vip_weekly_prize_time$count;
					this.nextCollectVipWeeklyPrizeTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
