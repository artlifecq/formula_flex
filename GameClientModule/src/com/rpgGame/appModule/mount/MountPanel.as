package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.appModule.shop.ItemGetAdvisePanelExt;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.mokylin.skin.app.zuoqi.Zuoqi_Skin;
	import org.mokylin.skin.app.zuoqi.button.ButtonZhanqi;
	import org.mokylin.skin.app.zuoqi.button.ButtonZuoqi;
	
	import starling.display.DisplayObjectContainer;
	
	public class MountPanel extends TabBarPanel
	{
		private var _skin:Zuoqi_Skin;
		public function MountPanel():void
		{
			_skin = new Zuoqi_Skin();
			super(_skin);
		}
		override protected function initTabBarDatas():void
		{
			addTabDatas(ButtonZuoqi,MountView,EmFunctionID.EM_ZUOQI);
			addTabDatas(ButtonZhanqi,ZhanQiPanelExt,EmFunctionID.EM_ZHANQI);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
		}
		
		public function buyItem(id:int):void
		{
			var retw:int=ItemGetAdvisePanelExt.showBuyItem(id,this);
			if (retw!=0) 
			{
				onStageResize(_stage.stageWidth-retw,_stage.stageHeight);
			}
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			var gap:int = 20;
			var w:int = this.width;
			this.x =(sw - w)/2;
			this.y =(sh - this.height)/2;
		}
	}
}