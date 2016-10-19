package app.message.ChatContentProto {
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
	public dynamic final class PosInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ChatContentProto.PosInfoProto.scene_id", "sceneId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_id$field:int;

		private var hasField$0:uint = 0;

		public function clearSceneId():void {
			hasField$0 &= 0xfffffffe;
			scene_id$field = new int();
		}

		public function get hasSceneId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sceneId(value:int):void {
			hasField$0 |= 0x1;
			scene_id$field = value;
		}

		public function get sceneId():int {
			return scene_id$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ChatContentProto.PosInfoProto.scene_x", "sceneX", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_x$field:int;

		public function clearSceneX():void {
			hasField$0 &= 0xfffffffd;
			scene_x$field = new int();
		}

		public function get hasSceneX():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set sceneX(value:int):void {
			hasField$0 |= 0x2;
			scene_x$field = value;
		}

		public function get sceneX():int {
			return scene_x$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ChatContentProto.PosInfoProto.scene_y", "sceneY", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_y$field:int;

		public function clearSceneY():void {
			hasField$0 &= 0xfffffffb;
			scene_y$field = new int();
		}

		public function get hasSceneY():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set sceneY(value:int):void {
			hasField$0 |= 0x4;
			scene_y$field = value;
		}

		public function get sceneY():int {
			return scene_y$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_LINE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ChatContentProto.PosInfoProto.scene_line", "sceneLine", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_line$field:int;

		public function clearSceneLine():void {
			hasField$0 &= 0xfffffff7;
			scene_line$field = new int();
		}

		public function get hasSceneLine():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set sceneLine(value:int):void {
			hasField$0 |= 0x8;
			scene_line$field = value;
		}

		public function get sceneLine():int {
			return scene_line$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_COUNTRY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ChatContentProto.PosInfoProto.scene_country", "sceneCountry", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scene_country$field:int;

		public function clearSceneCountry():void {
			hasField$0 &= 0xffffffef;
			scene_country$field = new int();
		}

		public function get hasSceneCountry():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set sceneCountry(value:int):void {
			hasField$0 |= 0x10;
			scene_country$field = value;
		}

		public function get sceneCountry():int {
			return scene_country$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_id$field);
			}
			if (hasSceneX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_x$field);
			}
			if (hasSceneY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_y$field);
			}
			if (hasSceneLine) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_line$field);
			}
			if (hasSceneCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_country$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var scene_id$count:uint = 0;
			var scene_x$count:uint = 0;
			var scene_y$count:uint = 0;
			var scene_line$count:uint = 0;
			var scene_country$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: PosInfoProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (scene_x$count != 0) {
						throw new flash.errors.IOError('Bad data format: PosInfoProto.sceneX cannot be set twice.');
					}
					++scene_x$count;
					this.sceneX = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (scene_y$count != 0) {
						throw new flash.errors.IOError('Bad data format: PosInfoProto.sceneY cannot be set twice.');
					}
					++scene_y$count;
					this.sceneY = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (scene_line$count != 0) {
						throw new flash.errors.IOError('Bad data format: PosInfoProto.sceneLine cannot be set twice.');
					}
					++scene_line$count;
					this.sceneLine = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (scene_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: PosInfoProto.sceneCountry cannot be set twice.');
					}
					++scene_country$count;
					this.sceneCountry = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
