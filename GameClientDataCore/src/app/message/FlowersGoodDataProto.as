package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FlowersGoodDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ADD_DEGREE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.FlowersGoodDataProto.add_degree", "addDegree", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var add_degree$field:int;

		private var hasField$0:uint = 0;

		public function clearAddDegree():void {
			hasField$0 &= 0xfffffffe;
			add_degree$field = new int();
		}

		public function get hasAddDegree():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set addDegree(value:int):void {
			hasField$0 |= 0x1;
			add_degree$field = value;
		}

		public function get addDegree():int {
			return add_degree$field;
		}

		/**
		 *  @private
		 */
		public static const GOODS_UPGRADE_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FlowersGoodDataProto.goods_upgrade_data", "goodsUpgradeData", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var goods_upgrade_data$field:app.message.UpgradeProto;

		public function clearGoodsUpgradeData():void {
			goods_upgrade_data$field = null;
		}

		public function get hasGoodsUpgradeData():Boolean {
			return goods_upgrade_data$field != null;
		}

		public function set goodsUpgradeData(value:app.message.UpgradeProto):void {
			goods_upgrade_data$field = value;
		}

		public function get goodsUpgradeData():app.message.UpgradeProto {
			return goods_upgrade_data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAddDegree) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, add_degree$field);
			}
			if (hasGoodsUpgradeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, goods_upgrade_data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var add_degree$count:uint = 0;
			var goods_upgrade_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (add_degree$count != 0) {
						throw new flash.errors.IOError('Bad data format: FlowersGoodDataProto.addDegree cannot be set twice.');
					}
					++add_degree$count;
					this.addDegree = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (goods_upgrade_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: FlowersGoodDataProto.goodsUpgradeData cannot be set twice.');
					}
					++goods_upgrade_data$count;
					this.goodsUpgradeData = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.goodsUpgradeData);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
