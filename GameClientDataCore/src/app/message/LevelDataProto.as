package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FunctionType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LevelDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FUNCTIONS:RepeatedFieldDescriptor$TYPE_ENUM = new RepeatedFieldDescriptor$TYPE_ENUM("app.message.LevelDataProto.functions", "functions", (1 << 3) | com.netease.protobuf.WireType.VARINT, app.message.FunctionType);

		[ArrayElementType("int")]
		public var functions:Array = [];

		/**
		 *  @private
		 */
		public static const OFFLINE_EXP_PER_MINUTE_BY_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.LevelDataProto.offline_exp_per_minute_by_level", "offlineExpPerMinuteByLevel", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var offline_exp_per_minute_by_level$field:int;

		private var hasField$0:uint = 0;

		public function clearOfflineExpPerMinuteByLevel():void {
			hasField$0 &= 0xfffffffe;
			offline_exp_per_minute_by_level$field = new int();
		}

		public function get hasOfflineExpPerMinuteByLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set offlineExpPerMinuteByLevel(value:int):void {
			hasField$0 |= 0x1;
			offline_exp_per_minute_by_level$field = value;
		}

		public function get offlineExpPerMinuteByLevel():int {
			return offline_exp_per_minute_by_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var functions$index:uint = 0; functions$index < this.functions.length; ++functions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, this.functions[functions$index]);
			}
			if (hasOfflineExpPerMinuteByLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, offline_exp_per_minute_by_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var offline_exp_per_minute_by_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_ENUM, this.functions);
						break;
					}
					this.functions.push(com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input));
					break;
				case 2:
					if (offline_exp_per_minute_by_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: LevelDataProto.offlineExpPerMinuteByLevel cannot be set twice.');
					}
					++offline_exp_per_minute_by_level$count;
					this.offlineExpPerMinuteByLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
