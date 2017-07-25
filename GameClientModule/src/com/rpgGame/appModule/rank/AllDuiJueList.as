package com.rpgGame.appModule.rank
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.coreData.enum.RankListType;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.dianfeng.bean.DianFengDataInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.paihangbang.PaiHangTotal_zhanli;
	import org.mokylin.skin.common.Flip2_Skin;
	
	import starling.display.DisplayObject;
	
	public class AllDuiJueList extends ViewUI
	{
		private var _skin:PaiHangTotal_zhanli;
		private var _type:int ;
		private var _gReward:RewardGroup;
		public function AllDuiJueList():void
		{
			_skin = new PaiHangTotal_zhanli();
			super(_skin);
			initView();
		}
		private var _leftGroup:AllRankLeftGroup;
		private function initView():void
		{
			this.x = 22;
			this.y = 54;
			_type = RankListType.ALL_DIANFENG_TYPE;
			_leftGroup = new AllRankLeftGroup(_skin.cellgroup,_type);
			_leftGroup.bindPageBtn(_skin.skinFlip.skin  as Flip2_Skin);
			_leftGroup.bindUI(_skin.lbMiaosu,_skin.uiTongjizhong);
			_leftGroup.bindRightGroup(_skin.skinRight);
			_gReward=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon1);
			TipTargetManager.show(_skin.uiLevel,TargetTipsMaker.makeTips(TipType.D1V1_RANK_TIP,new DynamicTipData()));
		}
		override protected function onShow():void
		{
			super.onShow();
			_leftGroup.onShow();
			ongetPanelData();
			EventManager.addEvent(D1v1Event.GET_PANEL_DATA,ongetPanelData);
			Mgr.d1v1Mgr.reqPanelData();
		}
		private function ongetPanelData(state:int=0):void
		{
			// TODO Auto Generated method stub
			var data:DianFengDataInfo=Mgr.d1v1Mgr.data;
			if (data) 
			{
				var qRank:Q_battle_rank=BattleRankCfg.getRank(data.level);
				if (qRank) 
				{
					_gReward.setRewardByJsonStr(qRank.q_reward);
				}
				if (data.drawAward==1) 
				{
					TouchableUtil.gray(_skin.btnLinQu);
				}
				else 
				{
					TouchableUtil.ungray(_skin.btnLinQu);
				}
			}
			
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnLinQu:
				{
					Mgr.d1v1Mgr.reqGetReward();
					break;
				}
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			_leftGroup.onHide();
			_gReward.clear();
			EventManager.removeEvent(D1v1Event.GET_PANEL_DATA,ongetPanelData);
		}
		
	}
}