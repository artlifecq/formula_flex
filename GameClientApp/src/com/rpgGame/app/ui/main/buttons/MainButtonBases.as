package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.Button;
	import feathers.controls.ButtonState;
	import feathers.controls.StateSkin;
	import feathers.themes.GuiTheme;
	
	import gs.TweenMax;
	
	import starling.display.Image;
	import starling.textures.IStarlingTexture;
	
	public class MainButtonBases extends Button implements IOpen
	{
		private var _info:FunctionBarInfo;
		
		protected var _openState:Boolean=true;
		private var resList:Array=[];
		
		public function get info():FunctionBarInfo
		{
			return _info;
		}
		
		public function set info(value:FunctionBarInfo):void
		{
			_info = value;
		}
		
		public function canOpen():Boolean
		{
			return FunctionOpenManager.getOpenLevelByFunBarInfo(_info)<=MainRoleManager.actorInfo.totalStat.level;
		}
		
		private var _needPlayFirstAm:Boolean = false;

		public function get needPlayFirstAm():Boolean
		{
			return _needPlayFirstAm;
		}

		public function set needPlayFirstAm(value:Boolean):void
		{
			_needPlayFirstAm = value;
		}

		public function MainButtonBases():void
		{
			super();
			this.width=this.height=60;//默认设置为60
		}
		
		override public function set styleClass(cls:Class):void
		{
			var styles:StateSkin=new cls();
			var skinNames:Object=styles.skinNames;
			resList.push(skinNames.up);
			resList.push(skinNames.hover);
			resList.push(skinNames.down);
			loadSkin();
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
		
		override protected function feathersControl_addedToStageHandler(event:Event):void
		{
			super.feathersControl_addedToStageHandler(event);
			onShow();
		}
		
		protected function onShow():void
		{
			this.visible = !_needPlayFirstAm;
		}
		
		
		override public function get width():Number
		{
			if(needPlayFirstAm)
				return 0;
			else
				return super.width;
		}
		
		override public function get height():Number
		{
			if(needPlayFirstAm)
				return 0;
			else
				return super.height;
		}
		
		override protected function feathersControl_removedFromStageHandler(event:Event):void
		{
			super.feathersControl_removedFromStageHandler(event);
			onHite();
		}
		
		protected function onHite():void
		{
			
		}
		
		override protected function initialize():void
		{
			if (/*!ClientConfig.isBanShu&&*/_info.tips!="")
			{
				TipTargetManager.show(this, TargetTipsMaker.makeSimpleTextTips(_info.tips));
			}
		}
		override protected function changeState(state:String):void
		{
			var oldState:String = this._currentState;
			if(oldState === state)
			{
				return;
			}
			super.changeState(state);
			if(state == ButtonState.DOWN)
			{
				triggeredHanadler();
//				run();
			}
		}
		
		protected function triggeredHanadler():void
		{
			FunctionOpenManager.openModeByInfo(_info,_info.open_id);
		}
		
		private var _tweenmax:TweenMax;
		public function runAnimation():void
		{
			if(_tweenmax!=null)
			{
				_tweenmax.restart();
				return ;
			}
			var lasty:Number = this.y;
			_tweenmax = TweenMax.to(this,0.1,{repeat:5,y:lasty-10,onComplete:onTweenFlyComplete,onCompleteParams:[this,lasty]});
		}
		
		private function onTweenFlyComplete(display:IOpen,lastY:Number):void
		{
			_tweenmax = null;
			display.y = lastY;
		}
	}
}