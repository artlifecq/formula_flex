package com.rpgGame.appModule.dungeon.lunjian
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangUI;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.fuben.FuBenJieSuan2_Shibai;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	/**
	 *论剑失败
	 *@author dik
	 *2017-5-11下午5:43:03
	 */
	public class LunJianFailPanel extends SkinUIPanel
	{
		private var _skin:FuBenJieSuan2_Shibai;
		private var leftTime:int;
		
		public function LunJianFailPanel()
		{
			_skin=new FuBenJieSuan2_Shibai();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_skin.container.scale=0.1;
			_skin.container.alpha=0;
			
			TweenLite.to(_skin.container,1,{scale:1,alpha:1,onComplete:tweenComplete});
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnEixt){
				DungeonSender.reqQuitDungeon();
				this.onHide();
			}
		}
		
		private function tweenComplete():void
		{
			leftTime=10;
			TimerServer.addLoop(updateTime,1000);
			_skin.lbTime.text=leftTime+LanguageConfig.getText(LangUI.UI_TEXT33);
		}
		
		private function updateTime():void
		{
			leftTime--;

			_skin.lbTime.text=leftTime+LanguageConfig.getText(LangUI.UI_TEXT33);
			if(leftTime<0){

				TimerServer.remove(updateTime);
				DungeonSender.reqQuitDungeon();
				this.onHide();
			}
		}
	}
}