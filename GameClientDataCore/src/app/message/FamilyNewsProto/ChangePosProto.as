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
	import app.message.FamilyOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChangePosProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHANGE_POS_MEMBER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyNewsProto.ChangePosProto.change_pos_member", "changePosMember", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyNewsProto.MemberIdAndNameProto; });

		private var change_pos_member$field:app.message.FamilyNewsProto.MemberIdAndNameProto;

		public function clearChangePosMember():void {
			change_pos_member$field = null;
		}

		public function get hasChangePosMember():Boolean {
			return change_pos_member$field != null;
		}

		public function set changePosMember(value:app.message.FamilyNewsProto.MemberIdAndNameProto):void {
			change_pos_member$field = value;
		}

		public function get changePosMember():app.message.FamilyNewsProto.MemberIdAndNameProto {
			return change_pos_member$field;
		}

		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("app.message.FamilyNewsProto.ChangePosProto.pos", "pos", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FamilyOfficerPos);

		private var pos$field:int;

		private var hasField$0:uint = 0;

		public function clearPos():void {
			hasField$0 &= 0xfffffffe;
			pos$field = new int();
		}

		public function get hasPos():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set pos(value:int):void {
			hasField$0 |= 0x1;
			pos$field = value;
		}

		public function get pos():int {
			return pos$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChangePosMember) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, change_pos_member$field);
			}
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, pos$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var change_pos_member$count:uint = 0;
			var pos$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (change_pos_member$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangePosProto.changePosMember cannot be set twice.');
					}
					++change_pos_member$count;
					this.changePosMember = new app.message.FamilyNewsProto.MemberIdAndNameProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.changePosMember);
					break;
				case 1:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChangePosProto.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
