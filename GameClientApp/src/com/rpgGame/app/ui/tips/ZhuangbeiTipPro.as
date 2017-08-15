package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.tips.Tips_ZhangBeiPro;
	
	public class ZhuangbeiTipPro extends SkinUI
	{
		private var _skin:Tips_ZhangBeiPro;
		public function ZhuangbeiTipPro()
		{
			_skin=new Tips_ZhangBeiPro();
			super(_skin);
		}
		
		public function setDate(view:int,maxView:int):void
		{
			_skin.skinBar.maximum=maxView;
			_skin.skinBar.value=view;
			_skin.lbBar.text=view.toString()+"/"+maxView;
		}
	}
}