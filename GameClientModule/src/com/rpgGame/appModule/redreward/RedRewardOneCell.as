package com.rpgGame.appModule.redreward
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.hongbao.HongBao_Item2;
	import org.mokylin.skin.app.hongbao.HongBao_ItemBg;
	
	public class RedRewardOneCell extends SkinUI
	{
		private var _skin:HongBao_Item2;
		public function RedRewardOneCell():void
		{
			_skin = new HongBao_Item2();
			super(_skin);
		}
		public function updata(index:int):void
		{
			var bgskin:HongBao_ItemBg = _skin.bg.skin as HongBao_ItemBg;
			if(index%2 ==0)
			{
				bgskin.bg1.visible = false;
			}else{
				bgskin.bg1.visible = true;
			}
			
			bgskin.bg2.visible = (index ==0);
			_skin.uiNo1.visible = (index ==0);	
		}
	}
}