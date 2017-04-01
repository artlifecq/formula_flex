package com.editor.story.view.timeline
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.events.TextOperationEvent;
	
	[Event(name="change",type="spark.events.TextOperationEvent")]
	[Event(name="enter",type="mx.events.FlexEvent")]
	
	public class TransparentTextInput extends Group
	{
		private var _doubleClickToEdit:Boolean;
		
		private var textDisplay:TextInput;
		
		private var labelDisplay:Label;
		
		public function TransparentTextInput()
		{
			super();
			textDisplay = new TextInput();
			textDisplay.percentWidth = 100;
			textDisplay.percentHeight = 100;
			this.addElement(textDisplay);
			labelDisplay = new Label();
			labelDisplay.maxDisplayedLines = 1;
			labelDisplay.showTruncationTip = true;
			labelDisplay.setStyle("paddingLeft",3);
			labelDisplay.setStyle("paddingRight",3);
			labelDisplay.setStyle("paddingTop",7);
			labelDisplay.setStyle("color",0x4382e2);
			labelDisplay.percentWidth = 100;
			labelDisplay.percentHeight = 100;
			this.addElement(labelDisplay);
			textDisplay.visible = false;
			this.addEventListener(MouseEvent.CLICK,onClick);
			textDisplay.addEventListener(FlexEvent.ENTER,onTextEnter);
			textDisplay.addEventListener(TextOperationEvent.CHANGE,onTextChange);
		}
		
		public function get doubleClickToEdit():Boolean
		{
			return _doubleClickToEdit;
		}
		
		public function set doubleClickToEdit(value:Boolean):void
		{
			if(_doubleClickToEdit != value)
			{
				_doubleClickToEdit = value;
				this.doubleClickEnabled = _doubleClickToEdit;
				if(_doubleClickToEdit)
				{
					this.removeEventListener(MouseEvent.CLICK,onClick);
					this.addEventListener(MouseEvent.DOUBLE_CLICK,onClick);
				}
				else
				{
					this.addEventListener(MouseEvent.CLICK,onClick);
					this.removeEventListener(MouseEvent.DOUBLE_CLICK,onClick);
				}
			}
		}
		
		public function set text(value:String):void
		{
			textDisplay.text = value;
			labelDisplay.text = value;
		}
		
		public function get text():String
		{
			return textDisplay.text;
		}
		
		protected function onClick(event:MouseEvent):void
		{
			labelDisplay.visible = false;
			textDisplay.visible = true;
			stage.addEventListener(MouseEvent.CLICK,onStageMouseClick);
		}
		
		protected function onStageMouseClick(event:MouseEvent):void
		{
			if(!isMouseTargetOn(this,event.target as DisplayObject))
			{
				onFocusOut(null);
				this.dispatchEvent(new FlexEvent(FlexEvent.ENTER));
			}
		}
		
		protected function onFocusOut(event:FocusEvent):void
		{
			textDisplay.visible = false;
			labelDisplay.text = textDisplay.text;
			labelDisplay.visible = true;
			if(stage)stage.removeEventListener(MouseEvent.CLICK,onStageMouseClick);
		}
		
		private function isMouseTargetOn(obj:DisplayObject,target:DisplayObject):Boolean
		{
			if(obj == target)
				return true;
			if(target is Stage)
				return false;
			if(target.parent)
				return isMouseTargetOn(obj,target.parent);
			return false;
		}
		
		private function onTextEnter(e:FlexEvent):void
		{
			onFocusOut(null);
			this.dispatchEvent(e.clone());
		}
		
		private function onTextChange(e:TextOperationEvent):void
		{
			this.dispatchEvent(e.clone());
		}
	}
}