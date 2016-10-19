package com.rpgGame.app.ui.main.task
{
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.task.TaskCfgData;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.task.TaskChapterInfo;
	import com.rpgGame.coreData.info.task.TaskInfo;
	import com.rpgGame.coreData.info.task.target.BaseTaskTargetInfo;
	import com.rpgGame.coreData.type.TaskTargetType;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.coreData.utils.ColorUtils;

	import flash.text.TextFormat;

	import feathers.controls.Label;
	import feathers.controls.UIAsset;

	import org.client.mainCore.manager.EventManager;

	import starling.display.Sprite;
	import starling.text.TextFieldAutoSize;

	import utils.StringUtil;

	/**
	 * 主线任务列表
	 * @author luguozheng
	 *
	 */
	public class TaskMainLineList extends Sprite
	{
		private static const MAX_WIDTH : int = 220;

		private var oldTaskIsReply : Boolean = false;

		/**章节名字**/
		private var _chapterNameText : Label;
		/**任务名字**/
		private var _taskNameText : Label;
		/**任务类型的图标**/
		private var _taskIco : UIAsset;
		/**任务描述**/
		private var _taskInfoText : Label;
		/**击杀目标**/
		private var _taskTargetText : RichTextArea3D;
		/**任务物品奖励列表**/
		private var prizeList : TaskPrizeList;

		public function TaskMainLineList()
		{
			init();
		}

		/**
		 * 初始化
		 *
		 */
		private function init() : void
		{
			_chapterNameText = new Label();
			_chapterNameText.width = MAX_WIDTH;
			_chapterNameText.height = 25;
			_chapterNameText.color = StaticValue.COLOR_CODE_16;
			_chapterNameText.fontSize = 16;
			_chapterNameText.bold = true;
			_chapterNameText.autoSize = TextFieldAutoSize.HORIZONTAL;
			_chapterNameText.touchable = false;
			addChild(_chapterNameText);

			_taskIco = new UIAsset();
			addChild(_taskIco);
			_taskIco.touchable = false;

			_taskNameText = new Label();
			_taskNameText.width = MAX_WIDTH;
			_taskNameText.height = 25;
			_taskNameText.color = StaticValue.COLOR_CODE_1;
			_taskNameText.fontSize = 14;
			_taskNameText.bold = true;
			_taskNameText.autoSize = TextFieldAutoSize.HORIZONTAL;
			_taskNameText.touchable = false;
			addChild(_taskNameText);

			_taskInfoText = new Label();
			_taskInfoText.width = _taskInfoText.maxWidth = MAX_WIDTH;
			_taskInfoText.touchable = false;
			addChild(_taskInfoText);

			_taskTargetText = new RichTextArea3D(MAX_WIDTH, 60, ColorUtils.getDefaultStrokeFilter());
			_taskTargetText.multiline = true;
			_taskTargetText.wordWrap = true;
			addChild(_taskTargetText);

			prizeList = new TaskPrizeList();
			addChild(prizeList);

			var defaultFormat : TextFormat = new TextFormat();
			defaultFormat.color = StaticValue.COLOR_CODE_1;
			defaultFormat.size = 14;
			defaultFormat.font = "SimHei";
			_taskTargetText.defaultTextFormat = defaultFormat;

			_taskInfoText.setTextFormat(defaultFormat);

			_chapterNameText.nativeFilters = ColorUtils.getDefaultStrokeFilter();
			_taskNameText.nativeFilters = ColorUtils.getDefaultStrokeFilter();
			_taskInfoText.nativeFilters = ColorUtils.getDefaultStrokeFilter();

			setLabelPosition();

			updateTask();

			EventManager.addEvent(TaskEvent.TASK_STORY_ALL_CHAPTER_COMPLETED, onCompleteAllTask);
			EventManager.addEvent(TaskEvent.TASK_STORY_COMPLETE_TASK, onCompleteTask);
			EventManager.addEvent(TaskEvent.TASK_UPDATE_NEW_TASK, onUpdateTask);
			EventManager.addEvent(TaskEvent.TASK_TARGET_PROGRESS_UPDATED, updateProgress);
		}

		/**
		 * 完成剧情任务  带参数 当前完成的任务ID taskId:int
		 * @param taskID
		 *
		 */
		private function onCompleteTask(taskID : int) : void
		{
		/*if( !oldTaskIsReply )
		{
			prizeList.flyPrizeIco();
		}*/
		}

		/**
		 * 任务目标进度更新,携带一个数组，元素依次为任务id，目标索引
		 * @param taskArr
		 *
		 */
		private function updateProgress(taskArr : Array) : void
		{
			var taskId : int = taskArr[0];

			if (TaskManager.currentMainTaskInfo == null || taskId != TaskManager.currentMainTaskInfo.id)
				return;

			updateMainProgress(true);

			updatePosition();
		}

		/**
		 * 接受新剧情任务
		 *
		 */
		private function onUpdateTask() : void
		{
			updateTask();
		}

		/**
		 * 完成所有主线任务
		 *
		 */
		private function onCompleteAllTask() : void
		{
			this.visible = false;
			_chapterNameText.text = "";
			_taskNameText.text = "";
			_taskInfoText.htmlText = "";
			_taskTargetText.text = "";
			_taskIco.visible = false;
			prizeList.visible = false;
		}

		/**
		 * 界面Label布局
		 *
		 */
		private function setLabelPosition() : void
		{
			_chapterNameText.x = _chapterNameText.y = 0;

			_taskIco.x = 0;
			_taskIco.y = _chapterNameText.y + _chapterNameText.height + 5;

			_taskNameText.x = _taskIco.x + _taskIco.width + 35;
			_taskNameText.y = _chapterNameText.y + _chapterNameText.height + 5;

			_taskInfoText.x = 0
			_taskInfoText.y = _taskNameText.y + _taskNameText.height + 10;
		}

		/**
		 * 更新奖励位置、任务目标位置
		 *
		 */
		private function updatePosition() : void
		{
			_taskTargetText.y = _taskInfoText.y + _taskInfoText.textHeight + 10;

			prizeList.y = _taskTargetText.y + _taskTargetText.textHeight + 10;
		}

		/**
		 * 更新主线任务
		 *
		 */
		private function updateTask() : void
		{
			var taskInfo : TaskInfo = TaskManager.currentMainTaskInfo;
			if (taskInfo != null)
			{
				this.visible = true;
				var taskLineName : String;
				var chapterName : String;
				switch (taskInfo.type)
				{
					case TaskType.TASK_TYPE_MAIN_LINE:
						var currentChapterInfo : TaskChapterInfo = TaskManager.currentChapterInfo;
						if (currentChapterInfo != null)
						{
							chapterName = TaskCfgData.getStoryTaskChapterName(currentChapterInfo.order);
						}
						taskLineName = "主线";
						break;
					case TaskType.TASK_TYPE_STORY_DUNGEON:
						chapterName = MapDataManager.currentScene ? MapDataManager.currentScene.name : "未知";
						taskLineName = "剧情";
						break;
					default:
						chapterName = "未知";
						taskLineName = "未知";
				}

				_chapterNameText.text = chapterName;
				_taskNameText.text = LanguageConfig.replaceStr("[" + taskLineName + "] $", [taskInfo.dataInfo.name]);
				_taskInfoText.text = taskInfo.dataInfo.desc;
				_taskInfoText.isHtmlText = StringUtil.isHtmlChars(taskInfo.dataInfo.desc);

				updateMainProgress();
				prizeList.visible = true;
				prizeList.setData(taskInfo.dataInfo);

				var targeInfo : BaseTaskTargetInfo = taskInfo.dataInfo.getTargetInfoAt(0);
				if (targeInfo)
				{
					_taskIco.styleName = ClientConfig.getTaskIcon(targeInfo.type);
					oldTaskIsReply = (targeInfo.type == TaskTargetType.TASK_TARGET_REPLY_NPC);
					_taskIco.visible = true;
				}
			}
			else
			{
				onCompleteAllTask();
			}

			updatePosition();
		}

		/**
		 * 更新主线任务进度
		 * @param showTips
		 *
		 */
		private function updateMainProgress(showTips : Boolean = false) : void
		{
			var taskInfo : TaskInfo = TaskManager.currentMainTaskInfo;
			if (taskInfo == null)
				return;

			var _targetVec : Vector.<BaseTaskTargetInfo> = taskInfo.dataInfo.getAllTargetInfo();

			var targeInfo : BaseTaskTargetInfo;
			var len : int = _targetVec.length;
			var info : String = "";
			for (var i : int = 0; i < len; i++)
			{
				targeInfo = _targetVec[i];
				info += TaskUtil.progressUpdatedHandler(TaskTargetType.TASK_TYPE_FLY_CHAPTER, targeInfo, taskInfo.getProgressNumAt(i), taskInfo.id, true) + "<br/>";
				if (showTips)
				{
					TaskUtil.showProgressTip(targeInfo, taskInfo.getProgressNumAt(i));
				}
			}

			_taskTargetText.text = info;
		}


	}
}
