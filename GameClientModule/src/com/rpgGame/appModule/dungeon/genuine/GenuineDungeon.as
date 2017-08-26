package com.rpgGame.appModule.dungeon.genuine
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.HorizontalLayout;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBen_ZhenQi_Skin;
	
	import starling.display.DisplayObject;
	
	public class GenuineDungeon extends ViewUI
	{
		private var _skin:FuBen_ZhenQi_Skin;
		private var qdataList:Array;
		//private var gridList:Vector.<IconCDFace>;
		private var icoListGroup:RewardGroup;
		public function GenuineDungeon():void
		{
			_skin = new FuBen_ZhenQi_Skin();
			super(_skin);
			init();
			//_skin.list.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
		}
		private function init():void
		{
			_skin.list.itemRendererType =GenuineCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 4;
			_skin.list.layout = layout;
			qdataList= DailyZoneCfgData.getTypeList(1);
			_skin.list.dataProvider = new ListCollection(qdataList);
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_42,_skin.icon1,RewardGroup.ALIN_RIGHT,15,6,6,true,15);
			
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
		
		override public function hide():void
		{
			super.hide();
			remvoeEvent();
			icoListGroup.clear();
		}
		
		override public function show(data:Object=null):void
		{
			addEvent();
			setReWard();
			updateAll();
			toInitIndex();
			EventManager.dispatchEvent(DungeonEvent.GENUNE_ITEM_INTO);
		}
		/**设置底部奖励*/
		private function setReWard():void
		{
			var reWardStr:String=GlobalSheetData.getSettingInfo(716)!=null?GlobalSheetData.getSettingInfo(716).q_string_value:"";
			icoListGroup.setRewardByJsonStr(reWardStr);
			_skin.jiangli_text.x=icoListGroup.x-icoListGroup.width-40;
		}
		
		/**打开卷到适合的元素*/
		private function toInitIndex():void
		{
			var toIndex:int=gettoIndex();
			TweenLite.killDelayedCallsTo(refeashList);
			TweenLite.delayedCall(0.1, refeashList,[toIndex]);
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
			}
		}
		
		private function updateAll():void
		{
			if(_skin.list)
				_skin.list.dataProvider.updateAll();
		}
		
		private function refeashList(index:int):void
		{
			index=index>3?index-3:0;
			_skin.btnNext.visible = (index <_skin.list.maxHorizontalPageIndex);
			_skin.btnPrev.visible = (index >0);
			_skin.list.scrollToPageIndex(index,0);
		}
		private function gettoIndex():int
		{
			//var list:Array=_skin.list.dataProvider.data as Array;
			var toIndex:int=-1;
			if(qdataList!=null)
			{
				var levelid:int=DailyZoneDataManager.instance().getFitLevelIdbyType(1,MainRoleManager.actorInfo.totalStat.level);
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
	}
}