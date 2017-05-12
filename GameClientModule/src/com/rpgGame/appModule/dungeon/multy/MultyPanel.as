package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.fuben.FuBen_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;


	/**
	 * 多人副本弹出面板
	 * @author YT
	 */	
	public class MultyPanel  extends SkinUIPanel
	{
		private var _skin :FuBen_Skin;
		private var _multyView:MultyView;
		public function MultyPanel()
		{
			_skin=new FuBen_Skin();
			super(_skin);
			_multyView=new MultyView(_skin.duoren_skin);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			changeTab();
			_multyView.showView();
		}
		
		override public function hide():void 
		{
			super.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			_multyView.onTouchTarget(target);
			
		}
		
		private function changeTab() : void 
		{
			_skin.tab_fuben.selectedIndex=1;
		}
		
		
		
	}
}