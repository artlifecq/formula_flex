package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiPaiHang_Skin;
	
	public class D1v1RankConfigPanelExt extends SkinUIPanel
	{
		private var _skin:DuanWeiPaiHang_Skin;
		private var _cellList:Vector.<D1v1ConfigCell>;
		private var _nowRank:int=0;
		public function D1v1RankConfigPanelExt()
		{
			_skin=new DuanWeiPaiHang_Skin();
			super(_skin);
			//写死吧只有这个id不会变
			_skin.skinDuan1.userData=1000;
			_skin.skinDuan1.userData=2000;
			_skin.skinDuan1.userData=3000;
			_skin.skinDuan1.userData=4000;
			_skin.skinDuan1.userData=5000;
			
			_cellList=new Vector.<D1v1ConfigCell>();
			_cellList.push(new D1v1ConfigCell(_skin.skinItem1));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem2));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem3));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem4));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem5));
			
		}
		override protected function onHide():void
		{
			super.onHide();
			clearData();
		}
		override protected function onShow():void
		{
			super.onShow();
			if (_nowRank==0) 
			{
				_nowRank=1000;
			}
			showRank(_nowRank);
		}
		private function showRank(rank:int):void
		{
			clearData();
			_nowRank=rank;
			var arr:Array=BattleRankCfg.getConfigsByMainRank(rank);
			if (arr.length!=_cellList.length) 
			{
				throw new Error("巅峰对决配置和xml长度不一致");
			}
			var len:int=arr.length;
			for (var i:int = 0; i < len; i++) 
			{
				_cellList[i].setConfig(arr[i]);
			}
			
		}
		private function clearData():void
		{
			for each (var cell:D1v1ConfigCell in _cellList) 
			{
				cell.clear();
			}
			
		}
	}
}
