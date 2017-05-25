package com.rpgGame.app.ui.common
{
	import com.rpgGame.core.ui.SkinUI;
	
	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.data.ListCollection;
	import feathers.layout.TiledRowsLayout;
	
	import away3d.events.Event;

	/**
	 *翻页ui
	 *@author dik
	 *2017-5-11上午10:26:55
	 */
	public class PageContainerUI extends SkinUI
	{
		private var _renderGroup:LayoutGroup;
		private var _tileLayout:TiledRowsLayout;
		private var _itemRendererType:Class;
		
		/**
		 *数据 
		 */
		private var _dataProvider:ListCollection;
		/**
		 *每页显示的数量 
		 */
		private var _onePageNum:int;
		private var _currentPage:int=1;
		private var renderList:Vector.<DefaultPageItemRender>;
		private var maxPage:int;
		private var _nextBtn:Button;
		private var _preBtn:Button;
		
		public function PageContainerUI(onePageNum:int,pre:Button,next:Button)
		{
			_renderGroup=new LayoutGroup();
			_tileLayout=new TiledRowsLayout();
			_tileLayout.gap=5;
			_renderGroup.layout=_tileLayout;
			_onePageNum=onePageNum;
			renderList=new Vector.<DefaultPageItemRender>();
			this.addChild(_renderGroup);
			
			_preBtn=pre;
			_nextBtn=next;
			
			_preBtn.addEventListener(Event.TRIGGERED,onPre);
			_nextBtn.addEventListener(Event.TRIGGERED,onNext);
		}
		
		/**
		 *当前页面 
		 */
		public function set currentPage(value:int):void
		{
			_currentPage = value;
			if(_currentPage>maxPage){
				_currentPage=maxPage;
			}
			if(_currentPage<1){
				_currentPage=1;
			}
			updateItemView();
		}

		private function onNext(event:Event):void
		{
			_currentPage++;
			if(_currentPage>maxPage){
				_currentPage=maxPage;
			}
			updateItemView();
		}
		
		private function onPre(event:Event):void
		{
			_currentPage--;
			if(_currentPage<1){
				_currentPage=1;
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
			this._dataProvider = value;
			updateItemView();
		}
		
		private function updateItemView():void
		{
			maxPage=Math.ceil(_dataProvider.length/_onePageNum);
			var index:int=(_currentPage-1)*_onePageNum;
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
			
			_preBtn.visible=_currentPage!=1;
			_nextBtn.visible=_currentPage!=maxPage;
		}
		
		override public function dispose():void
		{
			super.dispose();
			_preBtn.removeEventListener(Event.TRIGGERED,onPre);
			_nextBtn.removeEventListener(Event.TRIGGERED,onNext);
		}
	}
}