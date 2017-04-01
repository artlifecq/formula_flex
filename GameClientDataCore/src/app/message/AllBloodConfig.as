package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.BloodMiscDataProto;
	import app.message.BloodSkillProto;
	import app.message.BloodLineProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class AllBloodConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BLOOD_LINE_PROTO:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.AllBloodConfig.blood_line_proto", "bloodLineProto", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BloodLineProto; });

		[ArrayElementType("app.message.BloodLineProto")]
		public var bloodLineProto:Array = [];

		/**
		 *  @private
		 */
		public static const BLOOD_SKILL_PROTO:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.AllBloodConfig.blood_skill_proto", "bloodSkillProto", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BloodSkillProto; });

		[ArrayElementType("app.message.BloodSkillProto")]
		public var bloodSkillProto:Array = [];

		/**
		 *  @private
		 */
		public static const BLOOD_MISC_PROTO:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.AllBloodConfig.blood_misc_proto", "bloodMiscProto", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BloodMiscDataProto; });

		private var blood_misc_proto$field:app.message.BloodMiscDataProto;

		public function clearBloodMiscProto():void {
			blood_misc_proto$field = null;
		}

		public function get hasBloodMiscProto():Boolean {
			return blood_misc_proto$field != null;
		}

		public function set bloodMiscProto(value:app.message.BloodMiscDataProto):void {
			blood_misc_proto$field = value;
		}

		public function get bloodMiscProto():app.message.BloodMiscDataProto {
			return blood_misc_proto$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var bloodLineProto$index:uint = 0; bloodLineProto$index < this.bloodLineProto.length; ++bloodLineProto$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.bloodLineProto[bloodLineProto$index]);
			}
			for (var bloodSkillProto$index:uint = 0; bloodSkillProto$index < this.bloodSkillProto.length; ++bloodSkillProto$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.bloodSkillProto[bloodSkillProto$index]);
			}
			if (hasBloodMiscProto) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, blood_misc_proto$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var blood_misc_proto$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.bloodLineProto.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.BloodLineProto()));
					break;
				case 2:
					this.bloodSkillProto.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.BloodSkillProto()));
					break;
				case 3:
					if (blood_misc_proto$count != 0) {
						throw new flash.errors.IOError('Bad data format: AllBloodConfig.bloodMiscProto cannot be set twice.');
					}
					++blood_misc_proto$count;
					this.bloodMiscProto = new app.message.BloodMiscDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.bloodMiscProto);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
