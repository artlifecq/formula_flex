package com.rpgGame.appModule.zhangong
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.ZhanGongManager;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.skill.SkillItem;
	import com.rpgGame.appModule.zhangong.render.BossItemSelectCellRender;
	import com.rpgGame.appModule.zhangong.render.MapItemSelectCellRender;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.events.ZhanGongEvent;
	import com.rpgGame.coreData.cfg.ZhanGongData;
	import com.rpgGame.netData.zhangong.message.SCMeritoriousUpgradeResultMessage;
	
	import feathers.FEATHERS_VERSION;
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.beibao.zhangong.ZhanGong_Skin;
	
	import starling.events.Event;
	
	public class ZhanGongPanelExt extends ViewUI
	{
		private var _skin:ZhanGong_Skin;
		
		private var _mapItemList:Vector.<MapItem>=new Vector.<MapItem>();
		private var _bossItemList:Vector.<BossItem>=new Vector.<BossItem>();
		
		private var _nowSelectMapItem:MapItem;
		
		private var _isFirst:Boolean=false;
		public function ZhanGongPanelExt()
		{
			_skin=new ZhanGong_Skin();
			super(_skin);
			
			var list:List=_skin.ListMap;
			list.itemRendererFactory = creatMapItemCell;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=0;
			//			_skin.ListMap.addEventListener(FeathersEventType.CREATION_COMPLETE,toShouShow);
			
			var list1:List=_skin.ListBoss;
			list1.itemRendererFactory = creatBossItemCell;
			list1.clipContent = true;
			list1.scrollBarDisplayMode = "fixed";
			list1.verticalScrollBarPosition = "right";
			list1.horizontalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list1.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list1.padding=0;
			
			initView();
		}
		
		private function initView():void
		{
			_isFirst=true;
			_skin.ListMap.addEventListener(FeathersEventType.CREATION_COMPLETE,toShouShow);
			var mapItemList:Vector.<int>=ZhanGongData.getMapItemLvList();
			_skin.ListMap.dataProvider=new ListCollection(mapItemList);
		}
		
		override protected function onShow():void
		{
			super.onShow();
			initEvent();
			showPower();
			if(!_isFirst)
				showMapItemByIndex(0);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			clearEvent();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(ZhanGongEvent.MAPITEM_SELECT,selecteSpell);
			EventManager.addEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePower);
		}
		
		private function clearEvent():void
		{
			EventManager.removeEvent(ZhanGongEvent.MAPITEM_SELECT,selecteSpell);
			EventManager.removeEvent(ZhanGongEvent.BOSSITEM_CHANGE,updatePower);
		}
		
		private function showPower():void
		{
			_skin.Num_zhandouli.label=ZhanGongManager.getPower().toString();
		}
		
		private function toShouShow(e:Event):void
		{
			if(_isFirst)
			{
				showMapItemByIndex(0);
				_isFirst=false;
			}
		}
		
		/**
		 * 依据索引显示相应的选项
		 * */
		private function showMapItemByIndex(index:int):void
		{
			if(_mapItemList!=null&&_mapItemList.length>0&&_mapItemList.length>index)
			{
				_mapItemList[index].setBtnState();
				_nowSelectMapItem=_mapItemList[index];
			}
		}
		
		/**
		 * 依据等级显示相应的类型的怪物
		 * */
		private function showBossItemByLv(lv:int):void
		{
			if(_bossItemList.length>0)
			{
				_bossItemList.length=0;
				_skin.ListBoss.removeChildAt(0);
			}
			var list:Vector.<int>=ZhanGongData.getBossItemTypeList(lv);
			_skin.ListBoss.dataProvider=new ListCollection(list);
		}
		
		private function creatMapItemCell():MapItemSelectCellRender
		{
			var render:MapItemSelectCellRender=new MapItemSelectCellRender();
			var item:MapItem=render.mapItem;
			_mapItemList.push(item);
			return render;
		}
		
		private function creatBossItemCell():BossItemSelectCellRender
		{
			return new BossItemSelectCellRender();
		}
		
		private function selecteSpell(mapitem:MapItem):void
		{
			if(_nowSelectMapItem!=null&&_nowSelectMapItem.level==mapitem.level) return;
			_nowSelectMapItem=mapitem;
			showBossItemByLv(_nowSelectMapItem.level);
		}
		
		private function updatePower(msg:SCMeritoriousUpgradeResultMessage):void
		{
			if(msg.flag==1)
			{
				showPower();
			}
		}
	}
}