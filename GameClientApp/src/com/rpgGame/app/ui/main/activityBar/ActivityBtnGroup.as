package com.rpgGame.app.ui.main.activityBar
{
	import com.rpgGame.app.utils.TimeData;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.coreData.type.activity.ActivityOpenStateType;

	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;

	/**
	 *
	 * 活动按钮组
	 * @author L.L.M.Sunny
	 * 创建时间：2016-09-05 下午3:05:12
	 *
	 */
	public class ActivityBtnGroup
	{
		private var _activityType : int;
		private var _openTimeData : TimeData;
		private var _group : Group;
		private var _button : Button;
		private var _label : Label;

		private var _onClickButton : Function;
		private var _duration : int;
		private var _openTimeAdvance : int;
		private var _opened : Boolean;
		private var _openTime : Number;

		/**
		 *
		 * @param group
		 * @param button
		 * @param label
		 * @param onClickButton
		 * @param openTime
		 * @param duration
		 * @param openTimeLimit 开启倒计时距离
		 *
		 */
		public function ActivityBtnGroup(activityType : int, group : Group, button : Button, label : Label, onClickButton : Function, openTime : String = null, duration : int = 0, openTimeAdvance : int = 0)
		{
			_activityType = activityType;
			_group = group;
			_button = button;
			_label = label;
			_onClickButton = onClickButton;
			_group.visible = false;
			_opened = false;
			_openTime = 0;
			if (openTime)
				_openTimeData = new TimeData(openTime);
			_duration = duration;
			_openTimeAdvance = openTimeAdvance;
		}

		public function get activityType() : int
		{
			return _activityType;
		}

		public function get label() : Label
		{
			return _label;
		}

		public function get button() : Button
		{
			return _button;
		}

		public function get group() : Group
		{
			return _group;
		}

		public function clickButton() : void
		{
			if (_onClickButton != null)
			{
				_onClickButton(this);
			}
		}

		public function open(openTime : Number = 0) : void
		{
			if (_opened)
				return;
			_openTime = openTime;
			_opened = true;
			_group.visible = true;
		}

		public function close() : void
		{
			if (!_opened)
				return;
			_opened = false;
			_group.visible = false;
		}

		public function updateTime(currTime : Number) : int
		{
			if (_openTimeData)
			{
				var currOpenTime : Number = _openTime > 0 ? _openTime : _openTimeData.getNextTime().time;
				var time : int = (currOpenTime - currTime) * 0.001;
				var durationTime : int = _duration * 0.001;
				if (time > 0) //准备开启
				{
					if (time - _openTimeAdvance <= 0)
					{
						_label.text = TimeUtil.timeFormatCH(time, 3) + "开启";
						return ActivityOpenStateType.OPEN_COUNTDOWN;
					}
					else
					{
						_openTime = 0;
						_label.text = "";
						return ActivityOpenStateType.CLOSE;
					}
				}
				else if (-time < durationTime) //准备关闭
				{
					_label.text = TimeUtil.timeFormatCH(durationTime + time, 3) + "结束";
					return ActivityOpenStateType.CLOSE_COUNTDOWN;
				}
				else
				{
					_openTime = 0;
					_label.text = "";
					return ActivityOpenStateType.CLOSE;
				}
			}
			else
			{
				_openTime = 0;
				_label.text = "";
				return ActivityOpenStateType.OPEN;
			}
		}
	}
}
