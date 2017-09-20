package com.rpgGame.app.ui.main.activityBar.item
{
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
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
				setTextLeable(HtmlTextUtil.getTextColor(StaticValue.RED_TEXT, ActivetyDataManager.getNextRefreshTime(_actData.actCfg)+"开启"));
				ui.uiJinXing.visible=false;
			}else{
				this.setupActTime(_actData.info.notifyTime);
				ui.uiJinXing.visible=true;
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			ui.uiJinXing.visible=false;
		}
	}
}