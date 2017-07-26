package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.QSinglecitybaseCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.clientConfig.Q_singlecitybase;
	import com.rpgGame.coreData.enum.EnumCity;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.tip.WczbTipsData;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityInfo;
	
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
			var tipsInfo:WczbTipsData=(data as DynamicTipData).data;
			if(!tipsInfo){
				return;
			}
			var info:GuildWarCityInfo=tipsInfo.cityInfo;
			var cfg:Q_singlecitybase=QSinglecitybaseCfgData.getCityCfg(info.id);
			_rewardG.setRewardByJsonStr(cfg.q_rewards2);
			_rewardB.setRewardByJsonStr(cfg.q_rewards1);
			
			_skins.lbTeamName.text=info.occupyGuildName?info.occupyGuildName:"无";
			_skins.lbRoleName.text=info.occupyCheifName?info.occupyCheifName:"无";
			
			_skins.lbVsBang.htmlText=info.occupyGuildName&&info.attackGuildName?HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,info.occupyGuildName)+"VS"+HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,info.attackGuildName):"无";
			if(tipsInfo.nextTime!=0){
				_skins.lbTime.text=TimeUtil.changeDateToDateStr(new Date(tipsInfo.nextTime));
			}else{
				_skins.lbTime.text="待定";
			}
			_skins.lbJiangli.visible=tipsInfo.isOwner;
			if(tipsInfo.isOwner){
				_skins.lbJiangli.htmlText=tipsInfo.rewardState==0?HtmlTextUtil.getTextColor(StaticValue.UI_RED1,"已经领取"):HtmlTextUtil.getTextColor(StaticValue.UI_GREEN,"点击领取");
			}
			_skins.lbName.text=EnumCity.getCityName(info.id);
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