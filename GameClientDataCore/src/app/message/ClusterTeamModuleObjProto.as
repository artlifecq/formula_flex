package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GroupDungeonCollectablePrizeProto;
	import app.message.Int32PairProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ClusterTeamModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GROUP_COLLECTABLE_PRIZE_PROTO:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ClusterTeamModuleObjProto.group_collectable_prize_proto", "groupCollectablePrizeProto", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GroupDungeonCollectablePrizeProto; });

		[ArrayElementType("app.message.GroupDungeonCollectablePrizeProto")]
		public var groupCollectablePrizeProto:Array = [];

		/**
		 *  @private
		 */
		public static const GROUP_DAILY_ENTER_TIMES:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ClusterTeamModuleObjProto.group_daily_enter_times", "groupDailyEnterTimes", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Int32PairProto; });

		[ArrayElementType("app.message.Int32PairProto")]
		public var groupDailyEnterTimes:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var groupCollectablePrizeProto$index:uint = 0; groupCollectablePrizeProto$index < this.groupCollectablePrizeProto.length; ++groupCollectablePrizeProto$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.groupCollectablePrizeProto[groupCollectablePrizeProto$index]);
			}
			for (var groupDailyEnterTimes$index:uint = 0; groupDailyEnterTimes$index < this.groupDailyEnterTimes.length; ++groupDailyEnterTimes$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.groupDailyEnterTimes[groupDailyEnterTimes$index]);
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
					this.groupCollectablePrizeProto.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.GroupDungeonCollectablePrizeProto()));
					break;
				case 2:
					this.groupDailyEnterTimes.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.Int32PairProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
