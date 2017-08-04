package com.rpgGame.app.manager.fight
{
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
		private var tweenMap:HashMap;

		private var delaTime:Number=0.5;
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
			delaTime=-0.5;
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
				typeRes=FightFaceHelper.getAttributeUrl(key,val>0);
				numberColor=val>0?FightFaceHelper.ATTRIBUTE_USESFUL_NUM:FightFaceHelper.ATTRIBUTE_HARMFUL_NUM;
				delaTime+=0.5;
				TweenLite.delayedCall(delaTime,showAttackFaceNew,[typeRes, numberColor, val]);
			}
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
			addFace(showobj);
		}
		
		private function standCompleteHandler(attackFace:AttackFace):void
		{
			var index:int = _newdMoveList.indexOf(attackFace);
			if(index>=0)
				_newdMoveList.splice(index,1);
			var myTimeline:TimelineLite=tweenMap.getValue(attackFace);
			if(myTimeline){
				myTimeline.kill();
			}
			tweenMap.remove(attackFace);
			attackFace.recycleSub();
			attackFace.alpha = attackFace.scaleX = attackFace.scaleY = 1;
			attackFace.y=0;
			attackFace.x=0;
			//从场景中移除
			if (attackFace != null && attackFace.parent != null)
				attackFace.parent.removeChild(attackFace);
			//池回收
			AttackFace.recycleAttackFace(attackFace);
		}
		
		private function addFace(attackFace:AttackFace):void
		{
			var height:Number = attackFace.height;
			this.addChild(attackFace);
			var showobj:AttackFace;
			var myTimeline:TimelineLite;
			
			while(_newdMoveList.length>4){
				showobj=_newdMoveList.pop();
				standCompleteHandler(showobj);
			}
			attackFace.alpha=0;
			_newdMoveList.splice(0,0,attackFace);
			var length:int=_newdMoveList.length;
			for(var i:int = 0;i<length;i++)
			{
				showobj=_newdMoveList[i];
				showobj.x=0;
				var setY:int=i*height*-1;
				if(showobj.y>=setY){
					showobj.y = setY;
				}
				myTimeline=tweenMap.getValue(showobj);
				if(!myTimeline){
					myTimeline = new TimelineLite({onComplete:standCompleteHandler,onCompleteParams:[showobj]});
					myTimeline.append(new TweenLite(showobj, 0.2, {alpha:1,ease:Expo.easeIn,onUpdate:onUpdateFaceY,onUpdateParams:[showobj]}));
					myTimeline.append(new TweenLite(showobj, 0.8, {ease:Expo.easeIn,onUpdate:onUpdateFaceY,onUpdateParams:[showobj]}));
					myTimeline.append(new TweenLite(showobj, 0.5, {alpha:0,ease:Expo.easeOut}));
					tweenMap.add(showobj,myTimeline);
				}
			}
		}
		
		private function onUpdateFaceY(attackFace:AttackFace):void
		{
			attackFace.y=attackFace.y-5;
		}
	}
}