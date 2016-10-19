package app.message {
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
	public dynamic final class SceneTransportProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_TRANSPORT_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.can_transport_country", "canTransportCountry", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_transport_country$field:int;

		public function clearCanTransportCountry():void {
			hasField$0 &= 0xfffffffd;
			can_transport_country$field = new int();
		}

		public function get hasCanTransportCountry():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set canTransportCountry(value:int):void {
			hasField$0 |= 0x2;
			can_transport_country$field = value;
		}

		public function get canTransportCountry():int {
			return can_transport_country$field;
		}

		/**
		 *  @private
		 */
		public static const SOURCE_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.source_country", "sourceCountry", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var source_country$field:int;

		public function clearSourceCountry():void {
			hasField$0 &= 0xfffffffb;
			source_country$field = new int();
		}

		public function get hasSourceCountry():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set sourceCountry(value:int):void {
			hasField$0 |= 0x4;
			source_country$field = value;
		}

		public function get sourceCountry():int {
			return source_country$field;
		}

		/**
		 *  @private
		 */
		public static const SOURCE_AREA_DATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SceneTransportProto.source_area_data", "sourceAreaData", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AreaDataProto; });

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
		public static const DEST_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.dest_country", "destCountry", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dest_country$field:int;

		public function clearDestCountry():void {
			hasField$0 &= 0xfffffff7;
			dest_country$field = new int();
		}

		public function get hasDestCountry():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set destCountry(value:int):void {
			hasField$0 |= 0x8;
			dest_country$field = value;
		}

		public function get destCountry():int {
			return dest_country$field;
		}

		/**
		 *  @private
		 */
		public static const DEST_SCENE_DATA_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.dest_scene_data_id", "destSceneDataId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dest_scene_data_id$field:int;

		public function clearDestSceneDataId():void {
			hasField$0 &= 0xffffffef;
			dest_scene_data_id$field = new int();
		}

		public function get hasDestSceneDataId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set destSceneDataId(value:int):void {
			hasField$0 |= 0x10;
			dest_scene_data_id$field = value;
		}

		public function get destSceneDataId():int {
			return dest_scene_data_id$field;
		}

		/**
		 *  @private
		 */
		public static const RES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.SceneTransportProto.res", "res", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const RES_DIRECTION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.res_direction", "resDirection", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_direction$field:int;

		public function clearResDirection():void {
			hasField$0 &= 0xffffffdf;
			res_direction$field = new int();
		}

		public function get hasResDirection():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set resDirection(value:int):void {
			hasField$0 |= 0x20;
			res_direction$field = value;
		}

		public function get resDirection():int {
			return res_direction$field;
		}

		/**
		 *  @private
		 */
		public static const RES_X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.res_x", "resX", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_x$field:int;

		public function clearResX():void {
			hasField$0 &= 0xffffffbf;
			res_x$field = new int();
		}

		public function get hasResX():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set resX(value:int):void {
			hasField$0 |= 0x40;
			res_x$field = value;
		}

		public function get resX():int {
			return res_x$field;
		}

		/**
		 *  @private
		 */
		public static const RES_Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.res_y", "resY", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_y$field:int;

		public function clearResY():void {
			hasField$0 &= 0xffffff7f;
			res_y$field = new int();
		}

		public function get hasResY():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set resY(value:int):void {
			hasField$0 |= 0x80;
			res_y$field = value;
		}

		public function get resY():int {
			return res_y$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_IN_SMALL_MAP_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.show_in_small_map_type", "showInSmallMapType", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_in_small_map_type$field:int;

		public function clearShowInSmallMapType():void {
			hasField$0 &= 0xfffffeff;
			show_in_small_map_type$field = new int();
		}

		public function get hasShowInSmallMapType():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set showInSmallMapType(value:int):void {
			hasField$0 |= 0x100;
			show_in_small_map_type$field = value;
		}

		public function get showInSmallMapType():int {
			return show_in_small_map_type$field;
		}

		/**
		 *  @private
		 */
		public static const RES_OFFSET_UP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.res_offset_up", "resOffsetUp", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var res_offset_up$field:int;

		public function clearResOffsetUp():void {
			hasField$0 &= 0xfffffdff;
			res_offset_up$field = new int();
		}

		public function get hasResOffsetUp():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set resOffsetUp(value:int):void {
			hasField$0 |= 0x200;
			res_offset_up$field = value;
		}

		public function get resOffsetUp():int {
			return res_offset_up$field;
		}

		/**
		 *  @private
		 */
		public static const SCALE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTransportProto.scale", "scale", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scale$field:int;

		public function clearScale():void {
			hasField$0 &= 0xfffffbff;
			scale$field = new int();
		}

		public function get hasScale():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set scale(value:int):void {
			hasField$0 |= 0x400;
			scale$field = value;
		}

		public function get scale():int {
			return scale$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasCanTransportCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, can_transport_country$field);
			}
			if (hasSourceCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, source_country$field);
			}
			if (hasSourceAreaData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, source_area_data$field);
			}
			if (hasDestCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, dest_country$field);
			}
			if (hasDestSceneDataId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, dest_scene_data_id$field);
			}
			if (hasRes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, res$field);
			}
			if (hasResDirection) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, res_direction$field);
			}
			if (hasResX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, res_x$field);
			}
			if (hasResY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, res_y$field);
			}
			if (hasShowInSmallMapType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, show_in_small_map_type$field);
			}
			if (hasResOffsetUp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, res_offset_up$field);
			}
			if (hasScale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scale$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var can_transport_country$count:uint = 0;
			var source_country$count:uint = 0;
			var source_area_data$count:uint = 0;
			var dest_country$count:uint = 0;
			var dest_scene_data_id$count:uint = 0;
			var res$count:uint = 0;
			var res_direction$count:uint = 0;
			var res_x$count:uint = 0;
			var res_y$count:uint = 0;
			var show_in_small_map_type$count:uint = 0;
			var res_offset_up$count:uint = 0;
			var scale$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (can_transport_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.canTransportCountry cannot be set twice.');
					}
					++can_transport_country$count;
					this.canTransportCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (source_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.sourceCountry cannot be set twice.');
					}
					++source_country$count;
					this.sourceCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (source_area_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.sourceAreaData cannot be set twice.');
					}
					++source_area_data$count;
					this.sourceAreaData = new app.message.AreaDataProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.sourceAreaData);
					break;
				case 4:
					if (dest_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.destCountry cannot be set twice.');
					}
					++dest_country$count;
					this.destCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (dest_scene_data_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.destSceneDataId cannot be set twice.');
					}
					++dest_scene_data_id$count;
					this.destSceneDataId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (res$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.res cannot be set twice.');
					}
					++res$count;
					this.res = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (res_direction$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.resDirection cannot be set twice.');
					}
					++res_direction$count;
					this.resDirection = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (res_x$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.resX cannot be set twice.');
					}
					++res_x$count;
					this.resX = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (res_y$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.resY cannot be set twice.');
					}
					++res_y$count;
					this.resY = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (show_in_small_map_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.showInSmallMapType cannot be set twice.');
					}
					++show_in_small_map_type$count;
					this.showInSmallMapType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (res_offset_up$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.resOffsetUp cannot be set twice.');
					}
					++res_offset_up$count;
					this.resOffsetUp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (scale$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTransportProto.scale cannot be set twice.');
					}
					++scale$count;
					this.scale = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
