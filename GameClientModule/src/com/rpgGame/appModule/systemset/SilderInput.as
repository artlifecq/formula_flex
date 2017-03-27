package com.rpgGame.appModule.systemset
{
	import feathers.controls.Slider;
	import feathers.controls.TextInput;
	import feathers.events.FeathersEventType;
	
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class SilderInput extends EventDispatcher
	{
		private var _id:int;
		private var _sld:Slider;
		private var _textInput:*;	
		private var _num:Number;
		public function SilderInput(id:int,sld:Slider,textinput:*,num:Number):void
		{
			super();
			_id = id;
			_sld = sld;
			_textInput= textinput;
			_num = num;
			initEvent();
		}

		public function get num():Number
		{
			return _num;
		}

		public function get id():int
		{
			return _id;
		}

		private function initEvent():void
		{
			if(_textInput is TextInput)
			{
				_textInput.restrict = "0-9";
				_textInput.maxChars = 3;
				_textInput.addEventListener(Event.CHANGE,textChangeHandler);
			}
			_sld.minimum = 0;
			_sld.maximum = 100;
			_sld.addEventListener(Event.CHANGE, horizontalSlider_changeHandler);
			refeashValue();
		}
		private function textChangeHandler(event:Event):void
		{
			_num = Number(_textInput.text);
			refeashValue();
		}
		private function horizontalSlider_changeHandler(event:Event):void
		{
			_num = Math.floor(_sld.value);
			refeashValue();
		}
		
		private function refeashValue():void
		{
			if(_textInput is TextInput)
			{
				_textInput.text = _num.toString();
			}else{
				_textInput.text = _num.toString()+"%";
			}
			
			_sld.value = _num;
			this.dispatchEventWith(Event.CHANGE);
		}
	}
}