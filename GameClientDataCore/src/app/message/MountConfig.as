package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MountMiscDataProto;
	import app.message.MountVitalityDatasProto;
	import app.message.MountSpeciesDatasProto;
	import app.message.MountLevelDatasProto;
	import app.message.MountHungerDegreeDatasProto;
	import app.message.MountDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MountConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MOUNT_MISC:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountConfig.mount_misc", "mountMisc", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountMiscDataProto; });

		private var mount_misc$field:app.message.MountMiscDataProto;

		public function clearMountMisc():void {
			mount_misc$field = null;
		}

		public function get hasMountMisc():Boolean {
			return mount_misc$field != null;
		}

		public function set mountMisc(value:app.message.MountMiscDataProto):void {
			mount_misc$field = value;
		}

		public function get mountMisc():app.message.MountMiscDataProto {
			return mount_misc$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_SPECIES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountConfig.mount_species", "mountSpecies", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountSpeciesDatasProto; });

		private var mount_species$field:app.message.MountSpeciesDatasProto;

		public function clearMountSpecies():void {
			mount_species$field = null;
		}

		public function get hasMountSpecies():Boolean {
			return mount_species$field != null;
		}

		public function set mountSpecies(value:app.message.MountSpeciesDatasProto):void {
			mount_species$field = value;
		}

		public function get mountSpecies():app.message.MountSpeciesDatasProto {
			return mount_species$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_LEVEL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountConfig.mount_level", "mountLevel", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountLevelDatasProto; });

		private var mount_level$field:app.message.MountLevelDatasProto;

		public function clearMountLevel():void {
			mount_level$field = null;
		}

		public function get hasMountLevel():Boolean {
			return mount_level$field != null;
		}

		public function set mountLevel(value:app.message.MountLevelDatasProto):void {
			mount_level$field = value;
		}

		public function get mountLevel():app.message.MountLevelDatasProto {
			return mount_level$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountConfig.mount_datas", "mountDatas", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountDatasProto; });

		private var mount_datas$field:app.message.MountDatasProto;

		public function clearMountDatas():void {
			mount_datas$field = null;
		}

		public function get hasMountDatas():Boolean {
			return mount_datas$field != null;
		}

		public function set mountDatas(value:app.message.MountDatasProto):void {
			mount_datas$field = value;
		}

		public function get mountDatas():app.message.MountDatasProto {
			return mount_datas$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_VITALITY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountConfig.mount_vitality", "mountVitality", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountVitalityDatasProto; });

		private var mount_vitality$field:app.message.MountVitalityDatasProto;

		public function clearMountVitality():void {
			mount_vitality$field = null;
		}

		public function get hasMountVitality():Boolean {
			return mount_vitality$field != null;
		}

		public function set mountVitality(value:app.message.MountVitalityDatasProto):void {
			mount_vitality$field = value;
		}

		public function get mountVitality():app.message.MountVitalityDatasProto {
			return mount_vitality$field;
		}

		/**
		 *  @private
		 */
		public static const MOUNT_HUNGRE_DEGREE_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MountConfig.mount_hungre_degree_datas", "mountHungreDegreeDatas", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MountHungerDegreeDatasProto; });

		private var mount_hungre_degree_datas$field:app.message.MountHungerDegreeDatasProto;

		public function clearMountHungreDegreeDatas():void {
			mount_hungre_degree_datas$field = null;
		}

		public function get hasMountHungreDegreeDatas():Boolean {
			return mount_hungre_degree_datas$field != null;
		}

		public function set mountHungreDegreeDatas(value:app.message.MountHungerDegreeDatasProto):void {
			mount_hungre_degree_datas$field = value;
		}

		public function get mountHungreDegreeDatas():app.message.MountHungerDegreeDatasProto {
			return mount_hungre_degree_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMountMisc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_misc$field);
			}
			if (hasMountSpecies) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_species$field);
			}
			if (hasMountLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_level$field);
			}
			if (hasMountDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_datas$field);
			}
			if (hasMountVitality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_vitality$field);
			}
			if (hasMountHungreDegreeDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mount_hungre_degree_datas$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var mount_misc$count:uint = 0;
			var mount_species$count:uint = 0;
			var mount_level$count:uint = 0;
			var mount_datas$count:uint = 0;
			var mount_vitality$count:uint = 0;
			var mount_hungre_degree_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mount_misc$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountConfig.mountMisc cannot be set twice.');
					}
					++mount_misc$count;
					this.mountMisc = new app.message.MountMiscDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountMisc);
					break;
				case 2:
					if (mount_species$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountConfig.mountSpecies cannot be set twice.');
					}
					++mount_species$count;
					this.mountSpecies = new app.message.MountSpeciesDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountSpecies);
					break;
				case 3:
					if (mount_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountConfig.mountLevel cannot be set twice.');
					}
					++mount_level$count;
					this.mountLevel = new app.message.MountLevelDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountLevel);
					break;
				case 4:
					if (mount_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountConfig.mountDatas cannot be set twice.');
					}
					++mount_datas$count;
					this.mountDatas = new app.message.MountDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountDatas);
					break;
				case 5:
					if (mount_vitality$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountConfig.mountVitality cannot be set twice.');
					}
					++mount_vitality$count;
					this.mountVitality = new app.message.MountVitalityDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountVitality);
					break;
				case 7:
					if (mount_hungre_degree_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: MountConfig.mountHungreDegreeDatas cannot be set twice.');
					}
					++mount_hungre_degree_datas$count;
					this.mountHungreDegreeDatas = new app.message.MountHungerDegreeDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.mountHungreDegreeDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
