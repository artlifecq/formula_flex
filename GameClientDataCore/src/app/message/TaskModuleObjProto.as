package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.MiXinTaskProto;
	import app.message.TouJingTaskProto;
	import app.message.BranchTaskProto;
	import app.message.ChanceTaskProto;
	import app.message.TouZhuTaskProto;
	import app.message.DailyTaskProto;
	import app.message.ChapterTaskProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class TaskModuleObjProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DOING_CHAPTER_TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskModuleObjProto.doing_chapter_task", "doingChapterTask", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ChapterTaskProto; });

		private var doing_chapter_task$field:app.message.ChapterTaskProto;

		public function clearDoingChapterTask():void {
			doing_chapter_task$field = null;
		}

		public function get hasDoingChapterTask():Boolean {
			return doing_chapter_task$field != null;
		}

		public function set doingChapterTask(value:app.message.ChapterTaskProto):void {
			doing_chapter_task$field = value;
		}

		public function get doingChapterTask():app.message.ChapterTaskProto {
			return doing_chapter_task$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_SWALLOWED_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskModuleObjProto.chance_task_swallowed_count", "chanceTaskSwallowedCount", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_swallowed_count$field:int;

		private var hasField$0:uint = 0;

		public function clearChanceTaskSwallowedCount():void {
			hasField$0 &= 0xfffffffe;
			chance_task_swallowed_count$field = new int();
		}

		public function get hasChanceTaskSwallowedCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set chanceTaskSwallowedCount(value:int):void {
			hasField$0 |= 0x1;
			chance_task_swallowed_count$field = value;
		}

		public function get chanceTaskSwallowedCount():int {
			return chance_task_swallowed_count$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_ACCEPTED_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskModuleObjProto.chance_task_accepted_count", "chanceTaskAcceptedCount", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chance_task_accepted_count$field:int;

		public function clearChanceTaskAcceptedCount():void {
			hasField$0 &= 0xfffffffd;
			chance_task_accepted_count$field = new int();
		}

		public function get hasChanceTaskAcceptedCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set chanceTaskAcceptedCount(value:int):void {
			hasField$0 |= 0x2;
			chance_task_accepted_count$field = value;
		}

		public function get chanceTaskAcceptedCount():int {
			return chance_task_accepted_count$field;
		}

		/**
		 *  @private
		 */
		public static const CHANCE_TASK_AUTO_COMPLETE_COUNT:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.TaskModuleObjProto.chance_task_auto_complete_count", "chanceTaskAutoCompleteCount", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var chanceTaskAutoCompleteCount:Array = [];

		/**
		 *  @private
		 */
		public static const CHANCE_TASK:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.TaskModuleObjProto.chance_task", "chanceTask", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ChanceTaskProto; });

		[ArrayElementType("app.message.ChanceTaskProto")]
		public var chanceTask:Array = [];

		/**
		 *  @private
		 */
		public static const DOING_DAILY_TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskModuleObjProto.doing_daily_task", "doingDailyTask", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.DailyTaskProto; });

		private var doing_daily_task$field:app.message.DailyTaskProto;

		public function clearDoingDailyTask():void {
			doing_daily_task$field = null;
		}

		public function get hasDoingDailyTask():Boolean {
			return doing_daily_task$field != null;
		}

		public function set doingDailyTask(value:app.message.DailyTaskProto):void {
			doing_daily_task$field = value;
		}

		public function get doingDailyTask():app.message.DailyTaskProto {
			return doing_daily_task$field;
		}

		/**
		 *  @private
		 */
		public static const BRANCH_TASK:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("app.message.TaskModuleObjProto.branch_task", "branchTask", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.BranchTaskProto; });

		[ArrayElementType("app.message.BranchTaskProto")]
		public var branchTask:Array = [];

		/**
		 *  @private
		 */
		public static const TOU_JING_TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskModuleObjProto.tou_jing_task", "touJingTask", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TouJingTaskProto; });

		private var tou_jing_task$field:app.message.TouJingTaskProto;

		public function clearTouJingTask():void {
			tou_jing_task$field = null;
		}

		public function get hasTouJingTask():Boolean {
			return tou_jing_task$field != null;
		}

		public function set touJingTask(value:app.message.TouJingTaskProto):void {
			tou_jing_task$field = value;
		}

		public function get touJingTask():app.message.TouJingTaskProto {
			return tou_jing_task$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_JING_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskModuleObjProto.tou_jing_times", "touJingTimes", (32 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_jing_times$field:int;

		public function clearTouJingTimes():void {
			hasField$0 &= 0xfffffffb;
			tou_jing_times$field = new int();
		}

		public function get hasTouJingTimes():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set touJingTimes(value:int):void {
			hasField$0 |= 0x4;
			tou_jing_times$field = value;
		}

		public function get touJingTimes():int {
			return tou_jing_times$field;
		}

		/**
		 *  @private
		 */
		public static const MI_XIN_TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskModuleObjProto.mi_xin_task", "miXinTask", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.MiXinTaskProto; });

		private var mi_xin_task$field:app.message.MiXinTaskProto;

		public function clearMiXinTask():void {
			mi_xin_task$field = null;
		}

		public function get hasMiXinTask():Boolean {
			return mi_xin_task$field != null;
		}

		public function set miXinTask(value:app.message.MiXinTaskProto):void {
			mi_xin_task$field = value;
		}

		public function get miXinTask():app.message.MiXinTaskProto {
			return mi_xin_task$field;
		}

		/**
		 *  @private
		 */
		public static const ACCEPT_MI_XIN_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskModuleObjProto.accept_mi_xin_times", "acceptMiXinTimes", (41 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accept_mi_xin_times$field:int;

		public function clearAcceptMiXinTimes():void {
			hasField$0 &= 0xfffffff7;
			accept_mi_xin_times$field = new int();
		}

		public function get hasAcceptMiXinTimes():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set acceptMiXinTimes(value:int):void {
			hasField$0 |= 0x8;
			accept_mi_xin_times$field = value;
		}

		public function get acceptMiXinTimes():int {
			return accept_mi_xin_times$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_ZHU_TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.TaskModuleObjProto.tou_zhu_task", "touZhuTask", (50 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TouZhuTaskProto; });

		private var tou_zhu_task$field:app.message.TouZhuTaskProto;

		public function clearTouZhuTask():void {
			tou_zhu_task$field = null;
		}

		public function get hasTouZhuTask():Boolean {
			return tou_zhu_task$field != null;
		}

		public function set touZhuTask(value:app.message.TouZhuTaskProto):void {
			tou_zhu_task$field = value;
		}

		public function get touZhuTask():app.message.TouZhuTaskProto {
			return tou_zhu_task$field;
		}

		/**
		 *  @private
		 */
		public static const TOU_ZHU_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.TaskModuleObjProto.tou_zhu_times", "touZhuTimes", (51 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tou_zhu_times$field:int;

		public function clearTouZhuTimes():void {
			hasField$0 &= 0xffffffef;
			tou_zhu_times$field = new int();
		}

		public function get hasTouZhuTimes():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set touZhuTimes(value:int):void {
			hasField$0 |= 0x10;
			tou_zhu_times$field = value;
		}

		public function get touZhuTimes():int {
			return tou_zhu_times$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDoingChapterTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, doing_chapter_task$field);
			}
			if (hasChanceTaskSwallowedCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chance_task_swallowed_count$field);
			}
			if (hasChanceTaskAcceptedCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chance_task_accepted_count$field);
			}
			for (var chanceTaskAutoCompleteCount$index:uint = 0; chanceTaskAutoCompleteCount$index < this.chanceTaskAutoCompleteCount.length; ++chanceTaskAutoCompleteCount$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.chanceTaskAutoCompleteCount[chanceTaskAutoCompleteCount$index]);
			}
			for (var chanceTask$index:uint = 0; chanceTask$index < this.chanceTask.length; ++chanceTask$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.chanceTask[chanceTask$index]);
			}
			if (hasDoingDailyTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, doing_daily_task$field);
			}
			for (var branchTask$index:uint = 0; branchTask$index < this.branchTask.length; ++branchTask$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.branchTask[branchTask$index]);
			}
			if (hasTouJingTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, tou_jing_task$field);
			}
			if (hasTouJingTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 32);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tou_jing_times$field);
			}
			if (hasMiXinTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mi_xin_task$field);
			}
			if (hasAcceptMiXinTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 41);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, accept_mi_xin_times$field);
			}
			if (hasTouZhuTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 50);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, tou_zhu_task$field);
			}
			if (hasTouZhuTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 51);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tou_zhu_times$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var doing_chapter_task$count:uint = 0;
			var chance_task_swallowed_count$count:uint = 0;
			var chance_task_accepted_count$count:uint = 0;
			var doing_daily_task$count:uint = 0;
			var tou_jing_task$count:uint = 0;
			var tou_jing_times$count:uint = 0;
			var mi_xin_task$count:uint = 0;
			var accept_mi_xin_times$count:uint = 0;
			var tou_zhu_task$count:uint = 0;
			var tou_zhu_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (doing_chapter_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.doingChapterTask cannot be set twice.');
					}
					++doing_chapter_task$count;
					this.doingChapterTask = new app.message.ChapterTaskProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.doingChapterTask);
					break;
				case 11:
					if (chance_task_swallowed_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.chanceTaskSwallowedCount cannot be set twice.');
					}
					++chance_task_swallowed_count$count;
					this.chanceTaskSwallowedCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (chance_task_accepted_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.chanceTaskAcceptedCount cannot be set twice.');
					}
					++chance_task_accepted_count$count;
					this.chanceTaskAcceptedCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.chanceTaskAutoCompleteCount);
						break;
					}
					this.chanceTaskAutoCompleteCount.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 14:
					this.chanceTask.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.ChanceTaskProto()));
					break;
				case 21:
					if (doing_daily_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.doingDailyTask cannot be set twice.');
					}
					++doing_daily_task$count;
					this.doingDailyTask = new app.message.DailyTaskProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.doingDailyTask);
					break;
				case 22:
					this.branchTask.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new app.message.BranchTaskProto()));
					break;
				case 31:
					if (tou_jing_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.touJingTask cannot be set twice.');
					}
					++tou_jing_task$count;
					this.touJingTask = new app.message.TouJingTaskProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.touJingTask);
					break;
				case 32:
					if (tou_jing_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.touJingTimes cannot be set twice.');
					}
					++tou_jing_times$count;
					this.touJingTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 40:
					if (mi_xin_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.miXinTask cannot be set twice.');
					}
					++mi_xin_task$count;
					this.miXinTask = new app.message.MiXinTaskProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.miXinTask);
					break;
				case 41:
					if (accept_mi_xin_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.acceptMiXinTimes cannot be set twice.');
					}
					++accept_mi_xin_times$count;
					this.acceptMiXinTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 50:
					if (tou_zhu_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.touZhuTask cannot be set twice.');
					}
					++tou_zhu_task$count;
					this.touZhuTask = new app.message.TouZhuTaskProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.touZhuTask);
					break;
				case 51:
					if (tou_zhu_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskModuleObjProto.touZhuTimes cannot be set twice.');
					}
					++tou_zhu_times$count;
					this.touZhuTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
