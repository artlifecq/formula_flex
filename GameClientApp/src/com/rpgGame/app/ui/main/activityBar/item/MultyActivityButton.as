package com.rpgGame.app.ui.main.activityBar.item
{
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;

	/**
	 * 多人副本队列按钮
	 * */
	public class MultyActivityButton extends ActivityButton
	{
		public function MultyActivityButton()
		{
			super();
			_openState=false;
			setTips(ui.btnBar,"","您当前处于跨服\n副本的队列匹配\n中，点击查看。");
		}
		override public function setTips(target:DisplayObject, tipReady:String, tipRuning:String):void
		{
			this.tipReady = tipReady;
			this.tipRuning = tipRuning;
			if (target != null)
			{
				TipTargetManager.show(target, TargetTipsMaker.makeSimpleTextTips(tipRuning));
			}
		}
		override protected function onTextRuningTime(second:int):String
		{
			EventManager.dispatchEvent(DungeonEvent.ZONE_TEAM_TIME,second);
			var closeTxt:String = "<font color='#4efd6f'>" + TimeUtil.format3TimeType(second) + "</font>";
//			ui.txtTitle.htmlText = closeTxt;
			setTextLeable(closeTxt);
			return closeTxt;
			
		}
		
		override public function canOpen():Boolean
		{
			return _openState;
		}
		
		override public function onActivityOpen(data:Object=null):void
		{
			super.onActivityOpen(data);
			onTextRuningTime(0);
			_openState=true;
		}
		
		override public function onActivityClose():void
		{
			super.onActivityClose();
			_openState=false;
		}
	}
}