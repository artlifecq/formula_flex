package com.rpgGame.appModule.common
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.appModule.common.itemRender.GridItemRender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GridOpenCfg;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.enum.item.ItemTypeEnum;
	import com.rpgGame.coreData.info.face.IBaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemGridUnlockInfo;
	import com.rpgGame.coreData.lang.LangGoods;
	
	import flash.geom.Point;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.themes.GuiThemeStyle;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
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
		
		public function set dataProvider(value:ListCollection):void
		{
			_dataProvider = value;
			goodsList.dataProvider =  _dataProvider;
		}
		
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
		
		public function setGrayForData(data:IBaseFaceInfo,gray:Boolean):void
		{
			var num:int=goodsList.dataProvider.length;
			for(var i:int=0;i<num;i++){
				var info:GridInfo=goodsList.dataProvider.getItemAt(i) as GridInfo;
				if(info&&info.data==data){
					info.isGray=gray;				
					goodsList.dataProvider.updateItemAt(i);
					break;
				}
			}
		}
		
		public function setGrayIsSelect(data:IBaseFaceInfo,isselect:Boolean):void
		{
			var num:int=goodsList.dataProvider.length;
			for(var i:int=0;i<num;i++){
				var info:GridInfo=goodsList.dataProvider.getItemAt(i) as GridInfo;
				if(info&&info.data==data){
					info.isSelsce=isselect;
					goodsList.dataProvider.updateItemAt(i);
					break;
				}
			}
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
			//			gridList.verticalScrollBarPosition = "right";
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
			if(count<gridCount){
				while(dataProvider.length>count){//移除超出部分
					dataProvider.removeItemAt(dataProvider.length-1);
				}
			}
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
		public function getFreeGridInfo():GridInfo
		{
			var data:Array=(dataProvider.data as Array);
			var len:int=data.length;
			var grid:GridInfo
			for (var i:int=0;i<len;i++) 
			{
				grid=data[i];
				if (grid.data==null&&!grid.isUnlock) 
				{
					return grid;
				}
			}
			return null;
		}
		public function getFreeGridInfoIndex():int
		{
			var grid:GridInfo=getFreeGridInfo();
			if (grid) 
			{
				return grid.index;
			}
			return -1;
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
		
		//		/**
		//		 * 获得指定索引可拖拽格子 
		//		 * @param index
		//		 * @return 
		//		 * 
		//		 */		
		//		private function getGridByIndex(index:int):DragDropItem
		//		{
		//			return index<dndGrids.length?dndGrids[index]:null;
		//		}
		
		/**
		 * 依据下标获取格子
		 * */
		public function getGridIndex(index:int):DragDropItem
		{
			for(var i:int=0;i<dndGrids.length;i++)
			{
				var item:DragDropItem=dndGrids[i];
				if(item.index==index)
					return item;
			}
			return null;
		}
		
		/**
		 * 设置格子数据 
		 * @param index
		 * @param itemInfo
		 * @param gridIndex 不为-1表示背包格子需要显示不能使用的索引
		 */		
		public function setGridInfo(index:int, itemInfo:ClientItemInfo, gridIndex:int = -1):void
		{
			var gridInfo:GridInfo = dataProvider.getItemAt(index) as GridInfo;
			if(!gridInfo)
				return;
			if(gridInfo.data!=null&&gridInfo.data==itemInfo){
				return;
			}
			gridInfo.data = itemInfo;
			gridInfo.isEnabled = _mgr?_mgr.isEnabled(index):true;
			gridInfo.isUnlock =  _mgr?_mgr.isUnlock(index):false;
			
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
			//			var grid:DragDropItem = getGridByIndex(index);
			//			if(!grid)return;
			//			grid.gridInfo = gridInfo;
			updateGridLen && updateGridLen();
		}
		
		/**
		 * 通过物品查询一个格子 
		 * @param iteminfo
		 * @return 
		 * 
		 */		
		public function getDragDropItemByItemInfo(iteminfo : ClientItemInfo):DragDropItem
		{
			var dragDropItem : DragDropItem;
			for each(dragDropItem in dndGrids)
			{
				if(dragDropItem.gridInfo.data == iteminfo)
					return dragDropItem;
			}
			return null;
		}
		
		/**通过唯一ID获取一个格子信息*/
		public function getDragDropItemByLong(id : long):ClientItemInfo
		{
			var dragDropItem : DragDropItem;
			for each(dragDropItem in dndGrids)
			{
				if(dragDropItem.gridInfo.data&&(dragDropItem.gridInfo.data as ClientItemInfo).itemInfo.itemId.EqualTo(id))
					return (dragDropItem.gridInfo.data as ClientItemInfo);
			}
			return null;
		}
		/**通过唯一ID获取一个格子信息*/
		public function geGridInfoByLong(id : long):GridInfo
		{
			var dragDropItem : GridInfo;
			for each(dragDropItem in dataProvider.data)
			{
				if(dragDropItem.data&&(dragDropItem.data as ClientItemInfo).itemInfo.itemId.EqualTo(id))
					return (dragDropItem);
			}
			return null;
		}
		/**定位到指定格子*/
		public function atoGrid(index):void
		{
			goodsList.scrollToDisplayIndex(index);
		}
		
		protected function getGridInfoByItemInfo(iteminfo : ClientItemInfo):GridInfo
		{
			var dragDropItem : DragDropItem;
			var item : ClientItemInfo;
			for each(dragDropItem in dndGrids)
			{
				if(!dragDropItem || !dragDropItem.gridInfo)
					continue;
				item = dragDropItem.gridInfo.data as ClientItemInfo;
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
			updateList();
			//			dataProvider.updateAll();
		}
		
		/**不要跳格子 还是循环刷新吧*/
		public function updateList():void
		{
			for(var i:int=0;i<dataProvider.length;i++)
			{
				dataProvider.updateItemAt(i);
			}
		}
		
		/**
		 *通过数据刷新格子 
		 * @param datas
		 * 
		 */
		public function refleshGridsByDatas(datas:Vector.<ClientItemInfo>):void
		{
			var i:int =0;
			var goodsLen:int = datas ? datas.length : 0;
			for (i=0; i<gridCount; i++)
			{
				if(i < goodsLen)
				{
					setGridInfo(i, datas[i]);
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
			refleshGrids();
		}
		
		private function refleshGrid(info:ClientItemInfo, newInfo:ClientItemInfo):void
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
		protected function onAddItem(info:ClientItemInfo):void
		{
			refleshGrid(info,info);
		}
		
		/**
		 * 物品发生变化 
		 * @param info
		 * 
		 */		
		private function onItemInfoChange(info:ClientItemInfo):void
		{
			refleshGrid(info,info);
		}
		
		/**
		 * 移除物品 
		 * @param info
		 * 
		 */		
		private function removeItem(info:ClientItemInfo):void
		{
			refleshGrid(info,null);
		}
		
		//============================拆分===============================
		
		
		
		//============================移动===============================
		/**
		 * 物品移动 
		 * @param info
		 * 
		 */		
		private function preMove(info:ClientItemInfo):void
		{
			if(!info ||  !_mgr.isEnabled(info.index))return;//info.containerID != containerId ||
			
			if(!movingFace)
			{
				movingFace = new DragDropItem( IcoSizeEnum.ICON_42, -1);
				movingFace.touchable = movingFace.touchGroup = false;
			}
			//			if(helperGridInfo == null)helperGridInfo = new GridInfo(info.containerID, info.index);
			movingFace.faceInfo = info;
			movingFace.setIconResName(ClientConfig.getItemIcon(info.icoName, IcoSizeEnum.ICON_42 ));
			
			//拖出后仅在显示层清空此格子
			
			var srcFace:DragDropItem = getDragDropItemByItemInfo(info);
			if(srcFace)
				srcFace.isGary=true;//置灰
			//			setGridInfo(info.index, null);//前清空
			
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
			
			ItemSender.moveItem(srcGrid,dstGrid);
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
		
		//		/**
		//		 * 移动失败 
		//		 * 
		//		 */		
		//		private function onFaceMoveFail():void
		//		{
		//			var info:ClientItemInfo = movingFace.faceInfo as ClientItemInfo;
		//			var srcFace:DragDropItem = getGridByIndex(info.index);
		//			var pos:Point = srcFace.localToGlobal(new Point(0,0));
		//			if(movingFace.stage == null)Starling.current.stage.addChild(movingFace);
		//			TweenLite.to(movingFace,0.5,{x:pos.x, y:pos.y, onComplete:reShowSrcFace});
		//		}
		
		/**
		 * 移动失败处理 
		 * 
		 */		
		private function reShowSrcFace():void
		{
			if(!movingFace)return;
			var info:ClientItemInfo = movingFace.faceInfo as ClientItemInfo;
			if(info)
				GoodsContainerMamager.setItemInfo(info.containerID, info.index, info);
			movingFace.removeFromParent();
		}
		
		/**
		 * Face移动成功 
		 * @param dstIndex
		 * 
		 */		
		public function onFaceMoveSuccess(dstGrid:GridInfo):void
		{
			var dstIndex:int=getRealIndex(dstGrid.index);
			var info:ClientItemInfo = movingFace.faceInfo as ClientItemInfo;
			if(!info)
				return;
			var srcIndex:int = info.index;
			var srcGrid:GridInfo=new GridInfo(info.containerID,info.itemInfo.gridId);
			srcGrid.data=info;
			stopFaceMove();
			movingFace.removeFromParent();
			
			if(dstIndex == srcIndex && containerId == info.containerID)
			{
				GoodsContainerMamager.setItemInfo(info.containerID, info.index, info);
				return;
			}
			
			ItemSender.moveItem(srcGrid,dstGrid);
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
			if(containerId != this.containerId)return;
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
			//			EventManager.addEvent(ItemEvent.ITEM_ADD,onAddItem);
			//			EventManager.addEvent(ItemEvent.ITEM_CHANG,onItemInfoChange);
			//			EventManager.addEvent(ItemEvent.ITEM_DELETE,removeItem);
			
			EventManager.addEvent(ItemEvent.ITEM_PRE_MOVE, preMove);
			EventManager.addEvent(ItemEvent.ITEM_DROPED, onDropItem);
			EventManager.addEvent(ItemEvent.ITEM_MOVE_FAIL, onServerReturnMoveFail);
			EventManager.addEvent(ItemEvent.ITEM_GRID_UNLOCK, onItemGridUnlock);
			
			EventManager.addEvent(ItemEvent.ITEM_REFLESH_BY_ITEM_INDEX,refleshGridByItemIndex);
			EventManager.addEvent(ItemEvent.ITEM_CONTAINER_REFLESH, onRefleshGrids);
		}
		
		/**
		 *当面板隐藏时,给子类处理自身逻辑
		 */
		public function hide():void
		{
			stopFaceMove();
			//			EventManager.removeEvent(ItemEvent.ITEM_ADD,onAddItem);
			//			EventManager.removeEvent(ItemEvent.ITEM_CHANG,onItemInfoChange);
			//			EventManager.removeEvent(ItemEvent.ITEM_DELETE,removeItem);
			EventManager.removeEvent(ItemEvent.ITEM_PRE_MOVE, preMove);
			EventManager.removeEvent(ItemEvent.ITEM_DROPED, onDropItem);
			EventManager.removeEvent(ItemEvent.ITEM_MOVE_FAIL, onServerReturnMoveFail);
			EventManager.removeEvent(ItemEvent.ITEM_GRID_UNLOCK, onItemGridUnlock);
			
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