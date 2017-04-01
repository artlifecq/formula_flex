package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.CountryWarTopRankProto.TopContinueKillTimesProto;
	import app.message.ModelProto;
	import app.message.CountryWarTopRankProto.TopHelpKillHeroTimesProto;
	import app.message.CountryWarTopRankProto.TopReliveTimesProto;
	import app.message.CountryWarTopRankProto.TopPointProto;
	import app.message.CountryWarTopRankProto.TopKillHeroTimesProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class CountryWarTopRankProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HERO_ID:FieldDescriptor_TYPE_INT64 = new FieldDescriptor_TYPE_INT64("app.message.CountryWarTopRankProto.hero_id", "heroId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_id$field:Int64;

		public function clearHeroId():void {
			hero_id$field = null;
		}

		public function get hasHeroId():Boolean {
			return hero_id$field != null;
		}

		public function set heroId(value:Int64):void {
			hero_id$field = value;
		}

		public function get heroId():Int64 {
			return hero_id$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_NAME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.CountryWarTopRankProto.hero_name", "heroName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var hero_name$field:String;

		public function clearHeroName():void {
			hero_name$field = null;
		}

		public function get hasHeroName():Boolean {
			return hero_name$field != null;
		}

		public function set heroName(value:String):void {
			hero_name$field = value;
		}

		public function get heroName():String {
			return hero_name$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_LEVEL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.CountryWarTopRankProto.hero_level", "heroLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_level$field:int;

		private var hasField$0:uint = 0;

		public function clearHeroLevel():void {
			hasField$0 &= 0xfffffffe;
			hero_level$field = new int();
		}

		public function get hasHeroLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set heroLevel(value:int):void {
			hasField$0 |= 0x1;
			hero_level$field = value;
		}

		public function get heroLevel():int {
			return hero_level$field;
		}

		/**
		 *  @private
		 */
		public static const MODEL:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarTopRankProto.model", "model", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ModelProto; });

		private var model$field:app.message.ModelProto;

		public function clearModel():void {
			model$field = null;
		}

		public function get hasModel():Boolean {
			return model$field != null;
		}

		public function set model(value:app.message.ModelProto):void {
			model$field = value;
		}

		public function get model():app.message.ModelProto {
			return model$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_HERO_TIMES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarTopRankProto.kill_hero_times", "killHeroTimes", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarTopRankProto.TopKillHeroTimesProto; });

		private var kill_hero_times$field:app.message.CountryWarTopRankProto.TopKillHeroTimesProto;

		public function clearKillHeroTimes():void {
			kill_hero_times$field = null;
		}

		public function get hasKillHeroTimes():Boolean {
			return kill_hero_times$field != null;
		}

		public function set killHeroTimes(value:app.message.CountryWarTopRankProto.TopKillHeroTimesProto):void {
			kill_hero_times$field = value;
		}

		public function get killHeroTimes():app.message.CountryWarTopRankProto.TopKillHeroTimesProto {
			return kill_hero_times$field;
		}

		/**
		 *  @private
		 */
		public static const HELP_KILL_HERO_TIMES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarTopRankProto.help_kill_hero_times", "helpKillHeroTimes", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarTopRankProto.TopHelpKillHeroTimesProto; });

		private var help_kill_hero_times$field:app.message.CountryWarTopRankProto.TopHelpKillHeroTimesProto;

		public function clearHelpKillHeroTimes():void {
			help_kill_hero_times$field = null;
		}

		public function get hasHelpKillHeroTimes():Boolean {
			return help_kill_hero_times$field != null;
		}

		public function set helpKillHeroTimes(value:app.message.CountryWarTopRankProto.TopHelpKillHeroTimesProto):void {
			help_kill_hero_times$field = value;
		}

		public function get helpKillHeroTimes():app.message.CountryWarTopRankProto.TopHelpKillHeroTimesProto {
			return help_kill_hero_times$field;
		}

		/**
		 *  @private
		 */
		public static const RELIVE_TIMES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarTopRankProto.relive_times", "reliveTimes", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarTopRankProto.TopReliveTimesProto; });

		private var relive_times$field:app.message.CountryWarTopRankProto.TopReliveTimesProto;

		public function clearReliveTimes():void {
			relive_times$field = null;
		}

		public function get hasReliveTimes():Boolean {
			return relive_times$field != null;
		}

		public function set reliveTimes(value:app.message.CountryWarTopRankProto.TopReliveTimesProto):void {
			relive_times$field = value;
		}

		public function get reliveTimes():app.message.CountryWarTopRankProto.TopReliveTimesProto {
			return relive_times$field;
		}

		/**
		 *  @private
		 */
		public static const CONTINUE_KILL_TIMES:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarTopRankProto.continue_kill_times", "continueKillTimes", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarTopRankProto.TopContinueKillTimesProto; });

		private var continue_kill_times$field:app.message.CountryWarTopRankProto.TopContinueKillTimesProto;

		public function clearContinueKillTimes():void {
			continue_kill_times$field = null;
		}

		public function get hasContinueKillTimes():Boolean {
			return continue_kill_times$field != null;
		}

		public function set continueKillTimes(value:app.message.CountryWarTopRankProto.TopContinueKillTimesProto):void {
			continue_kill_times$field = value;
		}

		public function get continueKillTimes():app.message.CountryWarTopRankProto.TopContinueKillTimesProto {
			return continue_kill_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOP_POINT:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.CountryWarTopRankProto.top_point", "topPoint", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.CountryWarTopRankProto.TopPointProto; });

		private var top_point$field:app.message.CountryWarTopRankProto.TopPointProto;

		public function clearTopPoint():void {
			top_point$field = null;
		}

		public function get hasTopPoint():Boolean {
			return top_point$field != null;
		}

		public function set topPoint(value:app.message.CountryWarTopRankProto.TopPointProto):void {
			top_point$field = value;
		}

		public function get topPoint():app.message.CountryWarTopRankProto.TopPointProto {
			return top_point$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT64(output, hero_id$field);
			}
			if (hasHeroName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, hero_name$field);
			}
			if (hasHeroLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hero_level$field);
			}
			if (hasModel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, model$field);
			}
			if (hasKillHeroTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, kill_hero_times$field);
			}
			if (hasHelpKillHeroTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, help_kill_hero_times$field);
			}
			if (hasReliveTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, relive_times$field);
			}
			if (hasContinueKillTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, continue_kill_times$field);
			}
			if (hasTopPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, top_point$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var hero_id$count:uint = 0;
			var hero_name$count:uint = 0;
			var hero_level$count:uint = 0;
			var model$count:uint = 0;
			var kill_hero_times$count:uint = 0;
			var help_kill_hero_times$count:uint = 0;
			var relive_times$count:uint = 0;
			var continue_kill_times$count:uint = 0;
			var top_point$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (hero_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.heroId cannot be set twice.');
					}
					++hero_id$count;
					this.heroId = com.netease.protobuf.ReadUtils.read_TYPE_INT64(input);
					break;
				case 2:
					if (hero_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.heroName cannot be set twice.');
					}
					++hero_name$count;
					this.heroName = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 3:
					if (hero_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.heroLevel cannot be set twice.');
					}
					++hero_level$count;
					this.heroLevel = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (model$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.model cannot be set twice.');
					}
					++model$count;
					this.model = new app.message.ModelProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.model);
					break;
				case 10:
					if (kill_hero_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.killHeroTimes cannot be set twice.');
					}
					++kill_hero_times$count;
					this.killHeroTimes = new app.message.CountryWarTopRankProto.TopKillHeroTimesProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.killHeroTimes);
					break;
				case 11:
					if (help_kill_hero_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.helpKillHeroTimes cannot be set twice.');
					}
					++help_kill_hero_times$count;
					this.helpKillHeroTimes = new app.message.CountryWarTopRankProto.TopHelpKillHeroTimesProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.helpKillHeroTimes);
					break;
				case 12:
					if (relive_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.reliveTimes cannot be set twice.');
					}
					++relive_times$count;
					this.reliveTimes = new app.message.CountryWarTopRankProto.TopReliveTimesProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.reliveTimes);
					break;
				case 13:
					if (continue_kill_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.continueKillTimes cannot be set twice.');
					}
					++continue_kill_times$count;
					this.continueKillTimes = new app.message.CountryWarTopRankProto.TopContinueKillTimesProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.continueKillTimes);
					break;
				case 14:
					if (top_point$count != 0) {
						throw new flash.errors.IOError('Bad data format: CountryWarTopRankProto.topPoint cannot be set twice.');
					}
					++top_point$count;
					this.topPoint = new app.message.CountryWarTopRankProto.TopPointProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.topPoint);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
