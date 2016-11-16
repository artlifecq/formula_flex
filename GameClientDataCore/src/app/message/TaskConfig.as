package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.TouZhuConfig;
	import app.message.AllChapterTaskConfig;
	import app.message.BranchTaskConfig;
	import app.message.ChanceTaskConfig;
	import app.message.TouJingConfig;
	import app.message.MiXinConfig;
	import app.message.DailyTaskConfig;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TaskConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHAPTER_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskConfig.chapter_task", "chapterTask", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllChapterTaskConfig; });

		private var chapter_task$field:app.message.AllChapterTaskConfig;

		public function clearChapterTask():void {
			chapter_task$field = null;
		}

		public function get hasChapterTask():Boolean {
			return chapter_task$field != null;
		}

		public function set chapterTask(value:app.message.AllChapterTaskConfig):void {
			chapter_task$field = value;
		}

		public function get chapterTask():app.message.AllChapterTaskConfig {
			return chapter_task$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskConfig.chance_task", "chanceTask", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ChanceTaskConfig; });

		private var chance_task$field:app.message.ChanceTaskConfig;

		public function clearChanceTask():void {
			chance_task$field = null;
		}

		public function get hasChanceTask():Boolean {
			return chance_task$field != null;
		}

		public function set chanceTask(value:app.message.ChanceTaskConfig):void {
			chance_task$field = value;
		}

		public function get chanceTask():app.message.ChanceTaskConfig {
			return chance_task$field;
		}

		/**
		 *  @private
		 */
		public static const DAILY_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskConfig.daily_task", "dailyTask", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.DailyTaskConfig; });

		private var daily_task$field:app.message.DailyTaskConfig;

		public function clearDailyTask():void {
			daily_task$field = null;
		}

		public function get hasDailyTask():Boolean {
			return daily_task$field != null;
		}

		public function set dailyTask(value:app.message.DailyTaskConfig):void {
			daily_task$field = value;
		}

		public function get dailyTask():app.message.DailyTaskConfig {
			return daily_task$field;
		}

		/**
		 *  @private
		 */
		public static const BRANCH_TASK:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.TaskConfig.branch_task", "branchTask", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BranchTaskConfig; });

		[ArrayElementType("app.message.BranchTaskConfig")]
		public var branchTask:Array = [];

		/**
		 *  @private
		 */
		public static const TOU_JING_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskConfig.tou_jing_config", "touJingConfig", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TouJingConfig; });

		private var tou_jing_config$field:app.message.TouJingConfig;

		public function clearTouJingConfig():void {
			tou_jing_config$field = null;
		}

		public function get hasTouJingConfig():Boolean {
			return tou_jing_config$field != null;
		}

		public function set touJingConfig(value:app.message.TouJingConfig):void {
			tou_jing_config$field = value;
		}

		public function get touJingConfig():app.message.TouJingConfig {
			return tou_jing_config$field;
		}

		/**
		 *  @private
		 */
		public static const MI_XIN_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskConfig.mi_xin_config", "miXinConfig", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MiXinConfig; });

		private var mi_xin_config$field:app.message.MiXinConfig;

		public function clearMiXinConfig():void {
			mi_xin_config$field = null;
		}

		public function get hasMiXinConfig():Boolean {
			return mi_xin_config$field != null;
		}

		public function set miXinConfig(value:app.message.MiXinConfig):void {
			mi_xin_config$field = value;
		}

		public function get miXinConfig():app.message.MiXinConfig {
			return mi_xin_config$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_ZHU_CONFIG:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.TaskConfig.tou_zhu_config", "touZhuConfig", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TouZhuConfig; });

		private var tou_zhu_config$field:app.message.TouZhuConfig;

		public function clearTouZhuConfig():void {
			tou_zhu_config$field = null;
		}

		public function get hasTouZhuConfig():Boolean {
			return tou_zhu_config$field != null;
		}

		public function set touZhuConfig(value:app.message.TouZhuConfig):void {
			tou_zhu_config$field = value;
		}

		public function get touZhuConfig():app.message.TouZhuConfig {
			return tou_zhu_config$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChapterTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, chapter_task$field);
			}
			if (hasChanceTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, chance_task$field);
			}
			if (hasDailyTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, daily_task$field);
			}
			for (var branchTask$index:uint = 0; branchTask$index < this.branchTask.length; ++branchTask$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.branchTask[branchTask$index]);
			}
			if (hasTouJingConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, tou_jing_config$field);
			}
			if (hasMiXinConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, mi_xin_config$field);
			}
			if (hasTouZhuConfig) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, tou_zhu_config$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chapter_task$count:uint = 0;
			var chance_task$count:uint = 0;
			var daily_task$count:uint = 0;
			var tou_jing_config$count:uint = 0;
			var mi_xin_config$count:uint = 0;
			var tou_zhu_config$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (chapter_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskConfig.chapterTask cannot be set twice.');
					}
					++chapter_task$count;
					this.chapterTask = new app.message.AllChapterTaskConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.chapterTask);
					break;
				case 2:
					if (chance_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskConfig.chanceTask cannot be set twice.');
					}
					++chance_task$count;
					this.chanceTask = new app.message.ChanceTaskConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.chanceTask);
					break;
				case 3:
					if (daily_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskConfig.dailyTask cannot be set twice.');
					}
					++daily_task$count;
					this.dailyTask = new app.message.DailyTaskConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.dailyTask);
					break;
				case 4:
					this.branchTask.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.BranchTaskConfig()));
					break;
				case 5:
					if (tou_jing_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskConfig.touJingConfig cannot be set twice.');
					}
					++tou_jing_config$count;
					this.touJingConfig = new app.message.TouJingConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.touJingConfig);
					break;
				case 6:
					if (mi_xin_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskConfig.miXinConfig cannot be set twice.');
					}
					++mi_xin_config$count;
					this.miXinConfig = new app.message.MiXinConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.miXinConfig);
					break;
				case 7:
					if (tou_zhu_config$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskConfig.touZhuConfig cannot be set twice.');
					}
					++tou_zhu_config$count;
					this.touZhuConfig = new app.message.TouZhuConfig();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.touZhuConfig);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
