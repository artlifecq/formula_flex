package app.message.CountryHistoryRecordProto {
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
	public dynamic final class CountryJingShuRecordProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KING_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.CountryHistoryRecordProto.CountryJingShuRecordProto.king_name", "kingName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var king_name$field:String;

		public function clearKingName():void {
			king_name$field = null;
		}

		public function get hasKingName():Boolean {
			return king_name$field != null;
		}

		public function set kingName(value:String):void {
			king_name$field = value;
		}

		public function get kingName():String {
			return king_name$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_JING_SHU_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryHistoryRecordProto.CountryJingShuRecordProto.cur_jing_shu_count", "curJingShuCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_jing_shu_count$field:int;

		private var hasField$0:uint = 0;

		public function clearCurJingShuCount():void {
			hasField$0 &= 0xfffffffe;
			cur_jing_shu_count$field = new int();
		}

		public function get hasCurJingShuCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set curJingShuCount(value:int):void {
			hasField$0 |= 0x1;
			cur_jing_shu_count$field = value;
		}

		public function get curJingShuCount():int {
			return cur_jing_shu_count$field;
		}

		/**
		 *  @private
		 */
		public static const TODAY_ROB_JING_SHU_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryHistoryRecordProto.CountryJingShuRecordProto.today_rob_jing_shu_count", "todayRobJingShuCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_rob_jing_shu_count$field:int;

		public function clearTodayRobJingShuCount():void {
			hasField$0 &= 0xfffffffd;
			today_rob_jing_shu_count$field = new int();
		}

		public function get hasTodayRobJingShuCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set todayRobJingShuCount(value:int):void {
			hasField$0 |= 0x2;
			today_rob_jing_shu_count$field = value;
		}

		public function get todayRobJingShuCount():int {
			return today_rob_jing_shu_count$field;
		}

		/**
		 *  @private
		 */
		public static const TODAY_BEEN_ROB_JING_SHU_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryHistoryRecordProto.CountryJingShuRecordProto.today_been_rob_jing_shu_count", "todayBeenRobJingShuCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_been_rob_jing_shu_count$field:int;

		public function clearTodayBeenRobJingShuCount():void {
			hasField$0 &= 0xfffffffb;
			today_been_rob_jing_shu_count$field = new int();
		}

		public function get hasTodayBeenRobJingShuCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set todayBeenRobJingShuCount(value:int):void {
			hasField$0 |= 0x4;
			today_been_rob_jing_shu_count$field = value;
		}

		public function get todayBeenRobJingShuCount():int {
			return today_been_rob_jing_shu_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKingName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, king_name$field);
			}
			if (hasCurJingShuCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cur_jing_shu_count$field);
			}
			if (hasTodayRobJingShuCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, today_rob_jing_shu_count$field);
			}
			if (hasTodayBeenRobJingShuCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, today_been_rob_jing_shu_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var king_name$count:uint = 0;
			var cur_jing_shu_count$count:uint = 0;
			var today_rob_jing_shu_count$count:uint = 0;
			var today_been_rob_jing_shu_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (king_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryJingShuRecordProto.kingName cannot be set twice.');
					}
					++king_name$count;
					this.kingName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 2:
					if (cur_jing_shu_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryJingShuRecordProto.curJingShuCount cannot be set twice.');
					}
					++cur_jing_shu_count$count;
					this.curJingShuCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (today_rob_jing_shu_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryJingShuRecordProto.todayRobJingShuCount cannot be set twice.');
					}
					++today_rob_jing_shu_count$count;
					this.todayRobJingShuCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (today_been_rob_jing_shu_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryJingShuRecordProto.todayBeenRobJingShuCount cannot be set twice.');
					}
					++today_been_rob_jing_shu_count$count;
					this.todayBeenRobJingShuCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
