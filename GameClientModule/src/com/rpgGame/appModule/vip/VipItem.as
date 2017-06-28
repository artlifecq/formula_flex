package com.rpgGame.appModule.vip
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.appModule.shop.ItemBuyPanelExt;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.type.TipType;
	
	import app.message.EnumItemId;
	import app.message.EnumVip;
	
	import away3d.events.Event;
	

	public class VipItem
	{
		private var _skin:*;
		private var _vip:int;
		private var _qVip:Q_vip;
		private var _shopItem:ShopItemVo;
		private var _call:Function;
		public function VipItem(s:*,vip:int,call:Function)
		{
			this._skin=s;
			this._vip=vip;
			_qVip=VipCfg.getVip(vip);
			this._call=call;
			this._skin.btnKaitong.addEventListener(Event.TRIGGERED,onBuy);
			this._skin.btnVip.addEventListener(Event.TRIGGERED,onVipClick);
			var itemId:int;
			if (_vip==EnumVip.VIP1) 
			{
				itemId=EnumItemId.ITEM_VIP1_CARD;
			}
			else if (vip==EnumVip.VIP2) 
			{
				itemId=EnumItemId.ITEM_VIP2_CARD;
			}
			else 
			{
				itemId=EnumItemId.ITEM_VIP3_CARD;
			}
			_skin.uiVip.touchable=true;
			TipTargetManager.show(_skin.uiVip,TargetTipsMaker.makeTips(TipType.ITEM_TIP,new ClientItemInfo(itemId)));
		}
		public function resetData():void
		{
			_shopItem=Mgr.shopMgr.getMallShopItemVo(_qVip.q_shopItemId);
			if (_shopItem) 
			{
				_skin.lbJiage.text=_shopItem.realPrice+"";
			}
		}
		private function onVipClick(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_call) 
			{
				_call(_vip);
			}
		}
		
		private function onBuy(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_shopItem) 
			{
				ItemBuyPanelExt.buyItem(_shopItem,1);
			}
		}
		public function setState(curVip:int):void
		{
			if (curVip>0) 
			{
				_skin.btnKaitong.label="续费";
			}
			else
			{
				_skin.btnKaitong.label="开通";
			}
		}
		public function setSelectState(bSelect:Boolean):void
		{
			_skin.uiSelect.visible=bSelect;
		}
	}
}