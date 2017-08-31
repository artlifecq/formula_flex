package com.rpgGame.app.manager
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.game.mainCore.core.manager.LayerManager;
	import com.game.mainCore.libCore.handle.HandleThread;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	
	import flash.geom.Point;
	import flash.utils.setTimeout;
	

	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	import gs.easing.Quad;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class ItemActionManager
	{
		//道具滑动进包队列
		private static var _tweenHT:HandleThread = new HandleThread();
		private static const HELP_PT:Point=new Point(0,0);
		private static const POS_PT:Point=new Point();
		private static const _parent3d:Inter3DContainer=new Inter3DContainer();
		
		public static function flyItemToBag(itemId:int,startDis:DisplayObject=null):void
		{
			
			var qItem:Q_item=ItemConfig.getQItemByID(itemId);
			if (qItem) 
			{
				var iconFace:UIAsset = new UIAsset();
				getStartPos(startDis,iconFace);
				
				iconFace.styleName =ClientConfig.getItemIcon(qItem.q_icon+"",IcoSizeEnum.ICON_48);
				addTweenHT(null,iconFace,null);
			}
			
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
	
		public static function flyItemsToBag(itemsIdArr:Array):void
		{
			if (itemsIdArr==null||itemsIdArr.length==0) 
			{
				return;
			}
			var len:int=itemsIdArr.length;
			var time:Number=0;
			for (var i:int = 0; i <len; i++) 
			{
				var itemId:int=itemsIdArr[i];
				
				setTimeout(flyItemToBag,time,itemsIdArr[i]);
				time+=0.2;
			}
		}
		public static function flyItemsToBagByList(itemsIdArr:Vector.<int>):void
		{
			if (itemsIdArr==null||itemsIdArr.length==0) 
			{
				return;
			}
			var len:int=itemsIdArr.length;
			var time:Number=0;
			for (var i:int = 0; i <len; i++) 
			{
				var itemId:int=itemsIdArr[i];
				
				setTimeout(flyItemToBag,time,itemsIdArr[i]);
				time+=0.2;
			}
		}
		/**
		 * 物品缓动进包裹 
		 * @param info
		 * @param startPos
		 * 
		 */		
		public static function tweenItemInBag(icon:IconCDFace,startPos:Point = null,onCmpFun:Function = null,time:Number = 1):void
		{
			if (icon==null) 
			{
				if (onCmpFun) 
				{
					onCmpFun();
				}
				return;
			}
			tweenItemByIcon(icon,startPos,null,onCmpFun,time);
		}
		
		public static function tweenItemByIcon(icon:IconCDFace,startPos:Point,endPoint:Point,onCmpFun:Function = null,time:Number = 0.6):void
		{
			if(icon == null)return;
			//获取道具UI
			var iconFace:UIAsset = new UIAsset();
			iconFace.styleName =icon.iconResURL;
			///////////////////////////////////////////////////////
			
			if(!startPos)
			{
				startPos = icon.localToGlobal(new Point(0,0));
			}
			iconFace.x = startPos.x;
			iconFace.y = startPos.y;
			//添加进滑动队列
			addTweenHT(endPoint,iconFace,onCmpFun,time);
		}
		
		public static function tweenItemByJsonStr(reward:String,startPos:Point,size:int=IcoSizeEnum.ICON_42):void
		{
			if (reward==null||reward=="") 
			{
				return;
			}
			var arr:Array=TaskMissionCfgData.getRewordByJobsex(reward,MainRoleManager.actorInfo.job,MainRoleManager.actorInfo.sex);
			for (var i:int = 0; i < arr.length; i++) 
			{
				
				var iconFace:UIAsset = new UIAsset();
				iconFace.styleName =ClientConfig.getItemIcon(arr[i].mod, size );
				
				iconFace.x = startPos.x;
				iconFace.y = startPos.y;
				addTweenHT(null,iconFace,null,1);
			}
		}
		
		public static function tweenMode(startPos:Point,onCmpFun:Function = null,time:Number = 1):void
		{
			startPos = LayerManager.stageCenterPoint.add(startPos);
			var content:Inter3DContainer = new Inter3DContainer();
			content.x=startPos.x;
			content.y=startPos.y;
			
			var inter3d:InterObject3D = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "mount1",ClientConfig.getEffect("ui_jingyantiaoqiu"));
			data.forceLoad=true;//ui上的3d特效强制加载
			var unit : RenderUnit3D = inter3d.addRenderUnitWith(data, 0);
			unit.addUnitAtComposite(unit);
			content.addChild3D(inter3d);
			partner.addChild(content);
			addTweenHT(null,content,onCmpFun,time);
		}
		
		public static function addTweenHT(endPos:Point,display:DisplayObject,onCmpFun:Function = null, time:Number = 0.6, interval:Number = 200):void
		{
			_tweenHT.push(executeTween,[endPos,display,onCmpFun,time], interval);
		}
		
		public static function addTweenDisplay(endPos:Point,display:DisplayObject,timeObj:Object,onCmpFun:Function = null, time:Number = 0.6, interval:Number = 200):void
		{
			_tweenHT.push(__executeTween,[endPos,display,timeObj,onCmpFun,time], interval);
		}
		
		private static function __executeTween($endPos:Point,$display:DisplayObject,timeObj:Object,onCmpFun:Function = null,time:Number = 0.6):void
		{
			partner.addChild($display);
			timeObj.onComplete = onTweenFlyComplete;
			timeObj.onCompleteParams = [$display,onCmpFun];
			TweenLite.to($display, time, timeObj);
		}
		
		private static function executeTween($endPos:Point,$display:DisplayObject,onCmpFun:Function = null,time:Number = 0.6):void
		{
			//获取目标位置
			if($endPos == null)
			{
				$endPos = getBackPackBtnPos();
			}
			partner.addChild($display);
			TweenLite.to($display, time, {x:$endPos.x - 5, y:$endPos.y,onComplete:onTweenFlyComplete,onCompleteParams:[$display,onCmpFun],ease:Quad.easeOut});
		}
		
	
		private static function onTweenFlyComplete($display:DisplayObject,onCmpFun:Function):void
		{
			TweenLite.killTweensOf($display);
			partner.removeChild($display,true);
			if(onCmpFun != null)
			{
				onCmpFun();
			}
		}
		
		
		private static function get partner():DisplayObjectContainer
		{
			return StarlingLayerManager.topUILayer;
		}
		private static function get parent3D():Inter3DContainer
		{
			if (_parent3d.parent==null) 
			{
				StarlingLayerManager.topUILayer.addChild(_parent3d);
			}
			return _parent3d;
		}
		
		public static function getBackPackBtnPos():Point
		{
			return MainUIManager.getBtnGolbalPos(MainButtonManager.getButtonName(1));
		}
		
		public static function tweenPrizeInfoToBag(prize:PrizeInfo,startPos:Point = null,onCompFunc:Function = null):void
		{
			/*if(prize == null) return;
			var arr:Vector.<ClientItemInfo> = prize.itemInfoList;
			var len:int = arr.length;
			var itemInfo:ClientItemInfo;
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
				var str:String = "获得 【" + ItemConfig.getItemName(itemInfo.cfgId) + "】X" + itemInfo.count;
				NoticeManager.showNotify(str);
			}*/
		}
	}
}
