package com.rpgGame.appModule.shop.backpackShop
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.shop.ItemBuyPanelExt;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import org.mokylin.skin.app.beibao.ShangDian_Item;
	
	import starling.display.DisplayObject;
	
	public class BackPackShopItemExt extends SkinUI
	{
		private var _type:int;
		private var _skin:ShangDian_Item;
		private var _data:Object;
		private var _grid:IconCDFace;
		public function BackPackShopItemExt(t:int)
		{
			this._type=t;
			_skin=new ShangDian_Item();
			super(_skin);
			_grid=IconCDFace.getIcoFace(IcoSizeEnum.ICON_42);
			_skin.Icon.addChild(_grid);
			_grid.x=6;
			_grid.y=6;
			_skin.Icon.touchGroup=false;
			_skin.Icon.touchable=true;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (_type==0) 
			{
				//Mgr.shopMgr.buyShopItem(_data as ShopItemVo);
				
				ItemBuyPanelExt.buyItem(_data as ShopItemVo);
			}
			else
			{
				Mgr.shopMgr.rebuyItem(_data.item as ItemInfo);
			}
		}
		
		public function setData(data:Object):void
		{
			// TODO Auto Generated method stub
			this._data=data;
			if (_type==0) 
			{
				showSellItem(_data as ShopItemVo);
			}
			else
			{
				showRebuyItem(_data.item as ItemInfo)
			}
		}
		private function showSellItem(vo:ShopItemVo):void
		{
			_skin.lbName.htmlText=ItemConfig.getItemNameWithQualityColor(vo.data.item.mod);
			var itemInfo:ClientItemInfo=new ClientItemInfo(vo.data.item.mod);
			
			itemInfo.count=vo.data.item.num;
			itemInfo.setContainerId(ItemContainerID.BACKPACK_SHOP);
			FaceUtil.SetItemGrid(_grid,itemInfo);
			_skin.imgPrice.styleName=ItemUtil.getResURL(vo.data.priceType);
			_skin.lbNum.text="x"+vo.data.price;
		}
		private function showRebuyItem(item:ItemInfo):void
		{
			_skin.lbName.htmlText=ItemConfig.getItemNameWithQualityColor(item.itemModelId);
			var itemInfo:ClientItemInfo=new ClientItemInfo(item.itemModelId);
			itemInfo.itemInfo=item;
			itemInfo.count=item.num;
			itemInfo.setContainerId(ItemContainerID.BACKPACK_SHOP);
			FaceUtil.SetItemGrid(_grid,itemInfo);
			_skin.imgPrice.styleName=ItemUtil.getResURL(CharAttributeType.RES_MONEY);
			var qItem:Q_item=ItemConfig.getQItemByID(item.itemModelId);
			if (qItem) 
			{
				_skin.lbNum.text="x"+qItem.q_recycle;
			}
		}
		public function clearData():void
		{
			// TODO Auto Generated method stub
			_grid.clear();
			this._data=null;
		}
	}
}