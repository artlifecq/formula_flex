package com.rpgGame.appModule.dungeon.equip
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBen_ZhuangBei_Skin;
	
	import starling.display.DisplayObject;
	
	public class EquipDungeon extends ViewUI
	{
		private var _skin:FuBen_ZhuangBei_Skin;
		private var qdataList:Array;
		//private var _dailyZoneInfo:DailyZonePanelInfo;
		private var icoListGroup:RewardGroup;
		//private var gridList:Vector.<IconCDFace>;
		public function EquipDungeon():void
		{
			_skin = new FuBen_ZhuangBei_Skin();
			super(_skin);
			init();
		}
		private function init():void
		{
			_skin.list.itemRendererType =EquipCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 4;
			_skin.list.layout = layout;
			qdataList=DailyZoneCfgData.getTypeList(2);
			_skin.list.dataProvider = new ListCollection(qdataList);
			//_skin.list.getItemRendererFactoryWithID(
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_42,_skin.icon1,RewardGroup.ALIN_RIGHT,15,6,6,true,15);
			
			
			//_skin.list.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
		}
		private function addEvent():void
		{
			EventManager.addEvent(DungeonEvent.EQUIP_UPDATE_DAILYZONE_INFO,updateAll);
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,updateAll);
			
		}
		private function remvoeEvent():void
		{
			EventManager.removeEvent(DungeonEvent.EQUIP_UPDATE_DAILYZONE_INFO,updateAll);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,updateAll);
			
		}
		
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			addEvent();
			setDownNum();
			setReWard();
			updateAll();
			toInitIndex();
			EventManager.dispatchEvent(DungeonEvent.EQUIP_ITEM_INTO);
		}
		/**打开卷到适合的元素*/
		private function toInitIndex():void
		{
			var toIndex:int=gettoIndex();
			TweenLite.killDelayedCallsTo(refeashList);
			TweenLite.delayedCall(0.1, refeashList,[toIndex]);
		}
		
		private function refeashList(index:int):void
		{
			index=index>_skin.list.maxHorizontalPageIndex?_skin.list.maxHorizontalPageIndex:index;
			index=index<0?0:index;	
			_skin.btnNext.visible = (index <_skin.list.maxHorizontalPageIndex);
			_skin.btnPrev.visible = (index >0);
			_skin.list.scrollToPageIndex(index,0);
		}
		/**设置底部剩余次数*/
		private function setDownNum():void
		{
			var toIndex:int=gettoIndex();
			var q_data:Q_daily_zone = qdataList[0];//装备副本是公用的。可以顺便取一个值
			var Info:DailyZonePanelInfo=DailyZoneDataManager.instance().getInfoById(q_data.q_id);
			if(Info!=null)
			{
				_skin.lbShengyu.text = "今日剩余次数："+Info.remainCount;
				_skin.lbGoumai.text = "剩余购买次数："+Info.canBuyCount;
			}
		}
		/**设置底部奖励*/
		private function setReWard():void
		{
			var reWardStr:String=GlobalSheetData.getSettingInfo(717)!=null?GlobalSheetData.getSettingInfo(717).q_string_value:"";
			icoListGroup.setRewardByJsonStr(reWardStr);
			_skin.jiangli_text.x=icoListGroup.x-icoListGroup.width-40;
			
		}
		
		private function updateAll():void
		{
			if(_skin.list)
				_skin.list.dataProvider.updateAll();
			setDownNum();
			
		}
		private function gettoIndex():int
		{
			//var list:Array=_skin.list.dataProvider.data as Array;
			var toIndex:int=-1;
			if(qdataList!=null)
			{
				var levelid:int=DailyZoneDataManager.instance().getFitLevelIdbyType(2,MainRoleManager.actorInfo.totalStat.level);
				for(var i:int=0;i<qdataList.length;i++){
					if(qdataList[i].q_id==levelid)
					{
						toIndex=i;
						break;
					}
				}
			}
			if(toIndex==-1){
				toIndex=0;
			}
			return toIndex;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			var index:int=_skin.list.horizontalPageIndex;
			switch(target)
			{
				case _skin.btnNext:
					refeashList(index+1);
					break;
				case _skin.btnPrev:
					refeashList(index-1);
					break;
				case _skin.btnAdd:
					var Info:DailyZonePanelInfo=DailyZoneDataManager.instance().getInfoById(qdataList[0].q_id);
					DailyZoneDataManager.instance().buyCount(Info,true);
					break;
			}
		}
		override public function hideView():void
		{
			super.hideView();
			remvoeEvent();
			//_skin.list.scrollToPageIndex(0,0);
			icoListGroup.clear();
		}
	}
}