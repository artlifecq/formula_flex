package app.message.MazeDungeonProto {
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
	public dynamic final class MazePortalDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.MazeDungeonProto.MazePortalDataProto.name", "name", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:String;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:String):void {
			name$field = value;
		}

		public function get name():String {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const SOURCE_AREA_DATA:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MazeDungeonProto.MazePortalDataProto.source_area_data", "sourceAreaData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AreaDataProto; });

		private var source_area_data$field:app.message.AreaDataProto;

		public function clearSourceAreaData():void {
			source_area_data$field = null;
		}

		public function get hasSourceAreaData():Boolean {
			return source_area_data$field != null;
		}

		public function set sourceAreaData(value:app.message.AreaDataProto):void {
			source_area_data$field = value;
		}

		public function get sourceAreaData():app.message.AreaDataProto {
			return source_area_data$field;
		}

		/**
		 *  @private
		 */
		public static const RES:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.MazeDungeonProto.MazePortalDataProto.res", "res", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var res$field:String;

		public function clearRes():void {
			res$field = null;
		}

		public function get hasRes():Boolean {
			return res$field != null;
		}

		public function set res(value:String):void {
			res$field = value;
		}

		public function get res():String {
			return res$field;
		}

		/**
		 *  @private
		 */
		public static const RES_DIRECTION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeDungeonProto.MazePortalDataProto.res_direction", "resDirection", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_direction$field:int;

		private var hasField$0:uint = 0;

		public function clearResDirection():void {
			hasField$0 &= 0xfffffffe;
			res_direction$field = new int();
		}

		public function get hasResDirection():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set resDirection(value:int):void {
			hasField$0 |= 0x1;
			res_direction$field = value;
		}

		public function get resDirection():int {
			return res_direction$field;
		}

		/**
		 *  @private
		 */
		public static const RES_X:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeDungeonProto.MazePortalDataProto.res_x", "resX", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_x$field:int;

		public function clearResX():void {
			hasField$0 &= 0xfffffffd;
			res_x$field = new int();
		}

		public function get hasResX():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set resX(value:int):void {
			hasField$0 |= 0x2;
			res_x$field = value;
		}

		public function get resX():int {
			return res_x$field;
		}

		/**
		 *  @private
		 */
		public static const RES_Y:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeDungeonProto.MazePortalDataProto.res_y", "resY", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_y$field:int;

		public function clearResY():void {
			hasField$0 &= 0xfffffffb;
			res_y$field = new int();
		}

		public function get hasResY():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set resY(value:int):void {
			hasField$0 |= 0x4;
			res_y$field = value;
		}

		public function get resY():int {
			return res_y$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_IN_SMALL_MAP_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeDungeonProto.MazePortalDataProto.show_in_small_map_type", "showInSmallMapType", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_in_small_map_type$field:int;

		public function clearShowInSmallMapType():void {
			hasField$0 &= 0xfffffff7;
			show_in_small_map_type$field = new int();
		}

		public function get hasShowInSmallMapType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set showInSmallMapType(value:int):void {
			hasField$0 |= 0x8;
			show_in_small_map_type$field = value;
		}

		public function get showInSmallMapType():int {
			return show_in_small_map_type$field;
		}

		/**
		 *  @private
		 */
		public static const RES_OFFSET_UP:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeDungeonProto.MazePortalDataProto.res_offset_up", "resOffsetUp", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_offset_up$field:int;

		public function clearResOffsetUp():void {
			hasField$0 &= 0xffffffef;
			res_offset_up$field = new int();
		}

		public function get hasResOffsetUp():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set resOffsetUp(value:int):void {
			hasField$0 |= 0x10;
			res_offset_up$field = value;
		}

		public function get resOffsetUp():int {
			return res_offset_up$field;
		}

		/**
		 *  @private
		 */
		public static const SCALE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeDungeonProto.MazePortalDataProto.scale", "scale", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scale$field:int;

		public function clearScale():void {
			hasField$0 &= 0xffffffdf;
			scale$field = new int();
		}

		public function get hasScale():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set scale(value:int):void {
			hasField$0 |= 0x20;
			scale$field = value;
		}

		public function get scale():int {
			return scale$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, name$field);
			}
			if (hasSourceAreaData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, source_area_data$field);
			}
			if (hasRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, res$field);
			}
			if (hasResDirection) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, res_direction$field);
			}
			if (hasResX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, res_x$field);
			}
			if (hasResY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, res_y$field);
			}
			if (hasShowInSmallMapType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, show_in_small_map_type$field);
			}
			if (hasResOffsetUp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, res_offset_up$field);
			}
			if (hasScale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, scale$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var name$count:uint = 0;
			var source_area_data$count:uint = 0;
			var res$count:uint = 0;
			var res_direction$count:uint = 0;
			var res_x$count:uint = 0;
			var res_y$count:uint = 0;
			var show_in_small_map_type$count:uint = 0;
			var res_offset_up$count:uint = 0;
			var scale$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 7:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 1:
					if (source_area_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.sourceAreaData cannot be set twice.');
					}
					++source_area_data$count;
					this.sourceAreaData = new app.message.AreaDataProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.sourceAreaData);
					break;
				case 2:
					if (res$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.res cannot be set twice.');
					}
					++res$count;
					this.res = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (res_direction$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.resDirection cannot be set twice.');
					}
					++res_direction$count;
					this.resDirection = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (res_x$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.resX cannot be set twice.');
					}
					++res_x$count;
					this.resX = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (res_y$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.resY cannot be set twice.');
					}
					++res_y$count;
					this.resY = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (show_in_small_map_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.showInSmallMapType cannot be set twice.');
					}
					++show_in_small_map_type$count;
					this.showInSmallMapType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (res_offset_up$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.resOffsetUp cannot be set twice.');
					}
					++res_offset_up$count;
					this.resOffsetUp = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 13:
					if (scale$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazePortalDataProto.scale cannot be set twice.');
					}
					++scale$count;
					this.scale = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
