package com.rpgGame.appModule.dungeon.exp
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.ui.SkinUIModePanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import org.mokylin.skin.app.fuben.FuBen_JingYan_Skin;
	
	import starling.display.DisplayObject;

	public class ExpDungeon extends SkinUIModePanel
	{
		private var _skin:FuBen_JingYan_Skin;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		public function ExpDungeon():void
		{
			super(FuBen_JingYan_Skin, "经验副本", 1);
		}
		override protected function initialize():void
		{
			_skin = _uiskin as FuBen_JingYan_Skin;
			var list:Array = DailyZoneCfgData.getTypeList(3);
			var data:Q_daily_zone = list[0] as Q_daily_zone;
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
				icon = FaceUtil.creatIconCDFaceByUIAsset(_skin["ico_"+(i+1)],IcoSizeEnum.ICON_48,1,5,5)
				FaceUtil.SetItemGrid(icon,ItemUtil.convertClientItemInfo(item), true);
			}
			
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(data.q_id);
		}
		
		override public function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnEnter:
					DailyZoneDataManager.instance().requestCombat(_dailyZoneInfo);
					break;
			}
		}
		
	}
}