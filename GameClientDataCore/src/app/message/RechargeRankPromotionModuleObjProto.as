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
	public dynamic final class RechargeRankPromotionModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COLLECTED_RECHARGE_RANK_PROMOTION_PRIZE:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.RechargeRankPromotionModuleObjProto.collected_recharge_rank_promotion_prize", "collectedRechargeRankPromotionPrize", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var collectedRechargeRankPromotionPrize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var collectedRechargeRankPromotionPrize$index:uint = 0; collectedRechargeRankPromotionPrize$index < this.collectedRechargeRankPromotionPrize.length; ++collectedRechargeRankPromotionPrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.collectedRechargeRankPromotionPrize[collectedRechargeRankPromotionPrize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.collectedRechargeRankPromotionPrize);
						break;
					}
					this.collectedRechargeRankPromotionPrize.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
