package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import org.mokylin.skin.app.banghui.wangcheng.Tips_WangCheng;
	
	/**
	 *王城争霸奖励tips 
	 * @author dik
	 * 
	 */
	public class WangChengRewardTips extends SkinUI implements ITip
	{
		private var _skins:Tips_WangCheng;
		private var _rewardG:RewardGroup;
		private var _rewardB:RewardGroup;
		
		public function WangChengRewardTips()
		{
			_skins=new Tips_WangCheng();
			super(_skins);
			_rewardG=new RewardGroup(IcoSizeEnum.ICON_42,_skins.icon1_1,RewardGroup.ALIN_LEFT,4);
			_rewardB=new RewardGroup(IcoSizeEnum.ICON_42,_skins.icon2_1,RewardGroup.ALIN_LEFT,4);
		}
		
		public function setTipData(data:*):void
		{
			var cityId:int=EnumCity.DONG_WEI;
			var cfg:Q_singlecitybase=QSinglecitybaseCfgData.getCityCfg(cityId);
			_rewardG.setRewardByJsonStr(cfg.q_rewards2);
			_rewardB.setRewardByJsonStr(cfg.q_rewards1);
		}
		
		public function hideTips():void
		{
			_rewardG.clear();
			_rewardB.clear();
		}
		
		private static var _instance:WangChengRewardTips=null;
		public static function get instance():WangChengRewardTips
		{
			if (null == _instance)
			{
				_instance=new WangChengRewardTips();
			}
			return _instance;
		}
	}
}