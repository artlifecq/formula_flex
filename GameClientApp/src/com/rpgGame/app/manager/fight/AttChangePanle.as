package com.rpgGame.app.manager.fight
{
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import flash.utils.getTimer;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Back;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.Sprite;
	
	public class AttChangePanle extends Sprite
	{
		private var _newdMoveList:Vector.<AttackFace>;
		private var tweenMap:HashMap;
		
		private var waitEftDatas:Vector.<AttEftData>;
		private var playingNum:int;
		private var maxPlayNum:int=10;
		private var prePlayTime:int;
		private var showTime:Number=0.3;
		private var moveTime:Number=0.5;
		private var missTime:Number=0.2;
		private var showY:int=60;
		private var showY1:int=150;
		private var showY2:int=200;
		private var lastPlayFace:AttackFace;
		private var oneFaceH:int=29;

		public function AttChangePanle(x:int,y:int):void
		{
			super();
			this.x = x;
			this.y = y;
			_newdMoveList = new Vector.<AttackFace>();
			waitEftDatas=new Vector.<AttEftData>();
			tweenMap=new HashMap();
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
			playNextEft();
		}
		
		private function playNextEft():void
		{
			var overTime:Number=getTimer()-prePlayTime;
			overTime=overTime*0.001;
			
			if(playingNum<maxPlayNum&&waitEftDatas.length!=0&&overTime>=showTime){
				prePlayTime=getTimer();
				var eftData:AttEftData=waitEftDatas.shift();
				playingNum++;
				var attackFace : AttackFace= AttackFace.createAttackFace(eftData.typeRes, eftData.numberRes, eftData.value);
				attackFace.touchAcross = true;
				attackFace.touchable = false;
				attackFace.touchGroup = false;
				attackFace.visible = true;
				attackFace.alpha=0;
				attackFace.y=0;
				this.addChild(attackFace);
				tweenNormalAtt(attackFace);
			}
		}		
		
		/**
		 *普通属性瓢字 
		 * @param attackFace
		 * 
		 */
		private function tweenNormalAtt(attackFace:AttackFace):void
		{
			lastPlayFace=attackFace;
			var myTimeline: TimelineLite= new TimelineLite({onComplete:eftTweenComplete,onCompleteParams:[attackFace]});
			myTimeline.append(new TweenLite(attackFace, showTime, {alpha:1,y:attackFace.y-showY,onComplete:onAlphaComplete}));
			myTimeline.append(new TweenLite(attackFace, moveTime, {y:attackFace.y-showY1}));
			myTimeline.append(new TweenLite(attackFace, missTime, {alpha:0,y:attackFace.y-showY2}));
		}		
		
		private function eftTweenComplete(attackFace:AttackFace):void
		{
			playingNum--;
			if(playingNum==0){
				lastPlayFace=null;
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