package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GroupDungeonCollectablePrizeProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DUNGEON_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GroupDungeonCollectablePrizeProto.dungeon_id", "dungeonId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dungeon_id$field:int;

		private var hasField$0:uint = 0;

		public function clearDungeonId():void {
			hasField$0 &= 0xfffffffe;
			dungeon_id$field = new int();
		}

		public function get hasDungeonId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set dungeonId(value:int):void {
			hasField$0 |= 0x1;
			dungeon_id$field = value;
		}

		public function get dungeonId():int {
			return dungeon_id$field;
		}

		/**
		 *  @private
		 */
		public static const NO_SCORE_S_PRIZE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.GroupDungeonCollectablePrizeProto.no_score_s_prize", "noScoreSPrize", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var no_score_s_prize$field:Boolean;

		public function clearNoScoreSPrize():void {
			hasField$0 &= 0xfffffffd;
			no_score_s_prize$field = new Boolean();
		}

		public function get hasNoScoreSPrize():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set noScoreSPrize(value:Boolean):void {
			hasField$0 |= 0x2;
			no_score_s_prize$field = value;
		}

		public function get noScoreSPrize():Boolean {
			return no_score_s_prize$field;
		}

		/**
		 *  @private
		 */
		public static const EXPIRE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GroupDungeonCollectablePrizeProto.expire_time", "expireTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var expire_time$field:Int64;

		public function clearExpireTime():void {
			expire_time$field = null;
		}

		public function get hasExpireTime():Boolean {
			return expire_time$field != null;
		}

		public function set expireTime(value:Int64):void {
			expire_time$field = value;
		}

		public function get expireTime():Int64 {
			return expire_time$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOMED_S_PRIZE:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.GroupDungeonCollectablePrizeProto.randomed_s_prize", "randomedSPrize", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var randomed_s_prize$field:flash.utils.ByteArray;

		public function clearRandomedSPrize():void {
			randomed_s_prize$field = null;
		}

		public function get hasRandomedSPrize():Boolean {
			return randomed_s_prize$field != null;
		}

		public function set randomedSPrize(value:flash.utils.ByteArray):void {
			randomed_s_prize$field = value;
		}

		public function get randomedSPrize():flash.utils.ByteArray {
			return randomed_s_prize$field;
		}

		/**
		 *  @private
		 */
		public static const RANDOMED_VIP_PRIZE:FieldDescriptor_TYPE_BYTES = new FieldDescriptor_TYPE_BYTES("app.message.GroupDungeonCollectablePrizeProto.randomed_vip_prize", "randomedVipPrize", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var randomed_vip_prize$field:flash.utils.ByteArray;

		public function clearRandomedVipPrize():void {
			randomed_vip_prize$field = null;
		}

		public function get hasRandomedVipPrize():Boolean {
			return randomed_vip_prize$field != null;
		}

		public function set randomedVipPrize(value:flash.utils.ByteArray):void {
			randomed_vip_prize$field = value;
		}

		public function get randomedVipPrize():flash.utils.ByteArray {
			return randomed_vip_prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDungeonId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dungeon_id$field);
			}
			if (hasNoScoreSPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, no_score_s_prize$field);
			}
			if (hasExpireTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, expire_time$field);
			}
			if (hasRandomedSPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, randomed_s_prize$field);
			}
			if (hasRandomedVipPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, randomed_vip_prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var dungeon_id$count:uint = 0;
			var no_score_s_prize$count:uint = 0;
			var expire_time$count:uint = 0;
			var randomed_s_prize$count:uint = 0;
			var randomed_vip_prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (dungeon_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonCollectablePrizeProto.dungeonId cannot be set twice.');
					}
					++dungeon_id$count;
					this.dungeonId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (no_score_s_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonCollectablePrizeProto.noScoreSPrize cannot be set twice.');
					}
					++no_score_s_prize$count;
					this.noScoreSPrize = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (expire_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonCollectablePrizeProto.expireTime cannot be set twice.');
					}
					++expire_time$count;
					this.expireTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (randomed_s_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonCollectablePrizeProto.randomedSPrize cannot be set twice.');
					}
					++randomed_s_prize$count;
					this.randomedSPrize = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				case 6:
					if (randomed_vip_prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: GroupDungeonCollectablePrizeProto.randomedVipPrize cannot be set twice.');
					}
					++randomed_vip_prize$count;
					this.randomedVipPrize = com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
