package com.rpgGame.appModule.vip
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.appModule.shop.ItemBuyPanelExt;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.TipType;
	
	import app.message.EnumItemId;
	import app.message.EnumVip;
	
	import away3d.events.Event;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.vip.VipLevels;
	

	public class VipItem
	{
		private var _skin:VipLevels;
		private var _vip:int;
		private var _qVip:Q_vip;
		private var _shopItem:ShopItemVo;
		private var _call:Function;
		private var _con:SkinnableContainer;
		public function VipItem(s:*,vip:int,call:Function)
		{
			this._con=s;
			this._skin=_con.skin as VipLevels;
			//this._skin.uiOver.touchable=false;
			//this._skin.uiSelect.touchable=false;
			this._vip=vip;
			_qVip=VipCfg.getVip(vip);
			this._call=call;
			this._skin.btnGoumai.addEventListener(Event.TRIGGERED,onBuy);
			//this._skin.btnVip.addEventListener(Event.TRIGGERED,onVipClick);
			var itemId:int;
			if (_vip==EnumVip.VIP1) 
			{
				itemId=EnumItemId.ITEM_VIP1_CARD;
				_skin.uiName.styleName="ui/app/vip/vip/baijinjika.png";
			}
			else if (vip==EnumVip.VIP2) 
			{
				itemId=EnumItemId.ITEM_VIP2_CARD;
				_skin.uiName.styleName="ui/app/vip/vip/zuanshijika.png";
			}
			else 
			{
				itemId=EnumItemId.ITEM_VIP3_CARD;
				_skin.uiName.styleName="ui/app/vip/vip/zhizunbannianka.png";
			}
			var attr:HashMap=AttValueConfig.getAttrHash(_qVip.q_attr_id);
			
			_skin.lbSM.text="+"+AttValueConfig.getDisAttValueStr(CharAttributeType.MAX_HP,attr.getValue(CharAttributeType.MAX_HP));
			_skin.lbGJ.text="+"+AttValueConfig.getDisAttValueStr(CharAttributeType.WAI_GONG,attr.getValue(CharAttributeType.WAI_GONG))
			_skin.lbFY.text="+"+AttValueConfig.getDisAttValueStr(CharAttributeType.DEFENSE_PER,attr.getValue(CharAttributeType.DEFENSE_PER));
			MCUtil.removeSelf(_skin.imgPoint);
			var arr:Array=_qVip.q_vip_privileges.split("|");
			var len:int=arr.length;
			for (var i:int = 0; i < len; i++) 
			{
				var cell:VipTQCellRender=new VipTQCellRender();
				cell.x=_skin.imgPoint.x;
				cell.y=_skin.imgPoint.y+(cell.height+2)*i-4;
				_con.addChild(cell);
				cell.setData(arr[i]);
			}
			
			//TipTargetManager.show(this._con,TargetTipsMaker.makeTips(TipType.ITEM_TIP,new ClientItemInfo(itemId)));
			var touch:TouchCtrl=new TouchCtrl(this._con,onVipClick,onOver,onOut);
			_skin.uiOver.visible=false;
		}
		
		private function onOut():void
		{
			// TODO Auto Generated method stub
			_skin.uiOver.visible=false;
		}
		
		private function onOver():void
		{
			// TODO Auto Generated method stub
			_skin.uiOver.visible=true;
		}
		public function resetData():void
		{
			_shopItem=Mgr.shopMgr.getMallShopItemVo(_qVip.q_shopItemId);
			if (_shopItem) 
			{
				_skin.NumYuanbao.label=_shopItem.realPrice+"";
			}
		}
		private function onVipClick():void
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
			if (curVip>0) 
			{
				_skin.btnGoumai.label="续费";
			}
			else
			{
				_skin.btnGoumai.label="开通";
			}
		}
		public function setSelectState(bSelect:Boolean):void
		{
			_skin.uiSelect.visible=bSelect;
		}
	}
}