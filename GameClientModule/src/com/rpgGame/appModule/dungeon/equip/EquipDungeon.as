package com.rpgGame.appModule.dungeon.equip
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.events.FeathersEventType;
	import feathers.layout.HorizontalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBen_ZhuangBei_Skin;
	
	import starling.display.DisplayObject;
	
	public class EquipDungeon extends ViewUI
	{
		private var _skin:FuBen_ZhuangBei_Skin;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var icoListGroup:RewardGroup;
		//private var gridList:Vector.<IconCDFace>;
		public function EquipDungeon():void
		{
			_skin = new FuBen_ZhuangBei_Skin();
			super(_skin);
			icoListGroup=new RewardGroup(IcoSizeEnum.ICON_42,_skin.icon1,RewardGroup.ALIN_RIGHT,15,6,6,true,15);
			_skin.list.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			_skin.list.itemRendererType =EquipCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 4;
			_skin.list.layout = layout;
			var list:Array = DailyZoneCfgData.getTypeList(2);
			
			_skin.list.dataProvider = new ListCollection(list);
			
			
			var reWardStr:String=GlobalSheetData.getSettingInfo(717)!=null?GlobalSheetData.getSettingInfo(717).q_string_value:"";
			icoListGroup.setRewardByJsonStr(reWardStr);
			_skin.jiangli_text.x=icoListGroup.x-icoListGroup.width-40;
			
//			var qglob:Q_global = GlobalSheetData.getSettingInfo(717);
//			var itemInfos:Array = JSON.parse(qglob.q_string_value) as Array;
//			var length:int = itemInfos.length;
//			var startX:Number = 742;
//			var item:ItemInfo;
//			var icon:IconCDFace;
//			gridList=new Vector.<IconCDFace>();
//			for(var i:int = 0;i<length;i++)
//			{
//				var grid:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_42);
//				//				grid.setUrlBg("ui/common/gezikuang/tubiaodikuang/48.png");
//				_skin.container.addChild(grid);
//				grid.x = startX+60*i;
//				grid.y = 532;
//				gridList.push(grid);
//				item = new ItemInfo();
//				item.itemModelId = itemInfos[i]["mod"];
//				FaceUtil.SetItemGrid(grid,ItemUtil.convertClientItemInfo(item), true);
//			}
			
			EventManager.addEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,refeashValue);
			EventManager.addEvent(MainPlayerEvent.LEVEL_CHANGE,updatePlayerLvUp);
			refeashValue();
			if (!_skin.list.hasEventListener(FeathersEventType.CREATION_COMPLETE)) 
			{
				onCreate();
			}
			
		}
		
		private function onCreate():void
		{
			_skin.list.removeEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
			//			_skin.list.horizontalScrollStep=194+30;
			
			var list:Array=_skin.list.dataProvider.data as Array;
			var toIndex:int=-1;
			for(var i:int=0;i<list.length;i++){
				var info:DailyZonePanelInfo=DailyZoneDataManager.instance().getInfoById(list[i].q_id);
				if(info.remainCount!=0||info.canBuyCount!=0){
					toIndex=i;
					break;
				}
			}
			if(toIndex==-1){
				toIndex=0;
			}
			
			refeashList(0);
			var q_data:Q_daily_zone = list[toIndex] as Q_daily_zone;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(q_data.q_id);
			refeashValue();
			toIndex=Math.floor(toIndex/4);
			refeashList(toIndex);			
			refeashValue();
		}
		
		private function refeashValue():void
		{
			if(_dailyZoneInfo==null)
				return ;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(_dailyZoneInfo.dailyzoneId);
			_skin.lbShengyu.text = "今日剩余次数："+_dailyZoneInfo.remainCount;
			_skin.lbGoumai.text = "剩余购买次数："+_dailyZoneInfo.canBuyCount;
		}
		
		private function updatePlayerLvUp():void
		{
			if(_skin.list)
				_skin.list.dataProvider.updateAll();
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
					DailyZoneDataManager.instance().buyCount(_dailyZoneInfo,true);
					break;
			}
		}
		
		private function refeashList(index:int):void
		{
			_skin.btnNext.visible = (index <_skin.list.maxHorizontalPageIndex);
			_skin.btnPrev.visible = (index >0);
			_skin.list.scrollToPageIndex(index,0);
		}
		
		override public function hide():void
		{
			EventManager.removeEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,refeashValue);
			EventManager.removeEvent(MainPlayerEvent.LEVEL_CHANGE,updatePlayerLvUp);
			/*while(gridList.length>0){
				var icon:IconCDFace=gridList.pop();
				icon.destroy();
			}*/
			icoListGroup.clear();
		}
	}
}