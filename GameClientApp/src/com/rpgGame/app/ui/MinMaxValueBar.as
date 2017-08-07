package com.rpgGame.app.ui
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;
	
	/**
	 * 大小值组件封装
	 * @author dik
	 * 
	 */
	public class MinMaxValueBar
	{
		private var btn_min:Button;
		private var btn_max:Button;
		private var btnMax:Button;
		private var txt:TextInput;
		
		private var _min:int;
		private var _max:int;
		private var _step:int=1;
		private var _value:int;
		private var _maxNotify:int;
		private var _minNotify:int;
		
		public function get value():int
		{
			return _value;
		}
		
		public function set value(value:int):void
		{
			_value = value;
			_changeHandler();
		}
		
		public function get max():int
		{
			return _max;
		}
		
		private var _changeHandler:Function;
		
		public function MinMaxValueBar(skin:StateSkin,changeHandler:Function,maxNotify:int=2011,minNotify:int=2012)
		{
			btn_min=skin["btn_min"];
			btn_max=skin["btn_max"];
			btnMax=skin["btnMax"];
			txt=skin["input_txt"];
			_maxNotify=maxNotify;
			_minNotify=minNotify;
			_changeHandler=changeHandler;
		}
		
		public function onHide():void
		{
			if(btn_max){
				btn_min.removeEventListener(Event.TRIGGERED,btnminHandler);
				btn_max.removeEventListener(Event.TRIGGERED,btnmaxHandler);
				btnMax.removeEventListener(Event.TRIGGERED,btnTomaxHandler);
				btn_min.removeEventListener(TouchEvent.TOUCH,onTouch);
				btn_max.removeEventListener(TouchEvent.TOUCH,onTouch);
			}
		}
		
		
		public function onShow():void
		{
			if(btn_max){
				btn_min.addEventListener(Event.TRIGGERED,btnminHandler);
				btn_max.addEventListener(Event.TRIGGERED,btnmaxHandler);
				btnMax.addEventListener(Event.TRIGGERED,btnTomaxHandler);
				btn_min.addEventListener(TouchEvent.TOUCH,onTouch);
				btn_max.addEventListener(TouchEvent.TOUCH,onTouch);
			}
			value=_min;
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var changeStep:int=_step;
			if(target==btn_min){
				changeStep*=-1;
			}
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				TimerServer.remove(updateValue);
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.BEGAN);
			if (touch!=null&&!TimerServer.has(updateValue)) 
			{
				TimerServer.addLoop(updateValue,100,[changeStep]);
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				TimerServer.remove(updateValue);
			}
		}
		
		private function updateValue(changeStep:int):void
		{
			value+=changeStep;
			
			value=_value>_max?_max:_value;
			value=_value<_min?_min:_value;
			txt.text=_value.toString();
			if(_value==_max){
				NoticeManager.showNotifyById(_maxNotify);
				TimerServer.remove(updateValue);
				return;
			}
			if(_value==_min){
				NoticeManager.showNotifyById(_minNotify);
				TimerServer.remove(updateValue);
				return;
			}
		}
		
		private function btnTomaxHandler(e:Event):void
		{
			if(_value==_max){
				NoticeManager.showNotifyById(_maxNotify);
				return;
			}
			value=_max;
			txt.text=_value.toString();
		}
		
		private function btnmaxHandler(e:Event):void
		{
			if(_value==_max){
				NoticeManager.showNotifyById(_maxNotify);
				return;
			}
			value+=_step;
			value=_value>_max?_max:_value;
			txt.text=_value.toString();
		}
		
		private function btnminHandler(e:Event):void
		{
			if(_value==_min){
				NoticeManager.showNotifyById(_minNotify);
				return;
			}
			value-=_step;
			value=_value<_min?_min:_value;
			txt.text=_value.toString();
		}
		
		public function setMinMax(min:int,max:int):void
		{
			_min=min;
			_max=max<_min?_min:max;
		}
		
		public function set step(value:int):void
		{
			_step=value;	
		}
	}
}