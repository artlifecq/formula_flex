package app.message.CountryModuleObjProto {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryModuleWuXunProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WU_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.wu_xun", "wuXun", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var wu_xun$field:Int64;

		public function clearWuXun():void {
			wu_xun$field = null;
		}

		public function get hasWuXun():Boolean {
			return wu_xun$field != null;
		}

		public function set wuXun(value:Int64):void {
			wu_xun$field = value;
		}

		public function get wuXun():Int64 {
			return wu_xun$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_WU_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.total_wu_xun", "totalWuXun", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_wu_xun$field:Int64;

		public function clearTotalWuXun():void {
			total_wu_xun$field = null;
		}

		public function get hasTotalWuXun():Boolean {
			return total_wu_xun$field != null;
		}

		public function set totalWuXun(value:Int64):void {
			total_wu_xun$field = value;
		}

		public function get totalWuXun():Int64 {
			return total_wu_xun$field;
		}

		/**
		 *  @private
		 */
		public static const TODAY_KILL_ADD_WU_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.today_kill_add_wu_xun", "todayKillAddWuXun", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_kill_add_wu_xun$field:Int64;

		public function clearTodayKillAddWuXun():void {
			today_kill_add_wu_xun$field = null;
		}

		public function get hasTodayKillAddWuXun():Boolean {
			return today_kill_add_wu_xun$field != null;
		}

		public function set todayKillAddWuXun(value:Int64):void {
			today_kill_add_wu_xun$field = value;
		}

		public function get todayKillAddWuXun():Int64 {
			return today_kill_add_wu_xun$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_KILL_ADD_WU_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.total_kill_add_wu_xun", "totalKillAddWuXun", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_kill_add_wu_xun$field:Int64;

		public function clearTotalKillAddWuXun():void {
			total_kill_add_wu_xun$field = null;
		}

		public function get hasTotalKillAddWuXun():Boolean {
			return total_kill_add_wu_xun$field != null;
		}

		public function set totalKillAddWuXun(value:Int64):void {
			total_kill_add_wu_xun$field = value;
		}

		public function get totalKillAddWuXun():Int64 {
			return total_kill_add_wu_xun$field;
		}

		/**
		 *  @private
		 */
		public static const TODAY_OTHER_ADD_WU_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.today_other_add_wu_xun", "todayOtherAddWuXun", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var today_other_add_wu_xun$field:Int64;

		public function clearTodayOtherAddWuXun():void {
			today_other_add_wu_xun$field = null;
		}

		public function get hasTodayOtherAddWuXun():Boolean {
			return today_other_add_wu_xun$field != null;
		}

		public function set todayOtherAddWuXun(value:Int64):void {
			today_other_add_wu_xun$field = value;
		}

		public function get todayOtherAddWuXun():Int64 {
			return today_other_add_wu_xun$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_OTHER_ADD_WU_XUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryModuleObjProto.CountryModuleWuXunProto.total_other_add_wu_xun", "totalOtherAddWuXun", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_other_add_wu_xun$field:Int64;

		public function clearTotalOtherAddWuXun():void {
			total_other_add_wu_xun$field = null;
		}

		public function get hasTotalOtherAddWuXun():Boolean {
			return total_other_add_wu_xun$field != null;
		}

		public function set totalOtherAddWuXun(value:Int64):void {
			total_other_add_wu_xun$field = value;
		}

		public function get totalOtherAddWuXun():Int64 {
			return total_other_add_wu_xun$field;
		}

		/**
		 *  @private
		 */
		public static const RECORDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.CountryModuleObjProto.CountryModuleWuXunProto.records", "records", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto; });

		[ArrayElementType("app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto")]
		public var records:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, wu_xun$field);
			}
			if (hasTotalWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, total_wu_xun$field);
			}
			if (hasTodayKillAddWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, today_kill_add_wu_xun$field);
			}
			if (hasTotalKillAddWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, total_kill_add_wu_xun$field);
			}
			if (hasTodayOtherAddWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, today_other_add_wu_xun$field);
			}
			if (hasTotalOtherAddWuXun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, total_other_add_wu_xun$field);
			}
			for (var records$index:uint = 0; records$index < this.records.length; ++records$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.records[records$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var wu_xun$count:uint = 0;
			var total_wu_xun$count:uint = 0;
			var today_kill_add_wu_xun$count:uint = 0;
			var total_kill_add_wu_xun$count:uint = 0;
			var today_other_add_wu_xun$count:uint = 0;
			var total_other_add_wu_xun$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleWuXunProto.wuXun cannot be set twice.');
					}
					++wu_xun$count;
					this.wuXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (total_wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleWuXunProto.totalWuXun cannot be set twice.');
					}
					++total_wu_xun$count;
					this.totalWuXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 3:
					if (today_kill_add_wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleWuXunProto.todayKillAddWuXun cannot be set twice.');
					}
					++today_kill_add_wu_xun$count;
					this.todayKillAddWuXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (total_kill_add_wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleWuXunProto.totalKillAddWuXun cannot be set twice.');
					}
					++total_kill_add_wu_xun$count;
					this.totalKillAddWuXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 5:
					if (today_other_add_wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleWuXunProto.todayOtherAddWuXun cannot be set twice.');
					}
					++today_other_add_wu_xun$count;
					this.todayOtherAddWuXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 6:
					if (total_other_add_wu_xun$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryModuleWuXunProto.totalOtherAddWuXun cannot be set twice.');
					}
					++total_other_add_wu_xun$count;
					this.totalOtherAddWuXun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 7:
					this.records.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.CountryModuleObjProto.CountryModuleWuXunProto.AddWuXunRecordProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
