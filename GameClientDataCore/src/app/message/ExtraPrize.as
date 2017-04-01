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
	public dynamic final class ExtraPrize extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RANK:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExtraPrize.rank", "rank", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank$field:int;

		private var hasField$0:uint = 0;

		public function clearRank():void {
			hasField$0 &= 0xfffffffe;
			rank$field = new int();
		}

		public function get hasRank():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set rank(value:int):void {
			hasField$0 |= 0x1;
			rank$field = value;
		}

		public function get rank():int {
			return rank$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ExtraPrize.prize", "prize", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

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
		public static const EXTRAPERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExtraPrize.extraPercent", "extraPercent", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var extraPercent$field:int;

		public function clearExtraPercent():void {
			hasField$0 &= 0xfffffffd;
			extraPercent$field = new int();
		}

		public function get hasExtraPercent():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set extraPercent(value:int):void {
			hasField$0 |= 0x2;
			extraPercent$field = value;
		}

		public function get extraPercent():int {
			return extraPercent$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, rank$field);
			}
			if (hasPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, prize$field);
			}
			if (hasExtraPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, extraPercent$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var rank$count:uint = 0;
			var prize$count:uint = 0;
			var extraPercent$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtraPrize.rank cannot be set twice.');
					}
					++rank$count;
					this.rank = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtraPrize.prize cannot be set twice.');
					}
					++prize$count;
					this.prize = new app.message.PrizeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.prize);
					break;
				case 3:
					if (extraPercent$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtraPrize.extraPercent cannot be set twice.');
					}
					++extraPercent$count;
					this.extraPercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
