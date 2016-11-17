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
	public dynamic final class GuildStorageProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAN_RONG_DU:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildStorageProto.fan_rong_du", "fanRongDu", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fan_rong_du$field:Int64;

		public function clearFanRongDu():void {
			fan_rong_du$field = null;
		}

		public function get hasFanRongDu():Boolean {
			return fan_rong_du$field != null;
		}

		public function set fanRongDu(value:Int64):void {
			fan_rong_du$field = value;
		}

		public function get fanRongDu():Int64 {
			return fan_rong_du$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildStorageProto.money", "money", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:Int64;

		public function clearMoney():void {
			money$field = null;
		}

		public function get hasMoney():Boolean {
			return money$field != null;
		}

		public function set money(value:Int64):void {
			money$field = value;
		}

		public function get money():Int64 {
			return money$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFanRongDu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, fan_rong_du$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, money$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var fan_rong_du$count:uint = 0;
			var money$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (fan_rong_du$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildStorageProto.fanRongDu cannot be set twice.');
					}
					++fan_rong_du$count;
					this.fanRongDu = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildStorageProto.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
