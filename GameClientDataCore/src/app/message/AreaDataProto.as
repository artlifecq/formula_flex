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
	public dynamic final class AreaDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AreaDataProto.id", "id", (6 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SCENE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AreaDataProto.scene_id", "sceneId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_id$field:int;

		public function clearSceneId():void {
			hasField$0 &= 0xfffffffd;
			scene_id$field = new int();
		}

		public function get hasSceneId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set sceneId(value:int):void {
			hasField$0 |= 0x2;
			scene_id$field = value;
		}

		public function get sceneId():int {
			return scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const POS:RepeatedFieldDescriptor_TYPE_INT32 = new RepeatedFieldDescriptor_TYPE_INT32("app.message.AreaDataProto.pos", "pos", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var pos:Array = [];

		/**
		 *  @private
		 */
		public static const AREA_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.AreaDataProto.area_name", "areaName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var area_name$field:String;

		public function clearAreaName():void {
			area_name$field = null;
		}

		public function get hasAreaName():Boolean {
			return area_name$field != null;
		}

		public function set areaName(value:String):void {
			area_name$field = value;
		}

		public function get areaName():String {
			return area_name$field;
		}

		/**
		 *  @private
		 */
		public static const CENTER_X:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AreaDataProto.center_x", "centerX", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var center_x$field:int;

		public function clearCenterX():void {
			hasField$0 &= 0xfffffffb;
			center_x$field = new int();
		}

		public function get hasCenterX():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set centerX(value:int):void {
			hasField$0 |= 0x4;
			center_x$field = value;
		}

		public function get centerX():int {
			return center_x$field;
		}

		/**
		 *  @private
		 */
		public static const CENTER_Y:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.AreaDataProto.center_y", "centerY", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var center_y$field:int;

		public function clearCenterY():void {
			hasField$0 &= 0xfffffff7;
			center_y$field = new int();
		}

		public function get hasCenterY():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set centerY(value:int):void {
			hasField$0 |= 0x8;
			center_y$field = value;
		}

		public function get centerY():int {
			return center_y$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, scene_id$field);
			}
			for (var pos$index:uint = 0; pos$index < this.pos.length; ++pos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, this.pos[pos$index]);
			}
			if (hasAreaName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, area_name$field);
			}
			if (hasCenterX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, center_x$field);
			}
			if (hasCenterY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, center_y$field);
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
			var scene_id$count:uint = 0;
			var area_name$count:uint = 0;
			var center_x$count:uint = 0;
			var center_y$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 6:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AreaDataProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 1:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: AreaDataProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read_TYPE_INT32, this.pos);
						break;
					}
					this.pos.push(com.netease.protobuf.ReadUtils.read_TYPE_INT32(input));
					break;
				case 3:
					if (area_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: AreaDataProto.areaName cannot be set twice.');
					}
					++area_name$count;
					this.areaName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 4:
					if (center_x$count != 0) {
						throw new flash.errors.IOError('Bad data format: AreaDataProto.centerX cannot be set twice.');
					}
					++center_x$count;
					this.centerX = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (center_y$count != 0) {
						throw new flash.errors.IOError('Bad data format: AreaDataProto.centerY cannot be set twice.');
					}
					++center_y$count;
					this.centerY = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
