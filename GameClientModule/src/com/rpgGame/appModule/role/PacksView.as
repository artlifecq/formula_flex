package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.SmallShopItemManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.manager.goods.StorageManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.shop.ShopManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.sender.ShopSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.lang.LangBackPack;
	import com.rpgGame.coreData.lang.LangShop;
	import com.rpgGame.coreData.type.MenuType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import flash.geom.Point;
	
	import app.message.AmountType;
	import app.message.GoodsContainerProto;
	import app.message.GoodsProto;
	import app.message.GoodsType;
	
	import feathers.controls.Scroller;
	import feathers.themes.GuiThemeStyle;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	
	import starling.display.DisplayObject;
	import starling.events.Event;

	/**
	 *背包部分 
	 * @author dik
	 * 
	 */
	public class PacksView
	{
		private var _skin : beibao_Skin;
		
		private var goodsContainer : GoodsContainerPanel;
		
		public function PacksView(skin:beibao_Skin)
		{
			_skin=skin;
			
			initTestDatas();
			
			initPacks();
			initEvent();
		}
		
		private function initTestDatas():void
		{
			var data:GoodsContainerProto=new GoodsContainerProto();
			data.initCount=42;
			data.size=42;
			var posArr:Array = [];
			var goodsArr:Array = [];
			var i:int
			for(i=0;i<42;i++){
				var goods:GoodsProto=new GoodsProto();
				goods.id=i;
				goodsArr.push(goods);
				posArr.push(i);
			}
			
			data.posList=posArr;
			data.goodsList=goodsArr;
			BackPackManager.instance.setGoodsInfo(data);
		}
		
		private function initPacks():void
		{
			goodsContainer = new GoodsContainerPanel(_skin.lst_pack,ItemContainerID.BackPack,createItemRender);
			goodsContainer.acceptDropFromContainerIdArr = [ItemContainerID.BackPack, ItemContainerID.Storage, ItemContainerID.Role, ItemContainerID.Mount];
			goodsContainer.updateGridLen = setUseGridLen;
			goodsContainer.onDragDropEnd = onItemDroped;
			
			_skin.lst_pack.clipContent = true;
			_skin.lst_pack.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_skin.lst_pack.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			_skin.lst_pack.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.lst_pack.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			GuiThemeStyle.setScrollerStyle(_skin.lst_pack, org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack);
		}
		
		
		public function updatePacks():void
		{
			setGridsCount(80,true);
			updateAmount();
		}
		
		private function updateAmount():void
		{
			var info:AmountInfo = MainRoleManager.actorInfo.amountInfo;
			_skin.txt_lijin.text = info.getAmountByType(AmountType.BAND_JINZI)+"";//绑金
			_skin.txt_yingzi.htmlText = MoneyUtil.getAutoHtmlMoneyString( info.getAmountByType(AmountType.BAND_MONEY) );//绑银
			_skin.txt_yuanbao.text = info.getAmountByType(AmountType.JINZI)+"";//金子
			_skin.txt_yingzibang.htmlText = MoneyUtil.getAutoHtmlMoneyString( info.getAmountByType(AmountType.MONEY) );//银子
		}
		
		public function setGridsCount(count:int, refleshNow:Boolean):void
		{
			goodsContainer.gridCount = count;
			//如果当前容器长度不够，则自动补充
			var len:int = goodsContainer.dataProvider.length;
			for( var i:int = len; i < goodsContainer.gridCount; i++ )
			{
				var gridInfo:GridInfo = new GridInfo(ItemContainerID.BackPack, i);
				goodsContainer.dataProvider.push(gridInfo);
			}
			goodsContainer.dataProvider.updateAll();
			setUseGridLen();
			if(refleshNow)
			{
				setRefleshLock();
			}
		}
		
		
		
		private function setRefleshLock():void
		{
			if(_skin.tab_pack.selectedIndex == 0)
			{
				BackPackManager.instance.setUnusableGrid(false);
				goodsContainer.refleshGrids();
			}
			else
			{
				BackPackManager.instance.setUnusableGrid(true);
				setUnusable();
			}
		}
		
		
		/**刷新背包不能使用的grid*/
		public function setUnusable():void
		{
			var goodsInfo:Array = BackPackManager.instance.getAllItem();
			var i:int =0;
			var goodsLen:int = goodsInfo ? goodsInfo.length : 0;
			for (i=0; i<goodsContainer.gridCount; i++)
			{
				if(i < goodsLen)
				{
					goodsContainer.setGridInfo(i, goodsInfo[i], i);
				}
				else
				{
					goodsContainer.setGridInfo(i, null, i);
				}
			}
			setUseGridLen();
			goodsContainer.dataProvider.updateAll();
		}
		
		/**
		 *更新开启数 
		 * 
		 */
		private function setUseGridLen():void
		{
//			_skin.lbCount.text = BackPackManager.instance.useGridLen() + "/" + BackPackManager.instance.hasOpenCount;
		}
		
		/**
		 * 背包物品移动 
		 * @param srcGrid
		 * @param dstGrid
		 * 
		 */		
		public function onItemDroped(srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			if(_skin.tab_pack.selectedIndex != 0)
				return;
			var item : ItemInfo = srcGrid.data as ItemInfo;
			if(!item)
			{
				trace("try move grid fail ,index :",srcGrid.index);
				return;
			}
			if(dstGrid && dstGrid.isUnlock)
			{
				NoticeManager.mouseFollowNotify("物品不能移动到这里!");
				return;
			}
			if(dstGrid)
			{
				var target : ItemInfo = dstGrid.data as ItemInfo;
				if(target && target.cfgId == item.cfgId && target.binded != item.binded && target.expireTime == 0 && item.expireTime == 0 && item.maxCount>1 && target.maxCount>1)
				{
					if(BackPackManager.instance.isAlertChangeBind == false)
					{
						var alertSet : AlertSetInfo =  new AlertSetInfo(LangBackPack.CHANGE_ITEM_BIND);
						alertSet.isShowCBox = true;
						GameAlert.showAlert(alertSet,changeItemBind,srcGrid,dstGrid);
						return;
					}
				}
			}
			ItemSender.reqMoveGoods(srcGrid.containerID, dstGrid.containerID, item.index, dstGrid.index);
		}
		
		private function changeItemBind(gameAlert:GameAlert,srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			if(gameAlert.clickType == AlertClickTypeEnum.TYPE_SURE)
			{
				BackPackManager.instance.isAlertChangeBind = gameAlert.isCheckSelected;
				var item : ItemInfo = srcGrid.data as ItemInfo;
				if(item)
					ItemSender.reqMoveGoods(srcGrid.containerID, dstGrid.containerID, item.index, dstGrid.index);
			}
		}
		
		/**
		 * 创建格子渲染器 
		 * 
		 */		
		private function createItemRender():GridItemRender
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.SIZE_44,GridBGType.GRID_SIZE_44);
			var grid:DragDropItem = render.getGrid();
			grid.doubleClickFun = onDoubleClick;
			grid.rightMouseClickFun = onRightMouse;
			grid.onTouchEndCallBack = onTouchGrid;
			return render;
		}
		
		protected function onDoubleClick(grid:IconCDFace):void
		{
			ItemUseManager.useItem(grid.faceInfo as ItemInfo);
		}
		
		protected function onRightMouse(grid:IconCDFace):void
		{
			ItemUseManager.useItem(grid.faceInfo as ItemInfo);
		}
		
		/**
		 * 使用格子上的东西
		 * @param cd
		 * 
		 */		
		protected function onTouchGrid( grid:DragDropItem ):void
		{
			if(!BackPackManager.instance.isEnabled(grid.index))return;
			
			var realIndex:int =  goodsContainer.getRealIndex(grid.index);
			if(GoodsContainerPanel.isFaceMoving)
			{
				goodsContainer.onFaceMoveSuccess(realIndex );
				return;
			}
			var isLock : Boolean = BackPackManager.instance.isUnlock(realIndex);
			if(isLock)
			{
				BackPackManager.instance.unLockGrid();//解锁
				return;
			}
			if( grid == null || grid.faceInfo == null)
				return;
			
			if(ShopManager.inSellMode)
			{
				SmallShopItemManager.reqSellGoods(grid.faceInfo as ItemInfo);
				return;
			}
			
			if(ShopManager.inRepairMode)
			{
				if(grid.faceInfo is EquipInfo)
				{
					ShopSender.reqRepairGoods(grid.containerID, grid.index, grid.faceInfo.cfgId);
				}else{
					NoticeManager.showNotify(LangShop.SHOP_ERROR_5);
				}
				return;
			}
			
			showMenu(grid);
		}
		
		public function showMenu(grid:IconCDFace):void
		{
			var item:ItemInfo = grid.faceInfo as ItemInfo;
			if( item == null )
				return;
			if(BackPackManager.instance.getIsShowBindLock())
				return;
			var pos:Point = grid.parent.localToGlobal(new Point(grid.x+2,grid.y+IcoSizeEnum.SIZE_40));
			
			if(item.type == GoodsType.EQUIPMENT)
			{
				MenuManager.showMenu( MenuType.EQUIP_MENUS,  grid.faceInfo, pos.x, pos.y, 40, _skin.container);
			}else
			{
				MenuManager.showMenu( MenuType.ITEM_MENUS,  grid.faceInfo, pos.x, pos.y, 40, _skin.container);
			}
		}
		
		private function initEvent():void
		{
			_skin.tab_pack.addEventListener(Event.CHANGE, onTab)
		}
		
		private function onTab(e:Event):void
		{
			BackPackManager.instance.tabbarIndex = _skin.tab_pack.selectedIndex;
	/*		curType =TAB_TYPE[ skin.tabBar.selectedIndex ];
			if(skin.tabBar.selectedIndex == 0)
			{
				BackPackManager.instance.setCheckType(null);
				//				BackPackManager.instance.checkType = null;
				BackPackManager.instance.setUnusableGrid(false);
				goodsContainer.refleshGrids();
			}
			else
			{
				BackPackManager.instance.setCheckType(curType);
				//				BackPackManager.instance.checkType = curType;
				BackPackManager.instance.setUnusableGrid(true);
				setUnusable();
			}*/
		}
		
		
		internal function onTouchTarget(target : DisplayObject):Boolean
		{
			switch (target) {
				case _skin.btn_chushou:
					return true;
				case _skin.btn_zhengli:
					return true;
				case _skin.btn_cangku:
					return true;
				case _skin.btn_shangdian:
					return true;
				case _skin.btn_paimaihang:
					return true;
				case _skin.btn_getYuanbao:
					return true;
			}
			return false;
		}
	}
}