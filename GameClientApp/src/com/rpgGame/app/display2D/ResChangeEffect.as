package com.rpgGame.app.display2D
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.app.fight.spell.SpellResultTweenUtil;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	
	import flash.geom.Point;
	
	import app.message.EnumItemId;
	
	import feathers.controls.UIAsset;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.easing.Cubic;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;

	/**
	 *资源变化飘动类 
	 * @author yfl
	 * 
	 */	
	public class ResChangeEffect extends UIAsset
	{
		private static const HELP_PT:Point=new Point(0,0);
		private static const POS_PT:Point=new Point();
		private static const POOL:Array=[];
		private var _resType:int;
		public function ResChangeEffect()
		{
			super();
			this.touchable=false;
			
		}
		public static function fly(resType:int,statDis:DisplayObject):void
		{
			var eff:ResChangeEffect;
			if (POOL.length>0) 
			{
				eff=POOL.pop();
			}
			else
			{
				eff=new ResChangeEffect();
			}
			eff.startFly(resType,statDis);
		}
		public function startFly(resType:int,statDis:DisplayObject):void
		{
			this._resType=resType;
			this.styleName="ui/icon/item/36/1.png";
			this.rotation=0;
			this.alpha=0.4;
			getStartPos(statDis,this);
			StarlingLayerManager.topUILayer.addChild(this);
			var bx:int=this.x+SpellResultTweenUtil.getRandBewtten(-100,100);
			var by:int=this.y-SpellResultTweenUtil.getRand(120);
			
			var endx:int=bx>this.x?(bx+SpellResultTweenUtil.getRand(100)):(bx-SpellResultTweenUtil.getRand(100));
			var endy:int=this.y+SpellResultTweenUtil.getRandBewtten(120,180);
			TweenLite.to(this, 0.3,{
				alpha:1,
				bezier:[{x:bx, y:by}],
				x:endx,
				y:endy,
				onComplete:dropComplete,
				ease:Cubic.easeInOut});
		}
		private function dropComplete():void
		{
			var endPos:Point
			if (EnumItemId.GOLD==_resType) 
			{
				endPos=MainUIManager.mainui.headBar.getGoldPos();
			}
			else if (EnumItemId.BIND_GOLD==_resType) 
			{
				endPos=MainUIManager.mainui.headBar.getBindGoldPos();
			}
			var bx:int=(this.x+endPos.x)/2+SpellResultTweenUtil.getRMRand(80);
			var by:int=(this.y+endPos.y)/2+SpellResultTweenUtil.getRand(80);
			var timeLine:TimelineLite=new TimelineLite({delay:0.2,onComplete:fly2Target});
			timeLine.insert(new TweenLite(this,1,{rotation:0.2}));
			timeLine.insert(new TweenLite(this,1.5,{x:endPos.x,y:endPos.y,bezier:[{x:bx, y:by}],ease:Cubic.easeInOut}));
	
		}
		
		private function fly2Target():void
		{
			MCUtil.removeSelf(this);
			POOL.push(this);
		}
		private static function getStartPos(startDis:DisplayObject,flyObj:DisplayObject):void
		{
			if (startDis&&startDis.stage!=null) 
			{
				startDis.localToGlobal(HELP_PT,POS_PT);
				flyObj.x=POS_PT.x;
				flyObj.y=POS_PT.y;
			}
			else
			{
				flyObj.x=Starling.current.nativeStage.mouseX;
				flyObj.y=Starling.current.nativeStage.mouseY;
			}
		}
	}
}