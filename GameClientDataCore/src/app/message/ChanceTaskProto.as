package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TaskProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChanceTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BASE_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ChanceTaskProto.base_task", "baseTask", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskProto; });

		private var base_task$field:app.message.TaskProto;

		public function clearBaseTask():void {
			base_task$field = null;
		}

		public function get hasBaseTask():Boolean {
			return base_task$field != null;
		}

		public function set baseTask(value:app.message.TaskProto):void {
			base_task$field = value;
		}

		public function get baseTask():app.message.TaskProto {
			return base_task$field;
		}

		/**
		 *  @private
		 */
		public static const SWALLOW_PERCENT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskProto.swallow_percent", "swallowPercent", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var swallow_percent$field:int;

		private var hasField$0:uint = 0;

		public function clearSwallowPercent():void {
			hasField$0 &= 0xfffffffe;
			swallow_percent$field = new int();
		}

		public function get hasSwallowPercent():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set swallowPercent(value:int):void {
			hasField$0 |= 0x1;
			swallow_percent$field = value;
		}

		public function get swallowPercent():int {
			return swallow_percent$field;
		}

		/**
		 *  @private
		 */
		public static const QUALITY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChanceTaskProto.quality", "quality", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var quality$field:int;

		public function clearQuality():void {
			hasField$0 &= 0xfffffffd;
			quality$field = new int();
		}

		public function get hasQuality():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set quality(value:int):void {
			hasField$0 |= 0x2;
			quality$field = value;
		}

		public function get quality():int {
			return quality$field;
		}

		/**
		 *  @private
		 */
		public static const HEAD_IMAGE:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.ChanceTaskProto.head_image", "headImage", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var head_image$field:String;

		public function clearHeadImage():void {
			head_image$field = null;
		}

		public function get hasHeadImage():Boolean {
			return head_image$field != null;
		}

		public function set headImage(value:String):void {
			head_image$field = value;
		}

		public function get headImage():String {
			return head_image$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBaseTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, base_task$field);
			}
			if (hasSwallowPercent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, swallow_percent$field);
			}
			if (hasQuality) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, quality$field);
			}
			if (hasHeadImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, head_image$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var base_task$count:uint = 0;
			var swallow_percent$count:uint = 0;
			var quality$count:uint = 0;
			var head_image$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (base_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskProto.baseTask cannot be set twice.');
					}
					++base_task$count;
					this.baseTask = new app.message.TaskProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.baseTask);
					break;
				case 2:
					if (swallow_percent$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskProto.swallowPercent cannot be set twice.');
					}
					++swallow_percent$count;
					this.swallowPercent = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (quality$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskProto.quality cannot be set twice.');
					}
					++quality$count;
					this.quality = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (head_image$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChanceTaskProto.headImage cannot be set twice.');
					}
					++head_image$count;
					this.headImage = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
