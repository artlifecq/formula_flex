package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CombineDatasProto;
	import app.message.EquipmentCombineDatasProto;
	import app.message.EquipmentBuildProto;
	import app.message.EquipmentDestroyDatasProto;
	import app.message.EquipmentGeneralDatasProto;
	import app.message.EquipmentRefineDatasProto;
	import app.message.EquipmentTaozDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class EquipmentConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EQUIP_BUILD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentConfig.equip_build", "equipBuild", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentBuildProto; });

		private var equip_build$field:app.message.EquipmentBuildProto;

		public function clearEquipBuild():void {
			equip_build$field = null;
		}

		public function get hasEquipBuild():Boolean {
			return equip_build$field != null;
		}

		public function set equipBuild(value:app.message.EquipmentBuildProto):void {
			equip_build$field = value;
		}

		public function get equipBuild():app.message.EquipmentBuildProto {
			return equip_build$field;
		}

		/**
		 *  @private
		 */
		public static const COMBINE_EQUIP_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentConfig.combine_equip_datas", "combineEquipDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentCombineDatasProto; });

		private var combine_equip_datas$field:app.message.EquipmentCombineDatasProto;

		public function clearCombineEquipDatas():void {
			combine_equip_datas$field = null;
		}

		public function get hasCombineEquipDatas():Boolean {
			return combine_equip_datas$field != null;
		}

		public function set combineEquipDatas(value:app.message.EquipmentCombineDatasProto):void {
			combine_equip_datas$field = value;
		}

		public function get combineEquipDatas():app.message.EquipmentCombineDatasProto {
			return combine_equip_datas$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentConfig.refine_datas", "refineDatas", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentRefineDatasProto; });

		private var refine_datas$field:app.message.EquipmentRefineDatasProto;

		public function clearRefineDatas():void {
			refine_datas$field = null;
		}

		public function get hasRefineDatas():Boolean {
			return refine_datas$field != null;
		}

		public function set refineDatas(value:app.message.EquipmentRefineDatasProto):void {
			refine_datas$field = value;
		}

		public function get refineDatas():app.message.EquipmentRefineDatasProto {
			return refine_datas$field;
		}

		/**
		 *  @private
		 */
		public static const COMBINE_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentConfig.combine_datas", "combineDatas", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CombineDatasProto; });

		private var combine_datas$field:app.message.CombineDatasProto;

		public function clearCombineDatas():void {
			combine_datas$field = null;
		}

		public function get hasCombineDatas():Boolean {
			return combine_datas$field != null;
		}

		public function set combineDatas(value:app.message.CombineDatasProto):void {
			combine_datas$field = value;
		}

		public function get combineDatas():app.message.CombineDatasProto {
			return combine_datas$field;
		}

		/**
		 *  @private
		 */
		public static const DESTROY_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentConfig.destroy_datas", "destroyDatas", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentDestroyDatasProto; });

		private var destroy_datas$field:app.message.EquipmentDestroyDatasProto;

		public function clearDestroyDatas():void {
			destroy_datas$field = null;
		}

		public function get hasDestroyDatas():Boolean {
			return destroy_datas$field != null;
		}

		public function set destroyDatas(value:app.message.EquipmentDestroyDatasProto):void {
			destroy_datas$field = value;
		}

		public function get destroyDatas():app.message.EquipmentDestroyDatasProto {
			return destroy_datas$field;
		}

		/**
		 *  @private
		 */
		public static const TAOZ_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentConfig.taoz_datas", "taozDatas", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentTaozDatasProto; });

		private var taoz_datas$field:app.message.EquipmentTaozDatasProto;

		public function clearTaozDatas():void {
			taoz_datas$field = null;
		}

		public function get hasTaozDatas():Boolean {
			return taoz_datas$field != null;
		}

		public function set taozDatas(value:app.message.EquipmentTaozDatasProto):void {
			taoz_datas$field = value;
		}

		public function get taozDatas():app.message.EquipmentTaozDatasProto {
			return taoz_datas$field;
		}

		/**
		 *  @private
		 */
		public static const GENERAL_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.EquipmentConfig.general_datas", "generalDatas", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentGeneralDatasProto; });

		private var general_datas$field:app.message.EquipmentGeneralDatasProto;

		public function clearGeneralDatas():void {
			general_datas$field = null;
		}

		public function get hasGeneralDatas():Boolean {
			return general_datas$field != null;
		}

		public function set generalDatas(value:app.message.EquipmentGeneralDatasProto):void {
			general_datas$field = value;
		}

		public function get generalDatas():app.message.EquipmentGeneralDatasProto {
			return general_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEquipBuild) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, equip_build$field);
			}
			if (hasCombineEquipDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, combine_equip_datas$field);
			}
			if (hasRefineDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, refine_datas$field);
			}
			if (hasCombineDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, combine_datas$field);
			}
			if (hasDestroyDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, destroy_datas$field);
			}
			if (hasTaozDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, taoz_datas$field);
			}
			if (hasGeneralDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, general_datas$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var equip_build$count:uint = 0;
			var combine_equip_datas$count:uint = 0;
			var refine_datas$count:uint = 0;
			var combine_datas$count:uint = 0;
			var destroy_datas$count:uint = 0;
			var taoz_datas$count:uint = 0;
			var general_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (equip_build$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentConfig.equipBuild cannot be set twice.');
					}
					++equip_build$count;
					this.equipBuild = new app.message.EquipmentBuildProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.equipBuild);
					break;
				case 2:
					if (combine_equip_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentConfig.combineEquipDatas cannot be set twice.');
					}
					++combine_equip_datas$count;
					this.combineEquipDatas = new app.message.EquipmentCombineDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.combineEquipDatas);
					break;
				case 3:
					if (refine_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentConfig.refineDatas cannot be set twice.');
					}
					++refine_datas$count;
					this.refineDatas = new app.message.EquipmentRefineDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.refineDatas);
					break;
				case 4:
					if (combine_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentConfig.combineDatas cannot be set twice.');
					}
					++combine_datas$count;
					this.combineDatas = new app.message.CombineDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.combineDatas);
					break;
				case 5:
					if (destroy_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentConfig.destroyDatas cannot be set twice.');
					}
					++destroy_datas$count;
					this.destroyDatas = new app.message.EquipmentDestroyDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.destroyDatas);
					break;
				case 6:
					if (taoz_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentConfig.taozDatas cannot be set twice.');
					}
					++taoz_datas$count;
					this.taozDatas = new app.message.EquipmentTaozDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.taozDatas);
					break;
				case 7:
					if (general_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipmentConfig.generalDatas cannot be set twice.');
					}
					++general_datas$count;
					this.generalDatas = new app.message.EquipmentGeneralDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.generalDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
