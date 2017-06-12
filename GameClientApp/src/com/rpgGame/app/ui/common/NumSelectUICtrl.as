package  com.rpgGame.app.ui.common
{
	import com.game.mainCore.core.timer.GameTimer;
	
	import flash.utils.getTimer;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class NumSelectUICtrl
	{
	
		private  var MAX_ALLOW:int=999;
		private var _maxCount:int=900;
		private var price:int;
		private var speedTime:int=1500;
		private var now:int=0;
		private var speedArr:Array=[1,2,4,8,16,32];
		
		private var speedIndex:int=0;
		private var addOrDec:int=1;
		private var curNum:int=0;
		private var gTimer:GameTimer;
		
		private var btnAdd:Button;
		private var btnDec:Button;
		private var btnMax:Button;
		private var callBack:Function;
		private var lab:Label;
		private var btnMin:Button;
		
		/**
		 *是否开启加速 ,默认开启
		 */		
		private var _needSpeed:Boolean=true;
		/**
		 *快速增减数字 
		 * @param btnA增加按钮
		 * @param btnD减小按钮
		 * @param btnM最大按钮
		 * @param addMax 增加最大值
		 * @param maxValue 一键最大值
		 * @param minValue 一键最最小值
		 */		
		public function NumSelectUICtrl(btnA:Button,btnD:Button,btnMax:Button,btnMin:Button,la:Label,addMax:int,maxValue:int,changeCall:Function)
		{
			this.lab=la;
			this.btnAdd=btnA;
			this.btnDec=btnD;
			this.btnMax=btnMax;
			this.btnMin=btnMin;
			MAX_ALLOW=addMax;
			_maxCount=maxValue;
			callBack=changeCall;
			initEvent();
			gTimer=new GameTimer("NumSelectUICtrl",100,0,onTime);
			setcurNum(1);
		}
		
		public function updateMax(maxValue:int,addMax:int,reset:Boolean=true):void
		{
			this._maxCount=maxValue;
			this.MAX_ALLOW=addMax;
			if (reset) 
			{
				setcurNum(1);
			}
			
		}
		private function onTime():void
		{
			// TODO Auto Generated method stub
			if (curNum<=MAX_ALLOW&&curNum>=0) 
			{
				if (speedIndex>=0&&speedIndex<=speedArr.length-1) 
				{
					isStart=true;
					curNum+=speedArr[speedIndex]*addOrDec;
					setcurNum(curNum);
					if (now>getTimer()&&speedIndex<speedArr.length-1) 
					{
						speedIndex++;
						now=getTimer()+speedTime;
					}
				}
				
			}
			else
			{
				gTimer.stop();
			}
			
		}
		private function initEvent():void
		{
			if (btnMax) 
			{
				btnMax.addEventListener(Event.TRIGGERED,onSetMax);
			}
			if (btnMin) 
			{
				btnMin.addEventListener(Event.TRIGGERED,onSetMin);
			}
			btnDec.addEventListener(TouchEvent.TOUCH,onDecTouch);
			btnAdd.addEventListener(TouchEvent.TOUCH,onAddTouch);
		}
		
		private function onSetMin(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (curNum!=0) 
			{
				setcurNum(0);
			}
		}
		
		private function onAddCount(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (curNum<MAX_ALLOW) 
			{
				setcurNum(curNum+1);
			}
		}
		
		private function onDecCout(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (curNum>1) 
			{
				setcurNum(curNum-1);
			}
		}
		private function onDecTouch(e:TouchEvent):void
		{
			// TODO Auto Generated method stub
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				OnRollOut();
				return;
			}
			touch = e.getTouch(target, TouchPhase.BEGAN);
			if (touch!=null) 
			{
				OnRollIn(-1);
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				if (!isStart) 
				{
					onDecCout(null);
				}
				OnRollOut();
				return;
			}
		}
		private function onAddTouch(e:TouchEvent):void
		{
			// TODO Auto Generated method stub
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				OnRollOut();
				return;
			}
			touch = e.getTouch(target, TouchPhase.BEGAN);
			if (touch!=null) 
			{
				OnRollIn(1);
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				if (!isStart) 
				{
					onAddCount(null);
				}
				OnRollOut();
				return;
			}
		}
		private var isStart:Boolean=false;
		private function OnRollIn(val:int):void
		{
			// TODO Auto Generated method stub
			addOrDec=val;
			speedIndex=0;
			now=getTimer()+speedTime;
			if (_needSpeed) 
			{
				gTimer.start();
			}
			
		}
		
		private function OnRollOut():void
		{
			// TODO Auto Generated method stub
			isStart=false;
			if (_needSpeed) 
			{
				gTimer.stop();
			}
		}
		
		private function setcurNum(num:int):void
		{
			
			curNum=Math.min(num,MAX_ALLOW);
			curNum=Math.max(curNum,1);
			this.lab.text=getText();
			if (callBack) 
			{
				callBack(curNum);
			}
		}
		protected function getText():String
		{
			return curNum+"";
		}
		private function onSetMax(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (curNum!=maxCount) 
			{
				setcurNum(maxCount);
			}
			
		}
		public function getValue():int
		{
			return curNum;
		}

		public function get needSpeed():Boolean
		{
			return _needSpeed;
		}

		public function set needSpeed(value:Boolean):void
		{
			_needSpeed = value;
		}

		public function get maxCount():int
		{
			return _maxCount;
		}


	}
}