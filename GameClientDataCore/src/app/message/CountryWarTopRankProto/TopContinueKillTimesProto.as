package app.message.CountryWarTopRankProto {
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
	public dynamic final class TopContinueKillTimesProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CONTINUE_KILL_HERO_TIMES:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarTopRankProto.TopContinueKillTimesProto.continue_kill_hero_times", "continueKillHeroTimes", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var continue_kill_hero_times$field:Int64;

		public function clearContinueKillHeroTimes():void {
			continue_kill_hero_times$field = null;
		}

		public function get hasContinueKillHeroTimes():Boolean {
			return continue_kill_hero_times$field != null;
		}

		public function set continueKillHeroTimes(value:Int64):void {
			continue_kill_hero_times$field = value;
		}

		public function get continueKillHeroTimes():Int64 {
			return continue_kill_hero_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasContinueKillHeroTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, continue_kill_hero_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var continue_kill_hero_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (continue_kill_hero_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: TopContinueKillTimesProto.continueKillHeroTimes cannot be set twice.');
					}
					++continue_kill_hero_times$count;
					this.continueKillHeroTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
