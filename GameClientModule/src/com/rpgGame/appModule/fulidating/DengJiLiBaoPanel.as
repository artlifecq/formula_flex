package com.rpgGame.appModule.fulidating
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.appModule.fulidating.render.LiBaoItemRender;
	import com.rpgGame.coreData.cfg.fulidating.DengJiCfg;
	
	import feathers.controls.List;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.fulidating.FLDT_Dengjilibao;
	
	public class DengJiLiBaoPanel extends ViewUI
	{
		private var _skin:FLDT_Dengjilibao;
		public function DengJiLiBaoPanel()
		{
			_skin=new FLDT_Dengjilibao();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			var list:List=_skin.listCont;
			list.itemRendererFactory = creatLiBaoItemCell;
			list.clipContent = true;
			list.verticalScrollBarPosition = "right";
			list.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=0;
			
			var arr:Array=DengJiCfg.getLvArr();
			list.dataProvider=new ListCollection(arr);
			list.selectedIndex=0;
		}
		
		private function creatLiBaoItemCell():LiBaoItemRender
		{
			var render:LiBaoItemRender=new LiBaoItemRender();
			return render;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			if(_skin.listCont.dataProvider!=null){
				_skin.listCont.selectedIndex=0;
			}
		}
		
	}
}