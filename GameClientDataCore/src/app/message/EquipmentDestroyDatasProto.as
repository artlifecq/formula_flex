package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentLevelStageQualityEvaluateDestoryDatasProto;
	import app.message.EquipmentRefineDestoryDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentDestroyDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REFINE_DESTROY_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentDestroyDatasProto.refine_destroy_datas", "refineDestroyDatas", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentRefineDestoryDatasProto; });

		private var refine_destroy_datas$field:app.message.EquipmentRefineDestoryDatasProto;

		public function clearRefineDestroyDatas():void {
			refine_destroy_datas$field = null;
		}

		public function get hasRefineDestroyDatas():Boolean {
			return refine_destroy_datas$field != null;
		}

		public function set refineDestroyDatas(value:app.message.EquipmentRefineDestoryDatasProto):void {
			refine_destroy_datas$field = value;
		}

		public function get refineDestroyDatas():app.message.EquipmentRefineDestoryDatasProto {
			return refine_destroy_datas$field;
		}

		/**
		 *  @private
		 */
		public static const DESTROY_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.EquipmentDestroyDatasProto.destroy_datas", "destroyDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentLevelStageQualityEvaluateDestoryDatasProto; });

		private var destroy_datas$field:app.message.EquipmentLevelStageQualityEvaluateDestoryDatasProto;

		public function clearDestroyDatas():void {
			destroy_datas$field = null;
		}

		public function get hasDestroyDatas():Boolean {
			return destroy_datas$field != null;
		}

		public function set destroyDatas(value:app.message.EquipmentLevelStageQualityEvaluateDestoryDatasProto):void {
			destroy_datas$field = value;
		}

		public function get destroyDatas():app.message.EquipmentLevelStageQualityEvaluateDestoryDatasProto {
			return destroy_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRefineDestroyDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, refine_destroy_datas$field);
			}
			if (hasDestroyDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, destroy_datas$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var refine_destroy_datas$count:uint = 0;
			var destroy_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (refine_destroy_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDestroyDatasProto.refineDestroyDatas cannot be set twice.');
					}
					++refine_destroy_datas$count;
					this.refineDestroyDatas = new app.message.EquipmentRefineDestoryDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.refineDestroyDatas);
					break;
				case 2:
					if (destroy_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentDestroyDatasProto.destroyDatas cannot be set twice.');
					}
					++destroy_datas$count;
					this.destroyDatas = new app.message.EquipmentLevelStageQualityEvaluateDestoryDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.destroyDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
