package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import away3d.events.Event;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
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
			_skin.list.addEventListener(Event.SELECT,selectHandler);
			var arr:Array = getRankNameList();
			_skin.list.dataProvider = new ListCollection(arr);
			
			var length:int = arr.length;
			for(var i:int = 0;i<length;i++)
			{
				if(FunctionOpenManager.functionIsOpen(arr[i].q_id.toString()))
				{
					_skin.list.selectedIndex = i;
					break;
				}
			}
			selectHandler();
		}
		
		private function getRankNameList():Array
		{
			var names:Array=[];
			names.push(NewFuncCfgData.getFuncCfg(EmFunctionID.EM_LEVELRANK).q_name);
			names.push(NewFuncCfgData.getFuncCfg(EmFunctionID.EM_COMBATPOAERRANK).q_name);
			names.push(NewFuncCfgData.getFuncCfg(EmFunctionID.EM_FIGHTFLAGRANK).q_name);
			names.push(NewFuncCfgData.getFuncCfg(EmFunctionID.EM_MOUNTRANK).q_name);
			names.push(NewFuncCfgData.getFuncCfg(EmFunctionID.EM_WEDDINGRINGRANK).q_name);
			names.push(NewFuncCfgData.getFuncCfg(EmFunctionID.EM_BEAUTYRANK).q_name);
			return names;
		}
		
		private var _selectIndex:int=-1;
		private function selectHandler(e:Event=null):void
		{
			if(_selectIndex == _skin.list.selectedIndex)
				return ;
			var index:int = _skin.list.selectedIndex;
			if(index <0)
				return ;
			var q_data:Q_newfunc = _skin.list.dataProvider.getItemAt(index) as Q_newfunc;
			if(q_data==null)
				return ;
			if(!FunctionOpenManager.functionIsOpen(q_data.q_id))
			{
				NoticeManager.showNotifyById(90203,null,q_data.q_name,q_data.q_level);
				_skin.list.selectedIndex = _selectIndex;
			}else{
				_selectIndex = index;
				changeHandler(q_data)
			}
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