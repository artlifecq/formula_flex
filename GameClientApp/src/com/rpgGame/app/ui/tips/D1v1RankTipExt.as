package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.netData.dianfeng.bean.DianFengDataInfo;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.zhanchang.dianfengduijue.Tips_DuanWei;
	
	public class D1v1RankTipExt extends SkinUI implements ITip
	{
		private static var _ins : D1v1RankTipExt = null;
		
		public static function get instance() : D1v1RankTipExt
		{
			if (!_ins)
			{
				_ins = new D1v1RankTipExt();
			}
			return _ins;
		}
		private var _skin:Tips_DuanWei;
		private var _rewardNow:RewardGroup;
		private var _rewardNext:RewardGroup;
		public function D1v1RankTipExt()
		{
			_skin=new Tips_DuanWei();
			super(_skin);
			_rewardNow=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon1,RewardGroup.ALIN_LEFT,10,2,2,false);
			_rewardNext=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon2,RewardGroup.ALIN_LEFT,10,2,2,false);
		}
	
		public function setTipData(data:*):void
		{
			_rewardNext.clear();
			_rewardNow.clear();
			var data1:DianFengDataInfo=Mgr.d1v1Mgr.data;
			if (!data1) 
			{
				return;
			}
			var curRank:int=data1.level;
			var qRank:Q_battle_rank=BattleRankCfg.getRank(curRank);
			if (qRank) 
			{
				_skin.lbCurrent.text=qRank.q_subrank_name;
				_rewardNow.setRewardByJsonStr(qRank.q_reward);
				_skin.uiIcon.styleName=Mgr.d1v1Mgr.getRankIconUrl(curRank,2);
				var next:Q_battle_rank=BattleRankCfg.getRank(qRank.q_next_subrank);
				if (next) 
				{
					_skin.gNext.visible=true;
					_skin.lbXiaJie.text="【下一阶段位】";
					_skin.lbNext.text=next.q_subrank_name;
					_rewardNext.setRewardByJsonStr(next.q_reward);
					_skin.uiIcon2.styleName=Mgr.d1v1Mgr.getRankIconUrl(qRank.q_next_subrank,2);
				}
				else
				{
					_skin.lbXiaJie.text="【已达最高阶】";
					_skin.gNext.visible=false;
				}
			}
		}
		
		public function hideTips():void
		{
			_rewardNext.clear();
			_rewardNow.clear();
		}
	}
}