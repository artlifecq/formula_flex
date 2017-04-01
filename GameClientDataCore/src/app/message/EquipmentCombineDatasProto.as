package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentCombineCostDatasProto;
	import app.message.EquipmentCombineRateDatasProto;
	import app.message.EquipmentCombinePointDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentCombineDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COMBINE_LEVEL_STAGE_GAP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentCombineDatasProto.combine_level_stage_gap", "combineLevelStageGap", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var combine_level_stage_gap$field:int;

		private var hasField$0:uint = 0;

		public function clearCombineLevelStageGap():void {
			hasField$0 &= 0xfffffffe;
			combine_level_stage_gap$field = new int();
		}

		public function get hasCombineLevelStageGap():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set combineLevelStageGap(value:int):void {
			hasField$0 |= 0x1;
			combine_level_stage_gap$field = value;
		}

		public function get combineLevelStageGap():int {
			return combine_level_stage_gap$field;
		}

		/**
		 *  @private
		 */
		public static const COMBINE_NEED_EQUIP_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentCombineDatasProto.combine_need_equip_count", "combineNeedEquipCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var combine_need_equip_count$field:int;

		public function clearCombineNeedEquipCount():void {
			hasField$0 &= 0xfffffffd;
			combine_need_equip_count$field = new int();
		}

		public function get hasCombineNeedEquipCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set combineNeedEquipCount(value:int):void {
			hasField$0 |= 0x2;
			combine_need_equip_count$field = value;
		}

		public function get combineNeedEquipCount():int {
			return combine_need_equip_count$field;
		}

		/**
		 *  @private
		 */
		public static const CENTER_EQUIP_POINT_MULTIPLE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.EquipmentCombineDatasProto.center_equip_point_multiple", "centerEquipPointMultiple", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var center_equip_point_multiple$field:int;

		public function clearCenterEquipPointMultiple():void {
			hasField$0 &= 0xfffffffb;
			center_equip_point_multiple$field = new int();
		}

		public function get hasCenterEquipPointMultiple():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set centerEquipPointMultiple(value:int):void {
			hasField$0 |= 0x4;
			center_equip_point_multiple$field = value;
		}

		public function get centerEquipPointMultiple():int {
			return center_equip_point_multiple$field;
		}

		/**
		 *  @private
		 */
		public static const COST_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentCombineDatasProto.cost_datas", "costDatas", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentCombineCostDatasProto; });

		private var cost_datas$field:app.message.EquipmentCombineCostDatasProto;

		public function clearCostDatas():void {
			cost_datas$field = null;
		}

		public function get hasCostDatas():Boolean {
			return cost_datas$field != null;
		}

		public function set costDatas(value:app.message.EquipmentCombineCostDatasProto):void {
			cost_datas$field = value;
		}

		public function get costDatas():app.message.EquipmentCombineCostDatasProto {
			return cost_datas$field;
		}

		/**
		 *  @private
		 */
		public static const RATE_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentCombineDatasProto.rate_datas", "rateDatas", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentCombineRateDatasProto; });

		private var rate_datas$field:app.message.EquipmentCombineRateDatasProto;

		public function clearRateDatas():void {
			rate_datas$field = null;
		}

		public function get hasRateDatas():Boolean {
			return rate_datas$field != null;
		}

		public function set rateDatas(value:app.message.EquipmentCombineRateDatasProto):void {
			rate_datas$field = value;
		}

		public function get rateDatas():app.message.EquipmentCombineRateDatasProto {
			return rate_datas$field;
		}

		/**
		 *  @private
		 */
		public static const POINT_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentCombineDatasProto.point_data", "pointData", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentCombinePointDataProto; });

		private var point_data$field:app.message.EquipmentCombinePointDataProto;

		public function clearPointData():void {
			point_data$field = null;
		}

		public function get hasPointData():Boolean {
			return point_data$field != null;
		}

		public function set pointData(value:app.message.EquipmentCombinePointDataProto):void {
			point_data$field = value;
		}

		public function get pointData():app.message.EquipmentCombinePointDataProto {
			return point_data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCombineLevelStageGap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, combine_level_stage_gap$field);
			}
			if (hasCombineNeedEquipCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, combine_need_equip_count$field);
			}
			if (hasCenterEquipPointMultiple) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, center_equip_point_multiple$field);
			}
			if (hasCostDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, cost_datas$field);
			}
			if (hasRateDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, rate_datas$field);
			}
			if (hasPointData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, point_data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var combine_level_stage_gap$count:uint = 0;
			var combine_need_equip_count$count:uint = 0;
			var center_equip_point_multiple$count:uint = 0;
			var cost_datas$count:uint = 0;
			var rate_datas$count:uint = 0;
			var point_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (combine_level_stage_gap$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineDatasProto.combineLevelStageGap cannot be set twice.');
					}
					++combine_level_stage_gap$count;
					this.combineLevelStageGap = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (combine_need_equip_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineDatasProto.combineNeedEquipCount cannot be set twice.');
					}
					++combine_need_equip_count$count;
					this.combineNeedEquipCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (center_equip_point_multiple$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineDatasProto.centerEquipPointMultiple cannot be set twice.');
					}
					++center_equip_point_multiple$count;
					this.centerEquipPointMultiple = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (cost_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineDatasProto.costDatas cannot be set twice.');
					}
					++cost_datas$count;
					this.costDatas = new app.message.EquipmentCombineCostDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.costDatas);
					break;
				case 5:
					if (rate_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineDatasProto.rateDatas cannot be set twice.');
					}
					++rate_datas$count;
					this.rateDatas = new app.message.EquipmentCombineRateDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.rateDatas);
					break;
				case 6:
					if (point_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentCombineDatasProto.pointData cannot be set twice.');
					}
					++point_data$count;
					this.pointData = new app.message.EquipmentCombinePointDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.pointData);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
