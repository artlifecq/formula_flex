package com.rpgGame.appModule.jingmai
{
	import com.rpgGame.app.sender.MeridianSender;
	import com.rpgGame.appModule.jingmai.render.StoneSelectCellRender;
	import com.rpgGame.appModule.jingmai.sub.MerdianPoint;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.beibao.jingmai.Stone_Skin;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MeridianStoneSelectPanelExt extends SkinUI
	{
		private static var ins:MeridianStoneSelectPanelExt=new MeridianStoneSelectPanelExt();
		private var _skin:Stone_Skin;
		private var _target:MerdianPoint;
		private var ckickCount:int=0;
		public function MeridianStoneSelectPanelExt()
		{
			_skin=new Stone_Skin();
			super(_skin);
			
			var list:List=_skin.lst_pack;
			list.itemRendererFactory = createStoneCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			
		}
		
		private function createStoneCell():StoneSelectCellRender
		{
			// TODO Auto Generated method stub
			return new StoneSelectCellRender();
		}
		public static function setData(data:Vector.<ClientItemInfo>,meridianPoint:MerdianPoint):void
		{
			data.sort(ins.onSort);
			ins._target=meridianPoint;
			ins._skin.lst_pack.dataProvider=new ListCollection(data);
			if (meridianPoint) 
			{
				var local:Point=new Point(meridianPoint.imgPoint.width+2,meridianPoint.imgPoint.height+2);
				var g:Point=meridianPoint.imgPoint.localToGlobal(local)
				var layer : DisplayObjectContainer = StarlingLayerManager.appUILayer;
				ins.x=g.x;
				ins.y=g.y;
				layer.addChild(ins);
				ins.ckickCount=1;
				Starling.current.stage.addEventListener(TouchEvent.TOUCH,onStageTouch);
			}
		}
		
		private static function onStageTouch(e : TouchEvent):void
		{
			// TODO Auto Generated method stub
			var t : Touch = e.getTouch(ins.stage, TouchPhase.ENDED);
			if (t != null )
			{
				if ( t.target != null && ins.contains(t.target)) 
				{
					//trace("touch me");
				}
				else
				{
					//remove();
					//trace("touch other");
					if (ins.ckickCount>0) 
					{
						ins.ckickCount--;
						return;
					}
					remove();
				}
			}
			
			
		}
		public static function selectStone(item:ClientItemInfo):void
		{
			remove();
			if (ins._target) 
			{
				MeridianSender.reqSetUpPoint(ins._target.data.MeridId,ins._target.data.acuPointId,item.itemInfo.itemId);
			}
		}
		
		private static function remove():void
		{
			Starling.current.stage.removeEventListener(TouchEvent.TOUCH,onStageTouch);
			MCUtil.removeSelf(ins);
		}
		private function onSort(itemA:ClientItemInfo,itemB:ClientItemInfo):int
		{
			if (itemA.qItem.q_levelnum>itemB.qItem.q_levelnum) 
			{
				return -1;
			}
			else if (itemA.qItem.q_levelnum<itemB.qItem.q_levelnum) 
			{
				return 1
			}
			else 
			{
				if (itemA.qItem.q_id<itemA.qItem.q_id) 
				{
					return -1;
				}
				else if (itemA.qItem.q_id>itemB.qItem.q_id) 
				{
					return 1;
				}
			}
			return 0;
		}
		
	}
}