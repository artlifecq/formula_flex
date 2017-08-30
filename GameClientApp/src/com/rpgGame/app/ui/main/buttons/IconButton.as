package com.rpgGame.app.ui.main.buttons
{
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.StateSkin;
	import feathers.themes.GuiTheme;
	
	import starling.display.Image;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.IStarlingTexture;
	
	/**
	 *icon按钮
	 * @author dik
	 * 2017
	 */
	public class IconButton extends Button
	{
		private var resList:Array;
		
		public function IconButton()
		{
			super();
		}
		
		override public function set styleClass(cls:Class):void
		{
			var styles:StateSkin=new cls();
			var skinNames:Object=styles.skinNames;
			resList=[];
			resList.push(skinNames.up);
			resList.push(skinNames.hover);
			resList.push(skinNames.down);
			loadSkin();
		}
		
		override protected function trigger():void
		{
			super.trigger();
		}
		
		private function loadSkin():void
		{
			GuiTheme.ins.LoadAsset(resList.pop(), onImgLoad, 6000, 0);			
		}
		
		private function onImgLoad(texture:IStarlingTexture):void
		{
			setBtnState(texture);
			if(resList.length!=0){
				loadSkin();
			}
		}
		
		override protected function basicButton_touchHandler(event:TouchEvent):void
		{
			super.basicButton_touchHandler(event);
			if(!this._isEnabled)
			{
				return;
			}
			var touch:Touch = event.getTouch(this, null, this.touchPointID);
			touch = event.getTouch(this, TouchPhase.ENDED);
			if(touch){
				trigger();
			}
		}
		
		protected function setBtnState(texture:IStarlingTexture):void
		{
			var img:Image=new Image(GuiTheme.ins.getTexture(texture.key));
			switch(resList.length){
				case 2:
					this.setSkinForState(ButtonState.DOWN,img);
					break;
				case 1:
					this.setSkinForState(ButtonState.HOVER,img);
					break;
				case 0:
					this.setSkinForState(ButtonState.UP,img);
					this.width=img.width;
					this.height=img.height;
					break;
			}
		}
	}
}