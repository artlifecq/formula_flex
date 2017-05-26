package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	
	import flash.utils.Dictionary;
	
	import feathers.controls.Check;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.Slider;
	
	import away3d.events.Event;

	public class BasePaneView
	{
		protected var _content:SkinnableContainer;
		public function BasePaneView(content:SkinnableContainer):void
		{
			_content = content;
			refeashView();
		}
		protected var _checkList:Dictionary;
		protected var _silderInput:Vector.<SilderInput>;
		public function refeashView():void
		{
			_checkList = new Dictionary();
			_silderInput = new Vector.<SilderInput>();
		}
		protected function bindSliderAndInput(sld:Slider,input:*,type:int):void
		{
			var num:int = SystemSetManager.getinstance().getValueByIndex(type);
			var sai:SilderInput = new SilderInput(type,sld,input,num);
			sai.addEventListener(Event.CHANGE,changeHandler);
			_silderInput.push(sai);
		}
		public function bindDate(check:Check,type:int):void
		{
			check.isSelected = SystemSetManager.getinstance().getBooleanByIndex(type);
			check.addEventListener(Event.CHANGE,checkChangeHandler)
			_checkList[check] = type;
		}
		private function changeHandler(e:Event):void
		{
			var sai:SilderInput = e.target as SilderInput;
			SystemSetManager.getinstance().setValueByIndex(sai.id,sai.num);
		}
		protected function checkChangeHandler(e:Event):void
		{
			var check:Check = e.target as Check;
			var type:int = _checkList[check];
			SystemSetManager.getinstance().setBooleanByIndex(type,check.isSelected);
		}
		
		public function set visible(value:Boolean):void
		{
			this._content.visible= value;
		}
		public function hide():void
		{
			_checkList = null;
			_silderInput = null;
		}
	}
}