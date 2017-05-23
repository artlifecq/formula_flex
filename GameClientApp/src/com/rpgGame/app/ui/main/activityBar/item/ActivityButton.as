package com.rpgGame.app.ui.main.activityBar.item
{
    import org.mokylin.skin.mainui.activityBar.ActivityButtonSkin;
    
    import starling.display.DisplayObject;

    public class ActivityButton extends ActivityButtonBase 
    {

        protected var ui:ActivityButtonSkin;

        public function ActivityButton()
        {
            ui = new ActivityButtonSkin();
            super(ui);
            ui.txtTitle.isHtmlText = true;
        }

        override public function set skin(cl:Class):void
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
                    if (onClick != null)
                    {
                        onClick(_local2);
                    }
                    return;
            }
        }

        protected function onButtonClick():void
        {
        }

        override public function onActivityData(data:Object):void
        {
        }

        override public function onActivityOpen():void
        {
        }

        override public function onActivityClose():void
        {
        }

        override protected function onTextStart(second:int):String
        {
            var title:String = this.title;
            var startTxt:String = super.onTextStart(second);
            ui.txtTitle.htmlText = startTxt;
            return startTxt;
        }

        override protected function onTextRuning():String
        {
            var runingTxt:String = super.onTextRuning();
            ui.txtTitle.htmlText = runingTxt;
            return runingTxt;
        }

        override protected function onTextEnd(second:int):String
        {
            var endTxt:String = super.onTextEnd(second);
            ui.txtTitle.htmlText = endTxt;
            return endTxt;
        }
		
		override protected function onTextEmpty():void
		{
			ui.txtTitle.htmlText = "";
		}

        override protected function onTextColse():String
        {
            var closeTxt:String = super.onTextColse();
            ui.txtTitle.htmlText = closeTxt;
            return closeTxt;
        }
    }
}