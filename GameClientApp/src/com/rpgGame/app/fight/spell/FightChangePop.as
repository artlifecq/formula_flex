package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.core.manager.StarlingLayerManager;
	
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
	public class FightChangePop extends PopSkinUI
	{
		private static var _ins:FightChangePop=new FightChangePop();
		private var beforeFight:int;
		private var afterFight:int;
		private var endY:int;
		
		private var fightTextImage:NumberTextImage;
		private var addTextImage:NumberTextImage;
		private static var _HelpW:Number = 0;
		private static var _HelpH:Number = 0;
		public function FightChangePop():void
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
		private function setData(newP:int,oldP:int):void
		{
			TweenLite.killTweensOf(this);
			beforeFight=oldP;
			afterFight=newP;
			
			var last:int = afterFight-beforeFight;
			var isTop:Boolean = last>0;
			fightTextImage.init(beforeFight,afterFight,isTop);
			_HelpW = fightTextImage.x +fightTextImage.width;
			
			addTextImage.init(last,0,isTop);
			addTextImage.x = _HelpW + 20;
			_HelpW = addTextImage.x +addTextImage.width;
			this.pivotX = _HelpW/2;
			this.pivotY = _HelpH/2;
			this.scaleX=3;
			this.scaleY=1.5;
			updateSeate();
			TweenLite.to(this,0.1,{scaleX:1,scaleY:1,onComplete:scaleComplete});
		}
		
		private function init():void
		{
			fightTextImage = new NumberTextImage(skin.num_yellow1,numRunCompleteHandler);
			skin.container.addChild(fightTextImage);
			addTextImage = new NumberTextImage(skin.num_lv,numRunCompleteHandler,true,true);
			skin.container.addChild(addTextImage);
			_HelpH = _skin.height;
		}
		
		private function get skin():ZhandouliTipSkin
		{
			return _skin as ZhandouliTipSkin;
		}

		
		private function scaleComplete():void
		{
			if(this.parent==null)
				return ;
			fightTextImage.startRolling();
			addTextImage.startRolling();
		}
		
		private function numRunCompleteHandler():void
		{
			if(!fightTextImage.isRollerEnd)
				return ;
			if(!addTextImage.isRollerEnd)
				return ;
			if(this.parent==null)
				return ;
			skin.container.filter = new GlowFilter(0xffff00,1,70,1);
			var timeLine:TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(skin.container,0.5,{scale:1.3,ease:Expo.easeOut}));
			timeLine.append(TweenLite.to(skin.container,0.5,{}));
			timeLine.append(TweenLite.to(skin.container,0.3,{alpha:0,ease:Expo.easeOut,onComplete:popComplete}));
			
		}
		
		override protected function popComplete():void
		{
			if(this.parent==null)
				return ;
			if(fightTextImage.isRollerEnd)
				fightTextImage.stopRun(false);
			if(addTextImage.isRollerEnd)
				addTextImage.stopRun(false);
			super.popComplete();
		}
		
		private function updateSeate():void
		{
			if(_stage){
				onStageResize(_stage.stageWidth, _stage.stageHeight);
			}
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=sw/2;
			this._skin.container.y=sh-_HelpH-100;
		}
	}
}