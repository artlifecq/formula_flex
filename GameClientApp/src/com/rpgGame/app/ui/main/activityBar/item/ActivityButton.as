package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.app.manager.FunctionOpenManager;
    
    import away3d.events.Event;
    
    import feathers.controls.ButtonState;
    import feathers.themes.GuiTheme;
    
    import gs.TweenLite;
    
    import org.mokylin.skin.mainui.activityBar.ActivityButtonSkin;
    import org.mokylin.skin.mainui.activityBar.ActivityItem;
    
    import starling.display.DisplayObject;
    import starling.display.Image;
    import starling.textures.IStarlingTexture;

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
		
		override public function set styleName(res:String):void
		{
			super.styleName=res;
			var img:Image=new Image(GuiTheme.ins.getTexture("ui/common/waitbtn.png"));
			ui.btnBar.setSkinForState(ButtonState.UP,img);
		}
		
		override protected function setBtnState(texture:IStarlingTexture):void
		{
			var upImg:Image=new Image(GuiTheme.ins.getTexture(texture.key));
			
			/*	var overC:uint=0xf9f3e7;
			overImg.setVertexColor(0,overC);
			overImg.setVertexColor(1,overC);
			overImg.setVertexColor(2,overC);
			overImg.setVertexColor(3,overC);
			var downC:uint=0xc6bfb3;
			downImg.setVertexColor(0,downC);
			downImg.setVertexColor(1,downC);
			downImg.setVertexColor(2,downC);
			downImg.setVertexColor(3,downC);*/
			var state:String=stateToIndex.getValue(_currentLoadIndex);
			ui.btnBar.setSkinForState(state,upImg);
//			ui.btnBar.setSkinForState(ButtonState.HOVER,overImg);
//			ui.btnBar.setSkinForState(ButtonState.DOWN,downImg);
		}
		
		private function sizeHandler(e:Event):void
		{
			ui.btnBar.x = (this.width-ui.btnBar.width)/2;
			ui.skinItem.y = ui.btnBar.y+ui.btnBar.height-5;
			_item.updataWidth(ui.btnBar.width);
			ui.skinItem.x = ui.btnBar.x;
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

		override protected function onShow():void
		{
			super.onShow();
			ui.uiJinXing.visible=false;
		}
		
        override protected function onTouchTarget(target:DisplayObject):void
        {
            var _local2:ActivityButtonBase = this;
            super.onTouchTarget(target);
            switch (target)
            {
                case ui.btnBar:
                    onButtonClick();
					FunctionOpenManager.openByBtnInfo(_btnInfo);
                    return;
            }
        }

        protected function onButtonClick():void
        {
			if(!_btnInfo){
				return;
			}
			if(_btnInfo.q_btn_eft)
			{
				stopEffect();
				TweenLite.delayedCall(600,playEffect);
			}
			
			
        }

        override public function onActivityData(data:Object):void
        {
        }

        
        

        override protected function onTextStart(second:int):String
        {
            var title:String = this.title;
            var startTxt:String = super.onTextStart(second);
			setTextLeable(startTxt);
            return startTxt;
        }

        override protected function onTextRuning():String
        {
            var runingTxt:String = super.onTextRuning();
			setTextLeable(runingTxt);
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
		}

        override protected function onTextColse():String
        {
            var closeTxt:String = super.onTextColse();
			setTextLeable(closeTxt);
            return closeTxt;
        }
		
		override protected function onTextRuningTime(second:int):String
		{
			var closeTxt:String = super.onTextRuningTime(second);
			setTextLeable(closeTxt);
			return closeTxt;
		}
		
		protected function setTextLeable(str:String):void
		{
			_item.text = str;
		}
    }
}