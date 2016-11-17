package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.GuildLevelDatasProto;
	import app.message.GuildMiscDataProto;
	import app.message.GuildOfficerDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GuildConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MISC_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildConfig.misc_data", "miscData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildMiscDataProto; });

		private var misc_data$field:app.message.GuildMiscDataProto;

		public function clearMiscData():void {
			misc_data$field = null;
		}

		public function get hasMiscData():Boolean {
			return misc_data$field != null;
		}

		public function set miscData(value:app.message.GuildMiscDataProto):void {
			misc_data$field = value;
		}

		public function get miscData():app.message.GuildMiscDataProto {
			return misc_data$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildConfig.level_datas", "levelDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildLevelDatasProto; });

		private var level_datas$field:app.message.GuildLevelDatasProto;

		public function clearLevelDatas():void {
			level_datas$field = null;
		}

		public function get hasLevelDatas():Boolean {
			return level_datas$field != null;
		}

		public function set levelDatas(value:app.message.GuildLevelDatasProto):void {
			level_datas$field = value;
		}

		public function get levelDatas():app.message.GuildLevelDatasProto {
			return level_datas$field;
		}

		/**
		 *  @private
		 */
		public static const OFFICER_DATAS:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.GuildConfig.officer_datas", "officerDatas", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.GuildOfficerDatasProto; });

		private var officer_datas$field:app.message.GuildOfficerDatasProto;

		public function clearOfficerDatas():void {
			officer_datas$field = null;
		}

		public function get hasOfficerDatas():Boolean {
			return officer_datas$field != null;
		}

		public function set officerDatas(value:app.message.GuildOfficerDatasProto):void {
			officer_datas$field = value;
		}

		public function get officerDatas():app.message.GuildOfficerDatasProto {
			return officer_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMiscData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, misc_data$field);
			}
			if (hasLevelDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, level_datas$field);
			}
			if (hasOfficerDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, officer_datas$field);
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
			var level_datas$count:uint = 0;
			var officer_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (misc_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildConfig.miscData cannot be set twice.');
					}
					++misc_data$count;
					this.miscData = new app.message.GuildMiscDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.miscData);
					break;
				case 2:
					if (level_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildConfig.levelDatas cannot be set twice.');
					}
					++level_datas$count;
					this.levelDatas = new app.message.GuildLevelDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.levelDatas);
					break;
				case 3:
					if (officer_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildConfig.officerDatas cannot be set twice.');
					}
					++officer_datas$count;
					this.officerDatas = new app.message.GuildOfficerDatasProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.officerDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
