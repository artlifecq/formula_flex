package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.manager.Mgr;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.zhanchang.paihangbang.PaiHangAlll_Skin;
	
	public class D1v1WeekRewardPanelExt 
	{
		private var _skin:PaiHangAlll_Skin;
		public function D1v1WeekRewardPanelExt(skin:PaiHangAlll_Skin)
		{
			_skin=skin;
			var list:List=_skin.listItem;
			list.itemRendererFactory = createStoneCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
		}
		
		private function createStoneCell():D1v1WeekRewardCellRender
		{
			// TODO Auto Generated method stub
			return new D1v1WeekRewardCellRender();
		}
		
		
		public function setMyRank(rank:int):void
		{
			// TODO Auto Generated method stub
			_skin.numZhanli.label=rank+"";
		}
		public function setData():void
		{
			_skin.listItem.dataProvider=new ListCollection(Mgr.d1v1Mgr.getRankReward());
		}
	}
}