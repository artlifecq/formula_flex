package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.main.openActivity.BaseActivityListItemCell;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampsFlag;
	
	import org.mokylin.skin.app.tequan.Item_Tequanlibao;
	
	public class P37PlatformVipLevelItemExt extends BaseActivityListItemCell
	{
		private var _skin:Item_Tequanlibao;
		private var _rewardG:RewardGroup;
		public function P37PlatformVipLevelItemExt()
		{
			_skin=new Item_Tequanlibao();
			super(_skin, _skin.btnOk);
			_rewardG=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1);
		}
		override public function setData(info:ActivityVo):void
		{
			super.setData(info);
			_skin.num.label=info.getFlagValue(EnumCampsFlag.F_CELLNUMS_STR);
			_rewardG.setRewardByJsonStr(info.activityReward);
		}
		override public function clearData():void
		{
			super.clearData();
			_rewardG.clear();
		}
	}
}