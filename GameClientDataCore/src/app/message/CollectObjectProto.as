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
	public dynamic final class CollectObjectProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.CollectObjectProto.name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var name$field:flash.utils.ByteArray;

		public function clearName():void {
			name$field = null;
		}

		public function get hasName():Boolean {
			return name$field != null;
		}

		public function set name(value:flash.utils.ByteArray):void {
			name$field = value;
		}

		public function get name():flash.utils.ByteArray {
			return name$field;
		}

		/**
		 *  @private
		 */
		public static const RESOURCE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CollectObjectProto.resource", "resource", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var resource$field:String;

		public function clearResource():void {
			resource$field = null;
		}

		public function get hasResource():Boolean {
			return resource$field != null;
		}

		public function set resource(value:String):void {
			resource$field = value;
		}

		public function get resource():String {
			return resource$field;
		}

		/**
		 *  @private
		 */
		public static const IS_REVERSE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CollectObjectProto.is_reverse", "isReverse", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_reverse$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearIsReverse():void {
			hasField$0 &= 0xfffffffe;
			is_reverse$field = new Boolean();
		}

		public function get hasIsReverse():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isReverse(value:Boolean):void {
			hasField$0 |= 0x1;
			is_reverse$field = value;
		}

		public function get isReverse():Boolean {
			return is_reverse$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CollectObjectProto.scene_id", "sceneId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const OBJECT_ID:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.CollectObjectProto.object_id", "objectId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var objectId:Array = [];

		/**
		 *  @private
		 */
		public static const POS_X:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.CollectObjectProto.pos_x", "posX", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var posX:Array = [];

		/**
		 *  @private
		 */
		public static const POS_Y:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.CollectObjectProto.pos_y", "posY", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var posY:Array = [];

		/**
		 *  @private
		 */
		public static const ACTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CollectObjectProto.action", "action", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var action$field:String;

		public function clearAction():void {
			action$field = null;
		}

		public function get hasAction():Boolean {
			return action$field != null;
		}

		public function set action(value:String):void {
			action$field = value;
		}

		public function get action():String {
			return action$field;
		}

		/**
		 *  @private
		 */
		public static const SCALE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CollectObjectProto.scale", "scale", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var scale$field:int;

		public function clearScale():void {
			hasField$0 &= 0xfffffffb;
			scale$field = new int();
		}

		public function get hasScale():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set scale(value:int):void {
			hasField$0 |= 0x4;
			scale$field = value;
		}

		public function get scale():int {
			return scale$field;
		}

		/**
		 *  @private
		 */
		public static const DIRECTION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.CollectObjectProto.direction", "direction", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var direction$field:int;

		public function clearDirection():void {
			hasField$0 &= 0xfffffff7;
			direction$field = new int();
		}

		public function get hasDirection():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set direction(value:int):void {
			hasField$0 |= 0x8;
			direction$field = value;
		}

		public function get direction():int {
			return direction$field;
		}

		/**
		 *  @private
		 */
		public static const IS_DYNAMIC_CREATE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("app.message.CollectObjectProto.is_dynamic_create", "isDynamicCreate", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_dynamic_create$field:Boolean;

		public function clearIsDynamicCreate():void {
			hasField$0 &= 0xffffffef;
			is_dynamic_create$field = new Boolean();
		}

		public function get hasIsDynamicCreate():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set isDynamicCreate(value:Boolean):void {
			hasField$0 |= 0x10;
			is_dynamic_create$field = value;
		}

		public function get isDynamicCreate():Boolean {
			return is_dynamic_create$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_SHOW:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.CollectObjectProto.collect_show", "collectShow", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var collect_show$field:String;

		public function clearCollectShow():void {
			collect_show$field = null;
		}

		public function get hasCollectShow():Boolean {
			return collect_show$field != null;
		}

		public function set collectShow(value:String):void {
			collect_show$field = value;
		}

		public function get collectShow():String {
			return collect_show$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, name$field);
			}
			if (hasResource) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, resource$field);
			}
			if (hasIsReverse) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_reverse$field);
			}
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_id$field);
			}
			for (var objectId$index:uint = 0; objectId$index < this.objectId.length; ++objectId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.objectId[objectId$index]);
			}
			for (var posX$index:uint = 0; posX$index < this.posX.length; ++posX$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.posX[posX$index]);
			}
			for (var posY$index:uint = 0; posY$index < this.posY.length; ++posY$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.posY[posY$index]);
			}
			if (hasAction) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, action$field);
			}
			if (hasScale) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scale$field);
			}
			if (hasDirection) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, direction$field);
			}
			if (hasIsDynamicCreate) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, is_dynamic_create$field);
			}
			if (hasCollectShow) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, collect_show$field);
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
			var resource$count:uint = 0;
			var is_reverse$count:uint = 0;
			var scene_id$count:uint = 0;
			var action$count:uint = 0;
			var scale$count:uint = 0;
			var direction$count:uint = 0;
			var is_dynamic_create$count:uint = 0;
			var collect_show$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.name cannot be set twice.');
					}
					++name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 2:
					if (resource$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.resource cannot be set twice.');
					}
					++resource$count;
					this.resource = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (is_reverse$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.isReverse cannot be set twice.');
					}
					++is_reverse$count;
					this.isReverse = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 4:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.objectId);
						break;
					}
					this.objectId.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.posX);
						break;
					}
					this.posX.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 7:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.posY);
						break;
					}
					this.posY.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 8:
					if (action$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.action cannot be set twice.');
					}
					++action$count;
					this.action = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (scale$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.scale cannot be set twice.');
					}
					++scale$count;
					this.scale = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (direction$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.direction cannot be set twice.');
					}
					++direction$count;
					this.direction = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (is_dynamic_create$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.isDynamicCreate cannot be set twice.');
					}
					++is_dynamic_create$count;
					this.isDynamicCreate = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 12:
					if (collect_show$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectProto.collectShow cannot be set twice.');
					}
					++collect_show$count;
					this.collectShow = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
