package com.rpgGame.appModule.vip
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.appModule.shop.ItemBuyPanelExt;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.vip.VipLevel1;
	

	public class VipItem
	{
		private var _skin:VipLevel1;
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
				ItemBuyPanelExt.buyItem(_shopItem);
			}
		}
		public function setState(curVip:int):void
		{
			if (curVip==_vip) 
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