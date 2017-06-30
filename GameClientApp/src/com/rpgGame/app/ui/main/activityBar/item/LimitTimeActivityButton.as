package com.rpgGame.app.ui.main.activityBar.item
{
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.type.activity.ActivityOpenStateType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;

	/**
	 *限时活动按钮 
	 * @author dik
	 * 
	 */
	public class LimitTimeActivityButton extends ActivityButton
	{
		private var _actData:ActivetyInfo;
		
		public function LimitTimeActivityButton()
		{
			super();
		}
		
		override public function onActivityData(data:Object):void
		{
			_actData=data as ActivetyInfo;
			if(_actData==null)
				return ;
			if(_actData.info.joinState==1)
				_activityState == ActivityOpenStateType.OPEN;
			else if(_actData.info.joinState==2)
				_activityState == ActivityOpenStateType.OPEN_COUNTDOWN;
			else
				_activityState = ActivityOpenStateType.CLOSE;
			onShow();
		}
		
		override public function canOpen():Boolean
		{
			var bool:Boolean = super.canOpen();
			if(!bool)
				return false;
			if(_actData == null)
				return false;
			return true;
		}
		
		override protected function onShow():void
		{
			if(this.parent==null)
				return ;
			if(_actData.info.notifyTime==0){
				setTextLeable(HtmlTextUtil.getTextColor(StaticValue.UI_RED1, ActivetyDataManager.getNextRefreshTime(_actData.actCfg)+"开启"));
			}else{
				this.setTimeData(SystemTimeManager.curtTm,_actData.info.notifyTime*1000,0,true);
			}
		}
		
		
		override protected function onTextRuningTime(second:int):String
		{
			var closeTxt:String = "<font color='#4efd6f'>活动剩余时间\n" + TimeUtil.format3TimeType(second) + "</font>";
			setTextLeable(closeTxt);
			return closeTxt;
		}
	}
}