package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MazeRankProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MazeAllRankProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FLOOR:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeAllRankProto.floor", "floor", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var floor$field:int;

		private var hasField$0:uint = 0;

		public function clearFloor():void {
			hasField$0 &= 0xfffffffe;
			floor$field = new int();
		}

		public function get hasFloor():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set floor(value:int):void {
			hasField$0 |= 0x1;
			floor$field = value;
		}

		public function get floor():int {
			return floor$field;
		}

		/**
		 *  @private
		 */
		public static const ALL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MazeAllRankProto.all", "all", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MazeRankProto; });

		private var all$field:app.message.MazeRankProto;

		public function clearAll():void {
			all$field = null;
		}

		public function get hasAll():Boolean {
			return all$field != null;
		}

		public function set all(value:app.message.MazeRankProto):void {
			all$field = value;
		}

		public function get all():app.message.MazeRankProto {
			return all$field;
		}

		/**
		 *  @private
		 */
		public static const SELF_COUNTRY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MazeAllRankProto.self_country", "selfCountry", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MazeRankProto; });

		private var self_country$field:app.message.MazeRankProto;

		public function clearSelfCountry():void {
			self_country$field = null;
		}

		public function get hasSelfCountry():Boolean {
			return self_country$field != null;
		}

		public function set selfCountry(value:app.message.MazeRankProto):void {
			self_country$field = value;
		}

		public function get selfCountry():app.message.MazeRankProto {
			return self_country$field;
		}

		/**
		 *  @private
		 */
		public static const ALL_COUNTRY:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.MazeAllRankProto.all_country", "allCountry", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MazeRankProto; });

		private var all_country$field:app.message.MazeRankProto;

		public function clearAllCountry():void {
			all_country$field = null;
		}

		public function get hasAllCountry():Boolean {
			return all_country$field != null;
		}

		public function set allCountry(value:app.message.MazeRankProto):void {
			all_country$field = value;
		}

		public function get allCountry():app.message.MazeRankProto {
			return all_country$field;
		}

		/**
		 *  @private
		 */
		public static const FINISH_HERO_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.MazeAllRankProto.finish_hero_count", "finishHeroCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var finish_hero_count$field:int;

		public function clearFinishHeroCount():void {
			hasField$0 &= 0xfffffffd;
			finish_hero_count$field = new int();
		}

		public function get hasFinishHeroCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set finishHeroCount(value:int):void {
			hasField$0 |= 0x2;
			finish_hero_count$field = value;
		}

		public function get finishHeroCount():int {
			return finish_hero_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFloor) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, floor$field);
			}
			if (hasAll) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, all$field);
			}
			if (hasSelfCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, self_country$field);
			}
			if (hasAllCountry) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, all_country$field);
			}
			if (hasFinishHeroCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, finish_hero_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var floor$count:uint = 0;
			var all$count:uint = 0;
			var self_country$count:uint = 0;
			var all_country$count:uint = 0;
			var finish_hero_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (floor$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeAllRankProto.floor cannot be set twice.');
					}
					++floor$count;
					this.floor = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					if (all$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeAllRankProto.all cannot be set twice.');
					}
					++all$count;
					this.all = new app.message.MazeRankProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.all);
					break;
				case 3:
					if (self_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeAllRankProto.selfCountry cannot be set twice.');
					}
					++self_country$count;
					this.selfCountry = new app.message.MazeRankProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.selfCountry);
					break;
				case 4:
					if (all_country$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeAllRankProto.allCountry cannot be set twice.');
					}
					++all_country$count;
					this.allCountry = new app.message.MazeRankProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.allCountry);
					break;
				case 5:
					if (finish_hero_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: MazeAllRankProto.finishHeroCount cannot be set twice.');
					}
					++finish_hero_count$count;
					this.finishHeroCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
