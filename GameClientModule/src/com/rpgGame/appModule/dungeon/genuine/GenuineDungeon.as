package com.rpgGame.appModule.dungeon.genuine
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.ui.SkinUIModePanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	
	import org.mokylin.skin.app.fuben.FuBen_ZhenQi_Skin;
	
	import starling.display.DisplayObject;
	
	public class GenuineDungeon extends SkinUIModePanel
	{
		private var _skin:FuBen_ZhenQi_Skin;
		private var _curentIndex:int;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		public function GenuineDungeon():void
		{
			super(FuBen_ZhenQi_Skin, "真气副本", 1);
		}
		
		override protected function initialize():void
		{
			_skin = _uiskin as FuBen_ZhenQi_Skin;
			_skin.list.itemRendererType =GenuineCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 15;
			_skin.list.layout = layout;
			var list:Array = DailyZoneCfgData.getTypeList(1);
			_skin.list.dataProvider = new ListCollection(list);
			_curentIndex = 0;
			refeashList(0);
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(list[0].q_id);
			var itemInfos:Object = JSONUtil.decode( list[0].q_special_rewards_show);
			var item:ItemInfo;
			var icon:IconCDFace;
			for(var i:int = 0;i<6;i++)
			{
				if(!itemInfos.hasOwnProperty(i))
					break;
				item = new ItemInfo();
				item.itemModelId = itemInfos[i]["mod"];
				item.num = itemInfos[i]["num"];
				icon = FaceUtil.creatIconCDFaceByUIAsset(_skin["ico_"+(i+1)],IcoSizeEnum.SIZE_40,1,5,5)
				FaceUtil.SetItemGrid(icon,ItemUtil.convertClientItemInfo(item), true);
			}
		}
		
		override public function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnNext:
					refeashList(_skin.list.horizontalPageIndex+1);
					break;
				case _skin.btnPrev:
					refeashList(_skin.list.horizontalPageIndex-1);
					break;
			}
		}
		
		private function refeashList(index:int):void
		{
			_skin.btnNext.visible = (index <1);
			_skin.btnPrev.visible = (index >0);
			_skin.list.scrollToPageIndex(index,0);
		}
	}
}