package com.rpgGame.appModule.redreward
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.hongbao.HongBao_Item1;
	import org.mokylin.skin.app.hongbao.HongBao_ItemBg;
	
	public class RedRewardMoreCell extends SkinUI
	{
		private var _skin:HongBao_Item1;
		public function RedRewardMoreCell():void
		{
			_skin = new HongBao_Item1();
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
			
			bgskin.bg2.visible = false;
		}
	}
}