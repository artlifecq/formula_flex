package com.rpgGame.app.manager.fight
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.geom.Point;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Quart;
	
	import starling.display.Sprite;
	
	public class AttChangePop extends Sprite
	{
		private var waitEftDatas:Vector.<AttEftData>;
		private var maxPlayingNum:int=5;
		private var maxWait:int=10;
		private var oneFaceH:int=29;
		private var showAttackTween:TweenLite;
		

		public function AttChangePop(x:int,y:int):void
		{
			super();
			this.x = x;
			this.y = y;
			waitEftDatas=new Vector.<AttEftData>();
		}
		
		public function clear():void
		{
			waitEftDatas.length=0;
		}
		
		public function addChangeHandler(hash:HashMap):void
		{
			var keys:Array=hash.keys();
			keys.sort();
			var len:int=keys.length;
			var key:int=0;
			var val:int=0;
			var numberColor : String = "";
			for (var i:int = 0; i <len; i++) 
			{
				key=keys[i];
				if (CharAttributeType.SPEED==key) 
				{
					continue;
				}
				val=hash.getValue(key);
				if(val==0){
					continue;
				}
				var data:AttEftData=new AttEftData();
				data.typeRes=FightFaceHelper.getAttributeUrl(key,val>0);
				data.numberRes=val>0?FightFaceHelper.ATTRIBUTE_USESFUL_NUM:FightFaceHelper.ATTRIBUTE_HARMFUL_NUM;
				data.value=val;
				waitEftDatas.push(data);
			}
			
			while(waitEftDatas.length>maxWait){
				waitEftDatas.shift();
			}
			
			playNextEft();
		}
		
		private function playNextEft():void
		{
			playNextEft1();
		}
		
		private function playNextEft1():void
		{
			if(waitEftDatas.length==0||showAttackTween){
				return;
			}
			
			var eftData:AttEftData=waitEftDatas.shift();
			var attackFace : AttackFace;
			attackFace= AttackFace.createAttackFace(eftData.typeRes, eftData.numberRes, eftData.value);
			attackFace.x=0;
			attackFace.y=oneFaceH;
			attackFace.alpha=0;
			attackFace.scaleX=attackFace.scaleY=0.1;
			this.addChild(attackFace);
			showAttackTween=TweenLite.to(attackFace,0.4,{y:0,alpha:1,scaleX:0.7,scaleY:0.7,onComplete:onShowComplete,onCompleteParams:[attackFace]});
		}
		
		private function onShowComplete(attackFace:AttackFace):void
		{
			showAttackTween=null;
			playNextEft();
			tweenContent(attackFace);
		}
		
		
		private function tweenContent(showobj:AttackFace):void
		{
			var start:Point=new Point(showobj.x,showobj.y);
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({onComplete:onTweenComplete,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.4, {y:start.y-50,scaleX:1,scaleY:1,ease:Quart.easeOut}));
			myTimeline.append(new TweenLite(showobj, 0.8, {y:start.y-150,ease:Quart.easeOut}));
			myTimeline.append(new TweenLite(showobj, 0.3, {y:start.y-190,alpha:0.6,scale:0.8,ease:Quart.easeOut}));
		}
		
		private function onTweenComplete(attackFace:AttackFace):void
		{
			FightFaceHelper.onAtackFaceComplete(attackFace);
			playNextEft();
		}
	}
}

class AttEftData{
	public var typeRes:int;
	public var numberRes:int;
	public var value:int;
}