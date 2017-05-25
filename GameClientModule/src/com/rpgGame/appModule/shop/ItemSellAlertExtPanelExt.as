package com.rpgGame.appModule.shop
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import app.message.Quality;
	
	import org.mokylin.skin.app.shangcheng.ChuShou_Skin;
	
	import starling.display.DisplayObjectContainer;
	import away3d.events.Event;
	
	public class ItemSellAlertExtPanelExt extends SkinUIPanel
	{
		private static var isNoNotice:Boolean=false;
		private static var _ins:ItemSellAlertExtPanelExt=new ItemSellAlertExtPanelExt();
		private var _skin:ChuShou_Skin;
		private var _grid:IconCDFace;
		private var _item:ClientItemInfo;
	
		public function ItemSellAlertExtPanelExt()
		{
			_skin=new ChuShou_Skin();
			super(_skin);
			this.model=true;
			_grid=new IconCDFace(IcoSizeEnum.ICON_64);
			this._skin.imgIocn.addChild(_grid);
			this._skin.imgIocn.touchable=true;
			this._skin.btn_ok.addEventListener(Event.TRIGGERED,onSale);
			this._skin.btn_cancel.addEventListener(Event.TRIGGERED,onCancel);
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
		}
		private function onSale(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_item) 
			{
				Mgr.shopMgr.ReqSellItem(_item.itemInfo.itemId);
				hide();
			}
		}
		public static function showAlert(item:ClientItemInfo):void
		{
			if (!item) 
			{
				return;
			}
			if (item.qItem.q_sell==0) 
			{
				NoticeManager.mouseFollowNotify("该物品无法出售");
				return;
			}
			if (isNoNotice||item.quality<=Quality.BLUE) 
			{
				Mgr.shopMgr.ReqSellItem(item.itemInfo.itemId);
				return;
			}
			
			Stage3DLayerManager.starlingLayer.getLayer("alert").addChild(_ins);
			_ins.setData(item);
		}
		private function setData(item:ClientItemInfo):void
		{
			_item=item;
			FaceUtil.SetItemGrid(_grid,item);
			this._skin.lbName.htmlText=ItemConfig.getItemNameWithQualityColor(item.itemInfo.itemModelId);
		}
		private function onCancel():void
		{
			hide();
		}
		override protected function onHide():void
		{
			super.onHide();
			isNoNotice=_skin.chk_ok.isSelected;
			_item=null;
		}
	}
}