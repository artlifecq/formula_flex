package com.rpgGame.app.manager.fight
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.utils.getTimer;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	
	import starling.display.Sprite;
	
	public class AttChangePop extends Sprite
	{
		private var waitEftDatas:Vector.<AttEftData>;
		private var maxPlayingNum:int=5;
		private var maxWait:int=10;
		private var oneFaceH:int=29;
		private var prePlayTime:int;
		private var timeLineMap:HashMap;
		
		private var showTime:Number=0.2*2;
		private var moveTime:Number=0.6+0.4;
		private var missTime:Number=0.2*2;
		
		private var showEndY:int=30;
		private var moveEndY:int=150;
		private var missEndY:int=210;
		private var playList:Vector.<AttackFace>;
		

		public function AttChangePop(x:int,y:int):void
		{
			super();
			this.x = x;
			this.y = y;
			waitEftDatas=new Vector.<AttEftData>();
			playList=new Vector.<AttackFace>();
			timeLineMap=new HashMap();
		}
		
		public function clear():void
		{
			waitEftDatas.length=0;
			
//			while(playList.length>0){
//				var attackFace : AttackFace=playList.pop();
//				var myTimeline: TimelineLite=timeLineMap.remove(attackFace);
//				myTimeline.killTweensOf(attackFace);
//				FightFaceHelper.onAtackFaceComplete(attackFace);
//			}
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
//			playNextEft1();
			playNextEft2();
		}
		
		private function playNextEft2():void
		{
			if(waitEftDatas.length==0||playList.length==maxPlayingNum){
				return;
			}
			
			var overTime:Number=getTimer()-prePlayTime;
			overTime=overTime*0.001;
			
			if(overTime>showTime){//达到播放条件可播放下一批
				var attackFace : AttackFace;
				prePlayTime=getTimer();				
				var createNum:int=0;
				while(playList.length<maxPlayingNum){
					if(waitEftDatas.length==0){
						break;
					}
					var eftData:AttEftData=waitEftDatas.shift();
					attackFace= AttackFace.createAttackFace(eftData.typeRes, eftData.numberRes, eftData.value);
					attackFace.x=0;
					attackFace.y=createNum*oneFaceH;
					attackFace.alpha=0;
					this.addChild(attackFace);
					createNum++;
					tweenContent(attackFace);
					playList.push(attackFace);
				}
			}
		}
		
		private function tweenContent(content:AttackFace):void
		{
			var myTimeline: TimelineLite= new TimelineLite({onComplete:contTweenComplete,onCompleteParams:[content]});
			myTimeline.clear();
			myTimeline.append(new TweenLite(content, showTime, {alpha:1,y:content.y-showEndY}));
			myTimeline.append(new TweenLite(content, moveTime, {y:content.y-moveEndY}));
			myTimeline.append(new TweenLite(content, missTime, {alpha:0,y:content.y-missEndY}));
			timeLineMap.put(content,myTimeline);
		}
		
		private function showComplete():void
		{
			playNextEft();
		}
		
		private function contTweenComplete(attackFace:AttackFace):void
		{
			timeLineMap.remove(attackFace);
			var index:int=playList.indexOf(attackFace);
			if (index==-1) 
			{
				trace("gg");
			}
			playList.removeAt(index);
			FightFaceHelper.onAtackFaceComplete(attackFace);
			if(playList.length==0){
				playNextEft();
			}
		}
	}
}

class AttEftData{
	public var typeRes:String;
	public var numberRes:String;
	public var value:int;
}