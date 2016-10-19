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
	public dynamic final class RelationModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MOOD:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.RelationModuleObjProto.mood", "mood", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var mood$field:flash.utils.ByteArray;

		public function clearMood():void {
			mood$field = null;
		}

		public function get hasMood():Boolean {
			return mood$field != null;
		}

		public function set mood(value:flash.utils.ByteArray):void {
			mood$field = value;
		}

		public function get mood():flash.utils.ByteArray {
			return mood$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMood) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, mood$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var mood$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (mood$count != 0) {
						throw new flash.errors.IOError('Bad data format: RelationModuleObjProto.mood cannot be set twice.');
					}
					++mood$count;
					this.mood = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
