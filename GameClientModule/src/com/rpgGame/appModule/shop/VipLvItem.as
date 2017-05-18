package com.rpgGame.appModule.shop
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.shangcheng.VipLevel_Skin;
	

	
	public class VipLvItem extends SkinUI
	{
		private var _skin:VipLevel_Skin;
		private var _lv:int=-1;
		public function VipLvItem()
		{
			_skin=new VipLevel_Skin();
			super(_skin);
		}
		public function setLevel(lv:int):void
		{
			if (lv==_lv) 
			{
				return;
			}
			_lv=lv;
			_skin.uiLevel.styleName="ui/app/shangcheng/number/sz/"+lv+".png"
		}
	}
}