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
	public dynamic final class BiaoModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TODAY_ACESS_PERSONAL_BIAO_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.BiaoModuleObjProto.today_acess_personal_biao_times", "todayAcessPersonalBiaoTimes", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_acess_personal_biao_times$field:int;

		private var hasField$0:uint = 0;

		public function clearTodayAcessPersonalBiaoTimes():void {
			hasField$0 &= 0xfffffffe;
			today_acess_personal_biao_times$field = new int();
		}

		public function get hasTodayAcessPersonalBiaoTimes():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set todayAcessPersonalBiaoTimes(value:int):void {
			hasField$0 |= 0x1;
			today_acess_personal_biao_times$field = value;
		}

		public function get todayAcessPersonalBiaoTimes():int {
			return today_acess_personal_biao_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTodayAcessPersonalBiaoTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, today_acess_personal_biao_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var today_acess_personal_biao_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (today_acess_personal_biao_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: BiaoModuleObjProto.todayAcessPersonalBiaoTimes cannot be set twice.');
					}
					++today_acess_personal_biao_times$count;
					this.todayAcessPersonalBiaoTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
