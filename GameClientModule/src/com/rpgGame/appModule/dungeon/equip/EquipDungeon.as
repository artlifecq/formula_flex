package com.rpgGame.appModule.dungeon.equip
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIModePanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.HorizontalLayout;
	
	import org.mokylin.skin.app.fuben.FuBen_ZhuangBei_Skin;
	
	import starling.display.DisplayObject;
	
	public class EquipDungeon extends SkinUIModePanel
	{
		private var _skin:FuBen_ZhuangBei_Skin;
		private var _curentIndex:int;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		public function EquipDungeon():void
		{
			super(FuBen_ZhuangBei_Skin, "装备副本", 1);
		}
		
		override protected function initialize():void
		{
			_skin = _uiskin as FuBen_ZhuangBei_Skin;
			_skin.list.itemRendererType =EquipCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 15;
			_skin.list.layout = layout;
			var list:Array = DailyZoneCfgData.getTypeList(2);
			_skin.list.dataProvider = new ListCollection(list);
			_curentIndex = 0;
			refeashList(0);
			var data:Q_daily_zone = list[0] as Q_daily_zone;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(data.q_id);
			var itemInfos:Object = JSONUtil.decode( data.q_special_rewards_show);
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
			refeashValue();
		}
		
		private function refeashValue():void
		{
			if(_dailyZoneInfo==null)
				return ;
			_skin.lbShengyu.text = "今日剩余次数："+_dailyZoneInfo.remainCount;
			_skin.lbGoumai.text = "剩余购买次数："+_dailyZoneInfo.canBuyCount;
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
				case _skin.btnAdd:
					DailyZoneDataManager.instance().buyCount(_dailyZoneInfo);
					break;
			}
		}
		
		private function refeashList(index:int):void
		{
			_skin.btnNext.visible = (index <1);
			_skin.btnPrev.visible = (index >0);
			_skin.list.scrollToPageIndex(index,0);
		}
		
		override public function get isOpen():Boolean
		{
			return MainRoleManager.actorInfo.totalStat.level>=50;
		}
	}
}