package com.rpgGame.appModule.common
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.AlertInput;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.enum.item.ItemTypeEnum;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.lang.LangBackPack;
	import com.rpgGame.coreData.lang.LangGoods;
	
	import flash.geom.Point;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.themes.GuiThemeStyle;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
	
	import starling.core.Starling;
	
	import utils.TimerServer;
	
	/**
	 * 抽象的物品容器界面，不可直接实例化，可作为背包，仓库，交易，摆摊等基础面板<br/>
	 * 1、提供了物品移动，分拆, 添加，删除,整理，过滤刷新等基本功能<br/>
	 * 2、提供优化的渲染,可分页和滚动条，也可同时都有,做到最少显示数量<br/>
	 * @author wewell@163.com
	 * 
	 */
	final public class GoodsContainerPanel 
	{
		/** 可拖拽格子 **/
		protected static var movingFace:DragDropItem;
		/** 是否在移动 **/
		public static var isFaceMoving:Boolean =false;
		/** 拖动物品放下时 **/
		private static var helperGridInfo:GridInfo;
		
//		private static const refleshGridTimer : int = 0;
		protected var _dataProvider:ListCollection;
		/** 当前页拥有的格子数据量,可以通过setGridsCount来改变 **/
		public var gridCount:int;
		private var _dndGrids:Vector.<DragDropItem>;
		/** 物品容器管理器 **/
		protected var _mgr:GoodsContainerMamager;
		
		//可选
		/** 当有分页时有用 **/
		public var curPage:int;
		/** 接受从containerId拖过来的物品Array **/
		public var acceptDropFromContainerIdArr:Array;
		
		/**
		 *子类必须在init方法中完成以下属性覆盖
		 * 见ItemContainerID
		 */	
		private var containerId:int = -1;
		private var goodsList : List;
		private var createGoodsListItemRender:Function;
		public var updateGridLen : Function;	
		public var onDragDropEnd : Function;
		public function GoodsContainerPanel(list:List,container:int,createItemRender:Function)
		{
			createGoodsListItemRender = createItemRender;
			goodsList = list;
			init(container );
		}
		
		//---------------------初始一个背包/仓库容器----------------------
		protected function init(containerId:int):void
		{
			this.containerId = containerId;
			if(containerId == -1)
			{
				throw new Error("请先设置物品容器ID");
				return;
			}
			_mgr = GoodsContainerMamager.getMrg(containerId);
			_dndGrids = new Vector.<DragDropItem>;
			_dataProvider = new ListCollection();
			initList();
		}
		
		private function initList():void
		{
			var gridList:List = goodsList;
			//			gridList.paddingTop = gridList.paddingBottom = 10;
			if(!gridList)
				return;
			gridList.dataProvider =  dataProvider;
			gridList.itemRendererFactory = createItemRender;
			gridList.clipContent = true;
			gridList.scrollBarDisplayMode = "fixed";
			gridList.verticalScrollBarPosition = "right";
			gridList.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			gridList.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			GuiThemeStyle.setScrollerStyle(gridList, org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat);
		}
		
		/**
		 * 创建格子渲染器 
		 * 
		 */		
		private function createItemRender():GridItemRender
		{
			if(!createGoodsListItemRender)
				return null;
			var render:GridItemRender = createGoodsListItemRender();
			var grid:DragDropItem = render.getGrid();
			dndGrids.push(grid);
			return render;
		}
		
		/**
		 * 设置格子数量 
		 * @param count 数量
		 * @param refleshNow 是否刷新数据
		 * 
		 */		
		public function setGridsCount(count:int, refleshNow:Boolean):void
		{
			gridCount = count;
			//如果当前容器长度不够，则自动补充
			var len:int = dataProvider.length;
			for( var i:int = len; i < gridCount; i++ )
			{
				var gridInfo:GridInfo = new GridInfo(this.containerId, i);
				dataProvider.push(gridInfo);
			}
			dataProvider.updateAll();
			updateGridLen && updateGridLen();
			if(refleshNow)refleshGrids();
		}
		
		//-----------------------通过一些设置，使这个容器显示指定的内容---------------
		private var group : Array;
		private var itemType:int = ItemTypeEnum.ENUM_TYPE_ALL;
		private var itemQuality:int;
		public function setShowItemGroup(groups:Array):void
		{
			if(this.group == groups)
				return;
			this.group = groups;
			updateContainer();
		}
		
		public function setShowItemType(type:int):void
		{
			
		}
		
		private function updateContainer():void
		{
		
		}
		
		/**
		 * 获得指定索引可拖拽格子 
		 * @param index
		 * @return 
		 * 
		 */		
		private function getGridByIndex(index:int):DragDropItem
		{
			var gridInfo:GridInfo = dataProvider.getItemAt(index) as GridInfo;
			var i:int = gridInfo.realIndex;
			return ( i >= 0 && i < dndGrids.length ) ? dndGrids[i] : null;
		}
		
		/**
		 * 设置格子数据 
		 * @param index
		 * @param itemInfo
		 * @param gridIndex 不为-1表示背包格子需要显示不能使用的索引
		 */		
		public function setGridInfo(index:int, itemInfo:ItemInfo, gridIndex:int = -1):void
		{
			var gridInfo:GridInfo = dataProvider.getItemAt(index) as GridInfo;
			if(!gridInfo)
				return;
			gridInfo.data = itemInfo;
			gridInfo.isEnabled = _mgr.isEnabled(index);
			gridInfo.isUnlock = GoodsContainerMamager.isUnlock(containerId,index);
			if(itemInfo && gridIndex == -1)
			{
				gridInfo.isShowLockAsset = GoodsContainerMamager.getIsShowLockAsset(containerId, itemInfo.index);
			}
			else
			{
				gridInfo.isShowLockAsset = GoodsContainerMamager.getIsShowLockAsset(containerId, gridIndex);
			}
			dataProvider.updateItemAt(index);
			if(this.containerId != gridInfo.containerID)
			{
				NoticeManager.showNotify("有一个格子的数据出错了！！！");
			}
			var grid:DragDropItem = getGridByIndex(index%gridCount);
			if(!grid)return;
			grid.gridInfo = gridInfo;
			
			updateGridLen && updateGridLen();
		}
		
		/**
		 * 通过物品查询一个格子 
		 * @param iteminfo
		 * @return 
		 * 
		 */		
		public function getDragDropItemByItemInfo(iteminfo : ItemInfo):DragDropItem
		{
			var dragDropItem : DragDropItem;
			for each(dragDropItem in dndGrids)
			{
				if(dragDropItem.gridInfo.data == iteminfo)
					return dragDropItem;
			}
			return null;
		}
		
		protected function getGridInfoByItemInfo(iteminfo : ItemInfo):GridInfo
		{
			var dragDropItem : DragDropItem;
			var item : ItemInfo;
			for each(dragDropItem in dndGrids)
			{
				if(!dragDropItem || !dragDropItem.gridInfo)
					continue;
				item = dragDropItem.gridInfo.data as ItemInfo;
				if(item && item.index == iteminfo.index)
					return dragDropItem.gridInfo;
			}
			return null;
		}
		
		protected function refleshGridByItemIndex(index:int):void
		{
//			var itemInfo:ItemInfo = _mgr.getItemInfoByIndex(index);
//			var refleshIndex:int = itemInfo?itemInfo.index:index;
//			var dragDropItem : DragDropItem;
//			var item : ItemInfo;
//			for each(dragDropItem in dndGrids)
//			{
//				if(!dragDropItem || !dragDropItem.gridInfo)
//					continue;
//				item = dragDropItem.gridInfo.data as ItemInfo;
//				if(item && item.index == refleshIndex)
//					setGridInfo(dragDropItem.index,itemInfo);
//			}
//			TimerServer.add(refleshGrids,refleshGridTimer);
			refleshGrids();
		}
		
		/**
		 * 刷新数据
		 */				
		public function refleshGrids():void
		{
			var goodsInfo:Array = _mgr.getAllItem();
			var i:int =0;
			var goodsLen:int = goodsInfo ? goodsInfo.length : 0;
			for (i=0; i<gridCount; i++)
			{
				if(i < goodsLen)
				{
					setGridInfo(i, goodsInfo[i]);
				}
				else
				{
					setGridInfo(i, null);
				}
			}
			updateGridLen && updateGridLen();
			dataProvider.updateAll();
		}
		
		/**
		 * 刷新格子 
		 * @param containerId
		 * 
		 */		
		private function onRefleshGrids(containerId:int):void
		{
			if(containerId != this.containerId)return;
				refleshGrids();
		}
		
		private function refleshGrid(info:ItemInfo, newInfo:ItemInfo):void
		{
			if(!info || info.containerID != containerId) return;
			if(containerId == ItemContainerID.BackPack && BackPackManager.instance.tabbarIndex != 0)//背包中除了显示所有物品的分页都要刷新所有
			{
				refleshGrids();
			}
			else
			{
				setGridInfo(info.index, newInfo);
			}
		}
		
		/**
		 * 添加一个物品 
		 * @param info
		 * 
		 */		
		protected function onAddItem(info:ItemInfo):void
		{
			refleshGrid(info,info);
		}
		
		/**
		 * 物品发生变化 
		 * @param info
		 * 
		 */		
		private function onItemInfoChange(info:ItemInfo):void
		{
			refleshGrid(info,info);
		}
		
		/**
		 * 移除物品 
		 * @param info
		 * 
		 */		
		private function removeItem(info:ItemInfo):void
		{
			refleshGrid(info,null);
		}
		
		//============================拆分===============================
		 
		/**
		 * 物品拆分 
		 * @param info
		 * 
		 */		
		private function preSplit(info:ItemInfo):void
		{
			if(!info || info.containerID != containerId)return;
			if(info.count <= 1)
			{
				return;
			}
			
			var alert:AlertInput = AlertInput.show(LanguageConfig.getText(LangBackPack.ITEM_SPLIT_TIP),onInputSplitNum);
			alert.skin.txtInput.restrict="0-9";
			function onInputSplitNum(txt:String):void
			{
				var num:int = parseInt(txt);
				if(num <= 0)
				{
					NoticeManager.showNotify(LangBackPack.ITEM_SPLIT_NUM_ERR);
					return;
				}else if(num > info.count)
				{
					alert.skin.txtInput.text = info.count+"";
					num = info.count;
				}
				var firstEmptyIndex:int = _mgr.getFirstEmptyIndex();
				if(firstEmptyIndex == -1)
				{
					NoticeManager.showNotify(LangBackPack.ITEM_SPLIT_NO_GRID);
					return;
				}
				ItemSender.reqSplitGoods(info.containerID, info.index,firstEmptyIndex,num);
			}
		}
		
		//============================移动===============================
		/**
		 * 物品移动 
		 * @param info
		 * 
		 */		
		private function preMove(info:ItemInfo):void
		{
			if(!info ||  !_mgr.isEnabled(info.index))return;//info.containerID != containerId ||
			
			if(!movingFace)
			{
				movingFace = new DragDropItem( IcoSizeEnum.SIZE_44, -1);
				movingFace.touchable = movingFace.touchGroup = false;
			}
//			if(helperGridInfo == null)helperGridInfo = new GridInfo(info.containerID, info.index);
			movingFace.faceInfo = info;
			movingFace.setIconResName(ClientConfig.getItemIcon(info.icoName, IcoSizeEnum.SIZE_44 ));
			
			//拖出后仅在显示层清空此格子
			setGridInfo(info.index, null);
			
			startFaceMove();
		}
		
		/**
		 * 拖动物品放下时 
		 * @param srcGrid
		 * @param dstGrid
		 * 
		 */		
		private function onDropItem(srcGrid:GridInfo, dstGrid:GridInfo):void
		{
			//虽在战场，但战火未扔到自己身上
			if(dstGrid == null || dstGrid.containerID != containerId)return;
			
			if(!_mgr.isEnabled(srcGrid.index) ||  !_mgr.isEnabled(dstGrid.index) )
				return;
			if(_mgr.getIsShowBindLock())
			{
				NoticeManager.showNotify(LangGoods.GOODS_CANT_MOVE);
				return;
			}
			//是否接受从 containerId 拖过来的物品
			if( isAcceptDropFromContainer(srcGrid.containerID))
			{
				if(onDragDropEnd)
					onDragDropEnd(srcGrid, dstGrid);
				else
					onItemDroped(srcGrid, dstGrid);
			}
		}
		
		/**
		 * 背包物品移动 
		 * @param srcGrid
		 * @param dstGrid
		 * 
		 */		
		public function onItemDroped(srcGrid:GridInfo, dstGrid:GridInfo):void
		{
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
			ItemSender.reqMoveGoods(srcGrid.containerID, dstGrid.containerID, item.index, dstGrid.index);
		}
		
		/**
		 * 开始移动 
		 * 
		 */		
		private function startFaceMove():void
		{
			isFaceMoving = true;
			updateMovefacePos();
			Starling.current.stage.addChild(movingFace);
			TimerServer.addTick(updateMovefacePos);
		}
		
		/**
		 * 停止移动 
		 * @param removeFaceNow
		 * 
		 */		
		private function stopFaceMove(removeFaceNow:Boolean=true):void
		{
			TimerServer.remove(updateMovefacePos);
			isFaceMoving = false;
			
			TweenLite.killTweensOf(movingFace);
			if(removeFaceNow && movingFace != null)
			{
				movingFace.removeFromParent();
			}
		}
		
		/**
		 * 更新移动的face的坐标 
		 * 
		 */		
		private function updateMovefacePos():void
		{
			movingFace.x = int(Starling.current.nativeStage.mouseX) - 23;
			movingFace.y = int(Starling.current.nativeStage.mouseY) - 23;
		}
		
		/**
		 * 移动失败 
		 * 
		 */		
		private function onFaceMoveFail():void
		{
			var info:ItemInfo = movingFace.faceInfo as ItemInfo;
			var srcFace:DragDropItem = getGridByIndex(info.index);
			var pos:Point = srcFace.localToGlobal(new Point(0,0));
			if(movingFace.stage == null)Starling.current.stage.addChild(movingFace);
			TweenLite.to(movingFace,0.5,{x:pos.x, y:pos.y, onComplete:reShowSrcFace});
		}
		
		/**
		 * 移动失败处理 
		 * 
		 */		
		private function reShowSrcFace():void
		{
			if(!movingFace)return;
			var info:ItemInfo = movingFace.faceInfo as ItemInfo;
			if(info)
				GoodsContainerMamager.setItemInfo(info.containerID, info.index, info);
			movingFace.removeFromParent();
		}
		
		/**
		 * Face移动成功 
		 * @param dstIndex
		 * 
		 */		
		public function onFaceMoveSuccess(dstIndex:int):void
		{
			var info:ItemInfo = movingFace.faceInfo as ItemInfo;
			if(!info)
				return;
			var srcIndex:int = info.index;
			
			stopFaceMove();
			movingFace.removeFromParent();
			
			if(dstIndex == srcIndex && containerId == info.containerID)
			{
				GoodsContainerMamager.setItemInfo(info.containerID, info.index, info);
				return;
			}
			
			ItemSender.reqMoveGoods(info.containerID, containerId, srcIndex, dstIndex);
		}
		
		/**
		 * 移动失败，服务器返回的消息 
		 * 
		 */		
		private function onServerReturnMoveFail():void
		{
			reShowSrcFace();
		}
		
		/**
		 * 解锁格子 
		 * @param containerId
		 * @param index
		 * 
		 */		
		protected function onItemGridUnlock(containerId:int, index:int):void
		{
			onRefleshGrids(containerId);
		}
		
		/**
		 *当面板显示时,给子类处理自身逻辑
		 */	
		public function show():void
		{
			refleshGrids();
			addEvents();
		}
		
		public function addEvents():void
		{
			EventManager.addEvent(ItemEvent.ITEM_ADD,onAddItem);
			EventManager.addEvent(ItemEvent.ITEM_CHANG,onItemInfoChange);
			EventManager.addEvent(ItemEvent.ITEM_DELETE,removeItem);
			EventManager.addEvent(ItemEvent.ITEM_PRE_SPLITE, preSplit);
			EventManager.addEvent(ItemEvent.ITEM_PRE_MOVE, preMove);
			EventManager.addEvent(ItemEvent.ITEM_DROPED, onDropItem);
			EventManager.addEvent(ItemEvent.ITEM_MOVE_FAIL, onServerReturnMoveFail);
//			EventManager.addEvent(ItemEvent.ITEM_GRID_UNLOCK, onItemGridUnlock);
			
			EventManager.addEvent(ItemEvent.ITEM_REFLESH_BY_ITEM_INDEX,refleshGridByItemIndex);
			EventManager.addEvent(ItemEvent.ITEM_CONTAINER_REFLESH, onRefleshGrids);
		}
		
		/**
		 *当面板隐藏时,给子类处理自身逻辑
		 */
		public function hide():void
		{
			stopFaceMove();
			EventManager.removeEvent(ItemEvent.ITEM_ADD,onAddItem);
			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onItemInfoChange);
			EventManager.removeEvent(ItemEvent.ITEM_DELETE,removeItem);
			EventManager.removeEvent(ItemEvent.ITEM_PRE_SPLITE, preSplit);
			EventManager.removeEvent(ItemEvent.ITEM_PRE_MOVE, preMove);
			EventManager.removeEvent(ItemEvent.ITEM_DROPED, onDropItem);
			EventManager.removeEvent(ItemEvent.ITEM_MOVE_FAIL, onServerReturnMoveFail);
//			EventManager.removeEvent(ItemEvent.ITEM_GRID_UNLOCK, onItemGridUnlock);
			
			EventManager.removeEvent(ItemEvent.ITEM_REFLESH_BY_ITEM_INDEX,refleshGridByItemIndex);
			EventManager.removeEvent(ItemEvent.ITEM_CONTAINER_REFLESH, onRefleshGrids);
		}
		
		//===========================给子类调用==============================
		//
		
		/**
		 * 是否接受从 containerId 拖过来的物品
		 * 
		 */		
		private function isAcceptDropFromContainer(containerId:int):Boolean
		{
			return containerId == this.containerId || (acceptDropFromContainerIdArr && acceptDropFromContainerIdArr.indexOf(containerId) != -1);
		}
		
		protected function getFirstEmptyIndex():int
		{
			return -1;
		}
		
		public function getRealIndex(index:int):int
		{
			return index%gridCount + curPage * gridCount;
		}
		
		public function get container():int
		{
			return containerId;
		}

		/** 可拖动格子,若容器为List，可通过list.itemRendererFactory生成DragDropItem,否则子类自行设置 **/
		public function get dndGrids():Vector.<DragDropItem>
		{
			return _dndGrids;
		}

		/** 数据<GridInfo> **/
		public function get dataProvider():ListCollection
		{
			return _dataProvider;
		}


	}
}