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
	public dynamic final class TopKillHeroTimesProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const KILL_HERO_TIMES:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.CountryWarTopRankProto.TopKillHeroTimesProto.kill_hero_times", "killHeroTimes", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_hero_times$field:Int64;

		public function clearKillHeroTimes():void {
			kill_hero_times$field = null;
		}

		public function get hasKillHeroTimes():Boolean {
			return kill_hero_times$field != null;
		}

		public function set killHeroTimes(value:Int64):void {
			kill_hero_times$field = value;
		}

		public function get killHeroTimes():Int64 {
			return kill_hero_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasKillHeroTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, kill_hero_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var kill_hero_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (kill_hero_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: TopKillHeroTimesProto.killHeroTimes cannot be set twice.');
					}
					++kill_hero_times$count;
					this.killHeroTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
