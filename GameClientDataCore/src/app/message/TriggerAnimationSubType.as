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
	public dynamic final class TriggerAnimationSubType extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIMING:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TriggerAnimationSubType.timing", "timing", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var timing$field:int;

		private var hasField$0:uint = 0;

		public function clearTiming():void {
			hasField$0 &= 0xfffffffe;
			timing$field = new int();
		}

		public function get hasTiming():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set timing(value:int):void {
			hasField$0 |= 0x1;
			timing$field = value;
		}

		public function get timing():int {
			return timing$field;
		}

		/**
		 *  @private
		 */
		public static const IS_REPEAT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.TriggerAnimationSubType.is_repeat", "isRepeat", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_repeat$field:Boolean;

		public function clearIsRepeat():void {
			hasField$0 &= 0xfffffffd;
			is_repeat$field = new Boolean();
		}

		public function get hasIsRepeat():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set isRepeat(value:Boolean):void {
			hasField$0 |= 0x2;
			is_repeat$field = value;
		}

		public function get isRepeat():Boolean {
			return is_repeat$field;
		}

		/**
		 *  @private
		 */
		public static const IS_REMOVE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.TriggerAnimationSubType.is_remove", "isRemove", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_remove$field:Boolean;

		public function clearIsRemove():void {
			hasField$0 &= 0xfffffffb;
			is_remove$field = new Boolean();
		}

		public function get hasIsRemove():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set isRemove(value:Boolean):void {
			hasField$0 |= 0x4;
			is_remove$field = value;
		}

		public function get isRemove():Boolean {
			return is_remove$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.TriggerAnimationSubType.time", "time", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:int;

		public function clearTime():void {
			hasField$0 &= 0xfffffff7;
			time$field = new int();
		}

		public function get hasTime():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set time(value:int):void {
			hasField$0 |= 0x8;
			time$field = value;
		}

		public function get time():int {
			return time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTiming) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, timing$field);
			}
			if (hasIsRepeat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_repeat$field);
			}
			if (hasIsRemove) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_remove$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var timing$count:uint = 0;
			var is_repeat$count:uint = 0;
			var is_remove$count:uint = 0;
			var time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (timing$count != 0) {
						throw new flash.errors.IOError('Bad data format: TriggerAnimationSubType.timing cannot be set twice.');
					}
					++timing$count;
					this.timing = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (is_repeat$count != 0) {
						throw new flash.errors.IOError('Bad data format: TriggerAnimationSubType.isRepeat cannot be set twice.');
					}
					++is_repeat$count;
					this.isRepeat = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 3:
					if (is_remove$count != 0) {
						throw new flash.errors.IOError('Bad data format: TriggerAnimationSubType.isRemove cannot be set twice.');
					}
					++is_remove$count;
					this.isRemove = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 4:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: TriggerAnimationSubType.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
