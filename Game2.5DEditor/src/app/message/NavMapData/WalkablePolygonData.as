package app.message.NavMapData {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.NavMapData.WalkablePolygonData;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class WalkablePolygonData extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IS_WALKABLE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.NavMapData.WalkablePolygonData.is_walkable", "isWalkable", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_walkable$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsWalkable():void {
			hasField$0 &= 0xfffffffe;
			is_walkable$field = new Boolean();
		}

		public function get hasIsWalkable():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isWalkable(value:Boolean):void {
			hasField$0 |= 0x1;
			is_walkable$field = value;
		}

		public function get isWalkable():Boolean {
			return is_walkable$field;
		}

		/**
		 *  @private
		 */
		public static const POINT:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.NavMapData.WalkablePolygonData.point", "point", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var point:Array = [];

		/**
		 *  @private
		 */
		public static const SUB_POLY:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.NavMapData.WalkablePolygonData.sub_poly", "subPoly", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return WalkablePolygonData; });

		[ArrayElementType("WalkablePolygonData")]
		public var subPoly:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIsWalkable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_walkable$field);
			}
			for (var point$index:uint = 0; point$index < this.point.length; ++point$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.point[point$index]);
			}
			for (var subPoly$index:uint = 0; subPoly$index < this.subPoly.length; ++subPoly$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.subPoly[subPoly$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var is_walkable$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (is_walkable$count != 0) {
						throw new flash.errors.IOError('Bad data format: WalkablePolygonData.isWalkable cannot be set twice.');
					}
					++is_walkable$count;
					this.isWalkable = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.point);
						break;
					}
					this.point.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 3:
					this.subPoly.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new WalkablePolygonData()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
