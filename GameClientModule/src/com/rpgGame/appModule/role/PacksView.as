package com.rpgGame.appModule.role
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.alert.GameAlertExt;
	import com.rpgGame.app.ui.tips.data.AmountTipData;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.app.view.uiComponent.menu.Menu;
	import com.rpgGame.appModule.bag.ItemBatchPanel;
	import com.rpgGame.appModule.bag.ItemSplitPanel;
	import com.rpgGame.appModule.common.GoodsContainerPanel;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.appModule.shop.BackpackShopExt;
	import com.rpgGame.appModule.shop.ItemSellAlertExtPanelExt;
	import com.rpgGame.appModule.storage.StoragePanel;
	import com.rpgGame.core.controller.MouseCursorController;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.MouseCursorEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.lang.LangQ_BackPack;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.MenuType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.coreData.utils.FilterUtil;
	
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBar;
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	import feathers.themes.GuiThemeStyle;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.juese_Skin;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	import utils.KeyboardMananger;
	
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
		private var itemBatchPanel:ItemBatchPanel;
		private var toStorage:Boolean;
		private var toStorageGridInfo:GridInfo;
		private var cdTime:uint;
		private var leftCD:int;
		private var _shopPanel:BackpackShopExt;
		
		private var ylTip:DynamicTipData;
		private var byTip:DynamicTipData;
		private var ybTip:DynamicTipData;
		private var ljTip:DynamicTipData;
		
		private var ylData:AmountTipData;
		private var byData:AmountTipData;
		private var ybData:AmountTipData;
		private var ljData:AmountTipData;
		
		private var _tishiEff:InterObject3D;
		private var _tishiEffContaner:Inter3DContainer;
		
		public function PacksView(skin:juese_Skin)
		{
			_skin=skin;
			
			_tishiEffContaner=new Inter3DContainer();
			initPacks();
			initDatas();
			
		}
		
		private function initDatas():void
		{
			currentListData=new ListCollection();
			TAB_TYPE= [
				[GoodsType.ALL_GOODS],
				[GoodsType.EQUIPMENT,GoodsType.EQUIPMENT1,GoodsType.EQUIPMENT2], 
				[GoodsType.MEDICINE],
				[GoodsType.MATERIAL_COMBO,GoodsType.MATERIAL_ADVANCE], 
				[GoodsType.CHAT,GoodsType.GIFT,GoodsType.PROPERTY,GoodsType.BUFF,GoodsType.TRANSFER,GoodsType.RESURGENCE,
					GoodsType.TASK,GoodsType.MOUNT,GoodsType.TITLE,GoodsType.DUNGOEN,GoodsType.MERIDIANSTONE]
			];
			
			toStorageGridInfo=new GridInfo(ItemContainerID.Storage,-1);
			
			ylTip=new DynamicTipData();
			byTip=new DynamicTipData();
			ybTip=new DynamicTipData();
			ljTip=new DynamicTipData();
			
			ylData=new AmountTipData();
			byData=new AmountTipData();
			ybData=new AmountTipData();
			ljData=new AmountTipData();
			
			
			ylTip.data=ylData;
			byTip.data=byData;
			ybTip.data=ybData;
			ljTip.data=ljData;
			
			ylData.name="银两:";
			ylData.des=ItemConfig.getQItemByID(4).q_describe;
			byData.name="绑银:";
			byData.des=ItemConfig.getQItemByID(6).q_describe;
			ybData.name="元宝:";
			ybData.des=ItemConfig.getQItemByID(3).q_describe;
			ljData.name="礼金:";
			ljData.des=ItemConfig.getQItemByID(5).q_describe;
		}
		
		private function initPacks():void
		{
			_skin.skinKuang.visible=false;
			storagePanel=new StoragePanel();
			itemSplitPanel=new ItemSplitPanel();
			itemBatchPanel=new ItemBatchPanel();
			
			goodsContainer = new GoodsContainerPanel(_skin.lst_pack,ItemContainerID.BackPack,createItemRender);
			goodsContainer.acceptDropFromContainerIdArr = [ItemContainerID.BackPack, ItemContainerID.Storage, ItemContainerID.Role, ItemContainerID.Mount];
			goodsContainer.onDragDropEnd = onItemDroped;
			
			GuiThemeStyle.setScrollerStyle(_skin.lst_pack, org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack);
			_skin.lst_pack.clipContent = true;
			_skin.lst_pack.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			//			_skin.lst_pack.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			_skin.lst_pack.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.lst_pack.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			
			_skin.lst_pack.padding=0.5;
			(_skin.lst_pack.layout as TiledRowsLayout).horizontalGap=0.5;
			(_skin.lst_pack.layout as TiledRowsLayout).verticalGap=0.5;
			Mgr.shopMgr.sellItemCall=ItemSellAlertExtPanelExt.showAlert;
			_skin.lst_pack.filter=FilterUtil.getHightLightFilter();
		}
		
		
		public function show():void
		{
			_skin.packs.visible=true;
			initEvent();
			setGridsCount(BackPackManager.instance.Max_Grid_Count,true);
			updateAmount();
			BackPackManager.instance.isShowRole=true;
		}
		
		private function updateAmount(type:int=3):void
		{
			if(type!=CharAttributeType.RES_GOLD&&type!=CharAttributeType.RES_MONEY&&
				type!=CharAttributeType.RES_BIND_GOLD&&type!=CharAttributeType.RES_BIND_MONEY){
				return;
			}
			
			var stat:SpriteStat=MainRoleManager.actorInfo.totalStat;
			_skin.txt_lijin.text =stat.getResData(CharAttributeType.RES_BIND_GOLD)+"";//绑金
			_skin.txt_yingzi.text = stat.getResData(CharAttributeType.RES_MONEY) +"";//银子
			_skin.txt_yuanbao.text = stat.getResData(CharAttributeType.RES_GOLD)+"";//金子
			_skin.txt_yingzibang.text = stat.getResData(CharAttributeType.RES_BIND_MONEY)+"";//绑银
			
			
			ylData.value=_skin.txt_yingzi.text;
			byData.value=_skin.txt_yingzibang.text;
			ybData.value=_skin.txt_yuanbao.text;
			ljData.value=_skin.txt_lijin.text;			
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
				BackPackManager.instance.setCheckType(null);
				BackPackManager.instance.setUnusableGrid(false);
				goodsContainer.refleshGrids();
			}
			else
			{
				BackPackManager.instance.setCheckType(curType);
				BackPackManager.instance.setUnusableGrid(false);
				goodsContainer.refleshGrids();
				//				refreshPackGrid();
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
						var alertSet : AlertSetInfo =  new AlertSetInfo(LangQ_BackPack.CHANGE_ITEM_BIND);
						alertSet.isShowCBox = true;
						GameAlert.showAlert(alertSet,changeItemBind,srcGrid,dstGrid);
						return;
					}
				}
			}
			
			if(item.containerID==ItemContainerID.Storage){
				ItemSender.StoreTobag(item.itemInfo.itemId,dstGrid.index);
			}else if(item.containerID==ItemContainerID.Role){
				ItemSender.unwearEquip(item.itemInfo.itemId,dstGrid.index);
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
			grid.checkDrag=checkDrag;
			
			return render;
		}
		
		/**
		 *返回为真就不能拖动了 
		 * @return 
		 * 
		 */
		private function checkDrag():Boolean
		{
			return GoodsContainerPanel.isFaceMoving||_skin.tab_pack.selectedIndex!=0;
		}
		
		protected function onDoubleClick(grid:IconCDFace):void
		{
			if(storagePanel.parent){
				var item:ClientItemInfo = grid.faceInfo as ClientItemInfo;
				if (!item) 
				{
					return;
				}
				ItemSender.bagToStore(item.itemInfo.itemId,-1);
				return;	
			}
			
			useItem(grid.faceInfo as ClientItemInfo);
			Menu.GetInstance().hide();
		}
		
		private function useItem(grid:ClientItemInfo):void
		{
			ItemUseManager.useItem(grid);
		}
		
		protected function onRightMouse(grid:IconCDFace):void
		{
			Menu.GetInstance().hide();
			ItemUseManager.useItem(grid.faceInfo as ClientItemInfo);
		}
		
		/**
		 * 使用格子上的东西
		 * @param cd
		 * 
		 */		
		protected function onTouchGrid( grid:DragDropItem ):void
		{
			var item:ClientItemInfo = grid.gridInfo.data as ClientItemInfo;
			if(toStorage){//存到仓库去
				if(grid.gridInfo.data==null){
					return;
				}
				
				ItemSender.bagToStore(item.itemInfo.itemId,-1);
				return;
			}
			
			var realIndex:int =  goodsContainer.getRealIndex(grid.index);
			if(grid.gridInfo.isUnlock&&(realIndex+1)>BackPackManager.instance.hasOpenCount)
			{
				BackPackManager.instance.unLockGrid(realIndex);
				return;
			}
			if(GoodsContainerPanel.isFaceMoving)//移动状态
			{
				goodsContainer.onFaceMoveSuccess(grid.gridInfo );
				return;
			}
			if (item&&Mouse.cursor == MouseCursorEnum.SELL) 
			{
				if (item.qItem.q_sell==1) 
				{
					ItemSellAlertExtPanelExt.showAlert(grid.gridInfo.data as ClientItemInfo);
				}
				else
				{
					NoticeManager.mouseFollowNotify("该物品无法出售");
				}
				
				return;
			}
			
			if(KeyboardMananger.isKeyDown(Keyboard.CONTROL))
			{
				EventManager.dispatchEvent(ChatEvent.SHOW_GOODS, grid.gridInfo.data);
				return;
			}
			Menu.GetInstance().hide();
			showMenu(grid);
		}
		
		public function showMenu(grid:IconCDFace):void
		{
			var item:ClientItemInfo = grid.faceInfo as ClientItemInfo;
			if( item == null )
				return;
			if(BackPackManager.instance.getIsShowBindLock())
				return;
			var pos:Point = grid.parent.localToGlobal(new Point(grid.x+2,grid.y+IcoSizeEnum.SIZE_40));
			
			var menus:Array;
			
			if(item.type == GoodsType.EQUIPMENT)
			{
				menus= MenuType.EQUIP_MENUS;
			}else
			{
				menus= MenuType.ITEM_MENUS;
			}
			
			var showMenus:Array=[];
			var outMenus:Array=[];//排除的列表
			if(_skin.tab_pack.selectedIndex!=0)//不在全部标签不能移动
			{
				outMenus.push(LangMenu.MOVE);
			}
			if(item.itemInfo.num<2){
				outMenus.push(LangMenu.SPLIT);
				outMenus.push(LangMenu.BATCH_ITM);
			}
			if(item.qItem.q_whether_batch==0&&outMenus.indexOf(LangMenu.BATCH_ITM)==-1){
				outMenus.push(LangMenu.BATCH_ITM);
			}
			if(item.qItem.q_drop==0){//不可丢弃
				outMenus.push(LangMenu.DISCARDED);
			}
			
			var num:int=menus.length;
			for(var i:int=0;i<num;i++){
				if(outMenus.indexOf(menus[i])==-1){//不是排除列表里面的
					showMenus.push(menus[i]);
				}
			}
			
			MenuManager.showMenu(showMenus,  grid.faceInfo, pos.x, pos.y, 40, _skin.container);
		}
		
		private function initEvent():void
		{
			_skin.tab_pack.addEventListener(Event.CHANGE, onTab);
			
			EventManager.addEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.addEvent(ItemEvent.CHANGE_ACCESS_STATE,changeAccessState);
			EventManager.addEvent(ItemEvent.ITEM_GRID_ONLOCK,setLuckGridState);//带解锁
			EventManager.addEvent(ItemEvent.ITEM_GRID_CANLOCK,setLuckGridState);//可解锁
			
			EventManager.addEvent(ItemEvent.ITEM_PRE_SPLITE, preSplit);
			EventManager.addEvent(ItemEvent.ITEM_BATCH, preBatch);
			EventManager.addEvent(ItemEvent.ITEM_DISCARDED, preDiscard);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,levelChange);
			
			
			
			goodsContainer.addEvents();
			
			TipTargetManager.show( _skin.icon_yingzi, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ylTip ));
			TipTargetManager.show( _skin.name_yz, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ylTip ));
			TipTargetManager.show( _skin.txt_yingzi, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ylTip ));
			
			TipTargetManager.show( _skin.icon_yingzibang, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,  byTip));
			TipTargetManager.show( _skin.name_by, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,  byTip));
			TipTargetManager.show( _skin.txt_yingzibang, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,  byTip));
			
			TipTargetManager.show( _skin.icon_yuanbao, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,ybTip ));
			TipTargetManager.show( _skin.name_yb, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,ybTip ));
			TipTargetManager.show( _skin.txt_yuanbao, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,ybTip ));
			
			TipTargetManager.show( _skin.icon_lijin, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ljTip));
			TipTargetManager.show( _skin.name_lj, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ljTip));
			TipTargetManager.show( _skin.txt_lijin, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ljTip));
		}
		
		private function levelChange():void
		{
			var oldV:Number=(_skin.lst_pack.getVerticalScrollBar() as ScrollBar).value
			goodsContainer.dataProvider.updateAll();
			_skin.lst_pack.scrollToPosition(0,oldV,0);
		}
		
		private function preDiscard(info:ClientItemInfo):void
		{
			if(info.qItem.q_drop_confirm==1){//需要二次确认
				//				var alertSet:AlertSetInfo=new AlertSetInfo(LangQ_BackPack.ITEM_dropItemToScene_3);
				//				GameAlert.showAlert(alertSet,okDiscard,info);
				
				//				var alertSet:AlertSetInfo=new AlertSetInfo(LangQ_BackPack.ITEM_dropItemToScene_3);
				//				GameAlert.showAlert(alertSet,okDiscard,info);
				GameAlertExt.show("这件物品看起来还不错哦！你确定要丢弃吗？",okDiscard,[info]);
			}else{
				if(info.qItem.q_drop==0){//不可丢弃
					NoticeManager.showNotifyById(12010);
					return;
				}
				ItemSender.discardItem(info);
			}
		}
		
		private function okDiscard(info:ClientItemInfo):void
		{
			//if(gameAlert.clickType==AlertClickTypeEnum.TYPE_SURE){
			ItemSender.discardItem(info);
			//}
		}
		
		private function preBatch(info:ClientItemInfo):void
		{
			if(info.count <= 1)
			{
				return;
			}
			itemBatchPanel.show(info,"",this._skin.container);
			itemBatchPanel.x=235;
			itemBatchPanel.y=160;
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
		
		private function setLuckGridState(containerID:int):void
		{
			if(containerID==ItemContainerID.BackPack)
			{
				goodsContainer.refleshGrids();
			}
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
			Menu.GetInstance().hide();
			BackPackManager.instance.tabbarIndex = _skin.tab_pack.selectedIndex;
			curType =TAB_TYPE[ _skin.tab_pack.selectedIndex ];
			
			currentListData.removeAll();
			currentListData.addAll(BackPackManager.instance.gridInfoDatas);
			var oldV:Number=(_skin.lst_pack.getVerticalScrollBar() as ScrollBar).value;
			if(_skin.tab_pack.selectedIndex == 0)
			{
				BackPackManager.instance.setCheckType(null);
				BackPackManager.instance.setUnusableGrid(false);
				goodsContainer.refleshGrids();
			}
			else
			{
				BackPackManager.instance.setCheckType(curType);
				BackPackManager.instance.setUnusableGrid(false);
				goodsContainer.refleshGrids();
			}			
			
			_skin.lst_pack.scrollToPosition(0,oldV,0);
			//			_skin.lst_pack.scrollToDisplayIndex(getScrollIndex(info));//滚动到最新操作物品处
			//切换页
			if (!info&&Mouse.cursor == MouseCursorEnum.SELL) 
			{
				enterOrLeaveSellMode(false);
			}
		}		
		
		private function getScrollIndex(itemInfo:ClientItemInfo):int
		{
			var datas:Array=_skin.lst_pack.dataProvider.data as Array;
			var num:int=datas.length;
			for(var i:int=0;i<num;i++){
				var grid:GridInfo=datas[i];
				if(grid){
					var info:ClientItemInfo=grid.data as ClientItemInfo;
					if(info==itemInfo){
						return i;
					}
				}
			}
			return -1;
		}
		private function enterOrLeaveSellMode(bool:Boolean):void
		{
			if (bool) 
			{
				MouseCursorController.showSell();
				//				BreatheTweenUtil.add(_skin.imgBg,StaticValue.OEANGE_TEXT,30);
				_skin.skinKuang.visible=true;
				showBG(true,0.5);
				//				EventManager.dispatchEvent(ItemEvent.ITEM_RECLAIM_ADD,true);
				if (!EventManager.hasEvent(SceneEvent.INTERACTIVE,onSceneTouch)) 
				{
					EventManager.addEvent(SceneEvent.INTERACTIVE,onSceneTouch);
				}		
			}
			else
			{
				MouseCursorController.exitSellMode();
				//				BreatheTweenUtil.remove(_skin.imgBg);
				_skin.skinKuang.visible=false;
				showBG(false,0.5);
				//				EventManager.dispatchEvent(ItemEvent.ITEM_RECLAIM_CANCEL,false);
				EventManager.removeEvent(SceneEvent.INTERACTIVE,onSceneTouch);
			}
		}
		private function onSceneTouch(...arg):void
		{
			var type:String=arg[0];
			if ( SceneEventAction3D.SCENE_MAP_MOUSE_DOWN==type) 
			{
				enterOrLeaveSellMode(false);
			}
		}
		internal function onTouchTarget(target : DisplayObject):Boolean
		{
			if(_blackBG&&_blackBG.graphics==target)
			{
				enterOrLeaveSellMode(false);
				return true;
			}
			switch (target) {
				case _skin.btn_chushou:
					enterOrLeaveSellMode(Mouse.cursor != MouseCursorEnum.SELL);
					return true;
				case _skin.btn_zhengli:
					enterOrLeaveSellMode(false);
					if(leftCD!=0){
						var alertSet:AlertSetInfo=new AlertSetInfo(LangQ_BackPack.ITEM_SORT_CD);
						alertSet.alertInfo.value=alertSet.alertInfo.value.replace(/#/,leftCD);
						NoticeManager.mouseFollowNotify(alertSet.alertInfo.value);
						return true;
					}
					GrayFilter.gray(_skin.btn_zhengli);
					cdTime=setInterval(cdComplete,1000);
					leftCD=10;
					ItemSender.clearUpItem(ItemContainerID.BackPack);
					return true;
				case _skin.btn_cangku:
					enterOrLeaveSellMode(false);
					if(storagePanel.parent){
						storagePanel.hide();
						return true;
					}
					storagePanel.show(null,"",this._skin.container);
					storagePanel.x=213;
					storagePanel.y=87;
					return true;
				case _skin.btn_shangdian:
					enterOrLeaveSellMode(false);
					if (shopPanel.parent) 
					{
						shopPanel.hide();
						return true;
					}
					shopPanel.x=213;
					shopPanel.y=87;
					//this._skin.container.addChild(shopPanel);
					shopPanel.show(null,"",this._skin.container);
					return true;
				case _skin.btn_getYuanbao:
					enterOrLeaveSellMode(false);
					return true;
			}
			return false;
		}
		
		private function cdComplete():void
		{
			if(leftCD==0){
				clearInterval(cdTime);
				cdTime=0;
				_skin.btn_zhengli.filter=null;
				return;
			}
			leftCD--;
		}
		
		internal function onHide():void
		{
			BackPackManager.instance.isShowRole=false;
			_skin.packs.visible=false;
			goodsContainer.hide();
			
			_skin.tab_pack.removeEventListener(Event.CHANGE, onTab);
			
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_REMOVE,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onFreshItems);
			EventManager.removeEvent(ItemEvent.ITEM_GRID_ONLOCK,setLuckGridState);//带解锁
			EventManager.removeEvent(ItemEvent.ITEM_GRID_CANLOCK,setLuckGridState);//可解锁
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);
			EventManager.removeEvent(ItemEvent.ITEM_BATCH, preBatch);
			EventManager.removeEvent(ItemEvent.CHANGE_ACCESS_STATE,changeAccessState);
			EventManager.removeEvent(ItemEvent.ITEM_PRE_SPLITE, preSplit);
			EventManager.removeEvent(ItemEvent.ITEM_DISCARDED, preDiscard);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,levelChange);
			
			TipTargetManager.remove( _skin.icon_yingzi);
			TipTargetManager.remove( _skin.name_yz);
			TipTargetManager.remove( _skin.txt_yingzi);
			
			TipTargetManager.remove( _skin.icon_yingzibang);
			TipTargetManager.remove( _skin.name_by);
			TipTargetManager.remove( _skin.txt_yingzibang);
			
			TipTargetManager.remove( _skin.icon_yuanbao);
			TipTargetManager.remove( _skin.name_yb);
			TipTargetManager.remove( _skin.txt_yuanbao);
			
			TipTargetManager.remove( _skin.icon_lijin);
			TipTargetManager.remove( _skin.name_lj);
			TipTargetManager.remove( _skin.txt_lijin);
			
			storagePanel.hide();
			itemSplitPanel.hide();
			if (_shopPanel) 
			{
				MCUtil.removeSelf(_shopPanel);
			}
			if (Mouse.cursor == MouseCursorEnum.SELL) 
			{
				enterOrLeaveSellMode(false);
			}
		}
		
		public function get shopPanel():BackpackShopExt
		{
			if (!_shopPanel) 
			{
				_shopPanel=new BackpackShopExt();
			}
			return _shopPanel;
		}
		
		public function showEff():void
		{
			
		}
		
		private function showBG(isAdd:Boolean,alpha:Number):void
		{
			if(isAdd&&!_blackBG){
				drawBG(alpha);
			}else{
				if(_blackBG){
					_blackBG.removeFromParent(true);
					_blackBG=null;
				}
			}
		}
		
		private var _blackBG:Sprite;
		private function drawBG(alpha:Number):void
		{
			var index:int=_skin.container.getChildIndex(_skin.packs);
			_blackBG=new Sprite();
			_blackBG.graphics.beginFill(0x000000,alpha);
			_blackBG.graphics.drawRect(0,0,10,10);
			_blackBG.graphics.endFill();
			
			_skin.container.addChildAt( _blackBG , index );
			updateResize(null);
		}
		
		private function updateResize(e:*):void
		{
			_blackBG.width = Starling.current.nativeStage.stageWidth;
			_blackBG.height = Starling.current.nativeStage.stageHeight;
			var p:Point=new Point(0,0);
			p=_skin.container.globalToLocal(p);	
			_blackBG.x=p.x;
			_blackBG.y=p.y;
		}
	}
}