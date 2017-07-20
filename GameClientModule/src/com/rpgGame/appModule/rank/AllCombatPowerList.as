package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.enum.RankListType;
	
	import org.mokylin.skin.app.paihangbang.PaiHangTotal_dianfeng;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip2_Skin;
	
	public class AllCombatPowerList extends ViewUI
	{
		private var _skin:PaiHangTotal_dianfeng;
		
		private var _type:int ;
		public function AllCombatPowerList():void
		{
			_skin = new PaiHangTotal_dianfeng();
			super(_skin);
			initView();
		}
		private var _leftGroup:AllRankLeftGroup;
		private function initView():void
		{
			this.x = 22;
			this.y = 54;
			_type = RankListType.All_COMBATPOWER_TYPE;
			_leftGroup = new AllRankLeftGroup(_skin.cellgroup,_type);
			_leftGroup.bindPageBtn(_skin.skinFlip.skin  as Flip2_Skin);
			_leftGroup.bindUI(_skin.lbMiaosu,_skin.uiTongjizhong);
			_leftGroup.bindRightGroup(_skin.skinRight);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			_leftGroup.onShow();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			_leftGroup.onHide();
		}
	}
}