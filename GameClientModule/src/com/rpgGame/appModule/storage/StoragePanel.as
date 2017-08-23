package com.rpgGame.appModule.storage
{
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.StorageManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.controller.MouseCursorController;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.MouseCursorEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	import feathers.themes.GuiThemeStyle;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.cangku_Skin;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 *仓库面板 
	 * @author dik
	 * 
	 */
	public class StoragePanel extends SkinUIPanel
	{
		private var _skin : cangku_Skin;
		
		private var goodsContainer : GoodsContainerPanel;
		private var currentListData:ListCollection;
		
		private var isSave:Boolean;
		
		public function StoragePanel()
		{
			this._skin = new cangku_Skin();
			super(_skin);
			this.dragAble=false;
			initGoodsPanel();
		}
		
		private function initGoodsPanel():void
		{
			currentListData=new ListCollection();
			goodsContainer = new GoodsContainerPanel(_skin.lst_pack,ItemContainerID.Storage,createItemRender);
			goodsContainer.acceptDropFromContainerIdArr = [ItemContainerID.BackPack, ItemContainerID.Storage, ItemContainerID.Role, ItemContainerID.Mount];
			goodsContainer.onDragDropEnd = onItemDroped;
			goodsContainer.updateGridLen = setUseGridLen;
			
			_skin.lst_pack.clipContent = true;
			_skin.lst_pack.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_skin.lst_pack.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			_skin.lst_pack.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.lst_pack.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			
			_skin.lst_pack.padding=0.5;
			(_skin.lst_pack.layout as TiledRowsLayout).horizontalGap=0.5;
			(_skin.lst_pack.layout as TiledRowsLayout).verticalGap=1;
			GuiThemeStyle.setScrollerStyle(_skin.lst_pack, org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack);			
		}
		
		/**
		 *更新开启数 
		 * 
		 */
		private function setUseGridLen():void
		{
			_skin.lb_Num.text = StorageManager.instance.useGridLen() + "/" + StorageManager.instance.hasOpenCount;
		}
		
		/**
		 * 创建格子渲染器 
		 * 
		 */		
		private function createItemRender():GridItemRender
		{
			var render:GridItemRender = new GridItemRender(IcoSizeEnum.ICON_42,GridBGType.GRID_SIZE_44);
			var grid:DragDropItem = render.getGrid();
			grid.doubleClickFun = onDoubleClick;
			grid.rightMouseClickFun = onRightMouse;
			grid.onTouchEndCallBack = onTouchGrid;
			return render;
		}
		
		protected function onDoubleClick(grid:IconCDFace):void
		{
			var item:ClientItemInfo=grid.faceInfo as ClientItemInfo;
			ItemSender.StoreTobag(item.itemInfo.itemId,-1);
		}
		
		protected function onRightMouse(grid:IconCDFace):void
		{
			//			ItemUseManager.useItem(grid.faceInfo as ItemInfo);
		}
		
		/**
		 * 使用格子上的东西
		 * @param cd
		 * 
		 */		
		protected function onTouchGrid( grid:DragDropItem ):void
		{
			var realIndex:int =  goodsContainer.getRealIndex(grid.index);
			if(GoodsContainerPanel.isFaceMoving)
			{
				goodsContainer.onFaceMoveSuccess(grid.gridInfo );
				return;
			}
			
			if(grid.gridInfo.isUnlock&&(realIndex+1)>StorageManager.instance.hasOpenCount)
			{
				StorageManager.instance.unLockGrid(realIndex);
				return;
			}
			
			if(isSave){//取出去
				if(grid.gridInfo.data==null){
					return;
				}
				var item:ClientItemInfo=grid.gridInfo.data as ClientItemInfo;
				ItemSender.StoreTobag(item.itemInfo.itemId,-1);
				return;
			}
			
			if(grid.gridInfo.data==null){
				return;
			}
			
			var pos:Point = grid.parent.localToGlobal(new Point(grid.x+2,grid.y+IcoSizeEnum.SIZE_40));
			MenuManager.showMenu([LangMenu.GET_ITEM],  grid.gridInfo, pos.x, pos.y, 40, _skin.container);
		}
		
		/**
		 * 物品移动 
		 * @param srcGrid
		 * @param dstGrid
		 * 
		 */		
		public function onItemDroped(srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			var item : ClientItemInfo = srcGrid.data as ClientItemInfo;
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
			var target : ClientItemInfo
			if(dstGrid)
			{
				target = dstGrid.data as ClientItemInfo;
				/*if(target && target.cfgId == item.cfgId && target.binded != item.binded && target.expireTime == 0 && item.expireTime == 0 && item.maxCount>1 && target.maxCount>1)
				{
				if(StorageManager.instance.isAlertChangeBind == false)
				{
				var alertSet : AlertSetInfo =  new AlertSetInfo(LangBackPack.CHANGE_ITEM_BIND);
				alertSet.isShowCBox = true;
				GameAlert.showAlert(alertSet,changeItemBind,srcGrid,dstGrid);
				return;
				}
				}*/
			}
			GameLog.addShow("moveItem");
			
			if(item.containerID!=dstGrid.containerID){
				ItemSender.bagToStore(item.itemInfo.itemId,dstGrid.index);
			}else{
				ItemSender.moveItem(srcGrid,dstGrid);
			}
		}
		
		private function changeItemBind(gameAlert:GameAlert,srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			if(gameAlert.clickType == AlertClickTypeEnum.TYPE_SURE)
			{
				var item : ClientItemInfo = srcGrid.data as ClientItemInfo;
				//				if(item)
				//					ItemSender.reqMoveGoods(srcGrid.containerID, dstGrid.containerID, item.index, dstGrid.index);
			}
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			CONFIG::netDebug {
				NetDebug.LOG("[AppModule] [StoragePanel] show");
			}
				super.show(data, openTable, parentContiner);
			
			initEvent();
			
			goodsContainer.addEvents();
			
			if(!ItemSender.isReqStorage){
				ItemSender.getItemsByType(ItemContainerID.Storage);
			}else{
				refreshGrid();
			}
		}
		
		private function initEvent():void
		{
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.addEvent(ItemEvent.ITEM_INIT,initStorageDatas);			
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,refreshGrid);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,refreshGrid);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,refreshGrid);
			EventManager.addEvent(ItemEvent.ITEM_GET, getItem);
			EventManager.addEvent(ItemEvent.ITEM_GRID_ONLOCK,setLuckGridState);//带解锁
			EventManager.addEvent(ItemEvent.ITEM_GRID_CANLOCK,setLuckGridState);//可解锁
		}
		
		private function getItem(info:GridInfo):void
		{
			if(info.containerID!=ItemContainerID.Storage){
				return;
			}
			
			var item:ClientItemInfo=info.data as ClientItemInfo;
			ItemSender.StoreTobag(item.itemInfo.itemId,-1);
		}
		
		private function initStorageDatas(containerId:int):void
		{
			if(containerId!=ItemContainerID.Storage){
				return;
			}
			EventManager.removeEvent(ItemEvent.ITEM_INIT,initStorageDatas);
			setGridsCount(StorageManager.instance.Max_Grid_Count);
		}
		
		private function setGridsCount(count:int):void
		{
			goodsContainer.gridCount = count;
			StorageManager.instance.setGridNum(count);
			currentListData.removeAll();
			currentListData.addAll(StorageManager.instance.gridInfoDatas);
			refreshGrid();
		}
		
		private function refreshGrid(info:ClientItemInfo=null):void
		{
			if(info&&info.containerID!=ItemContainerID.Storage){
				return;
			}
			
			goodsContainer.dataProvider=currentListData;
			goodsContainer.dataProvider.updateAll();
			
			StorageManager.instance.setCheckType(null);
			goodsContainer.refleshGrids();		
		}
		
		private function setLuckGridState(containerID:int):void
		{
			if(containerID==ItemContainerID.Storage)
			{
				goodsContainer.refleshGrids();
			}
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
			super.onTouchTarget(target);
			switch (target) {
				case _skin.btn_zhengli:
					ItemSender.clearUpItem(ItemContainerID.Storage);
					break
				case _skin.btn_chucun:
					isSave=!isSave;
					enterOrLeaveSaveMode(isSave);
					EventManager.dispatchEvent(ItemEvent.CHANGE_ACCESS_STATE,isSave);
					break
			}
		}
		
		private static const HELPER_POINT:Point = new Point();
		protected var touchPointID:int = -1;
		public function onTouchItem(event:TouchEvent):void
		{
			if(!isSave) return;
			if(this.touchPointID >= 0)
			{
				var touch:Touch = event.getTouch(this, null, this.touchPointID);
				if(!touch || !this.stage)
				{
					//this should never happen
					return;
				}
				
				touch.getLocation(this.stage, HELPER_POINT);
				var isInBounds:Boolean = this.contains(this.stage.hitTest(HELPER_POINT));
				if(touch.phase === TouchPhase.MOVED)
				{
					if(isInBounds)
					{
						MouseCursorController.showTake();
					}
					else
					{
						MouseCursorController.showSave();
					}
				}else if(touch.phase === TouchPhase.ENDED){
					this.touchPointID = -1;
					if(isInBounds)
					{
						MouseCursorController.showTake();
					}
					else
					{
						MouseCursorController.showSave();
					}
				}
				return;
			}
			else //if we get here, we don't have a saved touch ID yet
			{
				touch = event.getTouch(this, TouchPhase.BEGAN);
				if(touch)
				{
					MouseCursorController.showTake();
					this.touchPointID = touch.id;
					return;
				}
				touch = event.getTouch(this, TouchPhase.HOVER);
				if(touch)
				{
					MouseCursorController.showTake();
					return;
				}
				
				//end of hover
				MouseCursorController.showSave();
			}
			
		}
		
		private function enterOrLeaveSaveMode(bool:Boolean):void
		{
			if (bool) 
			{
				MouseCursorController.showSave();
				if (!EventManager.hasEvent(SceneEvent.INTERACTIVE,onSceneTouch)) 
				{
					EventManager.addEvent(SceneEvent.INTERACTIVE,onSceneTouch);
				}
			}
			else
			{
				MouseCursorController.exitSaveMode();
				EventManager.removeEvent(SceneEvent.INTERACTIVE,onSceneTouch);
			}
		}
		
		private function onSceneTouch(...arg):void
		{
			var type:String=arg[0];
			if ( SceneEventAction3D.SCENE_MAP_MOUSE_DOWN==type) 
			{
				enterOrLeaveSaveMode(false);
				isSave=false;
			}
		}
		
		override public function hide():void
		{
			super.hide();
			goodsContainer.hide();
			enterOrLeaveSaveMode(false);
			isSave=false;
			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouchItem);
			EventManager.removeEvent(ItemEvent.ITEM_ADD,refreshGrid);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,refreshGrid);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,refreshGrid);
			EventManager.removeEvent(ItemEvent.ITEM_GRID_ONLOCK,setLuckGridState);//带解锁
			EventManager.removeEvent(ItemEvent.ITEM_GRID_CANLOCK,setLuckGridState);//可解锁
			EventManager.dispatchEvent(ItemEvent.CHANGE_ACCESS_STATE,false);		
		}
	}
}