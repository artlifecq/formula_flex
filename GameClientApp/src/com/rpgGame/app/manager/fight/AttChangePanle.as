package com.rpgGame.app.manager.fight
{
	import com.game.mainCore.libCore.handle.HandleThread;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.app.fight.spell.time.TimeDelay;
	import com.rpgGame.core.events.AttChangeEvent;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import away3d.events.Event;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Circ;
	import gs.easing.Expo;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.Sprite;
	
	public class AttChangePanle extends Sprite
	{
		private var _modeType:int;
		private var _queueThread : HandleThread = new HandleThread(null, true, 20);
		private var _newdMoveList:Vector.<AttackFace>;
		private var _timedalay:TimeDelay;
		public function AttChangePanle(modeType:int,x:int,y:int):void
		{
			_modeType = modeType;
			super();
			this.x = x;
			this.y = y;
			_timedalay = new TimeDelay("");
			init();
		}
		private function init():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE,addToStageHandler);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removeFromStageHandler);
			_newdMoveList = new Vector.<AttackFace>();
		}
		private function addToStageHandler():void
		{
			EventManager.addEvent(AttChangeEvent.CHANGEPROPVALUE,addChangeHandler);
		}
		private function removeFromStageHandler():void
		{
			EventManager.removeEvent(AttChangeEvent.CHANGEPROPVALUE,addChangeHandler);
		}
		private function addChangeHandler(type:int,hash:HashMap):void
		{
			if(_modeType!=type)
				return ;
			var keys:Array=hash.keys();
			keys.sort();
			var len:int=keys.length;
			var key:int=0;
			var val:int=0;
			var typeRes : String = "";
			var numberColor : String = "";
			for (var i:int = 0; i <len; i++) 
			{
				key=keys[i];
				if (CharAttributeType.SPEED==key) 
				{
					continue;
				}
				val=hash.getValue(key);
				typeRes=FightFaceHelper.getAttributeUrl(key,val>0);
				numberColor=val>0?FightFaceHelper.ATTRIBUTE_USESFUL_NUM:FightFaceHelper.ATTRIBUTE_HARMFUL_NUM;
				addAttackFaceNew(typeRes, numberColor, val)
			}
		}
		
		private function addAttackFaceNew(typeRes : String = "", numberRes : String = "", $attackValue : * = 0):void
		{
			_queueThread.push(showAttackFaceNew, [typeRes,numberRes, $attackValue], 100);
		}
		
		private function showAttackFaceNew(typeRes : String = "", numberRes : String = "", $attackValue : * = 0):void
		{
			var attackFace : AttackFace= AttackFace.createAttackFace(typeRes, numberRes, $attackValue);
			attackFace.touchAcross = true;
			attackFace.touchable = false;
			attackFace.touchGroup = false;
			attackFace.visible = true;
			TweenAttrChange(attackFace);
		}
		
		private function TweenAttrChange(showobj:AttackFace):void
		{
			addToStageHanlder(showobj);
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite();
			myTimeline.append(new TweenLite(showobj, 0.2, {delay:0.3,y:-150,ease:Expo.easeIn,onComplete:standCompleteHandler,onCompleteParams:[showobj]}));
			myTimeline.append(TweenLite.delayedCall(0.5,timeCompleteHandler,[myTimeline,showobj]));
		}
		private function standCompleteHandler(attackFace:AttackFace):void
		{
			var index:int = _newdMoveList.indexOf(attackFace);
			if(index>=0)
				_newdMoveList.splice(index,1);
		}
		private function addToStageHanlder(attackFace:AttackFace):void
		{
			var height:Number = attackFace.height;
			var length:int = _newdMoveList.length;
			for(var i:int = 0;i<length;i++)
			{
				_newdMoveList[i].y -= height;
			}
			attackFace.y=0;
			this.addChild(attackFace);
			_newdMoveList.push(attackFace);
		}
		private function timeCompleteHandler(myTimeline:TimelineLite,attackFace:AttackFace):void
		{
			attackFace.recycleSub();
			attackFace.alpha = attackFace.scaleX = attackFace.scaleY = 1;
			TweenLite.killTweensOf(attackFace);
			//从场景中移除
			if (attackFace != null && attackFace.parent != null)
				attackFace.parent.removeChild(attackFace);
			//池回收
			AttackFace.recycleAttackFace(attackFace);
		}
	}
}