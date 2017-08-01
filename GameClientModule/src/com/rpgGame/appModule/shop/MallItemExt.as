package com.rpgGame.appModule.shop
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.shop.ShopItemVo;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.shangcheng.ShangPinItem;
	
	public class MallItemExt extends SkinUI
	{
		private var _skin:ShangPinItem;
		private var _data:ShopItemVo;
		private var _grid:IconCDFace;
		private var imgVip:VipLvItem;
		private var _initX:int;
		private var _initY:int;
		public function MallItemExt(ix:int,iy:int)
		{
			this._initX=ix;
			this._initY=iy;
			
			_skin=new ShangPinItem();
			super(_skin);
			_grid=IconCDFace.create(IcoSizeEnum.ICON_64);
			_grid.bindBg(this._skin.icons);
			this._skin.container.addChild(_grid);
			this._skin.btnBuy.addEventListener(Event.TRIGGERED,onBuy);
			this.x=ix;
			this.y=iy;
		}
		
		private function onBuy(eve:Event):void
		{
			// TODO Auto Generated method stub
//			Mgr.shopMgr.buyShopItem(this._data);
			ItemBuyPanelExt.buyItem(this._data);
		}
		public function setData(vo:ShopItemVo):void
		{
			this._data=vo;
			
			var itemInfo:ClientItemInfo=new ClientItemInfo(vo.data.item.mod);
			itemInfo.count=vo.data.item.num;
			FaceUtil.SetItemGrid(_grid,itemInfo);
			this._skin.lbName.htmlText=ItemConfig.getItemNameWithQualityColor(vo.data.item.mod);
			setNeedVip(_data.data.vipLevel);
			//有打折价格
			if (_data.data.discountPrice!=0) 
			{
				this._skin.grpJiage.visible=true;
				this._skin.lbNowPrice.visible=false;
				this._skin.grpJiage.y=30;
				this._skin.grpJiage2.y=48;
				this._skin.lbXiangou.y=68;
				//原价
				this._skin.lbYuanbao0.text=_data.data.price+"";
				this._skin.uiYuanbao0.styleName=ItemUtil.getResURL(_data.data.priceType);
				//现价
				this._skin.lbYuanbao2.text=_data.data.discountPrice+"";
				this._skin.uiYuanbao2.styleName=ItemUtil.getResURL(_data.data.priceType);
			}
			else
			{
				this._skin.grpJiage.visible=false;
				this._skin.lbNowPrice.visible=true;
				this._skin.grpJiage2.y=40;
				this._skin.lbXiangou.y=66;
				
				this._skin.lbYuanbao2.text=_data.data.price+"";
				this._skin.uiYuanbao2.styleName=ItemUtil.getResURL(_data.data.priceType);
			}
			this._skin.lbXiangou.visible=this._data.data.limitType!=0;
			if (this._data.data.limitType!=0) 
			{
				var str:String=_data.data.global_limit==1?NotifyCfgData.getNotifyTextByID(61020):"";
				if (_data.data.limitType==1) 
				{
					str+=NotifyCfgData.getNotifyTextByID(61021);
				}
				else if (_data.data.limitType==2) 
				{
					str+=NotifyCfgData.getNotifyTextByID(61022);
				}
				str+="："+_data.data.todayBuyNum+"/"+_data.data.limitNum;
				_skin.lbXiangou.text=str;
			}
		}
		private function setNeedVip(vipLv:int):void
		{
			if (vipLv>0) 
			{
				if (!imgVip) 
				{
					imgVip=new VipLvItem();
					this._skin.container.addChild(imgVip);
				}
				imgVip.setLevel(vipLv);
				imgVip.visible=true;
			}
			else
			{
				if (imgVip) 
				{
					imgVip.visible=false;
				}
			}
		}
		public function clearData():void
		{
			this._data=null;
			this._grid.clear();
		}

		public function get initX():int
		{
			return _initX;
		}

		public function get initY():int
		{
			return _initY;
		}

		public function get data():ShopItemVo
		{
			return _data;
		}


	}
}