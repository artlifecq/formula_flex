package app.message.DailyConsumeProto {
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
	public dynamic final class DailyConsumeSingleProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const JINZI:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyConsumeProto.DailyConsumeSingleProto.jinzi", "jinzi", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jinzi$field:int;

		private var hasField$0:uint = 0;

		public function clearJinzi():void {
			hasField$0 &= 0xfffffffe;
			jinzi$field = new int();
		}

		public function get hasJinzi():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set jinzi(value:int):void {
			hasField$0 |= 0x1;
			jinzi$field = value;
		}

		public function get jinzi():int {
			return jinzi$field;
		}

		/**
		 *  @private
		 */
		public static const LIMIT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyConsumeProto.DailyConsumeSingleProto.limit", "limit", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var limit$field:int;

		public function clearLimit():void {
			hasField$0 &= 0xfffffffd;
			limit$field = new int();
		}

		public function get hasLimit():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set limit(value:int):void {
			hasField$0 |= 0x2;
			limit$field = value;
		}

		public function get limit():int {
			return limit$field;
		}

		/**
		 *  @private
		 */
		public static const REQUIRE_VIP_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.DailyConsumeProto.DailyConsumeSingleProto.require_vip_level", "requireVipLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var require_vip_level$field:int;

		public function clearRequireVipLevel():void {
			hasField$0 &= 0xfffffffb;
			require_vip_level$field = new int();
		}

		public function get hasRequireVipLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set requireVipLevel(value:int):void {
			hasField$0 |= 0x4;
			require_vip_level$field = value;
		}

		public function get requireVipLevel():int {
			return require_vip_level$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.DailyConsumeProto.DailyConsumeSingleProto.prize", "prize", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

		private var prize$field:app.message.PrizeProto;

		public function clearPrize():void {
			prize$field = null;
		}

		public function get hasPrize():Boolean {
			return prize$field != null;
		}

		public function set prize(value:app.message.PrizeProto):void {
			prize$field = value;
		}

		public function get prize():app.message.PrizeProto {
			return prize$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasJinzi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, jinzi$field);
			}
			if (hasLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, limit$field);
			}
			if (hasRequireVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, require_vip_level$field);
			}
			if (hasPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, prize$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var jinzi$count:uint = 0;
			var limit$count:uint = 0;
			var require_vip_level$count:uint = 0;
			var prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (jinzi$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyConsumeSingleProto.jinzi cannot be set twice.');
					}
					++jinzi$count;
					this.jinzi = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyConsumeSingleProto.limit cannot be set twice.');
					}
					++limit$count;
					this.limit = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (require_vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyConsumeSingleProto.requireVipLevel cannot be set twice.');
					}
					++require_vip_level$count;
					this.requireVipLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailyConsumeSingleProto.prize cannot be set twice.');
					}
					++prize$count;
					this.prize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.prize);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
