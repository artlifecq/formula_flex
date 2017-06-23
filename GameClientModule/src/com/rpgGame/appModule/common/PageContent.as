package com.rpgGame.appModule.common
{
	import away3d.events.Event;
	
	import feathers.controls.Button;
	
	public class PageContent
	{
		private var _btnNext:Button;
		private var _btnPrev:Button;
		private var _callFun:Function;
		private var _currentPage:int = 0;

		public function get currentPage():int
		{
			return _currentPage;
		}

		public function set currentPage(value:int):void
		{
			_currentPage = value;
			requestPage(_currentPage);
		}

		private var _maxPage:int;
		
		public var ishide:Boolean = true;
		public function get maxPage():int
		{
			return _maxPage;
		}

		public function set maxPage(value:int):void
		{
			/*if(_maxPage == value)
				return ;*/
			_maxPage = value;
			requestPage(_currentPage);
		}

		public function PageContent(btnPrev:Button,btnNext:Button,updataFun:Function):void
		{
			_btnNext = btnNext;
			_btnPrev = btnPrev;
			_callFun = updataFun;
			super();
			initEvent();
		}
		
		private function initEvent():void
		{
			_btnNext.addEventListener(Event.TRIGGERED,triggeredHandler);
			_btnPrev.addEventListener(Event.TRIGGERED,triggeredHandler);
		}
		
		private function triggeredHandler(e:Event):void
		{
			if(e.target == _btnNext)
			{
				requestPage(_currentPage+1);
			}else if(e.target == _btnPrev){
				requestPage(_currentPage-1);
			}
		}
		
		private function requestPage(page:int):void
		{
			if(page<0)
				page = 0;
			if(page>_maxPage)
				page = _maxPage;
			_currentPage = page;
			if(_callFun!=null)
			{
				_callFun(_currentPage,_maxPage);
			}
			if(ishide)
			{
				_btnPrev.visible = _currentPage>0;
				_btnNext.visible = _currentPage< _maxPage;
			}
		}
	}
}