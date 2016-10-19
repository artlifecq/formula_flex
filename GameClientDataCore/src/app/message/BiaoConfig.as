package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.PersonalBiaoMiscDataProto;
	import app.message.BiaoJuMiscDataProto;
	import app.message.AllPersonalDatasProto;
	import app.message.BiaoMiscDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BiaoConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MISC_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.BiaoConfig.misc_data", "miscData", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoMiscDataProto; });

		private var misc_data$field:app.message.BiaoMiscDataProto;

		public function clearMiscData():void {
			misc_data$field = null;
		}

		public function get hasMiscData():Boolean {
			return misc_data$field != null;
		}

		public function set miscData(value:app.message.BiaoMiscDataProto):void {
			misc_data$field = value;
		}

		public function get miscData():app.message.BiaoMiscDataProto {
			return misc_data$field;
		}

		/**
		 *  @private
		 */
		public static const PERSONAL_MISC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.BiaoConfig.personal_misc", "personalMisc", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.PersonalBiaoMiscDataProto; });

		private var personal_misc$field:app.message.PersonalBiaoMiscDataProto;

		public function clearPersonalMisc():void {
			personal_misc$field = null;
		}

		public function get hasPersonalMisc():Boolean {
			return personal_misc$field != null;
		}

		public function set personalMisc(value:app.message.PersonalBiaoMiscDataProto):void {
			personal_misc$field = value;
		}

		public function get personalMisc():app.message.PersonalBiaoMiscDataProto {
			return personal_misc$field;
		}

		/**
		 *  @private
		 */
		public static const PERSONAL_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.BiaoConfig.personal_datas", "personalDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllPersonalDatasProto; });

		private var personal_datas$field:app.message.AllPersonalDatasProto;

		public function clearPersonalDatas():void {
			personal_datas$field = null;
		}

		public function get hasPersonalDatas():Boolean {
			return personal_datas$field != null;
		}

		public function set personalDatas(value:app.message.AllPersonalDatasProto):void {
			personal_datas$field = value;
		}

		public function get personalDatas():app.message.AllPersonalDatasProto {
			return personal_datas$field;
		}

		/**
		 *  @private
		 */
		public static const BIAO_JU_MISC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.BiaoConfig.biao_ju_misc", "biaoJuMisc", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BiaoJuMiscDataProto; });

		private var biao_ju_misc$field:app.message.BiaoJuMiscDataProto;

		public function clearBiaoJuMisc():void {
			biao_ju_misc$field = null;
		}

		public function get hasBiaoJuMisc():Boolean {
			return biao_ju_misc$field != null;
		}

		public function set biaoJuMisc(value:app.message.BiaoJuMiscDataProto):void {
			biao_ju_misc$field = value;
		}

		public function get biaoJuMisc():app.message.BiaoJuMiscDataProto {
			return biao_ju_misc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMiscData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, misc_data$field);
			}
			if (hasPersonalMisc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, personal_misc$field);
			}
			if (hasPersonalDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, personal_datas$field);
			}
			if (hasBiaoJuMisc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, biao_ju_misc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var misc_data$count:uint = 0;
			var personal_misc$count:uint = 0;
			var personal_datas$count:uint = 0;
			var biao_ju_misc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 4:
					if (misc_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoConfig.miscData cannot be set twice.');
					}
					++misc_data$count;
					this.miscData = new app.message.BiaoMiscDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.miscData);
					break;
				case 1:
					if (personal_misc$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoConfig.personalMisc cannot be set twice.');
					}
					++personal_misc$count;
					this.personalMisc = new app.message.PersonalBiaoMiscDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.personalMisc);
					break;
				case 2:
					if (personal_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoConfig.personalDatas cannot be set twice.');
					}
					++personal_datas$count;
					this.personalDatas = new app.message.AllPersonalDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.personalDatas);
					break;
				case 3:
					if (biao_ju_misc$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoConfig.biaoJuMisc cannot be set twice.');
					}
					++biao_ju_misc$count;
					this.biaoJuMisc = new app.message.BiaoJuMiscDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.biaoJuMisc);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
