package com.rpgGame.appModule.rank
{
	import com.rpgGame.coreData.enum.RankListType;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Dengji;
	import org.mokylin.skin.common.Flip1_Skin;
	
	public class LevelRankListView extends RankListViewBase
	{
		private var _skin:PaiHang_Dengji;
		public function LevelRankListView():void
		{
			_skin = new PaiHang_Dengji();
			super(_skin,RankListType.LEVEL_TYPE);
		}
		
		override protected function initstance():void
		{
			this._cellGroup = _skin.cellgroup;
			this.bindBtnAll(_skin.btnAll);
			this.bindPageBtn(_skin.skinFlip.skin as Flip1_Skin);
			this.bindRightGroup(_skin.skinRight);
			this._uiTongjizhong = _skin.uiTongjizhong;
			super.initstance();
		}
	}
}