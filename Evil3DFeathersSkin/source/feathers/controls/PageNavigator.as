package feathers.controls
{
	import away3d.events.Event;
	
	/**
	 * 翻页组件，页码被翻动后会发出change事件
	 * @author wewell
	 */
	public class PageNavigator extends SkinnableContainer
	{
		public function PageNavigator()
		{
			super();
		}
		
		/**
		 * [SkinPart]上一页按钮
		 */	
		public var prevPageButton:Button;
		/**
		 * [SkinPart]下一页按钮
		 */	
		public var nextPageButton:Button;
		
		/**
		 * [SkinPart]第一页按钮
		 */	
		public var firstPageButton:Button;
		/**
		 * [SkinPart]最后一页按钮
		 */	
		public var lastPageButton:Button;
		/**
		 * [SkinPart]页码文本显示对象
		 */		
		public var labelDisplay:Label;
		
		private static const PARTS:Array = [
			"prevPageButton",
			"nextPageButton",
			"firstPageButton",
			"lastPageButton",
			"labelDisplay"
		];
		
		override public function set skin(value:StateSkin):void
		{
			super.skin = value;
			
			for each(var part:String in PARTS)
			{
				if(_skin.hasOwnProperty(part))
				{
					this[part] = _skin[part];
				}
			}
			partAdded();
		}
		
		
		
		/**
		 * 页码文本格式化回调函数，示例：labelFunction(pageIndex:int,totalPages:int):String;
		 */		
		public var labelFunction:Function;
		/**
		 * 格式化当前页码为显示的文本
		 * @param pageIndex
		 */		
		protected function pageToLabel(pageIndex:int,totalPages:int):String
		{
			if(labelFunction!=null)
				return labelFunction(pageIndex,totalPages);
			return (pageIndex+1)+"/"+(totalPages || 1);
		}
		
		private var _currentPage:int = 0;
		/**
		 * 当前页码索引，从0开始。
		 */
		public function get currentPage():int
		{
			return _currentPage;
		}
		
		public function set currentPage(value:int):void
		{
			gotoPage(value);
		}
		
		private var _totalPages:int = 1;
		/**
		 * 总页数,最小值1。
		 */
		public function get totalPages():int
		{
			return _totalPages;
		}
		
		/**
		 * 更新总页码
		 */		
		public function set totalPages(value:int):void
		{
			if(value < 1)
				value = 1;
			if(value == _totalPages)return;
			_totalPages = value;
			if(_currentPage>_totalPages-1)
				_currentPage = _totalPages-1;
			checkButtonEnabled();
			if(labelDisplay)
				labelDisplay.text = pageToLabel(_currentPage,_totalPages);
		}
		
		
		private var _autoButtonVisibility:Boolean = false;
		/**
		 * 当已经到达页尾或页首时，是否自动隐藏或显示翻页按钮。默认值为false。
		 */
		public function get autoButtonVisibility():Boolean
		{
			return _autoButtonVisibility;
		}
		
		public function set autoButtonVisibility(value:Boolean):void
		{
			if(_autoButtonVisibility==value)
				return;
			_autoButtonVisibility = value;
			checkButtonEnabled();
		}
		
		private var pageIndexChanged:Boolean = false;
		/**
		 * 跳转到指定索引的页面
		 */			
		private function gotoPage(index:int):void
		{
			if(index<0)
				index = 0;
			if(_currentPage == index)
			{
				return;
			}
			_currentPage = index;
			doChangePage();
		}
		
		/**
		 * 执行翻页操作
		 */		
		private function doChangePage():void
		{
			if(_currentPage>_totalPages-1)
				_currentPage = _totalPages-1;
			checkButtonEnabled();
			if(labelDisplay)
				labelDisplay.text = pageToLabel(_currentPage,_totalPages);
			dispatchEventWith(Event.CHANGE);
		}
		
		/**
		 * 检查页码并设置按钮禁用状态
		 */		
		private function checkButtonEnabled():void
		{
			var prev:Boolean = false;
			var next:Boolean = false;
			var first:Boolean = false;
			var last:Boolean = false;
			if(_totalPages>1)
			{
				if(currentPage<_totalPages-1)
				{
					last = next = true;
				}
				if(currentPage>0)
				{
					first = prev = true;
				}
			}
			if(prevPageButton)
			{
				prevPageButton.isEnabled = prev;
				prevPageButton.visible = !_autoButtonVisibility||prev;
				prevPageButton.includeInLayout = !_autoButtonVisibility||prev;
			}
			if(nextPageButton)
			{
				nextPageButton.isEnabled = next;
				nextPageButton.visible = !_autoButtonVisibility||next;
				nextPageButton.includeInLayout = !_autoButtonVisibility||next;
			}
			if(firstPageButton)
			{
				firstPageButton.isEnabled = first;
				firstPageButton.visible = !_autoButtonVisibility||first;
				firstPageButton.includeInLayout = !_autoButtonVisibility||first;
			}
			if(lastPageButton)
			{
				lastPageButton.isEnabled = last;
				lastPageButton.visible = !_autoButtonVisibility||last;
				lastPageButton.includeInLayout = !_autoButtonVisibility||last;
			}
		}
		
		
		/**
		 * @inheritDoc
		 */
		protected function partAdded():void
		{
			if(prevPageButton)
			{
				prevPageButton.addEventListener(Event.TRIGGERED,onPrevPageClick);
			}
			if(nextPageButton)
			{
				nextPageButton.addEventListener(Event.TRIGGERED,onNextPageClick);
			}
			if(firstPageButton)
			{
				firstPageButton.addEventListener(Event.TRIGGERED,onFirstPageClick);
			}
			if(lastPageButton)
			{
				lastPageButton.addEventListener(Event.TRIGGERED,onLastPageClick);
			}
			if(labelDisplay)
			{
				labelDisplay.text = pageToLabel(currentPage,_totalPages);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		protected function partRemoved():void
		{
			if(prevPageButton)
			{
				prevPageButton.removeEventListener(Event.TRIGGERED,onPrevPageClick);
			}
			if(nextPageButton)
			{
				nextPageButton.removeEventListener(Event.TRIGGERED,onNextPageClick);
			}
			if(firstPageButton)
			{
				firstPageButton.removeEventListener(Event.TRIGGERED,onFirstPageClick);
			}
			if(lastPageButton)
			{
				lastPageButton.removeEventListener(Event.TRIGGERED,onLastPageClick);
			}
		}
		
		/**
		 * "最后一页"按钮被点击
		 */		
		protected function onLastPageClick(event:Event):void
		{
			gotoPage(_totalPages-1);
		}
		/**
		 * "第一页"按钮被点击
		 */		
		protected function onFirstPageClick(event:Event):void
		{
			gotoPage(0);
		}
		/**
		 * "下一页"按钮被点击
		 */		
		protected function onNextPageClick(event:Event):void
		{
			gotoPage(Math.min(_totalPages-1,currentPage+1));
		}
		/**
		 * "上一页"按钮被点击
		 */		
		protected function onPrevPageClick(event:Event):void
		{
			gotoPage(currentPage-1);
		}
	}
}
