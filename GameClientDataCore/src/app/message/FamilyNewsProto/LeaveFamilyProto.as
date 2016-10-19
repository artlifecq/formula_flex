package app.message.FamilyNewsProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyNewsProto.MemberIdAndNameProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LeaveFamilyProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEAVE_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.LeaveFamilyProto.leave_member", "leaveMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var leave_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearLeaveMember():void {
			leave_member$field = null;
		}

		public function get hasLeaveMember():Boolean {
			return leave_member$field != null;
		}

		public function set leaveMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			leave_member$field = value;
		}

		public function get leaveMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return leave_member$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLeaveMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, leave_member$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var leave_member$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (leave_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeaveFamilyProto.leaveMember cannot be set twice.');
					}
					++leave_member$count;
					this.leaveMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.leaveMember);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
