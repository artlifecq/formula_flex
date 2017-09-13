package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.fulidating.Item_Qiandao;
	
	public class DaysItem extends SkinUI
	{
		private var _skin:Item_Qiandao;
		private var _day:int=0;
		public function DaysItem()
		{
			_skin=new Item_Qiandao();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.uiJin.visible=false;
			_skin.uiTiqian.visible=false;
			_skin.uiBuqian.visible=false;
			_skin.uiOK.visible=false;
			_skin.bg2.visible=false;
			_skin.lbDate.text="1";
		}
		
		public function setDate(day:int):void
		{
			_day=day;
			_skin.lbDate.text=_day.toString();
		}
		
		public function set sign(bool:Boolean):void
		{
			_skin.uiOK.visible=bool;
			
		}
	}
}