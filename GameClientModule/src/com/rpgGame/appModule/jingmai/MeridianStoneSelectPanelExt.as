package com.rpgGame.appModule.jingmai
{
	import com.rpgGame.appModule.jingmai.render.StoneSelectCellRender;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.beibao.jingmai.Stone_Skin;
	
	public class MeridianStoneSelectPanelExt extends SkinUI
	{
		private var _skin:Stone_Skin;
		public function MeridianStoneSelectPanelExt()
		{
			_skin=new Stone_Skin();
			super(_skin);
			
			var list:List=_skin.lst_pack;
			list.itemRendererFactory = createStoneCell;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			
		}
		
		private function createStoneCell():StoneSelectCellRender
		{
			// TODO Auto Generated method stub
			return new StoneSelectCellRender();
		}
		public function setData(data:Vector.<ClientItemInfo>,acuInfo:AcuPointInfo):void
		{
			_skin.lst_pack.dataProvider=new ListCollection(data);
		}
	}
}