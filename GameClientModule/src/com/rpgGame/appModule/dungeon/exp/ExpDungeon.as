package com.rpgGame.appModule.dungeon.exp
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.SkinUIModePanel;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.item.GridBGType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBen_JingYan_Skin;
	
	import starling.display.DisplayObject;

	public class ExpDungeon extends ViewUI
	{
		private var _skin:FuBen_JingYan_Skin;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var gridList:Vector.<IconCDFace>;
		public function ExpDungeon():void
		{
			_skin=new FuBen_JingYan_Skin();
			super(_skin);
		}
		override public function show(data:Object=null):void
		{
			super.show(data);
			var list:Array = DailyZoneCfgData.getTypeList(3);
			var qdata:Q_daily_zone = list[0] as Q_daily_zone;
			
			
			var itemInfos:Array = JSON.parse(qdata.q_special_rewards_show) as Array;
			var length:int = itemInfos.length;
			var startX:Number = 475 - (60*length)/2;
			var item:ItemInfo;
			var icon:IconCDFace;
			gridList=new Vector.<IconCDFace>();
			for(var i:int = 0;i<length;i++)
			{
				var grid:IconCDFace = IconCDFace.create(IcoSizeEnum.ICON_48);
				grid.setUrlBg( "ui/common/gezikuang/tubiaodikuang/48.png");
				_skin.container.addChild(grid);
				grid.x = startX+60*i;
				grid.y = 507;
				gridList.push(grid);
				item = new ItemInfo();
				item.itemModelId = itemInfos[i]["mod"];
				FaceUtil.SetItemGrid(grid,ItemUtil.convertClientItemInfo(item), true);
			}
			
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(qdata.q_id);
			EventManager.addEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,refeashValue);
			refeashValue();
		}
		
		private function refeashValue():void
		{
			if(_dailyZoneInfo==null)
				return ;
			_dailyZoneInfo = DailyZoneDataManager.instance().getInfoById(_dailyZoneInfo.dailyzoneId);
			_skin.lbShengyu.text = "今日剩余次数："+_dailyZoneInfo.remainCount;
			_skin.lbGoumai.text = "剩余购买次数："+_dailyZoneInfo.canBuyCount;
			if(_dailyZoneInfo.remainCount<=0)
				_skin.lbShengyu.color = 0xd02525;
			else
				_skin.lbShengyu.color = 0xBEA757;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch(target)
			{
				case _skin.btnEnter:
					if(_dailyZoneInfo.remainCount>0)
						DailyZoneDataManager.instance().requestCombat(_dailyZoneInfo);
					else if(_dailyZoneInfo.canBuyCount>0)
						DailyZoneDataManager.instance().buyCount(_dailyZoneInfo,true);
					else
						NoticeManager.showNotifyById(21004);
					break;
				case _skin.btnAdd:
					DailyZoneDataManager.instance().buyCount(_dailyZoneInfo,true);
					break;
			}
		}
		override public function hide():void
		{
			EventManager.removeEvent(DailyZoneDataManager.UPDATEDAILYZONEINFO,refeashValue);
			while(gridList.length>0){
				var icon:IconCDFace=gridList.pop();
				icon.destroy();
			}
		}
	}
}