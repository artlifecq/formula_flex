package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryWarMiscDataProto;
	import app.message.ZhanCheMonsterDatasProto;
	import app.message.CountryWarReliveMonDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MISC_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryWarConfig.misc_data", "miscData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarMiscDataProto; });

		private var misc_data$field:app.message.CountryWarMiscDataProto;

		public function clearMiscData():void {
			misc_data$field = null;
		}

		public function get hasMiscData():Boolean {
			return misc_data$field != null;
		}

		public function set miscData(value:app.message.CountryWarMiscDataProto):void {
			misc_data$field = value;
		}

		public function get miscData():app.message.CountryWarMiscDataProto {
			return misc_data$field;
		}

		/**
		 *  @private
		 */
		public static const RELIVE_MON_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryWarConfig.relive_mon_datas", "reliveMonDatas", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarReliveMonDatasProto; });

		private var relive_mon_datas$field:app.message.CountryWarReliveMonDatasProto;

		public function clearReliveMonDatas():void {
			relive_mon_datas$field = null;
		}

		public function get hasReliveMonDatas():Boolean {
			return relive_mon_datas$field != null;
		}

		public function set reliveMonDatas(value:app.message.CountryWarReliveMonDatasProto):void {
			relive_mon_datas$field = value;
		}

		public function get reliveMonDatas():app.message.CountryWarReliveMonDatasProto {
			return relive_mon_datas$field;
		}

		/**
		 *  @private
		 */
		public static const ZHAN_CHE_MONSTER_DATAS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.CountryWarConfig.zhan_che_monster_datas", "zhanCheMonsterDatas", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ZhanCheMonsterDatasProto; });

		private var zhan_che_monster_datas$field:app.message.ZhanCheMonsterDatasProto;

		public function clearZhanCheMonsterDatas():void {
			zhan_che_monster_datas$field = null;
		}

		public function get hasZhanCheMonsterDatas():Boolean {
			return zhan_che_monster_datas$field != null;
		}

		public function set zhanCheMonsterDatas(value:app.message.ZhanCheMonsterDatasProto):void {
			zhan_che_monster_datas$field = value;
		}

		public function get zhanCheMonsterDatas():app.message.ZhanCheMonsterDatasProto {
			return zhan_che_monster_datas$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMiscData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, misc_data$field);
			}
			if (hasReliveMonDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, relive_mon_datas$field);
			}
			if (hasZhanCheMonsterDatas) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, zhan_che_monster_datas$field);
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
			var relive_mon_datas$count:uint = 0;
			var zhan_che_monster_datas$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (misc_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarConfig.miscData cannot be set twice.');
					}
					++misc_data$count;
					this.miscData = new app.message.CountryWarMiscDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.miscData);
					break;
				case 2:
					if (relive_mon_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarConfig.reliveMonDatas cannot be set twice.');
					}
					++relive_mon_datas$count;
					this.reliveMonDatas = new app.message.CountryWarReliveMonDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.reliveMonDatas);
					break;
				case 3:
					if (zhan_che_monster_datas$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarConfig.zhanCheMonsterDatas cannot be set twice.');
					}
					++zhan_che_monster_datas$count;
					this.zhanCheMonsterDatas = new app.message.ZhanCheMonsterDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.zhanCheMonsterDatas);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
