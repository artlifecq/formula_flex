package com.rpgGame.appModule.battle.jcyt
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.main.dungeon.NineTowerTrackUIExt;
	import com.rpgGame.core.events.NineTowerEvent;
	import com.rpgGame.netData.yaota.message.SCYaoTaIntegralMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jiucengyaota.JiFenPaiHang_Skin;
	
	public class NineTowerScorePanelExt extends SkinUIPanel
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
			
			this.dragAble=false;
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
			Mgr.nineTowerMgr.reqTowerScore();
		}
		private function onGetRankData(...arg):void
		{
			// TODO Auto Generated method stub
			var data:SCYaoTaIntegralMessage=arg[0];
			var len:int=data.yaoTaInfo.length;
			var cell:NineTowerScoreCellExt;
			for (var i:int = 0; i < 10; i++) 
			{
				cell=_cellList[i];
				if (i<len) 
				{
					cell.setData(data.yaoTaInfo[i]);
					cell.visible=true;
				}
				else
				{
					cell.visible=false;
				}
			}
			_myRank.setData(data.myYaoTaInfo);
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
		override protected function onStageResize(sw:int, sh:int):void
		{
			//var track:NineTowerTrackUIExt=Mgr.nineTowerMgr.track;
			var tw:int=260;
			//if (track) 
			{
			//	tw=track.width;
			}
			this.x=sw-tw-this.width-4;
			this.y=sh/2-this.height/2;
		}
	}
}