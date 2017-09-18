package com.rpgGame.app.manager.fulidating
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.coreData.cfg.VipCfg;
	import com.rpgGame.coreData.clientConfig.Q_vip;
	import com.rpgGame.coreData.info.fulidating.SignVO;
	import com.rpgGame.netData.sign.message.ResSendSignInfoToClientMessage;
	import com.rpgGame.netData.sign.message.ResSendSignResultToClientMessage;
	import com.rpgGame.netData.sign.message.ResSignObtainAwardMessage;
	import com.rpgGame.netData.sign.message.ResSignSumAwardResultToClientMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class SignManager
	{
		private var _signVO:SignVO = new SignVO();
		
		private static var _instance:SignManager;
		public static function get instance():SignManager
		{
			if(_instance == null)
				_instance = new SignManager();
			return _instance;
		}
		
		public function isHaveToDay():Boolean
		{
			if(_signVO.dayList==null||_signVO.dayList.length==0) return false;
			for(var i:int=0;i<_signVO.dayList.length;i++)
			{
				if(SystemTimeManager.sysDateTime.date==_signVO.dayList[i])
					return true;
			}
			return false;
		}
		
		public function isHaveSignDay(day:int):Boolean
		{
			if(_signVO.getedSignReward==null||_signVO.getedSignReward.length==0) return true;
			for(var i:int=0;i<_signVO.getedSignReward.length;i++)
			{
				if(day==_signVO.getedSignReward[i])
					return false;
			}
			return true;
		}
		
		/**
		 * 获取可补签的次数
		 * */
		public function get canBuQianNum():int
		{
			if(SystemTimeManager.sysDateTime.fullYear>_signVO.openServerTime.fullYear)
			{
				if(isHaveToDay())
					return SystemTimeManager.sysDateTime.date-_signVO.dayList.length;
				else
					return SystemTimeManager.sysDateTime.date-_signVO.dayList.length-1;
			}
			else
			{
				if(SystemTimeManager.sysDateTime.month>_signVO.openServerTime.month)
				{
					if(isHaveToDay())
						return SystemTimeManager.sysDateTime.date-_signVO.dayList.length;
					else
						return SystemTimeManager.sysDateTime.date-_signVO.dayList.length-1;
				}
				else
				{
					if(SystemTimeManager.sysDateTime.month==_signVO.openServerTime.month&&SystemTimeManager.sysDateTime.date>=_signVO.openServerTime.date)
					{
						if(isHaveToDay())
							return (SystemTimeManager.sysDateTime.date-_signVO.dayList.length-_signVO.openServerTime.date);
						else
							return (SystemTimeManager.sysDateTime.date-_signVO.dayList.length-_signVO.openServerTime.date+1);
					}
					else
						return -1;
				}
			}
			return -1;
		}	
		
		public function get signVO():SignVO
		{
			return _signVO;
		}
		
		public function isCanSign(day:int):Boolean
		{
			if(signVO!=null)
			{
				if(!signVO.dayIsSign( day ))
				{
					return true;
				}
			}
			return false;
		}
		
		public function getBuQianNum():int
		{
			var vipCfg:Q_vip=VipCfg.getVip(Mgr.vipMgr.vipLv);
			var arr:Array=JSONUtil.decode(vipCfg.q_sign_times);
			return arr[0];
		}
		
		public function getTiQianNum():int
		{
			var vipCfg:Q_vip=VipCfg.getVip(Mgr.vipMgr.vipLv);
			var arr:Array=JSONUtil.decode(vipCfg.q_sign_times);
			return arr[1];
		}
		
		/**签到信息数据*/
		public function onResSendSignInfoToClientMessage(msg:ResSendSignInfoToClientMessage):void
		{
			_signVO.signAddNum=msg.signInfo.signAddNum;
			_signVO.monthSignSum = msg.signInfo.monthSignSum;
			_signVO.historySignSum = msg.signInfo.historySignSum;
			_signVO.strikeSignSum=msg.signInfo.strikeSignSum;
			_signVO.firstAward=msg.signInfo.firstAward;
			_signVO.vipAward=msg.signInfo.vipAward;
			_signVO.dayList = msg.signInfo.dayList;
			_signVO.getedSignReward = msg.signInfo.sumList;
			_signVO.openServerTime=new Date(msg.signInfo.openTime.fValue*1000);
			EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_SIGN_GETINFOS,_signVO);
		}
		
		/**签到结果反馈*/		
		public function onResSendSignResultToClientMessage(msg:ResSendSignResultToClientMessage):void
		{
			if(msg.signResult > 0)
			{
				_signVO.dayList.push( msg.signResult );
				EventManager.dispatchEvent(ServerActiveEvent.SERVERACTIVE_SIGN_GETINFOS,_signVO);
			}
		}
		
		/**VIP额外签到领取反馈*/
		public function onResSignObtainAwardMessage(msg:ResSignObtainAwardMessage):void
		{
			//			Mgr.zaiXianMgr.onSCOnlineInfoMessage(msg);
		}
		
		/**领取累计签到奖励结果*/		
		public function onResSignSumAwardResultToClientMessage(msg:ResSignSumAwardResultToClientMessage):void
		{
			//			Mgr.zaiXianMgr.onSCOnlineRewardMessage(msg);
		}
	}
}