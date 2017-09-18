package com.rpgGame.appModule.dungeon.lunjian
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangUI;
	
	import away3d.primitives.RegularPolygonGeometry;
	
	import gs.TweenMax;
	import gs.easing.EaseLookup;
	
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
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_skin.container.scale=0.1;
			_skin.container.alpha=0;
			
			TweenMax.to(this,0.9,{scale:1,alpha:1});
			tweenComplete();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnEixt){
				DungeonSender.reqQuitDungeon();
				this.hide();
			}
		}
		
		private function tweenComplete():void
		{
			leftTime=10;
			TimerServer.addLoop(updateTime,1000);
			_skin.lbTime.text=leftTime+LanguageConfig.getText(LangUI.UI_TEXT33);
		}
		
		override public function hide():void
		{
			super.hide();
			TimerServer.remove(updateTime);
		}
		
		private function updateTime():void
		{
			leftTime--;

			_skin.lbTime.text=leftTime+LanguageConfig.getText(LangUI.UI_TEXT33);
			if(leftTime<=0)
			{
				TimerServer.remove(updateTime);
				DungeonSender.reqQuitDungeon();
				this.hide();
			}
		}
	}
}