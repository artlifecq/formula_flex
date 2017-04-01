package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentGeneralEvaluateCalcDatasProto;
	import app.message.EquipmentGeneralTaozDatasProto;
	import app.message.EquipmentGeneralChangeDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentGeneralDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EVALUATE_CALC_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentGeneralDatasProto.evaluate_calc_datas", "evaluateCalcDatas", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentGeneralEvaluateCalcDatasProto; });

		private var evaluate_calc_datas$field:app.message.EquipmentGeneralEvaluateCalcDatasProto;

		public function clearEvaluateCalcDatas():void {
			evaluate_calc_datas$field = null;
		}

		public function get hasEvaluateCalcDatas():Boolean {
			return evaluate_calc_datas$field != null;
		}

		public function set evaluateCalcDatas(value:app.message.EquipmentGeneralEvaluateCalcDatasProto):void {
			evaluate_calc_datas$field = value;
		}

		public function get evaluateCalcDatas():app.message.EquipmentGeneralEvaluateCalcDatasProto {
			return evaluate_calc_datas$field;
		}

		/**
		 *  @private
		 */
		public static const TAOZ_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentGeneralDatasProto.taoz_datas", "taozDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentGeneralTaozDatasProto; });

		private var taoz_datas$field:app.message.EquipmentGeneralTaozDatasProto;

		public function clearTaozDatas():void {
			taoz_datas$field = null;
		}

		public function get hasTaozDatas():Boolean {
			return taoz_datas$field != null;
		}

		public function set taozDatas(value:app.message.EquipmentGeneralTaozDatasProto):void {
			taoz_datas$field = value;
		}

		public function get taozDatas():app.message.EquipmentGeneralTaozDatasProto {
			return taoz_datas$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentGeneralDatasProto.change_datas", "changeDatas", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentGeneralChangeDatasProto; });

		private var change_datas$field:app.message.EquipmentGeneralChangeDatasProto;

		public function clearChangeDatas():void {
			change_datas$field = null;
		}

		public function get hasChangeDatas():Boolean {
			return change_datas$field != null;
		}

		public function set changeDatas(value:app.message.EquipmentGeneralChangeDatasProto):void {
			change_datas$field = value;
		}

		public function get changeDatas():app.message.EquipmentGeneralChangeDatasProto {
			return change_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEvaluateCalcDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, evaluate_calc_datas$field);
			}
			if (hasTaozDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, taoz_datas$field);
			}
			if (hasChangeDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, change_datas$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var evaluate_calc_datas$count:uint = 0;
			var taoz_datas$count:uint = 0;
			var change_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (evaluate_calc_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralDatasProto.evaluateCalcDatas cannot be set twice.');
					}
					++evaluate_calc_datas$count;
					this.evaluateCalcDatas = new app.message.EquipmentGeneralEvaluateCalcDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.evaluateCalcDatas);
					break;
				case 2:
					if (taoz_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralDatasProto.taozDatas cannot be set twice.');
					}
					++taoz_datas$count;
					this.taozDatas = new app.message.EquipmentGeneralTaozDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.taozDatas);
					break;
				case 3:
					if (change_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentGeneralDatasProto.changeDatas cannot be set twice.');
					}
					++change_datas$count;
					this.changeDatas = new app.message.EquipmentGeneralChangeDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.changeDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
