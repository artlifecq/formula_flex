package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TriggerAnimationSubType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TriggerAnimationType extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TriggerAnimationType.type_id", "typeId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type_id$field:int;

		private var hasField$0:uint = 0;

		public function clearTypeId():void {
			hasField$0 &= 0xfffffffe;
			type_id$field = new int();
		}

		public function get hasTypeId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set typeId(value:int):void {
			hasField$0 |= 0x1;
			type_id$field = value;
		}

		public function get typeId():int {
			return type_id$field;
		}

		/**
		 *  @private
		 */
		public static const RESET_CONDITION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TriggerAnimationType.reset_condition", "resetCondition", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var reset_condition$field:int;

		public function clearResetCondition():void {
			hasField$0 &= 0xfffffffd;
			reset_condition$field = new int();
		}

		public function get hasResetCondition():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set resetCondition(value:int):void {
			hasField$0 |= 0x2;
			reset_condition$field = value;
		}

		public function get resetCondition():int {
			return reset_condition$field;
		}

		/**
		 *  @private
		 */
		public static const SUB_TYPE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.TriggerAnimationType.sub_type", "subType", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TriggerAnimationSubType; });

		[ArrayElementType("app.message.TriggerAnimationSubType")]
		public var subType:Array = [];

		/**
		 *  @private
		 */
		public static const FILE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.TriggerAnimationType.file", "file", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var file$field:String;

		public function clearFile():void {
			file$field = null;
		}

		public function get hasFile():Boolean {
			return file$field != null;
		}

		public function set file(value:String):void {
			file$field = value;
		}

		public function get file():String {
			return file$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTypeId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type_id$field);
			}
			if (hasResetCondition) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, reset_condition$field);
			}
			for (var subType$index:uint = 0; subType$index < this.subType.length; ++subType$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.subType[subType$index]);
			}
			if (hasFile) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, file$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type_id$count:uint = 0;
			var reset_condition$count:uint = 0;
			var file$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TriggerAnimationType.typeId cannot be set twice.');
					}
					++type_id$count;
					this.typeId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (reset_condition$count != 0) {
						throw new flash.errors.IOError('Bad data format: TriggerAnimationType.resetCondition cannot be set twice.');
					}
					++reset_condition$count;
					this.resetCondition = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					this.subType.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.TriggerAnimationSubType()));
					break;
				case 4:
					if (file$count != 0) {
						throw new flash.errors.IOError('Bad data format: TriggerAnimationType.file cannot be set twice.');
					}
					++file$count;
					this.file = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
