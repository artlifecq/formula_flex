package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.RedRewardSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.RedRewardEvent;
	import com.rpgGame.core.events.VipEvent;
	import com.rpgGame.coreData.cfg.RedRewardCfgData;
	import com.rpgGame.coreData.clientConfig.Q_redreward;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.netData.redreward.bean.RedRewardDataInfo;
	import com.rpgGame.netData.redreward.bean.RedRewardLog;
	import com.rpgGame.netData.redreward.bean.RedRewardPlayerInfo;
	import com.rpgGame.netData.redreward.bean.RedRewardState;
	import com.rpgGame.netData.redreward.message.SCGetRedRewardInfoMessage;
	
	import org.client.mainCore.manager.EventManager;

	public class RedRewardManager
	{
		private var _firstAutoOpen:Boolean = true;
		private var _vipInfo:Q_redreward;
		public var funcOpening:Boolean=false;

		public function get vipInfo():Q_redreward
		{
			return _vipInfo;
		}

		private var _isMaxVipLevel:Boolean;
		private var _dayCount:int = 0;
		private var _sendCount:int;
		private var _redCount:int;
		private var _recharged:Boolean;
		private var _mouthTotal:int;

		public function get mouthTotal():int
		{
			return _mouthTotal;
		}

		
		
		public function updataMouthTotal(value:int):void
		{
			if(_mouthTotal == value)
				return ;
			_mouthTotal = value;
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_REDREWARDMONTHCOUNT);
		}
		public function get sendCount():int
		{
			return _sendCount;
		}
		
		public function get redCount():int
		{
			return _redCount;
		}
		
		private function init():void
		{
			EventManager.addEvent(VipEvent.GET_VIP_DATA,refeashVipData);
		}

		public function updataCountInfo(msg:SCGetRedRewardInfoMessage):void
		{
			_dayCount = msg.count;
			_sendCount = msg.sendcount;
			_redCount = msg.redCount;
			_recharged = msg.recharged == 1;
			if(msg.panelState==1&& _sendCount>0)
				FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_SENDREDREWARD);
			refeashVipData();
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_COUNTINFO);
			if(_firstAutoOpen&&canGetReward&&!funcOpening)
			{
//				AppManager.showAppNoHide(AppConstant.REDREWARD_OPEN);
				FunctionOpenManager.openPanelByFuncID(EmFunctionID.EM_REDREWARD);
				_firstAutoOpen = false;
			}
			
		}
		
		public function get rechaged():Boolean
		{
			return _recharged==1;
		}
		
		private var _rewardInfoList: Vector.<RedRewardPlayerInfo>;

		public function get rewardInfoList():Vector.<RedRewardPlayerInfo>
		{
			return _rewardInfoList;
		}

		private var _isMore:int;

		public function get isMore():int
		{
			return _isMore;
		}
		
		private var _selfCount:int;

		public function get selfCount():int
		{
			return _selfCount;
		}

		public function updataRedRewardList(rewardInfoList: Vector.<RedRewardPlayerInfo>,selfCount:int,isMore:int):void
		{
			_rewardInfoList = rewardInfoList;
			_isMore = isMore;
			_selfCount = selfCount;
			_redRewardInfo = null;
			/*if(_isMore == 1)
			{
				_dayCount-=rewardInfoList.length;
			}else{
				_dayCount--;
			}
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_COUNTINFO);*/
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_REDREWARDGETINFO);
		}
		
		public function sendReward(count:int):void
		{
			if(count==0)
			{
				NoticeManager.showNotifyById(91001);
				return ;
			}
			if(RedRewardManager.instance().sendCount<=0)
			{
				NoticeManager.showNotifyById(91002);
				return ;
			}
			_sendCount -= count;
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_COUNTINFO);
			RedRewardSender.sendReward(count);
		}
		
		private function refeashVipData():void
		{
			var viplevel:int = 0;
			switch(Mgr.vipMgr.vipLv)
			{
				case 1:
					viplevel = 3;
					break;
				case 2:
					viplevel = 4;
					break;
				case 3:
					viplevel = 5;
					break;
				default:
					viplevel = rechaged?2:1;
			}
			_vipInfo = RedRewardCfgData.getdataById(viplevel);
			_isMaxVipLevel = viplevel>=5;
		}
		
		
		
		public function get isMaxVipLevel():Boolean
		{
			return _isMaxVipLevel;
		}
		public function get haveRewardCount():int
		{
			return _dayCount;
		}
		
		public function get canGetReward():Boolean
		{
			var minvalue:int = Math.min(_dayCount,_redCount);
			if(isMaxVipLevel)
			{
				return minvalue>0;
			}else{
				if(minvalue>0)
					return true;
				if(minvalue==0&&_redCount>0)
					return true;
				return false;
			}
		}
		
		private var _redRewardInfo:RedRewardDataInfo;

		public function get redRewardInfo():RedRewardDataInfo
		{
			return _redRewardInfo;
		}

		public function updataRedRewardInfo(info:RedRewardDataInfo):void
		{
			_redRewardInfo = info;
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_REDREWARDINFO);
		}
		
		private var _redRewards: Vector.<RedRewardState>;

		public function get redRewards():Vector.<RedRewardState>
		{
			return _redRewards;
		}

		public function updataRedRewardStates(list:Vector.<RedRewardState>):void
		{
			_redRewards = list;
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_REDREWARDSTATES);
		}
		
		private var _loglist: Vector.<RedRewardLog>

		public function get loglist():Vector.<RedRewardLog>
		{
			return _loglist;
		}

		
		public function updataRedTewardLogLists(list:Vector.<RedRewardLog>):void
		{
			_loglist  = list;
			EventManager.dispatchEvent(RedRewardEvent.UPDATA_REDREWARDLOGS);
		}
		
		public function openRedRewardInfo(isMore:Boolean):void
		{
			if(_redRewardInfo==null)
				return ;
			if(!this.isMaxVipLevel&&_redCount>0&&_dayCount==0)
			{
				if(_recharged)
					NoticeManager.showNotifyById(91003);
				else
					NoticeManager.showNotifyById(91007);
				return ;
			}
			var type:int = 0;
			if(_redRewardInfo.sendPlayerId.IsZero())
				type = 0;
			else
				type = isMore?1:0;
			RedRewardSender.openReward(type);
		}
		
		private static var _instance:RedRewardManager;
		
		public static function instance():RedRewardManager
		{
			if(_instance==null)
			{
				_instance = new RedRewardManager();
				_instance.init();
			}
			return _instance;
		}
	}
}