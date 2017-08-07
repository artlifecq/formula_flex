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
		private var one_cont_max:int=5;
		
		private var prePlayTime:int;
		
		private var showTime:Number=0.2;
		private var moveTime:Number=0.5;
		private var missTime:Number=0.2;
		
		private var showY:int=50;
		private var oneFaceH:int=29;
		private var isStartPlay:Boolean;

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
			
			if(!isStartPlay){
				isStartPlay=true;
				playNextEft();
			}
		}
		
		private function playNextEft():void
		{
//			playNextEft1();
			playNextEft2();
		}
		
		private function playNextEft2():void
		{
			if(waitEftDatas.length==0){
				return;
			}
			
			var overTime:Number=getTimer()-prePlayTime;
			overTime=overTime*0.001;
			
			if(overTime>=showTime){//达到播放条件可播放下一批
				prePlayTime=getTimer();
				var content:AttChangeListCont=AttChangeListCont.create();
				this.addChild(content);
				while(content.numChildren<one_cont_max){
					if(waitEftDatas.length==0){
						break;
					}
					var eftData:AttEftData=waitEftDatas.shift();
					var attackFace : AttackFace= AttackFace.createAttackFace(eftData.typeRes, eftData.numberRes, eftData.value);
					attackFace.x=0;
					attackFace.y=0;
					content.addChild(attackFace);
				}
				for(var i:int=0;i<content.numChildren;i++){
					content.getChildAt(i).y=i*oneFaceH;
				}
				content.y=0;
				showY=content.height;
				tweenContent(content);
			}
		}
		
		private function tweenContent(content:AttChangeListCont):void
		{
			var myTimeline: TimelineLite= new TimelineLite({onComplete:contTweenComplete,onCompleteParams:[content]});
			myTimeline.clear();
			myTimeline.append(new TweenLite(content, showTime, {alpha:1,y:content.y-showY}));
			myTimeline.append(new TweenLite(content, moveTime, {y:content.y-showY-50}));
			myTimeline.append(new TweenLite(content, missTime, {alpha:0,y:content.y-showY-100}));
		}
		
		
		private function contTweenComplete(attackFace:AttChangeListCont):void
		{
			AttChangeListCont.recycle(attackFace);
			if(waitEftDatas.length!=0){
				playNextEft();
			}else{
				isStartPlay=false;
			}
		}
		
		private function onAlphaComplete():void
		{
			playNextEft();
		}
	}
}

class AttEftData{
	public var typeRes:String;
	public var numberRes:String;
	public var value:int;
}