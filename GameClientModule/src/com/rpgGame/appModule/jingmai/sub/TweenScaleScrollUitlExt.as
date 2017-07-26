package com.rpgGame.appModule.jingmai.sub
{
	import com.rpgGame.coreData.utils.FilterUtil;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	
	import gs.TweenMax;
	
	import starling.display.DisplayObject;
	
	public class TweenScaleScrollUitlExt extends TweenScrollUtil
	{
		private var leftBtn:Button;
		private var rightBtn:Button;
		private var dataArr:Array;
		private var _curIndex:int=0;
		private var nextIndex:int=0;
		private var _indexStep:int=1;
		private var tweenScale:Number=1;
		private var callBack:Function;
		public function TweenScaleScrollUitlExt(scrollObject:DisplayObject,data:Array,left:Button,right:Button,scale:Number, width:int, height:int, scrollWidth:int, scrollTime:Number=0.5, isHorizon:Boolean=true)
		{
			super(scrollObject, width, height, scrollWidth, scrollTime, isHorizon);
			this.dataArr=data;
			this.leftBtn=left;
			this.rightBtn=right;
			this.tweenScale=scale;
			if (tweenScale!=1.0) 
			{
				var len:int=dataArr.length;
				for (var i:int = 1; i < len; i++) 
				{
					dataArr[i].scale=tweenScale;
				}
				
			}
			addEvent();
			checkBtnState();
		}
		public function setStep(step:int):void
		{
			step=Math.max(1,step);
			step=Math.min(dataArr.length,step);
			_indexStep=step;
		}
		public function setCallBack(fun:Function):void
		{
			this.callBack=fun;
		}
		private function addEvent():void
		{
			this.leftBtn.addEventListener(Event.TRIGGERED,onTriggeredLeft);
			this.rightBtn.addEventListener(Event.TRIGGERED,onTriggeredRight);
		}
		private function removeEvent():void
		{
			this.leftBtn.removeEventListener(Event.TRIGGERED,onTriggeredLeft);
			this.rightBtn.removeEventListener(Event.TRIGGERED,onTriggeredRight);
		}
		private function onTriggeredRight(e:Event):void
		{
			// TODO Auto Generated method stub
			nextIndex=Math.min(dataArr.length-_indexStep,_curIndex+_indexStep);
			scroll2Index(nextIndex);
		}
		
		private function onTriggeredLeft(e:Event):void
		{
			// TODO Auto Generated method stub
			nextIndex=Math.max(0,_curIndex-_indexStep);
			scroll2Index(nextIndex);
		}
		
		override public function dispose():void
		{
			super.dispose();
			removeEvent();
		}
		
		private function checkBtnState():void
		{
			var dataLen:int=dataArr.length;
			leftBtn.visible=leftBtn.touchable=_curIndex>0;
			rightBtn.visible=rightBtn.touchable=_curIndex<(dataLen-_indexStep)&&dataLen>1;
			//
			return;
			if (!leftBtn.touchable) 
			{
				leftBtn.filter=FilterUtil.getGrayFilter();
			}
			else
			{
				leftBtn.filter=null;
			}
			if (!rightBtn.touchable) 
			{
				rightBtn.filter=FilterUtil.getGrayFilter();
			}
			else
			{
				rightBtn.filter=null;
			}
		}
		public function scroll2Index(targetIndex:int):void
		{
			if (targetIndex<0||targetIndex>dataArr.length) 
			{
				return;
			}
			if (targetIndex==_curIndex) 
			{
				return;
			}
			nextIndex=targetIndex;
			var tx:Number=-targetIndex*scrollWidth;
			var t:int=Math.abs(targetIndex-_curIndex);
			if (isHorizon) 
			{
				this.scrollToX(tx,t);
			}
			else
			{
				this.scrollToY(tx,t);
			}
		}
		override public function onTweenStart():void
		{
			super.onTweenStart();
			rightBtn.touchable=false;
			leftBtn.touchable=false;
			if (tweenScale!=1.0) 
			{
				var time:Number=Math.abs(nextIndex-_curIndex)*this.scrollTime;
				var len:int=dataArr.length;
				var dis:DisplayObject;
				var toScale:Number;
				for (var i:int = 0; i < len; i++) 
				{
					dis=dataArr[i];
					toScale=i==nextIndex?1:this.tweenScale;
					if (toScale!=dis.scale) 
					{
						TweenMax.to(dis,time,{scale:toScale});
					}
				}
			}
		}
		override public function onTweenEnd():void
		{
			super.onTweenEnd();
			
			_curIndex=nextIndex;
			checkBtnState();
			if (_curIndex>=0&&_curIndex<dataArr.length) 
			{
				if (callBack) 
				{
					callBack(dataArr[_curIndex]);
				}
			}
		}

		public function get curIndex():int
		{
			return _curIndex;
		}

	}
}