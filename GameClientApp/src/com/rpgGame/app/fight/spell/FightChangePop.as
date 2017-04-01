package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import feathers.controls.UINumber;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	
	import org.mokylin.skin.mainui.zhandouli.ZhandouliTipSkin;
	
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

		private var changNumber:UINumber;

		private var changeList:Array;

		public function FightChangePop(data:*)
		{
			afterFight=data[0];
			beforeFight=data[1];
			_skin=new ZhandouliTipSkin();
			super(data);
		}
		
		private function get skin():ZhandouliTipSkin
		{
			return _skin as ZhandouliTipSkin;
		}
		
		override  protected function onShow() : void
		{
			skin.num_yellow1.number=beforeFight;
			skin.container.alpha=0;
			skin.container.scaleX=skin.container.scaleY=1.5;
			skin.num_hong.visible=false;
			skin.num_lv.visible=false;
			skin.num_hong.x=skin.num_lv.x=skin.num_yellow1.x+skin.num_yellow1.width+20;
			TweenLite.to(skin.container,0.5,{scaleX:1,scaleY:1,alpha:1,onComplete:tween1});
		}
		
		private function tween1():void
		{
			var change:int=afterFight-beforeFight;
			changeList=getChangeList(change);
			var v:int;
			if(change>0){
				changNumber=skin.num_lv;
				changNumber.label="x"+change;
				skin.num_hong.visible=false;
				changNumber.y=100;
				endY=30;
			}else{
				changNumber=skin.num_hong;
				changNumber.label=String(change);
				skin.num_lv.visible=false;
				changNumber.y=0;
				endY=80;
			}
			changNumber.visible=true;
			changNumber.alpha=0;
			TweenLite.to(changNumber,0.5,{alpha:1,y:50,onComplete:tween2});
		}
		
		private function getChangeList(changeV:int):Array
		{
			var v:int=	Math.abs(changeV);
			var per:int;
			var i:int=5;
			while(i>0){
				per=Math.floor(v/i);
				if(per!=0){
					break;
				}
				i--;
			}
			if(changeV<0){
				per*=-1;
			}
			
			var num:int=i+1;
			var list:Array=[];
			for(i=1;i<num;i++){
				list.push(beforeFight+i*per);
			}
			return list;
		}
		
		private function tween2():void
		{
			TweenLite.to(changNumber,0.2,{alpha:0,y:endY});
			var  timeLine : TimelineLite = new TimelineLite();
			for(var i:int=0;i<changeList.length;i++){
				if(i==changeList.length-1){
					timeLine.append(TweenLite.delayedCall(0.1,delayTween1,[changeList[i]]));
				}else{
					timeLine.append(TweenLite.delayedCall(0.1,delayTween,[changeList[i]]));
				}
			}
		}
		
		private function delayTween1(v:int):void
		{
			skin.num_yellow1.number=v;
			TweenLite.delayedCall(0.5,popComplete);
		}
		
		private function delayTween(v:int):void
		{
			skin.num_yellow1.number=v;
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.width)/2;
			this._skin.container.y=sh-this._skin.height-50;
		}
	}
}