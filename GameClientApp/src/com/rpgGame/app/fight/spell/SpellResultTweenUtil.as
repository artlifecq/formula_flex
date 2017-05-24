package com.rpgGame.app.fight.spell
{
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.utils.MCUtil;
	
	import flash.geom.Point;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Expo;
	import gs.easing.Quart;
	
	import starling.display.DisplayObject;

	public class SpellResultTweenUtil
	{
		private static var _range:Number=0;
		private static var startPos:Point=new Point();
		private static var endPos:Point=new Point();
		private static const BASE_DIS:int=200;
		public function SpellResultTweenUtil()
		{
		}
		private static function get range():Number
		{
			_range+=0.2;
			if (_range>=1) 
			{
				_range=0;
			}
			return _range;
		}
		private static function calEndPos(start:Point,end:Point):void
		{
			var dis:int=Point.distance(start,end);
			if (dis==0) 
			{
				dis=BASE_DIS;
			}
			endPos=Point.interpolate(start,end,-BASE_DIS/dis*(1+range));
		}
		/**
		 *计算x的正负，相对于hurtPos的 
		 * @param attackPos
		 * @param hurtPos
		 * @return 
		 * 
		 */		
		private static function calXPM(attackPos:Point,hurtPos:Point):int
		{
			if (attackPos.x<hurtPos.x) 
			{
				return 1;
			}
			else if (attackPos.x>hurtPos.x) 
			{
				return -1;
			}
			return 1;
		}
		private static function calYPM(attackPos:Point,hurtPos:Point):int
		{
			if (attackPos.y<hurtPos.y) 
			{
				return 1;
			}
			else if (attackPos.y>hurtPos.y) 
			{
				return -1;
			}
			return 1;
		}
		public static function TweenCirt(showobj:DisplayObject,attackObj:SceneRole,hurtObj:SceneRole):void
		{
			if (!showobj||!attackObj||!hurtObj) 
			{
				return;
			}
			var start:Point=attackObj.pos;
			var end:Point=hurtObj.pos;
			showobj.x=start.x;
			showobj.y=start.y;
			
			var pmX:int=calXPM(start,end);
			var pmY:int=calYPM(start,end);
			calEndPos(start,end);
			var myTimeline:TimelineLite;
			myTimeline = new TimelineLite({delay:0.5,onComplete:tweenComplte,onCompleteParams:[showobj]});
			myTimeline.append(new TweenLite(showobj, 0.25, {x:endPos.x,y:endPos.y,ease:Quart.easeOut}));//,ease:Expo.easeOut
			myTimeline.addLabel("alpha1", 0);
			myTimeline.insert(new TweenLite(showobj, 0.2, {alpha:1,scaleX:0.9,scaleY:0.9}), "alpha1");
			myTimeline.append(new TweenLite(showobj, 0.3, {delay:0.1,alpha:0,scaleX:0.7,scaleY:0.7,x:(endPos.x+pmX*60),y:(endPos.y+pmY*40),ease:Quart.easeIn}));
		}
		private static function tweenComplte(...arg):void
		{
			MCUtil.removeSelf(arg[0]);
		}
	}
}