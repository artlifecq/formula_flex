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
	public dynamic final class ImpeachFamilyLeaderProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IMPEACH_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.ImpeachFamilyLeaderProto.impeach_member", "impeachMember", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var impeach_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearImpeachMember():void {
			impeach_member$field = null;
		}

		public function get hasImpeachMember():Boolean {
			return impeach_member$field != null;
		}

		public function set impeachMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			impeach_member$field = value;
		}

		public function get impeachMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return impeach_member$field;
		}

		/**
		 *  @private
		 */
		public static const BEEN_IMPEACH_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.ImpeachFamilyLeaderProto.been_impeach_member", "beenImpeachMember", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var been_impeach_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearBeenImpeachMember():void {
			been_impeach_member$field = null;
		}

		public function get hasBeenImpeachMember():Boolean {
			return been_impeach_member$field != null;
		}

		public function set beenImpeachMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			been_impeach_member$field = value;
		}

		public function get beenImpeachMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return been_impeach_member$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasImpeachMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, impeach_member$field);
			}
			if (hasBeenImpeachMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, been_impeach_member$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var impeach_member$count:uint = 0;
			var been_impeach_member$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (impeach_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: ImpeachFamilyLeaderProto.impeachMember cannot be set twice.');
					}
					++impeach_member$count;
					this.impeachMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.impeachMember);
					break;
				case 2:
					if (been_impeach_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: ImpeachFamilyLeaderProto.beenImpeachMember cannot be set twice.');
					}
					++been_impeach_member$count;
					this.beenImpeachMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.beenImpeachMember);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
