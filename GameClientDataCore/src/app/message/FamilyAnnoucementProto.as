package app.message {
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
	public dynamic final class FamilyAnnoucementProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CONTENT:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.FamilyAnnoucementProto.content", "content", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var content$field:String;

		public function clearContent():void {
			content$field = null;
		}

		public function get hasContent():Boolean {
			return content$field != null;
		}

		public function set content(value:String):void {
			content$field = value;
		}

		public function get content():String {
			return content$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_CHANGE_TIME:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.FamilyAnnoucementProto.last_change_time", "lastChangeTime", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_change_time$field:Int64;

		public function clearLastChangeTime():void {
			last_change_time$field = null;
		}

		public function get hasLastChangeTime():Boolean {
			return last_change_time$field != null;
		}

		public function set lastChangeTime(value:Int64):void {
			last_change_time$field = value;
		}

		public function get lastChangeTime():Int64 {
			return last_change_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasContent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, content$field);
			}
			if (hasLastChangeTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, last_change_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var content$count:uint = 0;
			var last_change_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 16:
					if (content$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyAnnoucementProto.content cannot be set twice.');
					}
					++content$count;
					this.content = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 17:
					if (last_change_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyAnnoucementProto.lastChangeTime cannot be set twice.');
					}
					++last_change_time$count;
					this.lastChangeTime = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
