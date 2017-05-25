package com.rpgGame.appModule.shop
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.shop.backpackShop.BackpackShopRebuyView;
	import com.rpgGame.appModule.shop.backpackShop.BackpackShopView;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import org.mokylin.skin.app.beibao.ShangDian_Skin;
	
	import starling.display.DisplayObject;
	import away3d.events.Event;

	/**
	 *随身商店 
	 * @author yfl
	 * 
	 */	
	public class BackpackShopExt extends SkinUIPanel
	{
		private var _skin:ShangDian_Skin;
		private var _shopView:BackpackShopView;
		private var _rebuyView:BackpackShopRebuyView;
		private var _curView:DisplayObject;
		public function BackpackShopExt()
		{
			_skin=new ShangDian_Skin();
			
			
			super(_skin);
			_shopView=new BackpackShopView(_skin);
			_rebuyView=new BackpackShopRebuyView(_skin);
			regEvent();
		}
		private function regEvent():void
		{
			this._skin.tab_pack.addEventListener(Event.CHANGE,onTab);
		}
		
		private function onTab(eve:Event):void
		{
			// TODO Auto Generated method stub
			showSubView(_skin.tab_pack.selectedIndex);
		}
		private function showSubView(type:int):void
		{
			var sub:DisplayObject;
			if (type==0) 
			{
				sub=_shopView;
			}
			else
			{
				sub=_rebuyView;
			}
			if (_curView==sub) 
			{
				return;
			}
			if (_curView) 
			{
				MCUtil.removeSelf(_curView);
				Object(_curView).onHide();
			}
			_curView=sub;
			this.addChild(_curView);
			Object(_curView).onShow();
		}
		override protected function onShow():void
		{
			super.onShow();
			if (_curView==null) 
			{
				showSubView(0);
			}
			else
			{
				Object(_curView).onShow();
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			//removeFromParent();
			if (_curView) 
			{
				Object(_curView).onHide();
			}
			
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
	}
}