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
	public dynamic final class AddMemberProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ADD_MEMBER:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.AddMemberProto.add_member", "addMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var add_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearAddMember():void {
			add_member$field = null;
		}

		public function get hasAddMember():Boolean {
			return add_member$field != null;
		}

		public function set addMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			add_member$field = value;
		}

		public function get addMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return add_member$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAddMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, add_member$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var add_member$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (add_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddMemberProto.addMember cannot be set twice.');
					}
					++add_member$count;
					this.addMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.addMember);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
