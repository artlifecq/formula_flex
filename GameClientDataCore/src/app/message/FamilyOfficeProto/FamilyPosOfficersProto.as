package app.message.FamilyOfficeProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyOfficerPos;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyPosOfficersProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor_TYPE_ENUM = new FieldDescriptor_TYPE_ENUM("app.message.FamilyOfficeProto.FamilyPosOfficersProto.pos", "pos", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FamilyOfficerPos);

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
		public static const LEADER_ID:RepeatedFieldDescriptor_TYPE_INT64 = new RepeatedFieldDescriptor_TYPE_INT64("app.message.FamilyOfficeProto.FamilyPosOfficersProto.leader_id", "leaderId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var leaderId:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_ENUM(output, pos$field);
			}
			for (var leaderId$index:uint = 0; leaderId$index < this.leaderId.length; ++leaderId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, this.leaderId[leaderId$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pos$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyPosOfficersProto.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read_TYPE_ENUM(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT64, this.leaderId);
						break;
					}
					this.leaderId.push(com.netease.protobuf.ReadUtils.read_TYPE_INT64(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
