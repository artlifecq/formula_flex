package com.rpgGame.appModule.jingmai
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.core.ui.SkinUI;
	
	import flash.events.Event;
	
	import org.mokylin.skin.app.beibao.jingmai.Jingmai_Shuxin;
	
	public class MeridianAttrViewPanelExt extends SkinUI
	{
		private var _skin:Jingmai_Shuxin;
		public function MeridianAttrViewPanelExt()
		{
			_skin=new Jingmai_Shuxin();
			super(_skin);
			
			Mgr.meridianMgr.addEventListener(MeridianEvent.ALL_DATA_UPATE,onUpdateAll);
			Mgr.meridianMgr.addEventListener(MeridianEvent.MERIDIAN_CHANGE,onMeridianChange);
		}
		
		protected function onMeridianChange(event:MeridianEvent):void
		{
			// TODO Auto-generated method stub
			
		}
		
		protected function onUpdateAll(event:MeridianEvent):void
		{
			// TODO Auto-generated method stub
			
		}
	}
}