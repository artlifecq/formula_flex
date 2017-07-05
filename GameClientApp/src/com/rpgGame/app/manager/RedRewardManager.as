package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.clientConfig.Q_vip;

	public class RedRewardManager
	{
		private var _vipInfo:Q_vip;
		private var _isMaxVipLevel:Boolean;
		private var _isGetCount:int = 20;
		public function RedRewardManager()
		{
			refeashVipData();
		}
		
		private function refeashVipData():void
		{
			var viplevel:int = MainRoleManager.actorInfo.vipLv;
			_vipInfo = VipCfg.getVip(viplevel);
			_isMaxVipLevel = VipCfg.getVip(viplevel)==null;
		}
		
		public function get isMaxVipLevel():Boolean
		{
			return _isMaxVipLevel;
		}
		public function get haveRewardCount():int
		{
			return 40;
		}
		
		public function get canGetRewardCount():int
		{
			return _vipInfo.q_redReward;
		}
		public function get canGetReward():Boolean
		{
			if(_isGetCount< canGetRewardCount)
				return true;
			if(!isMaxVipLevel&&haveRewardCount>0)
				return true;
			return false;
		}
		private static var _instance:RedRewardManager;
		
		public static function instance():RedRewardManager
		{
			if(_instance==null)
				_instance = new RedRewardManager();
			return _instance;
		}
	}
}