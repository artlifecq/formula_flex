package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.main.openActivity.comps.IActivityInter;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.utils.filter.GrayFilter;
	
	import starling.display.DisplayObject;

	/**
	 *活动显示对象，必须重写clearData 
	 * @author Administrator
	 * 
	 */	
	public class BaseActivityListItemCell extends SkinUI implements IActivityInter
	{
		protected var _data:ActivityVo;
		protected var _btnReward:Button;
		protected var _needGray:Boolean;
		private var _useText:Boolean;
		private var _setTouch:Boolean;
		public function BaseActivityListItemCell(skin:StateSkin=null,btn:Button=null,gray:Boolean=true,useText:Boolean=true,setT:Boolean=true)
		{
			super(skin);
			this._btnReward=btn;
			_needGray=gray;
			_useText=useText;
			_setTouch=setT
		}
		
		public function setData(info:ActivityVo):void
		{
			this._data=info;
			setBtnState(_btnReward,_data.status,_needGray,_useText,_setTouch);
		}
		
		public function get dis():DisplayObject
		{
			return this;
		}
		override protected function onHide():void
		{
			super.onHide();
			clearData();
		}
		public function clearData():void
		{
			this._data=null;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (_btnReward==target&&_data) 
			{
				if (_data.status==1) 
				{
					canGetReward();
				}
				if (_data.status==0) 
				{
					hasGetReward();
				}
				else
				{
					cannotGetReward();
				}
			}
		}
		protected function canGetReward():void
		{
			Mgr.activityPanelMgr.reqActivitiesGetRewardMsg(_data.activityId);
		}
		protected function cannotGetReward():void
		{
			
		}
		protected function hasGetReward():void
		{
			
		}
		/**
		 * 设置按钮状态
		 * @param btn
		 * @param state 0已经领取，1可领取， 2不可领取
		 * 
		 */		
		public static function setBtnState(btn:Button,state:int,gray:Boolean,useText:Boolean=true,setTouchable:Boolean=false):void
		{
			if (!btn) 
			{
				return;
			}
			btn.touchable=true;
			//
			if (state==0) 
			{
				if (useText) 
				{
					btn.label="已领取";
				}
				
				if (gray) 
				{
					GrayFilter.gray(btn);
				}
				if (setTouchable) 
				{
					btn.touchable=false;
				}
			}
			else if (state==1) 
			{
				if (useText) 
				{
					btn.label="领取";
				}
				if (gray) 
				{
					GrayFilter.unGray(btn);
				}
			}
			else if (state==2) 
			{
				if (useText) 
				{
					btn.label="未达成";
				}
				if (gray) 
				{
					GrayFilter.gray(btn);
				}
				if (setTouchable) 
				{
					btn.touchable=false;
				}
			}
		}
	}
}