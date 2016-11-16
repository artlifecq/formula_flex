package app.message.TouZhuConfig {
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
	public dynamic final class TouZhuPrize extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ZHU_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TouZhuConfig.TouZhuPrize.zhu_id", "zhuId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zhu_id$field:int;

		private var hasField$0:uint = 0;

		public function clearZhuId():void {
			hasField$0 &= 0xfffffffe;
			zhu_id$field = new int();
		}

		public function get hasZhuId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set zhuId(value:int):void {
			hasField$0 |= 0x1;
			zhu_id$field = value;
		}

		public function get zhuId():int {
			return zhu_id$field;
		}

		/**
		 *  @private
		 */
		public static const PRIZE:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TouZhuConfig.TouZhuPrize.prize", "prize", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PrizeProto; });

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
			if (hasZhuId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, zhu_id$field);
			}
			if (hasPrize) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
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
			var zhu_id$count:uint = 0;
			var prize$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (zhu_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouZhuPrize.zhuId cannot be set twice.');
					}
					++zhu_id$count;
					this.zhuId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (prize$count != 0) {
						throw new flash.errors.IOError('Bad data format: TouZhuPrize.prize cannot be set twice.');
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
