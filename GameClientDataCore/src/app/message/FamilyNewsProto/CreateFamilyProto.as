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
	public dynamic final class CreateFamilyProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CREATOR:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.FamilyNewsProto.CreateFamilyProto.creator", "creator", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var creator$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearCreator():void {
			creator$field = null;
		}

		public function get hasCreator():Boolean {
			return creator$field != null;
		}

		public function set creator(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			creator$field = value;
		}

		public function get creator():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return creator$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCreator) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, creator$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var creator$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (creator$count != 0) {
						throw new flash.errors.IOError('Bad data format: CreateFamilyProto.creator cannot be set twice.');
					}
					++creator$count;
					this.creator = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.creator);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
