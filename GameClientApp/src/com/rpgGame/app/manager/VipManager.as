package com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.sender.VipSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.VipEvent;
	import com.rpgGame.netData.vip.bean.VipCardInfo;
	import com.rpgGame.netData.vip.message.SCVipDataMessage;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;

	public class VipManager
	{
		public static var ins:VipManager=new VipManager();
		
		private var _vipLv:int;
		private var _endTime:Number;
		private var _cardInfos:HashMap;
		public function VipManager()
		{
			_cardInfos=new HashMap();
		}

		public function get vipLv():int
		{
			return _vipLv;
		}

		public function set vipLv(value:int):void
		{
			_vipLv = value;
		}
		public function iWantBecomeVip():void
		{
			AppManager.showApp(AppConstant.VIP_PANEL);
		}

		/**
		 *过期剩余时间,绝对时间
		 */
		public function get endTime():Number
		{
			return _endTime;
		}

		public function reqGetVipReward(vip:int):void
		{
			VipSender.ReqGetVipWard(vip);
		}
		public function recVipPanelData(msg:SCVipDataMessage):void
		{
			this._vipLv=msg.curVipId;
			this._endTime=msg.remain*1000+getTimer();
			_cardInfos.clear();
			for each (var card:VipCardInfo in msg.cardInfos) 
			{
				_cardInfos.put(card.vipId,card.count);
			}
			
			EventManager.dispatchEvent(VipEvent.GET_VIP_DATA);
		}

		
		public function getCardRewardCount(vip:int):int
		{
			return _cardInfos.getValue(vip);
		}
	}
}