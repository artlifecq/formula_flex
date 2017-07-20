package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.RankListEvent;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.paihangbang.PaiHangBang_Skin;
	
	public class RankListPanle extends SkinUIPanel
	{
		private var _skin:PaiHangBang_Skin;
		private var _tabViewMap:HashMap;
		public function RankListPanle():void
		{
			_skin = new PaiHangBang_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_tabViewMap = new HashMap();
			_skin.list.width = 160;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.itemRendererType = RankListButtonCell;
			var arr:Array = NewFuncCfgData.getListById(311);
			_skin.list.dataProvider = new ListCollection(arr);
			EventManager.addEvent(RankListEvent.SELECTCHANGEEVENT,changeHandler);
			_skin.list.selectedIndex = 0;
		}
		private var _selectIInfoData:Q_newfunc;
		private var _currentView:RankListViewBase;
		private function changeHandler(infodata:Q_newfunc):void
		{
			if(_selectIInfoData == infodata)
				return ;
			_selectIInfoData = infodata;
			refeahView();
		}
		
		private function refeahView():void
		{
			if(_currentView)
			{
				_skin.content.removeChild(_currentView);
			}
			if(!_tabViewMap.hasOwnProperty(_selectIInfoData.q_id))
			{
				createView(_selectIInfoData.q_id);
			}
			
			_currentView = _tabViewMap.getValue(_selectIInfoData.q_id) as RankListViewBase;
			_skin.content.addChild(_currentView);
		}
		
		private function createView(type:int):void
		{
			var typeToString:String = type.toString();
			var view:RankListViewBase;
			switch(typeToString)
			{
				case EmFunctionID.EM_LEVELRANK:
					view = new LevelRankListView();
					break;
				case EmFunctionID.EM_COMBATPOAERRANK:
					view = new CombatPowerListView();
					break;
				case EmFunctionID.EM_FIGHTFLAGRANK:
					view = new FightFlagListView();
					break;
				case EmFunctionID.EM_MOUNTRANK:
					view = new MountListView();
					break;
				case EmFunctionID.EM_WEDDINGRINGRANK:
					view = new WeddingRingListView();
					break;
				case EmFunctionID.EM_BEAUTYRANK:
					view = new BeautyListView();
					break;
			}
			_tabViewMap.add(type,view);
		}
	}
}