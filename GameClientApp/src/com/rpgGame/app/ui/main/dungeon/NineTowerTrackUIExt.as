package com.rpgGame.app.ui.main.dungeon
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.utils.TextUtil;
	
	import org.mokylin.skin.mainui.fubenzhuizong.JiuCengYaoTaTrack_Skin;
	
	import starling.display.DisplayObject;

	/**
	 *九层妖塔 
	 * @author yfl
	 * 
	 */	
	public class NineTowerTrackUIExt extends DungeonTrackerUI
	{
		private var _skin:JiuCengYaoTaTrack_Skin;
		private var _gReward:RewardGroup;
		private var _timer:GameTimer;
		public function NineTowerTrackUIExt()
		{
			_skin=new JiuCengYaoTaTrack_Skin();
			super(_skin);
			
			_gReward=new RewardGroup(_skin.sec_ico1_0);
			Mgr.nineTowerMgr.setPanel(this);
			_timer=new GameTimer("NineTowerTrackUIExt",1000);
			_timer.onUpdate=onTimer;
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.sec_subbut1:
				{
					onQuit();
					break;
				}
				case _skin.lbPaihang:
				{
					onRank();
					break;
				}
			}
		}
		
		private function onRank():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function onQuit():void
		{
			// TODO Auto Generated method stub
			
		}
		override protected function onShow():void
		{
			super.onShow();
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_timer) 
			{
				_timer.stop();
			}
			_gReward.clear();
		}
		public function setData(data:*):void
		{
			var level:int;
			var score:int;
			
			_skin.lbHeadName.text=TextUtil.ConectParam("第{0}层",[level]);
		}
	}
}