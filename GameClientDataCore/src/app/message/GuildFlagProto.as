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
	public dynamic final class GuildFlagProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FLAG:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.GuildFlagProto.flag", "flag", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var flag$field:String;

		public function clearFlag():void {
			flag$field = null;
		}

		public function get hasFlag():Boolean {
			return flag$field != null;
		}

		public function set flag(value:String):void {
			flag$field = value;
		}

		public function get flag():String {
			return flag$field;
		}

		/**
		 *  @private
		 */
		public static const DI_WEN:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildFlagProto.di_wen", "diWen", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var di_wen$field:int;

		private var hasField$0:uint = 0;

		public function clearDiWen():void {
			hasField$0 &= 0xfffffffe;
			di_wen$field = new int();
		}

		public function get hasDiWen():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set diWen(value:int):void {
			hasField$0 |= 0x1;
			di_wen$field = value;
		}

		public function get diWen():int {
			return di_wen$field;
		}

		/**
		 *  @private
		 */
		public static const DI_KUANG:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.GuildFlagProto.di_kuang", "diKuang", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var di_kuang$field:int;

		public function clearDiKuang():void {
			hasField$0 &= 0xfffffffd;
			di_kuang$field = new int();
		}

		public function get hasDiKuang():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set diKuang(value:int):void {
			hasField$0 |= 0x2;
			di_kuang$field = value;
		}

		public function get diKuang():int {
			return di_kuang$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFlag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, flag$field);
			}
			if (hasDiWen) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, di_wen$field);
			}
			if (hasDiKuang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, di_kuang$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var flag$count:uint = 0;
			var di_wen$count:uint = 0;
			var di_kuang$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (flag$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildFlagProto.flag cannot be set twice.');
					}
					++flag$count;
					this.flag = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (di_wen$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildFlagProto.diWen cannot be set twice.');
					}
					++di_wen$count;
					this.diWen = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (di_kuang$count != 0) {
						throw new flash.errors.IOError('Bad data format: GuildFlagProto.diKuang cannot be set twice.');
					}
					++di_kuang$count;
					this.diKuang = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
