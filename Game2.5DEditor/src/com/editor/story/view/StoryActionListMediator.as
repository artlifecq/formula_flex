package com.editor.story.view
{
	import com.editor.story.controller.StoryController;
	import com.editor.story.controller.StoryPreviewController;
	import com.editor.story.data.StoryProxy;
	import com.editor.story.data.vo.StoryActionCameraRoleVO;
	import com.editor.story.data.vo.StoryActionCameraVO;
	import com.editor.story.data.vo.StoryActionEffectCreateVO;
	import com.editor.story.data.vo.StoryActionEffectRemoveVO;
	import com.editor.story.data.vo.StoryActionEffectTypeVO;
	import com.editor.story.data.vo.StoryActionRoleCreateVO;
	import com.editor.story.data.vo.StoryActionRoleDoActionVO;
	import com.editor.story.data.vo.StoryActionRoleFaceToVO;
	import com.editor.story.data.vo.StoryActionRoleHideVO;
	import com.editor.story.data.vo.StoryActionRoleRemoveVO;
	import com.editor.story.data.vo.StoryActionRoleTypeVO;
	import com.editor.story.data.vo.StoryActionRoleWalkVO;
	import com.editor.story.data.vo.StoryActionRoleZoomVO;
	import com.editor.story.data.vo.StoryActionTextVO;
	import com.editor.story.data.vo.StoryActionVO;
	import com.editor.story.enum.StoryActionTypeEnum;
	import com.editor.story.enum.StoryTargetTypeEnum;
	import com.editor.story.enum.StoryTypeEnum;
	import com.editor.story.event.StoryEvent;
	import com.editor.story.view.component.ActionBarView;
	import com.editor.story.view.component.ActionInfoItemView;
	import com.editor.story.view.component.StoryActionListWindow;
	import com.editor.story.view.component.TimeLineTab;
	import com.editor.story.view.timeline.TimeSlider;

	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.events.CloseEvent;

	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	public class StoryActionListMediator
	{
		private var _view : StoryActionListWindow;
		private var _timeline : TimeSlider;
		private var _timeLineTab : TimeLineTab;

		private var _actionBarArr : Array = [];
		private var _timeLineTabTips : HashMap = new HashMap();

		public function get view() : StoryActionListWindow
		{
			return _view;
		}

		public function StoryActionListMediator($view : StoryActionListWindow)
		{
			_view = $view;
			updatePreviewBtn();
			createTimeline();
			updateActionList();
			_view.addEventListener(CloseEvent.CLOSE, closeHandler);
			_view.btn_add.addEventListener(MouseEvent.CLICK, btnAddClickHandler);
			_view.btn_edit.addEventListener(MouseEvent.CLICK, btnEditClickHandler);
			_view.btn_del.addEventListener(MouseEvent.CLICK, btnDelClickHandler);
			_view.btn_preview.addEventListener(MouseEvent.CLICK, btnPreviewClickHandler);
			_timeline.addEventListener(Event.CHANGE, timeLineChangedHandler);
			_view.scroller.horizontalScrollBar.addEventListener(Event.CHANGE, scrollBarChangedHandler);
			_view.scroller.verticalScrollBar.addEventListener(Event.CHANGE, verticalScrollBarChanged);
			EventManager.addEvent(StoryEvent.STORY_ACTION_CREATED, actionCreatedHandler);
			EventManager.addEvent(StoryEvent.STORY_ACTION_DELETED, actionDeletedHandler);
			EventManager.addEvent(StoryEvent.STORY_EDITING_CHANGED, updateActionList);
			EventManager.addEvent(StoryEvent.STORY_EVENT_EDITING_CHANGED, updateActionList);
			EventManager.addEvent(StoryEvent.STORY_ACTION_EDITED, updateActionList);
			EventManager.addEvent(StoryEvent.STORY_UPDATE_TIME, updateCurTime);
		}

		public function dispose() : void
		{
			_view.removeEventListener(CloseEvent.CLOSE, closeHandler);
			_view.btn_add.removeEventListener(MouseEvent.CLICK, btnAddClickHandler);
			_view.btn_edit.removeEventListener(MouseEvent.CLICK, btnEditClickHandler);
			_view.btn_del.removeEventListener(MouseEvent.CLICK, btnDelClickHandler);
			_timeline.removeEventListener(Event.CHANGE, timeLineChangedHandler);
			_view.scroller.horizontalScrollBar.removeEventListener(Event.CHANGE, scrollBarChangedHandler);
			_view.scroller.verticalScrollBar.removeEventListener(Event.CHANGE, verticalScrollBarChanged);
			EventManager.removeEvent(StoryEvent.STORY_ACTION_CREATED, actionCreatedHandler);
			EventManager.removeEvent(StoryEvent.STORY_ACTION_DELETED, actionDeletedHandler);
			EventManager.removeEvent(StoryEvent.STORY_EDITING_CHANGED, updateActionList);
			EventManager.removeEvent(StoryEvent.STORY_EVENT_EDITING_CHANGED, updateActionList);
			EventManager.removeEvent(StoryEvent.STORY_ACTION_EDITED, updateActionList);
			EventManager.removeEvent(StoryEvent.STORY_UPDATE_TIME, updateCurTime);
			_view = null;
			_timeline = null;
		}

		private function updatePreviewBtn() : void
		{
			_view.btn_preview.visible = (StoryProxy.currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION);
		}

		private function createTimeline() : void
		{
			_timeline = new TimeSlider();
			_timeline.duration = 60000;
			_timeline.width = 1080;
			_timeline.height = 230;
			_timeline.mode = TimeSlider.TIME_MODE;
			_timeline.startTime = 0;
			_timeline.endTime = 10000;
			_timeline.frameRate = 60;
			_timeline.y = 30;
			_timeline.x = 100;
			_view.addElement(_timeline);
			var wholeWidth : int = _timeline.duration / (_timeline.endTime - _timeline.startTime) * _timeline.width;
			_view.scrollerContainner.width = wholeWidth;
			StoryProxy.timelineTime = 0;

			_timeLineTab = new TimeLineTab();
			_view.addElement(_timeLineTab);

		}

		private function timeLineChangedHandler(event : Event) : void
		{
			StoryProxy.timelineTime = _timeline.time;
			_view.scroller.horizontalScrollBar.value = (_timeline.startTime / _timeline.duration) * _view.scrollerContainner.width;
		}

		private function scrollBarChangedHandler(event : Event) : void
		{
			var showTimeTotal : int = _timeline.endTime - _timeline.startTime;
			_timeline.startTime = (_view.scroller.horizontalScrollBar.value / _view.scroller.horizontalScrollBar.maximum) * (_timeline.duration - showTimeTotal);
			_timeline.endTime = _timeline.startTime + showTimeTotal;
		}

		/**
		 * 竖向滚动
		 * @author 杨剑明	  2015-11-25
		 */
		private function verticalScrollBarChanged(event : Event) : void
		{
			if (_view.scroller.verticalScrollBar.maximum == 0)
			{
				return;
			}
			_timeLineTab.tab_group.y = -(_timeLineTab.tab_group.height - _view.scroller.height + 15) * (_view.scroller.verticalScrollBar.value / _view.scroller.verticalScrollBar.maximum) + _timeLineTab.container.height;
		}

		/**
		 * 更新当前时间
		 * @author 杨剑明	  2015-11-26
		 */
		private function updateCurTime(time : int) : void
		{
			_timeLineTab.setCurTime(time);
			var showTimeTotal : int = _timeline.endTime - _timeline.startTime;
			_timeline.startTime = time;
			_timeline.endTime = _timeline.startTime + showTimeTotal;
		}

		private function updateActionList(... args) : void
		{
			if (_view.stage)
			{
				_actionBarArr = [];
				_view.scrollerContainner.removeAllElements();
				_timeLineTab.removeAllTab();
				StoryProxy.currentEditingActionID = -1;
				var actionArr : Array = StoryProxy.currentEditingActionArr;
				actionArr.sort(sortActionList);
				var len : int = actionArr.length;
				var endTime : int = 0;
				for (var i : int = 0; i < len; i++)
				{
					var actionVO : StoryActionVO = actionArr[i];
					addActionItem(actionVO);
					endTime = Math.max(endTime, actionVO.startTime + actionVO.totalTime);
				}
				_timeLineTab.setMaxTime(endTime);
				updateCurTime(0);
			}
		}

		private function sortActionList(vo1 : StoryActionVO, vo2 : StoryActionVO) : int
		{
			if (vo1 is StoryActionCameraVO)
			{
				return -1;
			}
			if (vo2 is StoryActionCameraVO)
			{
				return 1;
			}
			if (vo1 is StoryActionTextVO)
			{
				return -1;
			}
			if (vo2 is StoryActionTextVO)
			{
				return 1;
			}
			var roleVO1 : StoryActionRoleTypeVO = vo1 as StoryActionRoleTypeVO;
			var roleVO2 : StoryActionRoleTypeVO = vo2 as StoryActionRoleTypeVO;
			if (roleVO1 && roleVO2)
			{
				if (roleVO1.roleID < roleVO2.roleID)
				{
					return -1;
				}
			}
			var effectVO1 : StoryActionEffectTypeVO = vo1 as StoryActionEffectTypeVO;
			var effectVO2 : StoryActionEffectTypeVO = vo2 as StoryActionEffectTypeVO;
			if (effectVO1 && effectVO2)
			{
				if (effectVO1.effectID < effectVO2.effectID)
				{
					return -1;
				}
			}
			if (vo1 is StoryActionRoleTypeVO)
			{
				return -1;
			}
			if (vo2 is StoryActionRoleTypeVO)
			{
				return 1;
			}
			if (vo1 is StoryActionEffectTypeVO)
			{
				return -1;
			}
			if (vo2 is StoryActionEffectTypeVO)
			{
				return 1;
			}
			return 1;
		}

		private function addActionItem(actionVO : StoryActionVO) : void
		{
			var targetID : int;
			var actionBarView : ActionBarView;
			var storyTargetType : int = StoryProxy.getTargetTypeByActionType(actionVO.actionType);
			switch (storyTargetType)
			{
				case StoryTargetTypeEnum.CAMERA:
					targetID = 0;
					break;
				case StoryTargetTypeEnum.ROLE:
					var roleTypeActionVO : StoryActionRoleTypeVO = actionVO as StoryActionRoleTypeVO;
					targetID = roleTypeActionVO.roleID;
					break;
				case StoryTargetTypeEnum.EFFECT:
					var effectTypeActionVO : StoryActionEffectTypeVO = actionVO as StoryActionEffectTypeVO;
					targetID = effectTypeActionVO.effectID;
					break;
			}
			actionBarView = getActionBar(storyTargetType, targetID);
			if (actionBarView == null)
			{
				actionBarView = new ActionBarView();
				actionBarView.targetType = storyTargetType;
				actionBarView.targetID = targetID;
				actionBarView.tabType = actionVO.actionType;
				_actionBarArr.push(actionBarView);
			}
			var actionTypeStr : String = StoryProxy.getActionTypeName(actionVO.actionType);
			var actionItemView : ActionInfoItemView = new ActionInfoItemView();
			actionItemView.actionID = actionVO.actionID;
			updateActionLabel(actionVO, actionItemView);
			actionItemView.x = (actionVO.startTime / _timeline.duration) * _view.scrollerContainner.width + _timeline.x - _timeLineTab.width;
			actionItemView.width = Math.max((actionVO.totalTime / _timeline.duration) * _view.scrollerContainner.width, 5);
			actionItemView.addEventListener(MouseEvent.CLICK, actionItemClickHandler);
			actionBarView.addElementAt(actionItemView, 1);

			setResPath(actionVO, storyTargetType);
			actionBarView.resPath = _timeLineTabTips.getValue(storyTargetType);
			addActionBar();
		}

		/**
		 * 标签tips
		 * @author 杨剑明	  2015-11-26
		 */
		private function setResPath(actionVO : StoryActionVO, storyTargetType : int) : void
		{
			var path : String;
			switch (actionVO.actionType)
			{
				case StoryActionTypeEnum.CREATE_ROLE:
					path = (actionVO as StoryActionRoleCreateVO).bodyRes;
					break;
				case StoryActionTypeEnum.EFFECT_CREATE:
					path = (actionVO as StoryActionEffectCreateVO).res;
					break;
				case StoryActionTypeEnum.ADD_CAMERA_ROLE:
					path = (actionVO as StoryActionCameraRoleVO).bodyRes;
					break;
				default:
					break;
			}
			if (path)
			{
				_timeLineTabTips.add(storyTargetType, path);
			}
		}

		/**
		 * @author 杨剑明	  2015-11-23
		 */
		private function addActionBar() : void
		{
			_actionBarArr.sortOn(["targetType", "targetID"], [Array.NUMERIC, Array.NUMERIC]);
			_view.scrollerContainner.removeAllElements();
			_timeLineTab.removeAllTab();
			for (var index : int = 0; index < _actionBarArr.length; index++)
			{
				var actionBarView : ActionBarView = _actionBarArr[index];
				_view.scrollerContainner.addElement(actionBarView);
				var actionItemView : ActionInfoItemView = actionBarView.getChildAt(0) as ActionInfoItemView;
				_timeLineTab.createTab(index, actionItemView.label, actionBarView.resPath);
			}

		}

		private function updateActionLabel(actionVO : StoryActionVO, actionItemView : ActionInfoItemView) : void
		{
			var actionTypeStr : String = StoryProxy.getActionTypeName(actionVO.actionType);
			switch (actionVO.actionType)
			{
				case StoryActionTypeEnum.CREATE_ROLE:
					updateActionLabelCreateRole(actionVO as StoryActionRoleCreateVO, actionItemView);
					break;
				case StoryActionTypeEnum.EFFECT_CREATE:
					updateActionLabelCreateEffect(actionVO as StoryActionEffectCreateVO, actionItemView);
					break;
				case StoryActionTypeEnum.EFFECT_REMOVE:
					updateActionLabelRemoveEffect(actionVO as StoryActionEffectRemoveVO, actionItemView);
					break;
				case StoryActionTypeEnum.REMOVE_ROLE:
					updateActionLabelRemoveRole(actionVO as StoryActionRoleRemoveVO, actionItemView);
					break;
				case StoryActionTypeEnum.ROLE_DO_ACTION:
					updateActionLabelDoAction(actionVO as StoryActionRoleDoActionVO, actionItemView);
					break;
				case StoryActionTypeEnum.ROLE_WALK:
					updateActionLabelWalk(actionVO as StoryActionRoleWalkVO, actionItemView);
					break;
				case StoryActionTypeEnum.HIDE_ROLE:
					updateActionLabelHideRole(actionVO as StoryActionRoleHideVO, actionItemView);
					break;
				default:
					actionItemView.label = actionTypeStr + ":" + actionVO.desc;
			}
		}

		private function updateActionLabelRemoveEffect(actionVO : StoryActionEffectRemoveVO, actionItemView : ActionInfoItemView) : void
		{
			actionItemView.label = "移除e" + actionVO.effectID + ":" + actionVO.desc;
		}

		private function updateActionLabelCreateEffect(actionVO : StoryActionEffectCreateVO, actionItemView : ActionInfoItemView) : void
		{
			actionItemView.label = "添加e" + actionVO.effectID + ":" + actionVO.desc;
		}

		private function updateActionLabelCreateRole(actionVO : StoryActionRoleCreateVO, actionItemView : ActionInfoItemView) : void
		{
			actionItemView.label = "创建r" + actionVO.roleID + ":" + actionVO.desc;
		}

		private function updateActionLabelRemoveRole(actionVO : StoryActionRoleRemoveVO, actionItemView : ActionInfoItemView) : void
		{
			actionItemView.label = "移除r" + actionVO.roleID + ":" + actionVO.desc;
		}

		private function updateActionLabelDoAction(actionVO : StoryActionRoleDoActionVO, actionItemView : ActionInfoItemView) : void
		{
			actionItemView.label = "做动作r" + actionVO.roleID + ":" + actionVO.desc;
		}

		private function updateActionLabelWalk(actionVO : StoryActionRoleWalkVO, actionItemView : ActionInfoItemView) : void
		{
			actionItemView.label = "行走r" + actionVO.roleID + ":" + actionVO.desc;
		}

		private function updateActionLabelHideRole(actionVO : StoryActionRoleHideVO, actionItemView : ActionInfoItemView) : void
		{
			actionItemView.label = "隐藏r" + actionVO.roleID + ":" + actionVO.desc;
		}

		private function getActionBar(targetTpye : int, targetID : int) : ActionBarView
		{
			var bar : ActionBarView;
			var len : int = _view.scrollerContainner.numElements;
			for (var i : int = 0; i < len; i++)
			{
				bar = _view.scrollerContainner.getElementAt(i) as ActionBarView;
				if (bar.targetType == targetTpye && bar.targetID == targetID)
				{
					return bar;
				}
			}
			return null;
		}

		protected function actionItemClickHandler(event : MouseEvent) : void
		{
			var item : ActionInfoItemView;
			var bar : ActionBarView;
			var len : int = _view.scrollerContainner.numElements;
			for (var i : int = 0; i < len; i++)
			{
				bar = _view.scrollerContainner.getElementAt(i) as ActionBarView;
				var lenItem : int = bar.numElements;
				for (var j : int = 0; j < lenItem; j++)
				{
					item = bar.getElementAt(j) as ActionInfoItemView;
					if (item)
					{
						var isSelected : Boolean = (item == event.currentTarget);
						item.selected = isSelected;
//						bar.selected = isSelected;
						if (isSelected)
						{
							StoryProxy.currentEditingActionID = item.actionID;
						}
					}
				}
			}
			showCurrentAction();
			StoryController.closeCreateStoryActionPanel();
		}

		private function showCurrentAction() : void
		{
			var actionVO : StoryActionVO = StoryProxy.currentEditingActionVO;
			var storyTargetType : int = StoryProxy.getTargetTypeByActionType(actionVO.actionType);
			switch (actionVO.actionType)
			{
				case StoryActionTypeEnum.CAMERA:
					StoryPreviewController.showCameraAction(actionVO as StoryActionCameraVO);
					break;
				case StoryActionTypeEnum.CREATE_ROLE:
					StoryPreviewController.showCreateRoleAction(actionVO as StoryActionRoleCreateVO);
					break;
				case StoryActionTypeEnum.REMOVE_ROLE:
					StoryPreviewController.showRemoveRoleAction(actionVO as StoryActionRoleRemoveVO);
					break;
				case StoryActionTypeEnum.ROLE_WALK:
					StoryPreviewController.showRoleWalkAction(actionVO as StoryActionRoleWalkVO);
					break;
				case StoryActionTypeEnum.ROLE_DO_ACTION:
					StoryPreviewController.showRoleDoActionAction(actionVO as StoryActionRoleDoActionVO);
					break;
				case StoryActionTypeEnum.ROLE_FACE_TO:
					StoryPreviewController.showRoleFaceToAction(actionVO as StoryActionRoleFaceToVO);
					break;
				case StoryActionTypeEnum.ROLE_ZOOM:
					StoryPreviewController.showRoleZoomAction(actionVO as StoryActionRoleZoomVO);
					break;
				case StoryActionTypeEnum.TEXT_1:
					StoryPreviewController.showTextValue(actionVO as StoryActionTextVO);
					break;
				case StoryActionTypeEnum.EFFECT_CREATE:
					StoryPreviewController.showEffectCreateAction(actionVO as StoryActionEffectCreateVO);
					break;
				case StoryActionTypeEnum.EFFECT_REMOVE:
					StoryPreviewController.showEffectRemoveAction(actionVO as StoryActionEffectRemoveVO);
					break;
				case StoryActionTypeEnum.END:

					break;
			}
		}

		private function actionDeletedHandler(id : int) : void
		{
			updateActionList();
		}

		private function actionCreatedHandler(actionVO : StoryActionVO) : void
		{
			if (_view.stage)
			{
				updateActionList();
			}
		}

		private function btnPreviewClickHandler(event : MouseEvent) : void
		{
			if (StoryProxy.currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION)
			{
//				StoryController.closeStoryActionListWindow();
				StoryPreviewController.preview();
			}
		}

		private function btnDelClickHandler(event : MouseEvent) : void
		{
			if (StoryProxy.currentEditingActionID < 0)
			{
				return;
			}
			var id : int = StoryProxy.currentEditingActionID;
			StoryProxy.removeStoryAction(id);
		}

		private function btnEditClickHandler(event : MouseEvent) : void
		{
			if (StoryProxy.currentEditingActionID < 0)
			{
				return;
			}
			StoryController.openCreateStoryActionPanel(true);
		}

		private function btnAddClickHandler(event : MouseEvent) : void
		{
			StoryController.openCreateStoryActionPanel();
		}

		protected function closeHandler(event : CloseEvent) : void
		{
			StoryController.closeStoryActionListWindow();
		}

	}
}
