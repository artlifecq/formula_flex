package com.rpgGame.appModule.role
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.appModule.bag.ItemSplitPanel;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.appModule.storage.StoragePanel;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangBackPack;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.MenuType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import flash.geom.Point;
	
	import app.message.GoodsType;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.themes.GuiThemeStyle;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.juese_Skin;
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
		private var _skin : juese_Skin;
		private var goodsContainer : GoodsContainerPanel;
		
		private var TAB_TYPE:Array;
		private var curType:Array;
		private var currentListData:ListCollection;
		
		private var storagePanel:StoragePanel;
		private var itemSplitPanel:ItemSplitPanel;
		private var toStorage:Boolean;
		private var toStorageGridInfo:GridInfo;
		
		public function PacksView(skin:juese_Skin)
		{
			_skin=skin;
			
			
			initPacks();
			initDatas();
		}
		
		private function initDatas():void
		{
			currentListData=new ListCollection();
			TAB_TYPE= [
				[GoodsType.ALL_GOODS],
				[GoodsType.EQUIPMENT], 
				[GoodsType.MEDICINE],
				[GoodsType.MATERIAL_COMBO,GoodsType.MATERIAL_ADVANCE], 
				[GoodsType.CHAT,GoodsType.GIFT,GoodsType.PROPERTY,GoodsType.BUFF,GoodsType.TRANSFER,GoodsType.RESURGENCE,
				GoodsType.TASK,GoodsType.MOUNT,GoodsType.TITLE,GoodsType.DUNGOEN,GoodsType.FACTION,GoodsType.PK,GoodsType.SPECIAL,
				GoodsType.SKILL_BOOK_MOUNT,GoodsType.SKILL_BOOK_HERO]
				];
			
			toStorageGridInfo=new GridInfo(ItemContainerID.Storage,-1);
		}
		
		private function initPacks():void
		{
			storagePanel=new StoragePanel();
			itemSplitPanel=new ItemSplitPanel();
			
			goodsContainer = new GoodsContainerPanel(_skin.lst_pack,ItemContainerID.BackPack,createItemRender);
			goodsContainer.acceptDropFromContainerIdArr = [ItemContainerID.BackPack, ItemContainerID.Storage, ItemContainerID.Role, ItemContainerID.Mount];
			goodsContainer.onDragDropEnd = onItemDroped;
			
			_skin.lst_pack.clipContent = true;
			_skin.lst_pack.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_skin.lst_pack.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			_skin.lst_pack.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.lst_pack.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			
			_skin.lst_pack.padding=3;
			GuiThemeStyle.setScrollerStyle(_skin.lst_pack, org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack);
		}
		
		
		public function show():void
		{
			initEvent();
			
			if(!ItemSender.isReqPack){
				ItemSender.getItemsByType(ItemContainerID.BackPack);
			}else{
				setGridsCount(BackPackManager.instance.hasOpenCount,true);
			}
			
			updateAmount();
		}
		
		private function updateAmount(type:int=3):void
		{
			if(type!=CharAttributeType.RES_GOLD&&type!=CharAttributeType.RES_MONEY&&
				type!=CharAttributeType.RES_BIND_GOLD&&type!=CharAttributeType.RES_BIND_MONEY){
				return;
			}
			
			var stat:SpriteStat=MainRoleManager.actorInfo.totalStat;
			_skin.txt_lijin.text =stat.getResData(CharAttributeType.RES_BIND_GOLD)+"";//绑金
			_skin.txt_yingzi.htmlText = MoneyUtil.getAutoHtmlMoneyString(stat.getResData(CharAttributeType.RES_MONEY) );//银子
			_skin.txt_yuanbao.text = stat.getResData(CharAttributeType.RES_GOLD)+"";//金子
			_skin.txt_yingzibang.htmlText = MoneyUtil.getAutoHtmlMoneyString(stat.getResData(CharAttributeType.RES_BIND_MONEY) );//绑银
			
			TipTargetManager.remove(_skin.txt_lijin);
			TipTargetManager.remove(_skin.txt_yingzi);
			TipTargetManager.remove(_skin.txt_yuanbao);
			TipTargetManager.remove(_skin.txt_yingzibang);
			TipTargetManager.show( _skin.txt_lijin, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,_skin.txt_lijin.text   ));
			TipTargetManager.show( _skin.txt_yingzi, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, _skin.txt_yingzi.htmlText));
			TipTargetManager.show( _skin.txt_yuanbao, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,  _skin.txt_yuanbao.text));
			TipTargetManager.show( _skin.txt_yingzibang, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,	_skin.txt_yingzibang.htmlText));
		}
		
		private function setGridsCount(count:int, refleshNow:Boolean):void
		{
			goodsContainer.gridCount = count;
			BackPackManager.instance.setGridNum(count);
			currentListData.removeAll();
			currentListData.addAll(BackPackManager.instance.gridInfoDatas);
			goodsContainer.dataProvider=currentListData;
			goodsContainer.dataProvider.updateAll();
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
				refreshPackGrid();
			}
		}
		
		
		/**
		 *刷新背包格子 
		 * 
		 */
		public function refreshPackGrid():void
		{
			var goodsInfo:Array = BackPackManager.instance.getAllItem();
			var i:int =0;
			var goodsLen:int = goodsInfo ? goodsInfo.length : 0;
			if(_skin.tab_pack.selectedIndex == 0)
			{
				goodsLen=BackPackManager.instance.gridInfoDatas.length;
			}
			for (i=0; i<goodsLen; i++)
			{
				goodsContainer.setGridInfo(i, goodsInfo[i], i);
			}
			
			while(currentListData.length>goodsLen){
				currentListData.pop();
			}
			
			goodsContainer.dataProvider.updateAll();
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
			var target : ClientItemInfo;
			if(dstGrid)
			{
				target  = dstGrid.data as ClientItemInfo;
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
			
			if(item.containerID==ItemContainerID.Storage){
				ItemSender.StoreTobag(item.itemInfo.itemId,dstGrid.index);
			}else if(item.containerID==ItemContainerID.Role){
				ItemSender.unwearEquip(item.itemInfo.itemId);
			}else{
				ItemSender.moveItem(srcGrid,dstGrid);
			}
		}
		
		private function changeItemBind(gameAlert:GameAlert,srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			if(gameAlert.clickType == AlertClickTypeEnum.TYPE_SURE)
			{
				BackPackManager.instance.isAlertChangeBind = gameAlert.isCheckSelected;
		/*		var item : ClientItemInfo = srcGrid.data as ClientItemInfo;
				if(item)
					ItemSender.reqMoveGoods(srcGrid.containerID, dstGrid.containerID, item.index, dstGrid.index);*/
			}
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
			ItemUseManager.useItem(grid.faceInfo as ClientItemInfo);
		}
		
		protected function onRightMouse(grid:IconCDFace):void
		{
			ItemUseManager.useItem(grid.faceInfo as ClientItemInfo);
		}
		
		/**
		 * 使用格子上的东西
		 * @param cd
		 * 
		 */		
		protected function onTouchGrid( grid:DragDropItem ):void
		{
			if(toStorage){//存到仓库去
				if(grid.gridInfo.data==null){
					return;
				}
				var item:ClientItemInfo = grid.gridInfo.data as ClientItemInfo;
				ItemSender.bagToStore(item.itemInfo.itemId,-1);
				return;
			}
			
			var realIndex:int =  goodsContainer.getRealIndex(grid.index);
			if(GoodsContainerPanel.isFaceMoving)//移动状态
			{
				goodsContainer.onFaceMoveSuccess(grid.gridInfo );
				return;
			}
			
			showMenu(grid);//显示菜单
		}
		
		public function showMenu(grid:IconCDFace):void
		{
			var item:ClientItemInfo = grid.faceInfo as ClientItemInfo;
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
			_skin.tab_pack.addEventListener(Event.CHANGE, onTab);
			EventManager.addEvent(ItemEvent.ITEM_INIT,initPackDatas);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(ItemEvent.CHANGE_ACCESS_STATE,changeAccessState);
			
			EventManager.addEvent(ItemEvent.ITEM_PRE_SPLITE, preSplit);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			
			goodsContainer.addEvents();
		}
		
		/**
		 * 物品拆分 
		 * @param info
		 * 
		 */		
		private function preSplit(info:ClientItemInfo):void
		{
			if(info.count <= 1)
			{
				return;
			}
			itemSplitPanel.show(info,"",this._skin.container);
			itemSplitPanel.x=235;
			itemSplitPanel.y=160;
		}
		
		private function changeAccessState(isSave:Boolean):void
		{
			toStorage=isSave;
		}
		
		private function initPackDatas(containerId:int):void 
		{
			if(containerId!=ItemContainerID.BackPack){
				return;
			}
			EventManager.removeEvent(ItemEvent.ITEM_INIT,initPackDatas);
			setGridsCount(BackPackManager.instance.hasOpenCount,true);
		}
		
		private function onTab(e:Event):void
		{
			onFreshItems();
		}
		
		private function onFreshItems(info:ClientItemInfo=null):void
		{
			if(info&&info.containerID!=ItemContainerID.BackPack){
				return;
			}
			
			BackPackManager.instance.tabbarIndex = _skin.tab_pack.selectedIndex;
			curType =TAB_TYPE[ _skin.tab_pack.selectedIndex ];
			
			currentListData.removeAll();
			currentListData.addAll(BackPackManager.instance.gridInfoDatas);
			
			if(_skin.tab_pack.selectedIndex == 0)
			{
				BackPackManager.instance.setCheckType(null);
				BackPackManager.instance.setUnusableGrid(false);
				goodsContainer.refleshGrids();
			}
			else
			{
				BackPackManager.instance.setCheckType(curType);
				BackPackManager.instance.setUnusableGrid(true);
				refreshPackGrid();
			}			
		}		
		
		internal function onTouchTarget(target : DisplayObject):Boolean
		{
			switch (target) {
				case _skin.btn_chushou:
					return true;
				case _skin.btn_zhengli:
					ItemSender.clearUpItem(ItemContainerID.BackPack);
					return true;
				case _skin.btn_cangku:
					storagePanel.show(null,"",this._skin.container);
					storagePanel.x=225;
					storagePanel.y=75;
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
		
		internal function onHide():void
		{
			goodsContainer.hide();
			
			_skin.tab_pack.removeEventListener(Event.CHANGE, onTab);
			
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);
			
			EventManager.removeEvent(ItemEvent.CHANGE_ACCESS_STATE,changeAccessState);
			EventManager.removeEvent(ItemEvent.ITEM_PRE_SPLITE, preSplit);
			
			TipTargetManager.remove(_skin.txt_yingzibang);
			
			storagePanel.hide();
			itemSplitPanel.hide();
		}
	}
}