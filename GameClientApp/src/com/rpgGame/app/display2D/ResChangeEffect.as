package com.rpgGame.app.display2D
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.fight.spell.SpellResultTweenUtil;
	import com.rpgGame.app.fight.spell.time.TimeDelay;
	import com.rpgGame.app.manager.MainUIManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
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
		private static  const timeDelay:TimeDelay=new TimeDelay("res_change");
		private static  const droptimeDelay:TimeDelay=new TimeDelay("res_drop",0.1,2000);
		private static var _numArr:Array;
		private var _resType:int;
		public function ResChangeEffect()
		{
			super();
			this.touchable=false;
			this.pivotX=this.pivotY=25;
		}
		public static function fly(resType:int,change:int):void
		{
			
			var count:int=getNum(change);
			for (var i:int = 0; i < count; i++) 
			{
				setTimeout(reallyFly,droptimeDelay.timeDelay*1000,resType);
			}
			//eff.startFly(resType,statDis);
		}
		private static function reallyFly(resType:int):void
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
			eff.startFly(resType);
		
		}
		private static function getNum(change:int):int
		{
			if (_numArr==null) 
			{
				
				_numArr=JSONUtil.decode(GlobalSheetData.getStrValue(900)) as Array;
			}
			var len:int=_numArr.length;
			
			var tmp:Array;
			for (var i:int = 0; i < len; i++) 
			{
				tmp=_numArr[i];
				if (change>=tmp[0]&&change<=tmp[1]) 
				{
					return tmp[2];
				}
			}
			return 10;
		}
		public function startFly(resType:int):void
		{
			this._resType=resType;
			this.rotation=0;
			this.scale=1;
			this.alpha=0.4;
			var url:String;
			if (EnumItemId.GOLD==_resType) 
			{
				url="ui/mainui/head/yuanbao.png";
			}
			else if (EnumItemId.BIND_GOLD==_resType) 
			{
				url="ui/mainui/head/lijin.png";
			}
			if (url!=this.styleName) 
			{
				this.styleName=url;
			}
			
			
			//getStartPos(statDis,this);
			StarlingLayerManager.topUILayer.addChild(this);
			
			MainRoleManager.actor.headFace.localToGlobal(new Point(MainRoleManager.actor.headFace.width/2,0),HELP_PT);
			var endx:int=HELP_PT.x+SpellResultTweenUtil.getRMRand(120);
			this.x=endx+SpellResultTweenUtil.getRMRand(30);
			this.y=0;
			var endy:int=HELP_PT.y+SpellResultTweenUtil.getRMRand(120);			
			TweenLite.to(this, 0.4,{
				alpha:1,
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
			var endx:int=endPos.x;
			var endy:int=endPos.y;
			var bx:int=(this.x+endx)/2+SpellResultTweenUtil.getRMRand(80);
			var by:int=this.y+SpellResultTweenUtil.getRand(80);
			var timeLine:TimelineLite=new TimelineLite({delay:0.1+timeDelay.timeDelay,onComplete:fly2Target});
			
			timeLine.insert(new TweenLite(this,1.5,{scale:0.3,x:endx,y:endy,bezier:[{x:bx, y:by}],ease:Cubic.easeInOut}));
			
		}
		
		private function fly2Target():void
		{
			MCUtil.removeSelf(this);
			POOL.push(this);
		}
		private static function getStartPos(startDis:DisplayObject,flyObj:DisplayObject):void
		{
//			if (startDis&&startDis.stage!=null) 
//			{
//				startDis.localToGlobal(HELP_PT,POS_PT);
//				flyObj.x=POS_PT.x;
//				flyObj.y=POS_PT.y;
//			}
//			else
//			{
//				flyObj.x=Starling.current.nativeStage.stage.width/2+SpellResultTweenUtil.getRMRand(;
//				flyObj.y=0;
//			}
		}
	}
}