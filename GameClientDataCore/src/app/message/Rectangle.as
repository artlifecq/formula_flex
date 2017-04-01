package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.Point2D;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class Rectangle extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.Rectangle.start", "start", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Point2D; });

		private var start$field:app.message.Point2D;

		public function clearStart():void {
			start$field = null;
		}

		public function get hasStart():Boolean {
			return start$field != null;
		}

		public function set start(value:app.message.Point2D):void {
			start$field = value;
		}

		public function get start():app.message.Point2D {
			return start$field;
		}

		/**
		 *  @private
		 */
		public static const END:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.Rectangle.end", "end", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.Point2D; });

		private var end$field:app.message.Point2D;

		public function clearEnd():void {
			end$field = null;
		}

		public function get hasEnd():Boolean {
			return end$field != null;
		}

		public function set end(value:app.message.Point2D):void {
			end$field = value;
		}

		public function get end():app.message.Point2D {
			return end$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, start$field);
			}
			if (hasEnd) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, end$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start$count:uint = 0;
			var end$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start$count != 0) {
						throw new flash.errors.IOError('Bad data format: Rectangle.start cannot be set twice.');
					}
					++start$count;
					this.start = new app.message.Point2D();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.start);
					break;
				case 2:
					if (end$count != 0) {
						throw new flash.errors.IOError('Bad data format: Rectangle.end cannot be set twice.');
					}
					++end$count;
					this.end = new app.message.Point2D();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.end);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
