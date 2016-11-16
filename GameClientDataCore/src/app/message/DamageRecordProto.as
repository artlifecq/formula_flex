package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DamageRecordProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_ID:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.DamageRecordProto.hero_id", "heroId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var heroId:Array = [];

		/**
		 *  @private
		 */
		public static const HERO_NAME:RepeatedFieldDescriptor_TYPE_BYTES = new RepeatedFieldDescriptor_TYPE_BYTES("app.message.DamageRecordProto.hero_name", "heroName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("flash.utils.ByteArray")]
		public var heroName:Array = [];

		/**
		 *  @private
		 */
		public static const DAMAGE_DIVIDED_BY_1000:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.DamageRecordProto.damage_divided_by_1000", "damageDividedBy_1000", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var damageDividedBy_1000:Array = [];

		/**
		 *  @private
		 */
		public static const IS_OFFLINE:RepeatedFieldDescriptor_TYPE_BOOL = new RepeatedFieldDescriptor_TYPE_BOOL("app.message.DamageRecordProto.is_offline", "isOffline", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Boolean")]
		public var isOffline:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var heroId$index:uint = 0; heroId$index < this.heroId.length; ++heroId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.heroId[heroId$index]);
			}
			for (var heroName$index:uint = 0; heroName$index < this.heroName.length; ++heroName$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, this.heroName[heroName$index]);
			}
			for (var damageDividedBy_1000$index:uint = 0; damageDividedBy_1000$index < this.damageDividedBy_1000.length; ++damageDividedBy_1000$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.damageDividedBy_1000[damageDividedBy_1000$index]);
			}
			for (var isOffline$index:uint = 0; isOffline$index < this.isOffline.length; ++isOffline$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, this.isOffline[isOffline$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.heroId);
						break;
					}
					this.heroId.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				case 2:
					this.heroName.push(com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input));
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.damageDividedBy_1000);
						break;
					}
					this.damageDividedBy_1000.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_BOOL, this.isOffline);
						break;
					}
					this.isOffline.push(com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
