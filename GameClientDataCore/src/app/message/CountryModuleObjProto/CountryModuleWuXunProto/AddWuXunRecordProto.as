package app.message.CountryModuleObjProto.CountryModuleWuXunProto {
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
	public dynamic final class AddWuXunRecordProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto.time", "time", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var time$field:Int64;

		public function clearTime():void {
			time$field = null;
		}

		public function get hasTime():Boolean {
			return time$field != null;
		}

		public function set time(value:Int64):void {
			time$field = value;
		}

		public function get time():Int64 {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_ADD_AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto.kill_add_amount", "killAddAmount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_add_amount$field:Int64;

		public function clearKillAddAmount():void {
			kill_add_amount$field = null;
		}

		public function get hasKillAddAmount():Boolean {
			return kill_add_amount$field != null;
		}

		public function set killAddAmount(value:Int64):void {
			kill_add_amount$field = value;
		}

		public function get killAddAmount():Int64 {
			return kill_add_amount$field;
		}

		/**
		 *  @private
		 */
		public static const OTHER_ADD_AMOUNT:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto.other_add_amount", "otherAddAmount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var other_add_amount$field:Int64;

		public function clearOtherAddAmount():void {
			other_add_amount$field = null;
		}

		public function get hasOtherAddAmount():Boolean {
			return other_add_amount$field != null;
		}

		public function set otherAddAmount(value:Int64):void {
			other_add_amount$field = value;
		}

		public function get otherAddAmount():Int64 {
			return other_add_amount$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, time$field);
			}
			if (hasKillAddAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, kill_add_amount$field);
			}
			if (hasOtherAddAmount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, other_add_amount$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var time$count:uint = 0;
			var kill_add_amount$count:uint = 0;
			var other_add_amount$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddWuXunRecordProto.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (kill_add_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddWuXunRecordProto.killAddAmount cannot be set twice.');
					}
					++kill_add_amount$count;
					this.killAddAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (other_add_amount$count != 0) {
						throw new flash.errors.IOError('Bad data format: AddWuXunRecordProto.otherAddAmount cannot be set twice.');
					}
					++other_add_amount$count;
					this.otherAddAmount = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
