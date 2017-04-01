package app.message.NavMapData {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NavMapData.PolygonProto;
	import app.message.NavMapData.StallPolygonProto.StallPolyGridProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class StallPolygonProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POLY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.NavMapData.StallPolygonProto.poly", "poly", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.PolygonProto; });

		private var poly$field:app.message.NavMapData.PolygonProto;

		public function clearPoly():void {
			poly$field = null;
		}

		public function get hasPoly():Boolean {
			return poly$field != null;
		}

		public function set poly(value:app.message.NavMapData.PolygonProto):void {
			poly$field = value;
		}

		public function get poly():app.message.NavMapData.PolygonProto {
			return poly$field;
		}

		/**
		 *  @private
		 */
		public static const GRIDS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.NavMapData.StallPolygonProto.grids", "grids", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.NavMapData.StallPolygonProto.StallPolyGridProto; });

		[ArrayElementType("app.message.NavMapData.StallPolygonProto.StallPolyGridProto")]
		public var grids:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPoly) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, poly$field);
			}
			for (var grids$index:uint = 0; grids$index < this.grids.length; ++grids$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.grids[grids$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var poly$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (poly$count != 0) {
						throw new flash.errors.IOError('Bad data format: StallPolygonProto.poly cannot be set twice.');
					}
					++poly$count;
					this.poly = new app.message.NavMapData.PolygonProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.poly);
					break;
				case 2:
					this.grids.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.NavMapData.StallPolygonProto.StallPolyGridProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
