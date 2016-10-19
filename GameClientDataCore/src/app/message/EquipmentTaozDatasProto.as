package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentQualityTaozDatasProto;
	import app.message.EquipmentRefineTaozDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentTaozDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REFINE_TAOZ_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentTaozDatasProto.refine_taoz_datas", "refineTaozDatas", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentRefineTaozDatasProto; });

		private var refine_taoz_datas$field:app.message.EquipmentRefineTaozDatasProto;

		public function clearRefineTaozDatas():void {
			refine_taoz_datas$field = null;
		}

		public function get hasRefineTaozDatas():Boolean {
			return refine_taoz_datas$field != null;
		}

		public function set refineTaozDatas(value:app.message.EquipmentRefineTaozDatasProto):void {
			refine_taoz_datas$field = value;
		}

		public function get refineTaozDatas():app.message.EquipmentRefineTaozDatasProto {
			return refine_taoz_datas$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY_TAOZ_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentTaozDatasProto.quality_taoz_datas", "qualityTaozDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentQualityTaozDatasProto; });

		private var quality_taoz_datas$field:app.message.EquipmentQualityTaozDatasProto;

		public function clearQualityTaozDatas():void {
			quality_taoz_datas$field = null;
		}

		public function get hasQualityTaozDatas():Boolean {
			return quality_taoz_datas$field != null;
		}

		public function set qualityTaozDatas(value:app.message.EquipmentQualityTaozDatasProto):void {
			quality_taoz_datas$field = value;
		}

		public function get qualityTaozDatas():app.message.EquipmentQualityTaozDatasProto {
			return quality_taoz_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRefineTaozDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, refine_taoz_datas$field);
			}
			if (hasQualityTaozDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, quality_taoz_datas$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var refine_taoz_datas$count:uint = 0;
			var quality_taoz_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (refine_taoz_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentTaozDatasProto.refineTaozDatas cannot be set twice.');
					}
					++refine_taoz_datas$count;
					this.refineTaozDatas = new app.message.EquipmentRefineTaozDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.refineTaozDatas);
					break;
				case 2:
					if (quality_taoz_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentTaozDatasProto.qualityTaozDatas cannot be set twice.');
					}
					++quality_taoz_datas$count;
					this.qualityTaozDatas = new app.message.EquipmentQualityTaozDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.qualityTaozDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
