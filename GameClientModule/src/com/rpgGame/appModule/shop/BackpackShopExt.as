package com.rpgGame.appModule.shop
{
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.shop.backpackShop.BackpackShopRebuyView;
	import com.rpgGame.appModule.shop.backpackShop.BackpackShopView;
	import com.rpgGame.core.utils.MCUtil;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.beibao.ShangDian_Skin;
	
	import starling.display.DisplayObject;

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
		private var _touch:TouchCtrl;
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
			_touch=new TouchCtrl(this,null,onTouchMe,onLeaveMe);
		}
		
		private function onLeaveMe():void
		{
			// TODO Auto Generated method stub
			BackPackManager.instance.isShowShop=false;
		}
		
		private function onTouchMe():void
		{
			// TODO Auto Generated method stub
			BackPackManager.instance.isShowShop=true;
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
			BackPackManager.instance.isShowShop=false;
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
	}
}