package app.message.TaskTargetProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.AreaDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SearchAreaTargetProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SEARCH_AREA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskTargetProto.SearchAreaTargetProto.search_area", "searchArea", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AreaDataProto; });

		private var search_area$field:app.message.AreaDataProto;

		public function clearSearchArea():void {
			search_area$field = null;
		}

		public function get hasSearchArea():Boolean {
			return search_area$field != null;
		}

		public function set searchArea(value:app.message.AreaDataProto):void {
			search_area$field = value;
		}

		public function get searchArea():app.message.AreaDataProto {
			return search_area$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSearchArea) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, search_area$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var search_area$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (search_area$count != 0) {
						throw new flash.errors.IOError('Bad data format: SearchAreaTargetProto.searchArea cannot be set twice.');
					}
					++search_area$count;
					this.searchArea = new app.message.AreaDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.searchArea);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
