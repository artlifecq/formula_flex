package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Rectangle;
	import app.message.Point2D;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SceneTrigger extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TRIGGER_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTrigger.trigger_id", "triggerId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var trigger_id$field:int;

		private var hasField$0:uint = 0;

		public function clearTriggerId():void {
			hasField$0 &= 0xfffffffe;
			trigger_id$field = new int();
		}

		public function get hasTriggerId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set triggerId(value:int):void {
			hasField$0 |= 0x1;
			trigger_id$field = value;
		}

		public function get triggerId():int {
			return trigger_id$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTrigger.scene_id", "sceneId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TYPE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.SceneTrigger.type_id", "typeId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type_id$field:int;

		public function clearTypeId():void {
			hasField$0 &= 0xfffffffb;
			type_id$field = new int();
		}

		public function get hasTypeId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set typeId(value:int):void {
			hasField$0 |= 0x4;
			type_id$field = value;
		}

		public function get typeId():int {
			return type_id$field;
		}

		/**
		 *  @private
		 */
		public static const RECTANGLE_AREA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.SceneTrigger.rectangle_area", "rectangleArea", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Rectangle; });

		[ArrayElementType("app.message.Rectangle")]
		public var rectangleArea:Array = [];

		/**
		 *  @private
		 */
		public static const DOTTED_AREA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.SceneTrigger.dotted_area", "dottedArea", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Point2D; });

		[ArrayElementType("app.message.Point2D")]
		public var dottedArea:Array = [];

		/**
		 *  @private
		 */
		public static const DISPLAY_AREA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.SceneTrigger.display_area", "displayArea", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Point2D; });

		private var display_area$field:app.message.Point2D;

		public function clearDisplayArea():void {
			display_area$field = null;
		}

		public function get hasDisplayArea():Boolean {
			return display_area$field != null;
		}

		public function set displayArea(value:app.message.Point2D):void {
			display_area$field = value;
		}

		public function get displayArea():app.message.Point2D {
			return display_area$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTriggerId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, trigger_id$field);
			}
			if (hasSceneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, scene_id$field);
			}
			if (hasTypeId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type_id$field);
			}
			for (var rectangleArea$index:uint = 0; rectangleArea$index < this.rectangleArea.length; ++rectangleArea$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.rectangleArea[rectangleArea$index]);
			}
			for (var dottedArea$index:uint = 0; dottedArea$index < this.dottedArea.length; ++dottedArea$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.dottedArea[dottedArea$index]);
			}
			if (hasDisplayArea) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, display_area$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var trigger_id$count:uint = 0;
			var scene_id$count:uint = 0;
			var type_id$count:uint = 0;
			var display_area$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (trigger_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTrigger.triggerId cannot be set twice.');
					}
					++trigger_id$count;
					this.triggerId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (scene_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTrigger.sceneId cannot be set twice.');
					}
					++scene_id$count;
					this.sceneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (type_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTrigger.typeId cannot be set twice.');
					}
					++type_id$count;
					this.typeId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					this.rectangleArea.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.Rectangle()));
					break;
				case 5:
					this.dottedArea.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.Point2D()));
					break;
				case 6:
					if (display_area$count != 0) {
						throw new flash.errors.IOError('Bad data format: SceneTrigger.displayArea cannot be set twice.');
					}
					++display_area$count;
					this.displayArea = new app.message.Point2D();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.displayArea);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
