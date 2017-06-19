package com.rpgGame.appModule.battle.jcyt
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.core.events.NineTowerEvent;
	import com.rpgGame.core.ui.SkinUI;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jiucengyaota.JiFenPaiHang_Skin;
	
	public class NineTowerScorePanelExt extends SkinUI
	{
		private var _skin:JiFenPaiHang_Skin;
		private var _myRank:NineTowerScoreCellExt;
		private var _cellList:Vector.<NineTowerScoreCellExt>;
		private const NUM:int=10;
		private var _timer:GameTimer;
		public function NineTowerScorePanelExt()
		{
			_skin=new JiFenPaiHang_Skin();
			super(_skin);
			
			_cellList=new Vector.<NineTowerScoreCellExt>();
			var tmp:NineTowerScoreCellExt;
			for (var i:int = 0; i < NUM; i++) 
			{
				tmp=new NineTowerScoreCellExt();
				tmp.x=2;
				tmp.y=61+i*tmp.height;
				tmp.visible=false;
				_cellList.push(tmp);
				this.addChild(tmp);
			}
			_myRank=new NineTowerScoreCellExt();
			_myRank.x=2;
			_myRank.y=408;
			this.addChild(_myRank);
			
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(NineTowerEvent.GET_SCORE_RANK_DATA,onGetRankData);
			if (!_timer) 
			{
				_timer=new GameTimer("NineTowerScorePanelExt",5000);
				_timer.onUpdate=onTimer;
			}
			onTimer();
		}
		private function onTimer():void
		{
			
		}
		private function onGetRankData(...arg):void
		{
			// TODO Auto Generated method stub
			
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.addEvent(NineTowerEvent.GET_SCORE_RANK_DATA,onGetRankData);
			if (_timer) 
			{
				_timer.destroy();
				_timer=null;
			}
		}
	}
}