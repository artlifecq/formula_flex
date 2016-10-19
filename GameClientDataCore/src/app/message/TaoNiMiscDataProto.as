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
	public dynamic final class TaoNiMiscDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME_DATA:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.TaoNiMiscDataProto.time_data", "timeData", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var time_data$field:String;

		public function clearTimeData():void {
			time_data$field = null;
		}

		public function get hasTimeData():Boolean {
			return time_data$field != null;
		}

		public function set timeData(value:String):void {
			time_data$field = value;
		}

		public function get timeData():String {
			return time_data$field;
		}

		/**
		 *  @private
		 */
		public static const DURATION:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.TaoNiMiscDataProto.duration", "duration", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var duration$field:Int64;

		public function clearDuration():void {
			duration$field = null;
		}

		public function get hasDuration():Boolean {
			return duration$field != null;
		}

		public function set duration(value:Int64):void {
			duration$field = value;
		}

		public function get duration():Int64 {
			return duration$field;
		}

		/**
		 *  @private
		 */
		public static const SCENE:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.TaoNiMiscDataProto.scene", "scene", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var scene:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTimeData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, time_data$field);
			}
			if (hasDuration) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, duration$field);
			}
			for (var scene$index:uint = 0; scene$index < this.scene.length; ++scene$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.scene[scene$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time_data$count:uint = 0;
			var duration$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaoNiMiscDataProto.timeData cannot be set twice.');
					}
					++time_data$count;
					this.timeData = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (duration$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaoNiMiscDataProto.duration cannot be set twice.');
					}
					++duration$count;
					this.duration = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.scene);
						break;
					}
					this.scene.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
