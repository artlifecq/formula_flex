package com.rpgGame.app.fight.spell
{
	import feathers.controls.UINumber;
	
	import gs.TimelineLite;
	import gs.TweenLite;

	public class NumberChangeEffect
	{
		private var _changNumber:UINumber;
		public function NumberChangeEffect(changNumber:UINumber):void
		{
			_changNumber = changNumber;
			changeList = new Array();
		}
		
		private var _beforeValue:int;
		private var _afterValue:int;
		private var changeList:Array;
		public function updateValue(beforeValue:int,afterValue:int):void
		{
			_beforeValue = beforeValue;
			_afterValue = afterValue;
			_changNumber.number = _beforeValue;
		}
		
		public function runEffect():void
		{
			getChangeList();
			var  timeLine : TimelineLite = new TimelineLite();
			for(var i:int=0;i<changeList.length;i++){
				timeLine.append(TweenLite.delayedCall(0.05,delayTween,[changeList[i]]));
			}
		}
		
		private function delayTween(v:int):void
		{
			_changNumber.number=v;
		}
		
		private function getChangeList():void
		{
			changeList.length = 0;
			var changeV:int=_afterValue-_beforeValue;
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
			for(i=1;i<num;i++){
				changeList.push(_beforeValue+i*per);
			}
		}
	}
}