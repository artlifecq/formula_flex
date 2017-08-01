package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
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
		private var beforeFight:int;
		private var afterFight:int;
		private var endY:int;
		
		private var fightTextImage:NumberTextImage;
		private var addTextImage:NumberTextImage;
		private static var _HelpW:Number = 0;
		private static var _HelpH:Number = 0;
		private static var _last:FightChangePop;
		public function FightChangePop(data:*):void
		{
			beforeFight=data[1];
			afterFight=data[0];
			_skin=new ZhandouliTipSkin();
			super(data);
			init();
		}
		private function init():void
		{
			if(_last!=null)
			{
				_last.popComplete();
			}
			_last = this;
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
			scaleComplete();
			/*TweenMax.to(skin.container,0.0,{scaleX:10,alpha:1});
			TweenMax.to(skin.container,0.6,{scale:1,alpha:1,ease:Expo.easeOut,onUpdate:updateSeate,onComplete:scaleComplete});*/
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
			_last = null;
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