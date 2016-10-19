package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.BaiduVipPrizeConfigProto.BaiduVipPrizeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BaiduVipPrizeConfigProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PRIZELIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.BaiduVipPrizeConfigProto.prizelist", "prizelist", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BaiduVipPrizeConfigProto.BaiduVipPrizeProto; });

		[ArrayElementType("app.message.BaiduVipPrizeConfigProto.BaiduVipPrizeProto")]
		public var prizelist:Array = [];

		/**
		 *  @private
		 */
		public static const NICK_NAME_ID_LIST:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.BaiduVipPrizeConfigProto.nick_name_id_list", "nickNameIdList", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var nickNameIdList:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var prizelist$index:uint = 0; prizelist$index < this.prizelist.length; ++prizelist$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.prizelist[prizelist$index]);
			}
			for (var nickNameIdList$index:uint = 0; nickNameIdList$index < this.nickNameIdList.length; ++nickNameIdList$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.nickNameIdList[nickNameIdList$index]);
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
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.prizelist.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.BaiduVipPrizeConfigProto.BaiduVipPrizeProto()));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.nickNameIdList);
						break;
					}
					this.nickNameIdList.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
