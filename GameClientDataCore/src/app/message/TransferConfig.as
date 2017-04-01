package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.UpgradeProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TransferConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHANGE_NAME_UPGRADE_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TransferConfig.change_name_upgrade_data", "changeNameUpgradeData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var change_name_upgrade_data$field:app.message.UpgradeProto;

		public function clearChangeNameUpgradeData():void {
			change_name_upgrade_data$field = null;
		}

		public function get hasChangeNameUpgradeData():Boolean {
			return change_name_upgrade_data$field != null;
		}

		public function set changeNameUpgradeData(value:app.message.UpgradeProto):void {
			change_name_upgrade_data$field = value;
		}

		public function get changeNameUpgradeData():app.message.UpgradeProto {
			return change_name_upgrade_data$field;
		}

		/**
		 *  @private
		 */
		public static const CHANGE_COUNTRY_UPGRADE_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TransferConfig.change_country_upgrade_data", "changeCountryUpgradeData", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.UpgradeProto; });

		private var change_country_upgrade_data$field:app.message.UpgradeProto;

		public function clearChangeCountryUpgradeData():void {
			change_country_upgrade_data$field = null;
		}

		public function get hasChangeCountryUpgradeData():Boolean {
			return change_country_upgrade_data$field != null;
		}

		public function set changeCountryUpgradeData(value:app.message.UpgradeProto):void {
			change_country_upgrade_data$field = value;
		}

		public function get changeCountryUpgradeData():app.message.UpgradeProto {
			return change_country_upgrade_data$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChangeNameUpgradeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, change_name_upgrade_data$field);
			}
			if (hasChangeCountryUpgradeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, change_country_upgrade_data$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var change_name_upgrade_data$count:uint = 0;
			var change_country_upgrade_data$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (change_name_upgrade_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: TransferConfig.changeNameUpgradeData cannot be set twice.');
					}
					++change_name_upgrade_data$count;
					this.changeNameUpgradeData = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.changeNameUpgradeData);
					break;
				case 2:
					if (change_country_upgrade_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: TransferConfig.changeCountryUpgradeData cannot be set twice.');
					}
					++change_country_upgrade_data$count;
					this.changeCountryUpgradeData = new app.message.UpgradeProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.changeCountryUpgradeData);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
