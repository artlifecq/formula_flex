package com.rpgGame.appModule.rank
{
	import com.rpgGame.coreData.enum.RankListType;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.paihangbang.PaiHang_Jieshu;
	import org.mokylin.skin.app.paihangbang.PaiHang_Right;
	import org.mokylin.skin.common.Flip1_Skin;
	
	public class MountListView extends RankListViewBase
	{
		private var _skin:PaiHang_Jieshu;
		public function MountListView():void
		{
			_skin = new PaiHang_Jieshu();
			super(_skin,RankListType.MOUNT_TYPE);
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
		
		override protected function bindRightGroup(content:SkinnableContainer):void
		{
			if(_rightGroup!=null)
				return ;
			_rightGroup = new MountRightGroup(content.skin as PaiHang_Right,_type);
		}
	}
}