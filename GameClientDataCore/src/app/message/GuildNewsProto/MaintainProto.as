package app.message.GuildNewsProto {
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
	public dynamic final class MaintainProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INCOME_FAN_RONG_DU:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildNewsProto.MaintainProto.income_fan_rong_du", "incomeFanRongDu", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var income_fan_rong_du$field:Int64;

		public function clearIncomeFanRongDu():void {
			income_fan_rong_du$field = null;
		}

		public function get hasIncomeFanRongDu():Boolean {
			return income_fan_rong_du$field != null;
		}

		public function set incomeFanRongDu(value:Int64):void {
			income_fan_rong_du$field = value;
		}

		public function get incomeFanRongDu():Int64 {
			return income_fan_rong_du$field;
		}

		/**
		 *  @private
		 */
		public static const INCOME_MONEY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildNewsProto.MaintainProto.income_money", "incomeMoney", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var income_money$field:Int64;

		public function clearIncomeMoney():void {
			income_money$field = null;
		}

		public function get hasIncomeMoney():Boolean {
			return income_money$field != null;
		}

		public function set incomeMoney(value:Int64):void {
			income_money$field = value;
		}

		public function get incomeMoney():Int64 {
			return income_money$field;
		}

		/**
		 *  @private
		 */
		public static const COST_FAN_RONG_DU:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildNewsProto.MaintainProto.cost_fan_rong_du", "costFanRongDu", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost_fan_rong_du$field:Int64;

		public function clearCostFanRongDu():void {
			cost_fan_rong_du$field = null;
		}

		public function get hasCostFanRongDu():Boolean {
			return cost_fan_rong_du$field != null;
		}

		public function set costFanRongDu(value:Int64):void {
			cost_fan_rong_du$field = value;
		}

		public function get costFanRongDu():Int64 {
			return cost_fan_rong_du$field;
		}

		/**
		 *  @private
		 */
		public static const COST_MONEY:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.GuildNewsProto.MaintainProto.cost_money", "costMoney", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cost_money$field:Int64;

		public function clearCostMoney():void {
			cost_money$field = null;
		}

		public function get hasCostMoney():Boolean {
			return cost_money$field != null;
		}

		public function set costMoney(value:Int64):void {
			cost_money$field = value;
		}

		public function get costMoney():Int64 {
			return cost_money$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIncomeFanRongDu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, income_fan_rong_du$field);
			}
			if (hasIncomeMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, income_money$field);
			}
			if (hasCostFanRongDu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, cost_fan_rong_du$field);
			}
			if (hasCostMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, cost_money$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var income_fan_rong_du$count:uint = 0;
			var income_money$count:uint = 0;
			var cost_fan_rong_du$count:uint = 0;
			var cost_money$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (income_fan_rong_du$count != 0) {
						throw new flash.errors.IOError('Bad data format: MaintainProto.incomeFanRongDu cannot be set twice.');
					}
					++income_fan_rong_du$count;
					this.incomeFanRongDu = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (income_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: MaintainProto.incomeMoney cannot be set twice.');
					}
					++income_money$count;
					this.incomeMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (cost_fan_rong_du$count != 0) {
						throw new flash.errors.IOError('Bad data format: MaintainProto.costFanRongDu cannot be set twice.');
					}
					++cost_fan_rong_du$count;
					this.costFanRongDu = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (cost_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: MaintainProto.costMoney cannot be set twice.');
					}
					++cost_money$count;
					this.costMoney = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
