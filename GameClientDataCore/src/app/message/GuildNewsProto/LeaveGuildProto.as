package app.message.GuildNewsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LeaveGuildProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEAVE_FAMILY_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.GuildNewsProto.LeaveGuildProto.leave_family_name", "leaveFamilyName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var leave_family_name$field:String;

		public function clearLeaveFamilyName():void {
			leave_family_name$field = null;
		}

		public function get hasLeaveFamilyName():Boolean {
			return leave_family_name$field != null;
		}

		public function set leaveFamilyName(value:String):void {
			leave_family_name$field = value;
		}

		public function get leaveFamilyName():String {
			return leave_family_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLeaveFamilyName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, leave_family_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var leave_family_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (leave_family_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaveGuildProto.leaveFamilyName cannot be set twice.');
					}
					++leave_family_name$count;
					this.leaveFamilyName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
