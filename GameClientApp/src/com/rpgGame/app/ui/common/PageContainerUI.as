package com.rpgGame.app.ui.common
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.data.ListCollection;
	import feathers.events.CollectionEventType;
	import feathers.layout.TiledRowsLayout;
	
	import starling.events.Event;

	/**
	 *翻页ui
	 *@author dik
	 *2017-5-11上午10:26:55
	 */
	public class PageContainerUI extends SkinUI
	{
		private var _renderGroup:LayoutGroup;
		private var _tileLayout:TiledRowsLayout;
		private var _preBtn:Button;
		private var _nextBtn:Button;
		private var _itemRendererType:Class;
		
		/**
		 *数据 
		 */
		private var _dataProvider:ListCollection;
		/**
		 *每页显示的数量 
		 */
		private var _onePageNum:int;
		/**
		 *当前页面 
		 */
		private var currentPage:int=1;
		private var dataIndex:int;
		private var renderList:Vector.<DefaultPageItemRender>;
		private var maxPage:int;
		private var _next:Button;
		private var _pre:Button;
		
		public function PageContainerUI(onePageNum:int,pre:Button,next:Button)
		{
			_renderGroup=new LayoutGroup();
			_tileLayout=new TiledRowsLayout();
			_tileLayout.gap=5;
			_renderGroup.layout=_tileLayout;
			_onePageNum=onePageNum;
			renderList=new Vector.<DefaultPageItemRender>();
			this.addChild(_renderGroup);
			
			_pre=pre;
			_next=next;
			
			_pre.addEventListener(Event.TRIGGERED,onPre);
			_next.addEventListener(Event.TRIGGERED,onNext);
		}
		
		private function onNext(event:Event):void
		{
			currentPage++;
			if(currentPage>maxPage){
				currentPage=maxPage;
			}
			updateItemView();
		}
		
		private function onPre(event:Event):void
		{
			currentPage--;
			if(currentPage<1){
				currentPage=1;
			}
			updateItemView();
		}
		
		public function set itemRendererType(value:Class):void
		{
			if(_itemRendererType==value){
				return;
			}
			var i:int
			for(i=0;i<renderList.length;i++){
				_renderGroup.removeChild(renderList[i]);
			}
			
			_itemRendererType=value;
			for(i=0;i<_onePageNum;i++){
				var item:DefaultPageItemRender=new _itemRendererType();
				_renderGroup.addChild(item);
				if(item){
					renderList.push(item);
				}else{
					throw new Error("PageContainerUI的渲染器必须是DefaultPageItemRender的子类型");
				}
			}
		}
		
		public function set dataProvider(value:ListCollection):void
		{
			if(_dataProvider==value){
				return;
			}
			if(this._dataProvider)
			{
				this._dataProvider.removeEventListener(CollectionEventType.ADD_ITEM, itemHandler);
				this._dataProvider.removeEventListener(CollectionEventType.REMOVE_ITEM, itemHandler);
				this._dataProvider.removeEventListener(CollectionEventType.REPLACE_ITEM, itemHandler);
				this._dataProvider.removeEventListener(CollectionEventType.RESET, resetHandler);
				this._dataProvider.removeEventListener(Event.CHANGE, changeHandler);
			}
			this._dataProvider = value;
			if(this._dataProvider)
			{
				this._dataProvider.addEventListener(CollectionEventType.ADD_ITEM, itemHandler);
				this._dataProvider.addEventListener(CollectionEventType.REMOVE_ITEM, itemHandler);
				this._dataProvider.addEventListener(CollectionEventType.REPLACE_ITEM, itemHandler);
				this._dataProvider.addEventListener(CollectionEventType.RESET, resetHandler);
				this._dataProvider.addEventListener(Event.CHANGE, changeHandler);
			}
			updateItemView();
		}
		
		private function itemHandler(event:Event, index:int):void
		{
			updateItemView();
		}
		
		private function changeHandler(event:Event):void
		{
			updateItemView();
		}
		
		private function resetHandler(event:Event):void
		{
			updateItemView();
		}
		
		private function updateItemView():void
		{
			maxPage=Math.ceil(_dataProvider.length/_onePageNum);
			var index:int=(currentPage-1)*_onePageNum;
			var data:Object;
			var item:DefaultPageItemRender;
			for(var i:int=0;i<_onePageNum;i++){
				data=_dataProvider.getItemAt(index);
				item=renderList[i];
				if(data){
					item.visible=true;
					item.setData(data);
				}else{
					item.visible=false;
				}
				index++;
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			if(this._dataProvider)
			{
				this._dataProvider.removeEventListener(CollectionEventType.ADD_ITEM, itemHandler);
				this._dataProvider.removeEventListener(CollectionEventType.REMOVE_ITEM, itemHandler);
				this._dataProvider.removeEventListener(CollectionEventType.REPLACE_ITEM, itemHandler);
				this._dataProvider.removeEventListener(CollectionEventType.RESET, resetHandler);
				this._dataProvider.removeEventListener(Event.CHANGE, changeHandler);
			}
			_pre.removeEventListener(Event.TRIGGERED,onPre);
			_next.removeEventListener(Event.TRIGGERED,onNext);
		}
	}
}