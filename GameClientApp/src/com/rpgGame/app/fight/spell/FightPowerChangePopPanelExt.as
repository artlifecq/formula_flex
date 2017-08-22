package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.app.fight.spell.slotmachine.SlotMachineCon;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import away3d.events.Event;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import org.mokylin.skin.mainui.zhandouli.ZhandouliTipSkin;
	
	import starling.filters.GlowFilter;
	
	/**
	 *战斗力改变提示 
	 * @author dik
	 * 
	 */
	public class FightPowerChangePopPanelExt extends SkinUI
	{
		private static var _ins:FightPowerChangePopPanelExt=new FightPowerChangePopPanelExt();
		private var endY:int;
		
		private var fightText:SlotMachineCon;
		private var addText:SlotMachineCon;
		private static var _HelpW:Number = 0;
		private static var _HelpH:Number = 0;
		private var _skin:ZhandouliTipSkin;
		public function FightPowerChangePopPanelExt():void
		{
			
			_skin=new ZhandouliTipSkin();
			super(_skin);
			init();
		}
		public static function showFightPowerChange(newPower:int,oldPower:int):void
		{
			if (newPower==oldPower) 
			{
				return;
			}
			_ins.setData(newPower,oldPower);
			StarlingLayerManager.topUILayer.addChild(_ins);
		}
		private function setData(newValue:int,oldValue:int):void
		{
			TweenLite.killTweensOf(this);
			fightText.stopRollRightNow();
			addText.stopRollRightNow();
			var change:int = newValue-oldValue;
			fightText.setData(oldValue,newValue,-1);
			_skin.num_lv.label=change>0?"x":"-";
			_skin.num_lv.x=fightText.x+fightText.width+2;
			_skin.num_lv.visible=true;
			addText.setData(Math.abs(change),0,-1);
			addText.x = _skin.num_lv.x+_skin.num_lv.width;
			_HelpW = addText.x +addText.width;
			this.pivotX = _HelpW/2;
			this.pivotY = _HelpH/2;
			this.scaleX=3;
			this.scaleY=2;
			this.alpha=1;
			onResize();
			TweenLite.to(this,0.1,{scaleX:1,scaleY:1});
			TweenLite.to(this,0.3,{onComplete:scaleComplete});
		}
		
		private function init():void
		{
			MCUtil.removeSelf(_skin.num_yellow1);
			fightText=new SlotMachineCon("ui/component/uinumber/skin_zhandouli_yellow/",43,1);
			fightText.x=_skin.num_yellow1.x;
			fightText.y=_skin.num_yellow1.y;
			this.addChild(fightText);
			
			addText = new SlotMachineCon("ui/component/uinumber/skin_zhandouli_yellow/",43,1);
			addText.y=_skin.num_yellow1.y;
			addText.isZeroHide=true;
			this.addChild(addText);
			_HelpH = _skin.height;
			
			fightText.addEventListener(SlotMachineCon.ALLLISTSTOP,onFightRollStop);
			addText.addEventListener(SlotMachineCon.ALLLISTSTOP,onAddRollStop);
		}
		
		private function onAddRollStop(eve:Event):void
		{
			// TODO Auto Generated method stub
			_skin.num_lv.visible=false;
			numRunCompleteHandler();
		}
		
		private function onFightRollStop(eve:Event):void
		{
			// TODO Auto Generated method stub
			numRunCompleteHandler();
		}
		
		private function get skin():ZhandouliTipSkin
		{
			return _skin as ZhandouliTipSkin;
		}

		
		private function scaleComplete():void
		{
			if(this.parent==null)
				return ;
			fightText.startRoll();
			addText.startRoll();
		}
		
		private function numRunCompleteHandler():void
		{
			if(fightText.isRunning)
				return ;
			if(addText.isRunning)
				return ;
			if(this.parent==null)
				return ;
			//this.filter = new GlowFilter(0xffff00,1,70,1);
			var timeLine:TimelineLite = new TimelineLite();
			timeLine.append(TweenLite.to(skin.container,0.4,{scale:1.5,ease:Expo.easeOut}));
			timeLine.append(TweenLite.to(skin.container,0.4,{scale:1}));
			timeLine.append(TweenLite.to(skin.container,0.3,{y:y-100,alpha:0,ease:Expo.easeOut,onComplete:popComplete}));
			
		}
		
		private function popComplete():void
		{
			this.filter=null;
			MCUtil.removeSelf(this);
		}
		
		private function onResize():void
		{
			if(_stage)
			{
				onStageResize(_stage.stageWidth, _stage.stageHeight);
			}
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=sw/2;
			this.y=sh-_HelpH-100;
		}
	}
}