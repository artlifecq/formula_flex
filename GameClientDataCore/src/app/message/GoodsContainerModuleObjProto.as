package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GoodsContainerProto;
	import app.message.HeroEquipmentListProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GoodsContainerModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DEPOT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsContainerModuleObjProto.depot", "depot", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GoodsContainerProto; });

		private var depot$field:app.message.GoodsContainerProto;

		public function clearDepot():void {
			depot$field = null;
		}

		public function get hasDepot():Boolean {
			return depot$field != null;
		}

		public function set depot(value:app.message.GoodsContainerProto):void {
			depot$field = value;
		}

		public function get depot():app.message.GoodsContainerProto {
			return depot$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_EQUIPMENT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GoodsContainerModuleObjProto.hero_equipment", "heroEquipment", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.HeroEquipmentListProto; });

		private var hero_equipment$field:app.message.HeroEquipmentListProto;

		public function clearHeroEquipment():void {
			hero_equipment$field = null;
		}

		public function get hasHeroEquipment():Boolean {
			return hero_equipment$field != null;
		}

		public function set heroEquipment(value:app.message.HeroEquipmentListProto):void {
			hero_equipment$field = value;
		}

		public function get heroEquipment():app.message.HeroEquipmentListProto {
			return hero_equipment$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDepot) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, depot$field);
			}
			if (hasHeroEquipment) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, hero_equipment$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var depot$count:uint = 0;
			var hero_equipment$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (depot$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsContainerModuleObjProto.depot cannot be set twice.');
					}
					++depot$count;
					this.depot = new app.message.GoodsContainerProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.depot);
					break;
				case 2:
					if (hero_equipment$count != 0) {
						throw new flash.errors.IOError('Bad data format: GoodsContainerModuleObjProto.heroEquipment cannot be set twice.');
					}
					++hero_equipment$count;
					this.heroEquipment = new app.message.HeroEquipmentListProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.heroEquipment);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
