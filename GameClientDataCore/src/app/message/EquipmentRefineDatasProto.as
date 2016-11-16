package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentRefineMainStatDatasProto;
	import app.message.EquipmentRefineCostDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentRefineDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COST_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentRefineDatasProto.cost_datas", "costDatas", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentRefineCostDatasProto; });

		private var cost_datas$field:app.message.EquipmentRefineCostDatasProto;

		public function clearCostDatas():void {
			cost_datas$field = null;
		}

		public function get hasCostDatas():Boolean {
			return cost_datas$field != null;
		}

		public function set costDatas(value:app.message.EquipmentRefineCostDatasProto):void {
			cost_datas$field = value;
		}

		public function get costDatas():app.message.EquipmentRefineCostDatasProto {
			return cost_datas$field;
		}

		/**
		 *  @private
		 */
		public static const MAIN_STATS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentRefineDatasProto.main_stats", "mainStats", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentRefineMainStatDatasProto; });

		private var main_stats$field:app.message.EquipmentRefineMainStatDatasProto;

		public function clearMainStats():void {
			main_stats$field = null;
		}

		public function get hasMainStats():Boolean {
			return main_stats$field != null;
		}

		public function set mainStats(value:app.message.EquipmentRefineMainStatDatasProto):void {
			main_stats$field = value;
		}

		public function get mainStats():app.message.EquipmentRefineMainStatDatasProto {
			return main_stats$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCostDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, cost_datas$field);
			}
			if (hasMainStats) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, main_stats$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var cost_datas$count:uint = 0;
			var main_stats$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (cost_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineDatasProto.costDatas cannot be set twice.');
					}
					++cost_datas$count;
					this.costDatas = new app.message.EquipmentRefineCostDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.costDatas);
					break;
				case 2:
					if (main_stats$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentRefineDatasProto.mainStats cannot be set twice.');
					}
					++main_stats$count;
					this.mainStats = new app.message.EquipmentRefineMainStatDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mainStats);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
