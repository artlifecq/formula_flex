package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.EquipmentListProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class HeroEquipmentListProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EQUIPMENT_LIST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.HeroEquipmentListProto.equipment_list", "equipmentList", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.EquipmentListProto; });

		private var equipment_list$field:app.message.EquipmentListProto;

		public function clearEquipmentList():void {
			equipment_list$field = null;
		}

		public function get hasEquipmentList():Boolean {
			return equipment_list$field != null;
		}

		public function set equipmentList(value:app.message.EquipmentListProto):void {
			equipment_list$field = value;
		}

		public function get equipmentList():app.message.EquipmentListProto {
			return equipment_list$field;
		}

		/**
		 *  @private
		 */
		public static const REFINE_TAOZ_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.HeroEquipmentListProto.refine_taoz_id", "refineTaozId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var refine_taoz_id$field:int;

		private var hasField$0:uint = 0;

		public function clearRefineTaozId():void {
			hasField$0 &= 0xfffffffe;
			refine_taoz_id$field = new int();
		}

		public function get hasRefineTaozId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set refineTaozId(value:int):void {
			hasField$0 |= 0x1;
			refine_taoz_id$field = value;
		}

		public function get refineTaozId():int {
			return refine_taoz_id$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY_TAOZ_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.HeroEquipmentListProto.quality_taoz_id", "qualityTaozId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var quality_taoz_id$field:int;

		public function clearQualityTaozId():void {
			hasField$0 &= 0xfffffffd;
			quality_taoz_id$field = new int();
		}

		public function get hasQualityTaozId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set qualityTaozId(value:int):void {
			hasField$0 |= 0x2;
			quality_taoz_id$field = value;
		}

		public function get qualityTaozId():int {
			return quality_taoz_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEquipmentList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, equipment_list$field);
			}
			if (hasRefineTaozId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, refine_taoz_id$field);
			}
			if (hasQualityTaozId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, quality_taoz_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var equipment_list$count:uint = 0;
			var refine_taoz_id$count:uint = 0;
			var quality_taoz_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (equipment_list$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroEquipmentListProto.equipmentList cannot be set twice.');
					}
					++equipment_list$count;
					this.equipmentList = new app.message.EquipmentListProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.equipmentList);
					break;
				case 2:
					if (refine_taoz_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroEquipmentListProto.refineTaozId cannot be set twice.');
					}
					++refine_taoz_id$count;
					this.refineTaozId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (quality_taoz_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroEquipmentListProto.qualityTaozId cannot be set twice.');
					}
					++quality_taoz_id$count;
					this.qualityTaozId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
