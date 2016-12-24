package com.rpgGame.app.ui.main.task
{
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.YuMaQiShouManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.task.TaskInfo;
	import com.rpgGame.coreData.lang.LangStoryDungeon;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TaskType;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.task.TaskBarSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	public class TaskBar extends SkinUI
	{
		private var taskSkin : TaskBarSkin;

		private var _isShowTask : Boolean;
		private var taskSprite : Sprite;

		private var mainList : TaskMainShowList;
		private var _completeTaskEffect : InterObject3D;

		public function TaskBar()
		{
			taskSkin = new TaskBarSkin();
			super(taskSkin);

			initBar();
		}

		private function initBar() : void
		{
			taskSprite = new Sprite();
			addChild(taskSprite);

			addChild(taskSkin.btnBig);
			addChild(taskSkin.btnSmall);
			addChild(taskSkin.leaveBtn);

			mainList = new TaskMainShowList();
			taskSprite.addChild(mainList);

			isShowTask = true;
			updateTask();
			EventManager.addEvent(TaskEvent.TASK_UPDATE_NEW_TASK, onUpdateTask);
		}

		private function onUpdateTask() : void
		{
			updateTask();
		}

		private function updateTask() : void
		{
			var taskInfo : TaskInfo = TaskManager.currentMainTaskInfo;
			if (taskInfo != null)
			{
				switch (taskInfo.type)
				{
					case TaskType.TASK_TYPE_MAIN_LINE:
						taskSkin.leaveBtn.visible = false;
						break;
					case TaskType.TASK_TYPE_STORY_DUNGEON:
						taskSkin.leaveBtn.visible = true;
						break;
					default:
						taskSkin.leaveBtn.visible = false;
				}
			}
			else
			{
				taskSkin.leaveBtn.visible = false;
			}
		}

		private function showCompleteTaskEffect() : void
		{
			hideCompleteTaskEffect();
			if (!_completeTaskEffect)
			{
				_completeTaskEffect = playInter3DAt(ClientConfig.getEffect(EffectUrl.COMPLETE_TASK_EFFECT), 0, 0, 1, onCompleteTaskEffectComplete);
				_completeTaskEffect.x = 95;
				_completeTaskEffect.y = 75;
			}
		}

		private function onCompleteTaskEffectComplete(self : InterObject3D) : void
		{
			hideCompleteTaskEffect();
		}

		private function hideCompleteTaskEffect() : void
		{
			if (_completeTaskEffect)
			{
				removeChild3D(_completeTaskEffect);
				_completeTaskEffect = null;
			}
		}

		public function resize(sWidth : int, sHeight : int) : void
		{
			x = sWidth - taskSkin.width;
			y = int((sHeight - taskSkin.height) * 0.5);
		}

		//--------------------------------------

		override protected function onTouchTarget(target : DisplayObject) : void
		{
			if( YuMaQiShouManager.isInBiMaWenActivity() || YuMaQiShouManager.isInYuMaChangScene() )//在御马场不需要主线任务
			{
				taskSprite.visible = false;
				return;
			}
			
			switch (target)
			{
				case taskSkin.btnBig:
					isShowTask = true;
					break;

				case taskSkin.btnSmall:
					isShowTask = false;
					break;

				case taskSkin.leaveBtn:
					var taskInfo : TaskInfo = TaskManager.currentMainTaskInfo;
					if (taskInfo != null)
					{
						switch (taskInfo.type)
						{
							case TaskType.TASK_TYPE_STORY_DUNGEON:
								GameAlert.showAlertUtil(LangStoryDungeon.STORY_DUNGEON_LEAVE_ALERT_INFO, onLeaveAlertCallback);
								break;
						}
					}
					break;
			}
		}

		private function onLeaveAlertCallback(gameAlert : GameAlert) : void
		{
			if (gameAlert.clickType == AlertClickTypeEnum.TYPE_SURE)
			{
				var taskInfo : TaskInfo = TaskManager.currentMainTaskInfo;
				if (taskInfo != null)
				{
					switch (taskInfo.type)
					{
						case TaskType.TASK_TYPE_STORY_DUNGEON:
//							SceneSender.requestLeaveDungeon();
							break;
					}
				}
			}
		}

		public function get isShowTask() : Boolean
		{
			return _isShowTask;
		}

		public function set isShowTask(value : Boolean) : void
		{
			_isShowTask = value;

			taskSkin.btnBig.visible = !_isShowTask;
			taskSkin.btnSmall.visible = _isShowTask;

			taskSprite.visible = _isShowTask;
		}

		private function onCompleteTask(taskId : int) : void
		{
			showCompleteTaskEffect();
		}

		override protected function onShow() : void
		{
			super.onShow();
			EventManager.addEvent(TaskEvent.TASK_STORY_COMPLETE_TASK, onCompleteTask);
		}

		override protected function onHide() : void
		{
			super.onHide();
			EventManager.removeEvent(TaskEvent.TASK_STORY_COMPLETE_TASK, onCompleteTask);
			hideCompleteTaskEffect();
		}
		
		public function onShow():void
		{
			taskSprite.visible = true;
		}
		
		public function onHide():void
		{
			taskSprite.visible = false;
		}
	}
}
