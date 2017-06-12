package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Head;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiPaiHang_Skin;
	
	import starling.display.DisplayObject;
	
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
			setLeftRankData(_skin.skinDuan1,1000);
			setLeftRankData(_skin.skinDuan2,2000);
			setLeftRankData(_skin.skinDuan3,3000);
			setLeftRankData(_skin.skinDuan4,4000);
			setLeftRankData(_skin.skinDuan5,5000);
			
			_cellList=new Vector.<D1v1ConfigCell>();
			_cellList.push(new D1v1ConfigCell(_skin.skinItem1));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem2));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem3));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem4));
			_cellList.push(new D1v1ConfigCell(_skin.skinItem5));
			
		}
		
		private function setLeftRankData(s:SkinnableContainer,rankId:int):void
		{
			s.userData=rankId;
			var tmps:DuanWeiList_Head=s.skin as DuanWeiList_Head;
			tmps.uiIcon.styleName=Mgr.d1v1Mgr.getRankIconUrl(rankId+1,1);
			tmps.uiName.styleName="ui/app/zhanchang/dianfengduijue/name/"+rankId/1000+".png";
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target.parent)
			{
				case _skin.skinDuan1:
				case _skin.skinDuan2:
				case _skin.skinDuan3:
				case _skin.skinDuan4:
				case _skin.skinDuan5:
				{
					showRank((target.parent as SkinnableContainer).userData)
					break;
				}
					
				default:
				{
					break;
				}
			}
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
			arr.sortOn("q_subrank_id");
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
