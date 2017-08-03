package com.rpgGame.app.manager.fight
{
	import com.game.mainCore.libCore.handle.HandleThread;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Expo;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.Sprite;
	
	public class AttChangePanle extends Sprite
	{
		private var _newdMoveList:Vector.<AttackFace>;
		private var _queueThread : HandleThread = new HandleThread(null, true, 20);
		private var tweenMap:HashMap;
		public function AttChangePanle(x:int,y:int):void
		{
			super();
			this.x = x;
			this.y = y;
			_newdMoveList = new Vector.<AttackFace>();
			tweenMap=new HashMap();
		}
		
		public function addChangeHandler(hash:HashMap):void
		{
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
				showAttackFaceNew(typeRes, numberColor, val);
			}
		}

		/*private function addAttackFaceNew(typeRes : String = "", numberRes : String = "", $attackValue : * = 0):void
		{
			_queueThread.push(showAttackFaceNew, [typeRes,numberRes, $attackValue], 100);
		}*/
		
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
			addFace(showobj);
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({onComplete:standCompleteHandler,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.2, {delay:0.2,y:showobj.y-50,ease:Expo.easeIn}));
			myTimeline.append(new TweenLite(showobj, 0.1, {alpha:0,y:showobj.y-80,ease:Expo.easeOut}));
			tweenMap.add(showobj,myTimeline);
		}
		
		private function standCompleteHandler(attackFace:AttackFace):void
		{
			var index:int = _newdMoveList.indexOf(attackFace);
			if(index>=0)
				_newdMoveList.splice(index,1);
			tweenMap.remove(attackFace);
			attackFace.recycleSub();
			attackFace.alpha = attackFace.scaleX = attackFace.scaleY = 1;
			attackFace.y=0;
			//从场景中移除
			if (attackFace != null && attackFace.parent != null)
				attackFace.parent.removeChild(attackFace);
			//池回收
			AttackFace.recycleAttackFace(attackFace);
		}
		
		private function addFace(attackFace:AttackFace):void
		{
			var height:Number = attackFace.height;
			var length:int = _newdMoveList.length;
			attackFace.y=0;
			for(var i:int = 0;i<length;i++)
			{
				_newdMoveList[i].y = attackFace.y-(i+1)*height;
				var showobj:AttackFace=_newdMoveList[i];
				/*var myTimeline:TimelineLite=tweenMap.getValue(_newdMoveList[i]);
				myTimeline.kill();
				myTimeline.append(new TweenLite(showobj, 0.1, {delay:0.2,y:showobj.y-50,ease:Expo.easeIn}));
				myTimeline.append(new TweenLite(showobj, 0.1, {alpha:0,y:showobj.y-80,ease:Expo.easeOut}));
				myTimeline.play();*/
			}
			this.addChild(attackFace);
			_newdMoveList.push(attackFace);
		}
	}
}