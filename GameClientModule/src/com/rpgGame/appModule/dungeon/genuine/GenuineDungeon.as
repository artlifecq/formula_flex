package com.rpgGame.appModule.dungeon.genuine
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
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
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBen_ZhenQi_Skin;
	
	import starling.display.DisplayObject;
	
	public class GenuineDungeon extends ViewUI
	{
		private var _skin:FuBen_ZhenQi_Skin;
		private var gridList:Vector.<IconCDFace>;
		public function GenuineDungeon():void
		{
			_skin = new FuBen_ZhenQi_Skin();
			super(_skin);
			_skin.list.addEventListener(FeathersEventType.CREATION_COMPLETE,onCreate);
		}
		
		override public function hide():void
		{
			super.hide();
			while(gridList.length>0){
				var icon:IconCDFace=gridList.pop();
				icon.destroy();
			}
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updatePlayerLvUp);
		}
		
		override public function show(data:Object=null):void
		{
			_skin.list.itemRendererType =GenuineCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 4;
			_skin.list.layout = layout;
			var list:Array = DailyZoneCfgData.getTypeList(1);
		
			_skin.list.dataProvider = new ListCollection(list);
			
			var qglob:Q_global = GlobalSheetData.getSettingInfo(716);
			var itemInfos:Array = JSON.parse(qglob.q_string_value) as Array;
			var length:int = itemInfos.length;
			var startX:Number = 742;
			var item:ItemInfo;
			var icon:IconCDFace;
			gridList=new Vector.<IconCDFace>();
			for(var i:int = 0;i<length;i++)
			{
				var grid:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_42);
				grid.setBg( GridBGType.GRID_SIZE_42,1 );
//				grid.setUrlBg("ui/common/gezikuang/tubiaodikuang/48.png");
				_skin.container.addChild(grid);
				grid.x = startX+60*i;
				grid.y = 532;
				item = new ItemInfo();
				item.itemModelId = itemInfos[i]["mod"];
				FaceUtil.SetItemGrid(grid,ItemUtil.convertClientItemInfo(item), true);
				gridList.push(grid);
			}
			if (!_skin.list.hasEventListener(FeathersEventType.CREATION_COMPLETE)) 
			{
				onCreate();
			}
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updatePlayerLvUp);
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
			toIndex=Math.floor(toIndex/4);
			refeashList(toIndex);			
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
		
		private function updatePlayerLvUp():void
		{
			if(_skin.list)
				_skin.list.dataProvider.updateAll();
		}
		
		private function refeashList(index:int):void
		{
			_skin.btnNext.visible = (index <_skin.list.maxHorizontalPageIndex);
			_skin.btnPrev.visible = (index >0);
			_skin.list.scrollToPageIndex(index,0);
		}
	}
}