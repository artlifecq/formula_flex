package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.app.manager.FunctionOpenManager;
    
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
			this.onTextColse();
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
            ui.txtTitle.htmlText = startTxt;
			if(!ui.skinBg1.visible){
				ui.skinBg1.visible=true;
			}
            return startTxt;
        }

        override protected function onTextRuning():String
        {
            var runingTxt:String = super.onTextRuning();
            ui.txtTitle.htmlText = runingTxt;
			if(!ui.skinBg1.visible){
				ui.skinBg1.visible=true;
			}
            return runingTxt;
        }

        override protected function onTextEnd(second:int):String
        {
            var endTxt:String = super.onTextEnd(second);
            ui.txtTitle.htmlText = endTxt;
			if(!ui.skinBg1.visible){
				ui.skinBg1.visible=true;
			}
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
			ui.skinBg1.visible=false;
            return closeTxt;
        }
		
		override protected function onTextRuningTime(second:int):String
		{
			var closeTxt:String = super.onTextRuningTime(second);
			ui.txtTitle.htmlText = closeTxt;
			if(!ui.skinBg1.visible){
				ui.skinBg1.visible=true;
			}
			return closeTxt;
		}
    }
}