package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
	
	import away3d.events.Event;
	
	import feathers.controls.ButtonState;
	import feathers.themes.GuiTheme;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.openActivity.OpenActivityBtnSkin;
	import org.mokylin.skin.mainui.activityBar.ActivityButtonSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.textures.IStarlingTexture;
	
	public class BaseOpenActivityBtn extends ActivityButtonBase
	{
		protected var ui:OpenActivityBtnSkin;
		
		public function BaseOpenActivityBtn()
		{
			ui = new OpenActivityBtnSkin();
			super(ui);
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
		
		override public function set styleClass(cl:Class):void
		{
			ui.btnBar.styleClass = cl;
		}
		
		override public function set title(value:String):void
		{
			
		}
		
		override public function setTips(target:DisplayObject, tipReady:String, tipRuning:String):void
		{
			super.setTips(ui.btnBar, tipReady, tipRuning);
		}
		
		override protected function onShow():void
		{
			super.onShow();
		
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch (target)
			{
				case ui.btnBar:
					clickMe();
					return;
			}
		}
		public function clickMe():void
		{
			onButtonClick();
		}
		protected function onButtonClick():void
		{
	
			
		}
		
		override public function onActivityData(data:Object):void
		{
		}
	}
}