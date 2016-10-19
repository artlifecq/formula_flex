package com.rpgGame.app.manager.yunBiao
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.coreData.lang.LangYunBiao;
	
	import org.client.mainCore.manager.EventManager;
	

	public class GuildBiaoCheState extends BiaoCheStateBase
	{
		/** 帮会运镖需要的活跃值 **/
		public var guildYunBiaoActive:int;
		
		/** 提交帮会运镖的npc id **/
		public var _guildYunBiaoSubmitNpcId:Array;
		
		public var _yunbiaoLevelLimit:int = 0;

		public function GuildBiaoCheState()
		{
		}
		
		override public function reset() : void
		{
			limitTime = 0;
			isHited = false;
			isFarAwar = false;
			destoryFinishTimer();
		}
		
		override protected function onYunBiaoTimeOut() : void
		{
			GameAlert.showAlertUtil(LangYunBiao.YUN_BIAO_TIME_OUT);
			destoryFinishTimer();
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}
		
		/** 运镖开始 **/
		override protected function onYunBiaoStart() : void
		{
			YunBiaoManager.guildYunBiaoHelp();
		}

		/**
		 * 获取剩余的运镖次数 
		 * @author 康露 2014年12月27日
		 */
		override public function getLeftTimes() : int
		{
			return 1 - yunBiaoTimes; 
		}

		public function init($yunBiaoConfig:*) : void
		{
			if ($yunBiaoConfig.hasGuildYunBiaoActive)
			{
				guildYunBiaoActive = $yunBiaoConfig.guildYunBiaoActive;
			}
			if ($yunBiaoConfig.hasGuildGetYunBiaoNpcId)
			{
				getNpcId = $yunBiaoConfig.guildGetYunBiaoNpcId;
			}
			_guildYunBiaoSubmitNpcId = [];
			var len:int = $yunBiaoConfig.guildSubmitYunBiaoNpcId.length;
			for (var idx:int=0; idx<len; idx++)
			{
				_guildYunBiaoSubmitNpcId.push($yunBiaoConfig.guildSubmitYunBiaoNpcId[idx]);
			}
			
			if ($yunBiaoConfig.hasGuildYunBiaoLevelLimit)
				_yunbiaoLevelLimit = $yunBiaoConfig.guildYunBiaoLevelLimit;
			
			callUpCdTime = $yunBiaoConfig.guildYunBiaoCallHelpCd;
		}

		public function getSubmitYunBiaoNpcId() : int
		{
			return _guildYunBiaoSubmitNpcId[(MainRoleManager.actorInfo.countryId * 2) + quality];
		}
		
		override protected function onUpdateBiaoCheState() : void
		{
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_GUILD_BIAO_CHE_STATE);
		}
	}
}
