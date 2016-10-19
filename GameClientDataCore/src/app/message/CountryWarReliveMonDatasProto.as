package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryWarReliveMonDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarReliveMonDatasProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RELIVE_MON_DATA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryWarReliveMonDatasProto.relive_mon_data", "reliveMonData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarReliveMonDataProto; });

		[ArrayElementType("app.message.CountryWarReliveMonDataProto")]
		public var reliveMonData:Array = [];

		/**
		 *  @private
		 */
		public static const CAN_BE_ATTACK_BY_ZHAN_CHE_SHENG_SHOU:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDatasProto.can_be_attack_by_zhan_che_sheng_shou", "canBeAttackByZhanCheShengShou", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var canBeAttackByZhanCheShengShou:Array = [];

		/**
		 *  @private
		 */
		public static const SHENG_SHOU_CONFIG_ID:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDatasProto.sheng_shou_config_id", "shengShouConfigId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var shengShouConfigId:Array = [];

		/**
		 *  @private
		 */
		public static const QI_LIN_CONFIG_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CountryWarReliveMonDatasProto.qi_lin_config_id", "qiLinConfigId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var qi_lin_config_id$field:int;

		private var hasField$0:uint = 0;

		public function clearQiLinConfigId():void {
			hasField$0 &= 0xfffffffe;
			qi_lin_config_id$field = new int();
		}

		public function get hasQiLinConfigId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set qiLinConfigId(value:int):void {
			hasField$0 |= 0x1;
			qi_lin_config_id$field = value;
		}

		public function get qiLinConfigId():int {
			return qi_lin_config_id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var reliveMonData$index:uint = 0; reliveMonData$index < this.reliveMonData.length; ++reliveMonData$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.reliveMonData[reliveMonData$index]);
			}
			for (var canBeAttackByZhanCheShengShou$index:uint = 0; canBeAttackByZhanCheShengShou$index < this.canBeAttackByZhanCheShengShou.length; ++canBeAttackByZhanCheShengShou$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.canBeAttackByZhanCheShengShou[canBeAttackByZhanCheShengShou$index]);
			}
			for (var shengShouConfigId$index:uint = 0; shengShouConfigId$index < this.shengShouConfigId.length; ++shengShouConfigId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.shengShouConfigId[shengShouConfigId$index]);
			}
			if (hasQiLinConfigId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, qi_lin_config_id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var qi_lin_config_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.reliveMonData.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryWarReliveMonDataProto()));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.canBeAttackByZhanCheShengShou);
						break;
					}
					this.canBeAttackByZhanCheShengShou.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.shengShouConfigId);
						break;
					}
					this.shengShouConfigId.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 4:
					if (qi_lin_config_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarReliveMonDatasProto.qiLinConfigId cannot be set twice.');
					}
					++qi_lin_config_id$count;
					this.qiLinConfigId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
