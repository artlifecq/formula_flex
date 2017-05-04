package com.rpgGame.appModule.mount
{
	import feathers.controls.Button;
	import feathers.controls.TextInput;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class GameNumericStepper extends EventDispatcher
	{
		public var maxFun:Function;
		public var minFun:Function;
		public var maxValue:int;
		public var minValue:int;
		private var _reduceBtn:Button;
		private var _addBtn:Button;
		private var _maxBtn:Button;
		private var _textInput:TextInput;
		private var _num:int;
		public function setSkinInfo(reduceBtn:Button,addBtn:Button,maxBtn:Button,text:TextInput):void
		{
			if(_reduceBtn!=null)
				_reduceBtn.removeEventListener(Event.TRIGGERED,buttonClickHandler);
			if(_addBtn!=null)
				_addBtn.removeEventListener(Event.TRIGGERED,buttonClickHandler);
			if(_maxBtn!=null)
				_maxBtn.removeEventListener(Event.TRIGGERED,buttonClickHandler);
			
			_reduceBtn =reduceBtn;
			_addBtn = addBtn;
			_maxBtn = maxBtn;
			_textInput = text;
			
			_reduceBtn.addEventListener(Event.TRIGGERED,buttonClickHandler);
			_addBtn.addEventListener(Event.TRIGGERED,buttonClickHandler);
			_maxBtn.addEventListener(Event.TRIGGERED,buttonClickHandler);
			_textInput.addEventListener(Event.CHANGE,changeHandler);
			refeashValue();
		}
		
		private function buttonClickHandler(e:Event):void
		{
			switch(e.target)
			{
				case _reduceBtn:
					_num--;
					break;
				case _addBtn:
					_num++;
					break;
				case _maxBtn:
					_num = maxFun!=null?maxFun():maxValue;
					break;
			}
			refeashValue();
		}
		
		private function changeHandler(e:Event):void
		{
			_num = int(_textInput.text);
		}
		private function refeashValue(isdispath:Boolean = true):void
		{
			var min:int = minFun!=null?minFun():minValue;
			var max:int = maxFun!=null?maxFun():maxValue;
			if(_num<min)
				_num = min;
			else if(_num >max)
				_num = max;
			if(_textInput is TextInput)
			{
				_textInput.text = _num.toString();
			}else{
				_textInput.text = _num.toString()+"%";
			}
			if(isdispath)
				this.dispatchEventWith(Event.CHANGE);
		}
		
		public function get currentValue():int
		{
			return _num;
		}
		
		public function set currentValue(value:int):void
		{
			_num = value;
			refeashValue(false);
		}
	}
}