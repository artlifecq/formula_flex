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
	public dynamic final class SelfCountryWarInfoProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POINT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SelfCountryWarInfoProto.point", "point", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var point$field:Int64;

		public function clearPoint():void {
			point$field = null;
		}

		public function get hasPoint():Boolean {
			return point$field != null;
		}

		public function set point(value:Int64):void {
			point$field = value;
		}

		public function get point():Int64 {
			return point$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_KILL_HERO_TIMES:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SelfCountryWarInfoProto.total_kill_hero_times", "totalKillHeroTimes", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_kill_hero_times$field:Int64;

		public function clearTotalKillHeroTimes():void {
			total_kill_hero_times$field = null;
		}

		public function get hasTotalKillHeroTimes():Boolean {
			return total_kill_hero_times$field != null;
		}

		public function set totalKillHeroTimes(value:Int64):void {
			total_kill_hero_times$field = value;
		}

		public function get totalKillHeroTimes():Int64 {
			return total_kill_hero_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_BEEN_KILLED_TIMES:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SelfCountryWarInfoProto.total_been_killed_times", "totalBeenKilledTimes", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_been_killed_times$field:Int64;

		public function clearTotalBeenKilledTimes():void {
			total_been_killed_times$field = null;
		}

		public function get hasTotalBeenKilledTimes():Boolean {
			return total_been_killed_times$field != null;
		}

		public function set totalBeenKilledTimes(value:Int64):void {
			total_been_killed_times$field = value;
		}

		public function get totalBeenKilledTimes():Int64 {
			return total_been_killed_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_ORIGIN_RELIVE_TIMES:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SelfCountryWarInfoProto.total_origin_relive_times", "totalOriginReliveTimes", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_origin_relive_times$field:Int64;

		public function clearTotalOriginReliveTimes():void {
			total_origin_relive_times$field = null;
		}

		public function get hasTotalOriginReliveTimes():Boolean {
			return total_origin_relive_times$field != null;
		}

		public function set totalOriginReliveTimes(value:Int64):void {
			total_origin_relive_times$field = value;
		}

		public function get totalOriginReliveTimes():Int64 {
			return total_origin_relive_times$field;
		}

		/**
		 *  @private
		 */
		public static const OLD_MAX_POINT:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.SelfCountryWarInfoProto.old_max_point", "oldMaxPoint", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var old_max_point$field:Int64;

		public function clearOldMaxPoint():void {
			old_max_point$field = null;
		}

		public function get hasOldMaxPoint():Boolean {
			return old_max_point$field != null;
		}

		public function set oldMaxPoint(value:Int64):void {
			old_max_point$field = value;
		}

		public function get oldMaxPoint():Int64 {
			return old_max_point$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, point$field);
			}
			if (hasTotalKillHeroTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, total_kill_hero_times$field);
			}
			if (hasTotalBeenKilledTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, total_been_killed_times$field);
			}
			if (hasTotalOriginReliveTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, total_origin_relive_times$field);
			}
			if (hasOldMaxPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, old_max_point$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var point$count:uint = 0;
			var total_kill_hero_times$count:uint = 0;
			var total_been_killed_times$count:uint = 0;
			var total_origin_relive_times$count:uint = 0;
			var old_max_point$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (point$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelfCountryWarInfoProto.point cannot be set twice.');
					}
					++point$count;
					this.point = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (total_kill_hero_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelfCountryWarInfoProto.totalKillHeroTimes cannot be set twice.');
					}
					++total_kill_hero_times$count;
					this.totalKillHeroTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 3:
					if (total_been_killed_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelfCountryWarInfoProto.totalBeenKilledTimes cannot be set twice.');
					}
					++total_been_killed_times$count;
					this.totalBeenKilledTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 4:
					if (total_origin_relive_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelfCountryWarInfoProto.totalOriginReliveTimes cannot be set twice.');
					}
					++total_origin_relive_times$count;
					this.totalOriginReliveTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 5:
					if (old_max_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: SelfCountryWarInfoProto.oldMaxPoint cannot be set twice.');
					}
					++old_max_point$count;
					this.oldMaxPoint = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
