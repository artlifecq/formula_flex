package com.rpgGame.appModule.dungeon.exp
{
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.cfg.DailyZoneCfgData;
	import com.rpgGame.coreData.clientConfig.Q_daily_zone;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.dailyzone.bean.DailyZonePanelInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fuben.FuBen_JingYan_Skin;
	
	import starling.display.DisplayObject;
	
	public class ExpDungeon extends ViewUI
	{
		private var _skin:FuBen_JingYan_Skin;
		private var _dailyZoneInfo:DailyZonePanelInfo;
		private var _groupList1:RewardGroup;
		public function ExpDungeon():void
		{
			_skin=new FuBen_JingYan_Skin();
			super(_skin);
			_groupList1=new RewardGroup(IcoSizeEnum.ICON_42,_skin.icon_0,RewardGroup.ALIN_CENTER,9,13,0,true,9,false,false);
			
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			var list:Array = DailyZoneCfgData.getTypeList(3);
			var qdata:Q_daily_zone = list[0] as Q_daily_zone;
			_groupList1.setRewardByJsonStr(qdata.q_special_rewards_show);
			
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
			_groupList1.clear();
		}
	}
}