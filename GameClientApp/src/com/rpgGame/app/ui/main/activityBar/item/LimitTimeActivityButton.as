package com.rpgGame.app.ui.main.activityBar.item
{
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.utils.TimeUtil;
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
			if(_actData.info.notifyTime==0){
				ui.txtTitle.htmlText =HtmlTextUtil.getTextColor(StaticValue.UI_RED1, ActivetyDataManager.getNextRefreshTime(_actData.actCfg)+"开启");
				if(!ui.skinBg1.visible){
					ui.skinBg1.visible=true;
				}
			}else{
				this.setTimeData(_actData.info.notifyTime,0,0,true);
			}
		}
		
		override protected function onTextRuningTime(second:int):String
		{
			var closeTxt:String = "<font color='#4efd6f'>活动剩余时间\n" + TimeUtil.format3TimeType(second) + "</font>";
			ui.txtTitle.htmlText = closeTxt;
			if(!ui.skinBg1.visible){
				ui.skinBg1.visible=true;
			}
			return closeTxt;
		}
	}
}