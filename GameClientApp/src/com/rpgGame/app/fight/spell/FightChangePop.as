package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import gs.TweenMax;
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
		private var beforeFight:int;
		private var afterFight:int;
		private var endY:int;
		
		private var fightTextImage:NumberTextImage;
		private var addTextImage:NumberTextImage;
		private static var _HelpW:Number = 0;
		private static var _HelpH:Number = 0;
		public function FightChangePop(data:*):void
		{
			beforeFight=data[0];
			afterFight=data[1];
			_skin=new ZhandouliTipSkin();
			super(data);
			init();
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
		
		override  protected function onShow() : void
		{
			var last:int = afterFight-beforeFight;
			var isTop:Boolean = last>0;
			fightTextImage.init(beforeFight,afterFight,isTop);
			_HelpW = fightTextImage.x +fightTextImage.width;
			
			addTextImage.init(last,0,isTop);
			addTextImage.x = _HelpW + 20;
			_HelpW = addTextImage.x +addTextImage.width;
			_skin.container.pivotX = _HelpW/2;
			_skin.container.pivotY = _HelpH/2;
			updateSeate();
			TweenMax.to(skin.container,0.0,{scaleX:10,alpha:1});
			TweenMax.to(skin.container,0.6,{scale:1,alpha:1,ease:Expo.easeOut,onUpdate:updateSeate,onComplete:scaleComplete});
		}
		
		private function scaleComplete():void
		{
			fightTextImage.startRolling();
			addTextImage.startRolling();
		}
		
		
		private function numRunCompleteHandler():void
		{
			if(!fightTextImage.isRollerEnd)
				return ;
			if(!addTextImage.isRollerEnd)
				return ;
			skin.container.filter = new GlowFilter(0xffff00,1,50,1);
			TweenMax.to(this,0.1,{scale:3,alpha:1});
			TweenMax.to(this,0.3,{scale:1,ease:Expo.easeOut});
			TweenMax.to(this,0.6,{onComplete:completeHandler});	
		}
		
		
		private function completeHandler():void
		{
			TweenMax.to(skin.container,0.3,{y:skin.container.y+20,alpha:0,ease:Expo.easeOut,onComplete:popComplete});
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