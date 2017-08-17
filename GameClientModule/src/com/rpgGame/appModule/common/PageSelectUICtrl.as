package com.rpgGame.appModule.common
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.Label;

	/**
	 * 翻页控制, 这种用于指导所有数据的情况
	 * @author Administrator
	 * 
	 */
	public class PageSelectUICtrl
	{
		private var maxBtn:Button;
		private var minBtn:Button;
		private var leftBtn:Button;
		private var rightBtn:Button;
		private var _maxPage:int;
		private var _curPageIndex:int;
		private var pageLabel:Label;
		private var callBack:Function;
		private var pageData:*;
		private var dataStep:int;
		private var labStr:String;
		public function get maxPage():int
		{
			return _maxPage;
		}

		public function get curPageIndex():int
		{
			return _curPageIndex;
		}


		public function PageSelectUICtrl(lbtn:Button,rbtn:Button,plab:Label,pageChageCall:Function,str:String="{0}",btnMax:Button=null,btnMin:Button=null)
		{
			this.leftBtn=lbtn;
			this.rightBtn=rbtn;
			this.pageLabel=plab;
			this.labStr=str;
			this.callBack=pageChageCall;
			this.maxBtn=btnMax;
			this.minBtn=btnMin;
			this.leftBtn.addEventListener(Event.TRIGGERED,onLeft);
			this.rightBtn.addEventListener(Event.TRIGGERED,onRight);
			
			if (btnMax) 
			{
				btnMax.addEventListener(Event.TRIGGERED,onMax);
			}
			if (btnMin) 
			{
				btnMin.addEventListener(Event.TRIGGERED,onMin);
			}
		}
		
		private function onMin(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_curPageIndex>0) 
			{
				setCurPage(0);
			}
		}
		
		private function onMax(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_curPageIndex<maxPage-1) 
			{
				setCurPage(maxPage-1);
			}
		}
		public function setData(data:*,step:int):void
		{
			if (data==null||step==0) 
			{
				throw new Error("PageSelectUICtrl data is null or step is 0");
			}
			this.pageData=data;
			this.dataStep=step;
			this._maxPage=Math.ceil(data.length/step);
			resetState();
			if (_maxPage>0) 
			{
				setCurPage(0);
			}
		}
		private function resetState():void
		{
			leftBtn.touchable=false;
			rightBtn.touchable=false;
			pageLabel.text="";
		}
		private function onRight(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_curPageIndex<_maxPage-1) 
			{
				setCurPage(_curPageIndex+1);
			}
		}
		
		private function onLeft(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (_curPageIndex>0) 
			{
				setCurPage(_curPageIndex-1);
			}
		}
		private function checkBtn():void
		{
			this.leftBtn.touchable=_curPageIndex>0;
			this.rightBtn.touchable=_curPageIndex<_maxPage-1;
			if (minBtn) 
			{
				minBtn.touchable=leftBtn.touchable;
			}
			if (maxBtn) 
			{
				maxBtn.touchable=rightBtn.touchable;
			}
		}
		private function setCurPage(pageIndex:int):void
		{
			this._curPageIndex=pageIndex;
			this.pageLabel.text=LanguageConfig.replaceStr(labStr,[(_curPageIndex+1)+"/"+maxPage]);
			checkBtn();
			if (callBack&&pageData) 
			{
				var start:int=_curPageIndex*dataStep;
				callBack(pageData.slice(start,Math.min(start+dataStep,pageData.length)));
			}
		}
	}
}