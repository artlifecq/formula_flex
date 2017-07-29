package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.display2D.PopSkinUI;
	
	import feathers.controls.UINumber;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.TweenMax;
	import gs.easing.Expo;
	
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
//			skin.num_hong.visible=false;
			skin.num_lv.visible=false;
//			skin.num_hong.x=skin.num_lv.x=skin.num_yellow1.x+skin.num_yellow1.width+20;
			
			var change:int=afterFight-beforeFight;
			changeList=getChangeList(change);
			var v:int;
			if(change>0){
				changNumber=skin.num_lv;
				changNumber.label="x"+change;
//				skin.num_hong.visible=false;
				changNumber.y=75;
				endY=35;
			}else{
//				changNumber=skin.num_hong;
				changNumber.label=String(change);
				skin.num_lv.visible=false;
				changNumber.y=35;
				endY=75;
			}
			changNumber.visible=true;
			changNumber.alpha=0;
			skin.container.y-=20;
			
//			skin.bg.width=skin.num_yellow1.x+skin.num_yellow1.width+20+changNumber.width+55;
			
			
			TweenMax.to(skin.container,0.0,{scale:2,alpha:0});
			TweenMax.to(skin.container,0.3,{scale:1,alpha:1,ease:Expo.easeOut,onUpdate:updateSeate});
			TweenMax.to(changNumber,0.6,{delay:0.3,y:55,alpha:1,ease:Expo.easeOut,onComplete:remove_change});
		}
		
		private function remove_change():void
		{
			
			TweenLite.to(changNumber,0.2,{alpha:0,y:endY});
			var  timeLine : TimelineLite = new TimelineLite();
			for(var i:int=0;i<changeList.length;i++){
				timeLine.append(TweenLite.delayedCall(0.1,delayTween,[changeList[i]]));
			}
			
			TweenMax.to(changNumber,0.3,{delay:0.5,y:endY,alpha:0,onComplete:changComplete});
		}
		
		private function changComplete():void
		{
			TweenMax.to(skin.container,0.3,{y:skin.container.y+20,alpha:0,ease:Expo.easeOut,onComplete:popComplete});
		}
		
		private function updateSeate():void
		{
			if(_stage){
				onStageResize(_stage.stageWidth, _stage.stageHeight);
			}
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
		
		private function delayTween(v:int):void
		{
			skin.num_yellow1.number=v;
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this._skin.container.x=(sw-this._skin.container.width*this._skin.container.scale)/2;
			this._skin.container.y=sh-this._skin.container.height*this._skin.container.scale-50;
		}
	}
}