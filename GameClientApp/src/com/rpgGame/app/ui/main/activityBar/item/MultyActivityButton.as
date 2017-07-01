package com.rpgGame.app.ui.main.activityBar.item
{
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.DungeonEvent;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 多人副本队列按钮
	 * */
	public class MultyActivityButton extends ActivityButton
	{
		public function MultyActivityButton()
		{
			super();
			setTips(ui.btnBar,"","您当前处于跨服\n副本的队列匹配\n中，点击查看。");
		}
		
		override protected function onTextRuningTime(second:int):String
		{
			EventManager.dispatchEvent(DungeonEvent.ZONE_TEAM_TIME,second);
			var closeTxt:String = "<font color='#4efd6f'>副本匹配中\n" + TimeUtil.format3TimeType(second) + "</font>";
//			ui.txtTitle.htmlText = closeTxt;
			setTextLeable(closeTxt);
			return closeTxt;
			
		}
		
			
		
	}
}