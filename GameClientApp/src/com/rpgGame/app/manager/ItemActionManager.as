package com.rpgGame.app.manager
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.game.mainCore.libCore.handle.HandleThread;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	
	import flash.geom.Point;
	
	import gs.TweenLite;
	
	import starling.core.Starling;
	
	public class ItemActionManager
	{
		//道具滑动进包队列
		private static var _tweenHT:HandleThread = new HandleThread();
		
		/**
		 * 物品缓动进包裹 
		 * @param info
		 * @param startPos
		 * 
		 */		
		public static function tweenItemInBag(info:ItemInfo,startPos:Point = null,onCmpFun:Function = null,time:Number = 0.6, interval:int = 200):void
		{
			if(info == null)return;
			tweenItemInBagByCfgId(info.cfgId,info.count,startPos,onCmpFun,time,interval);
		}
		
		public static function tweenItemInBagByCfgId(cfgId:int,count:int = 1,startPos:Point = null,onCmpFun:Function = null,time:Number = 0.6,interval:int = 200):void
		{
			var icoName:String = ItemCfgData.getItemIcon(cfgId);
			tweenItemInBagByItemIcon(icoName,count,startPos,onCmpFun,time,interval);
		}
		
		public static function tweenItemByCfgId(cfgId:int,count:int,startPos:Point,endPoint:Point,onCmpFun:Function = null,time:Number = 0.6):void
		{
			var icoName:String = ItemCfgData.getItemIcon(cfgId);
			tweenItemByIconName(icoName,count,startPos,endPoint,onCmpFun,time);
		}
		
		public static function tweenItemInBagByItemIcon($iconName:String,count:int,startPos:Point = null,onCmpFun:Function = null,time:Number = 0.6,interval:int = 200):void
		{
			tweenItemByIconName($iconName,count,startPos,null,onCmpFun,time);
		}
		
		public static function tweenItemByIconName($iconName:String,count:int,startPos:Point,endPoint:Point,onCmpFun:Function = null,time:Number = 0.6):void
		{
			//获取道具UI
			var iconFace:IconCDFace = getItemIco();
			iconFace.count = count;
//			iconFace.iconName = $iconName;
			iconFace.touchable = false;
			iconFace.touchGroup = false;
			///////////////////////////////////////////////////////
			if(!startPos)
			{
				startPos = LayerManager.stageCenterPoint;
			}
			if(!endPoint)
			{
				endPoint = getBackPackBtnPos();
			}
			//添加进滑动队列
			addTweenHT(startPos,endPoint,iconFace,onCmpFun,time);
		}
		
		private static function addTweenHT(startPos:Point,endPos:Point,iconFace:IconCDFace,onCmpFun:Function = null, time:Number = 0.6, interval:Number = 200):void
		{
			_tweenHT.push(executeTween,[startPos,endPos,iconFace,onCmpFun,time], interval);
		}
		
		public static function tweenItemInHero($iconName:String,startPos:Point,count:int = 1,onCmpFun:Function=null,dur:Number = 0.5):void
		{
			var iconFace:IconCDFace = getItemIco();
			iconFace.count = count;
//			iconFace.iconName = $iconName;
			iconFace.touchable = false;
			iconFace.touchGroup = false;
			///////////////////////////////////////////////////////
			//添加进滑动队列
			_tweenHT.push(executeTweenInHero,[startPos,iconFace,onCmpFun,dur], 50);
			
		}
		
		private static function executeTweenInHero($startPos:Point,$iconFace:IconCDFace,onCmpFun:Function = null,time:Number = 0.5):void
		{
			//获取目标位置
		/*	var toPixelP:Point = Scene.localToGlobal(new Point(MainRoleManager.actor.x, MainRoleManager.actor.z+20));
			toPixelP.x -= 15;
			toPixelP.y -= 100;
			
			$iconFace.x = $startPos.x;
			$iconFace.y = $startPos.y;
			Starling.current.stage.addChild($iconFace);
			var dis:Number = Point.distance($startPos,toPixelP);
			var dur:Number = dis*0.002;
			dur = 0.1;
			TweenLite.to($iconFace, dur, {x:toPixelP.x,alpha:0.8,y:toPixelP.y,onComplete:onTweenFlyComplete,onCompleteParams:[$iconFace,onCmpFun]});*/
		}
		
		private static function executeTween($startPos:Point,$endPos:Point,$iconFace:IconCDFace,onCmpFun:Function = null,time:Number = 0.6):void
		{
			//获取目标位置
			var toPixelP:Point = $endPos;
			if(toPixelP == null)
			{
				toPixelP = getBackPackBtnPos();
			}
			$iconFace.x = $startPos.x;
			$iconFace.y = $startPos.y;
			Starling.current.stage.addChild($iconFace);
			TweenLite.to($iconFace, time, {x:toPixelP.x - 5, y:toPixelP.y,onComplete:onTweenFlyComplete,onCompleteParams:[$iconFace,onCmpFun]});
		}
		
		
		private static function getItemIco():IconCDFace
		{
			return IconCDFace.getIcoFace();
		}
		
		private static function onTweenFlyComplete($iconFace:IconCDFace,onCmpFun:Function):void
		{
			TweenLite.killTweensOf($iconFace);
			IconCDFace.releaseIcoFace($iconFace);
			if(onCmpFun != null)
			{
				onCmpFun();
			}
		}
		
		
		private static function getBackPackBtnPos():Point
		{
			return MainUIManager.getBtnGolbalPos("btnBackpack");
		}
		
		public static function tweenPrizeInfoToBag(prize:PrizeInfo,startPos:Point = null,onCompFunc:Function = null):void
		{
			if(prize == null) return;
			var arr:Vector.<ItemInfo> = prize.itemInfoList;
			var len:int = arr.length;
			var itemInfo:ItemInfo;
			for (var i:int = 0; i < len; i++) 
			{
				itemInfo = arr[i];
				if(i == len - 1)
				{
					tweenItemInBag(itemInfo,startPos,onCompFunc);
				}else
				{
					tweenItemInBag(itemInfo,startPos);
				}
				var str:String = "获得 【" + ItemCfgData.getItemName(itemInfo.cfgId) + "】X" + itemInfo.count;
				NoticeManager.showNotify(str);
			}
		}
	}
}
