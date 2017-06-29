﻿package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.app.manager.FunctionOpenManager;
    
    import away3d.events.Event;
    
    import org.mokylin.skin.mainui.activityBar.ActivityButtonSkin;
    import org.mokylin.skin.mainui.activityBar.ActivityItem;
    
    import starling.display.DisplayObject;

    public class ActivityButton extends ActivityButtonBase 
    {
        protected var ui:ActivityButtonSkin;
		private var _item:ActivityLable;
        public function ActivityButton()
        {
            ui = new ActivityButtonSkin();
            super(ui);
			
			_item = new ActivityLable(ui.skinItem.skin as ActivityItem);
			this.onTextColse();
			ui.btnBar.addEventListener(Event.RESIZE,sizeHandler);
        }
		
		private function sizeHandler(e:Event):void
		{
			ui.btnBar.x = (this.width-ui.btnBar.width)/2;
			ui.skinItem.y = ui.btnBar.y+ui.btnBar.height-5;
		}

        override public function set styleClass(cl:Class):void
        {
            ui.btnBar.styleClass = cl;
        }

        override public function set title(value:String):void
        {
            super.title = value;
        }

        override public function setTips(target:DisplayObject, tipReady:String, tipRuning:String):void
        {
            super.setTips(ui.btnBar, tipReady, tipRuning);
        }

        override protected function onTouchTarget(target:DisplayObject):void
        {
            var _local2:ActivityButtonBase = this;
            super.onTouchTarget(target);
            switch (target)
            {
                case ui.btnBar:
                    onButtonClick();
					FunctionOpenManager.openModeByInfo(info,info.open_id);
                    return;
            }
        }

        protected function onButtonClick():void
        {
        }

        override public function onActivityData(data:Object):void
        {
        }

        
        

        override protected function onTextStart(second:int):String
        {
            var title:String = this.title;
            var startTxt:String = super.onTextStart(second);
			setTextLeable(startTxt);
			ui.uiJinXing.visible = false;
            return startTxt;
        }

        override protected function onTextRuning():String
        {
            var runingTxt:String = super.onTextRuning();
			setTextLeable(runingTxt);
			ui.uiJinXing.visible = true;
            return runingTxt;
        }

        override protected function onTextEnd(second:int):String
        {
            var endTxt:String = super.onTextEnd(second);
			setTextLeable(endTxt);
            return endTxt;
        }
		
		override protected function onTextEmpty():void
		{
			setTextLeable("");
			ui.uiJinXing.visible = false;
		}

        override protected function onTextColse():String
        {
            var closeTxt:String = super.onTextColse();
			setTextLeable(closeTxt);
			ui.uiJinXing.visible = false;
            return closeTxt;
        }
		
		override protected function onTextRuningTime(second:int):String
		{
			var closeTxt:String = super.onTextRuningTime(second);
			setTextLeable(closeTxt);
			ui.uiJinXing.visible = true;
			return closeTxt;
		}
		
		protected function setTextLeable(str:String):void
		{
			_item.text = str;
		}
    }
}