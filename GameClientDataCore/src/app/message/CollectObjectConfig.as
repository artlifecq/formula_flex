package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CollectObjectProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CollectObjectConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START_TYPE_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CollectObjectConfig.start_type_id", "startTypeId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_type_id$field:int;

		private var hasField$0:uint = 0;

		public function clearStartTypeId():void {
			hasField$0 &= 0xfffffffe;
			start_type_id$field = new int();
		}

		public function get hasStartTypeId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set startTypeId(value:int):void {
			hasField$0 |= 0x1;
			start_type_id$field = value;
		}

		public function get startTypeId():int {
			return start_type_id$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_OBJECTS:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.CollectObjectConfig.collect_objects", "collectObjects", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CollectObjectProto; });

		[ArrayElementType("app.message.CollectObjectProto")]
		public var collectObjects:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStartTypeId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, start_type_id$field);
			}
			for (var collectObjects$index:uint = 0; collectObjects$index < this.collectObjects.length; ++collectObjects$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.collectObjects[collectObjects$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start_type_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start_type_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CollectObjectConfig.startTypeId cannot be set twice.');
					}
					++start_type_id$count;
					this.startTypeId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					this.collectObjects.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.CollectObjectProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
