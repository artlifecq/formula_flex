package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.main.openActivity.comps.IActivityInter;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	
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
		public function BaseActivityListItemCell(skin:StateSkin=null,btn:Button=null,gray:Boolean=true)
		{
			super(skin);
			this._btnReward=btn;
			_needGray=gray;
		}
		
		public function setData(info:ActivityVo):void
		{
			this._data=info;
			setBtnState(_btnReward,_data.status,_needGray);
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
		/**
		 * 设置按钮状态
		 * @param btn
		 * @param state 0已经领取，1可领取， 2不可领取
		 * 
		 */		
		public static function setBtnState(btn:Button,state:int,gray:Boolean):void
		{
			if (!btn) 
			{
				return;
			}
			//
			if (state==0) 
			{
				btn.label="已领取";
				if (gray) 
				{
					TouchableUtil.gray(btn);
				}
			}
			else if (state==1) 
			{
				btn.label="领取";
				if (gray) 
				{
					TouchableUtil.ungray(btn);
				}
			}
			else if (state==2) 
			{
				btn.label="未达成";
				if (gray) 
				{
					TouchableUtil.gray(btn);
				}
			}
		}
	}
}