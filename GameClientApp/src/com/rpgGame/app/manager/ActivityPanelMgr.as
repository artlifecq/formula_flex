package  com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.sender.OpenActivitySender;
	import com.rpgGame.app.ui.main.openActivity.ActivityIconExt;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.OpenActivityEvent;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;
	import com.rpgGame.netData.activities.bean.ActivityInfo;
	import com.rpgGame.netData.activities.message.ResActivitiesGetRewardInfoMessage;
	import com.rpgGame.netData.activities.message.ResActivitiesInfoMessage;
	import com.rpgGame.netData.activities.message.ResActivitiesRefreshMessage;
	import com.rpgGame.netData.player.message.SCSuperVipMessage;
	
	import flash.utils.setTimeout;
	
	import org.client.mainCore.manager.EventManager;

	public class ActivityPanelMgr 
	{
		public static const EVENT_GET:String="get_act_event";
		private static var _ins:ActivityPanelMgr;
		public static function get ins ():ActivityPanelMgr
		{
			if (!_ins) 
			{
				_ins=new ActivityPanelMgr();
			}
			return _ins;
		}
		private var isFirstGetInfo:Boolean = true;
		
		public var coupletCur:int = 0;
		
	
		//活动  hashmap
		private var _activtiyMap:HashMap = new HashMap();
		//活动panel
		private var _activityBtnMap:HashMap = new HashMap();
		
		
		
		
		
		private var _cacheDatnums:Vector.<int>;
		//	累计元宝数量
		public var goldCardcount:int;
		
		private var _timeActivityHash:HashMap = null; 
		
		private var _joinDay:int;
		
		private var _superVIP_girlImageURL:String="";
		

		
		public function get superVIP_girlImageURL():String
		{
			return _superVIP_girlImageURL;
		}
		
		private var _superVIP_girlQQ:String;
		
		public function get superVIP_girlQQ():String
		{
			return _superVIP_girlQQ;
		}
		
		
		public function ActivityPanelMgr()
		{
			_timeActivityHash = new HashMap();
			
			
		}
		
		/** 
		 * 合服天数
		 */
		public function get joinDay():int
		{
			return _joinDay;
		}	
		/******************************************************************************************
		 * 
		 * 活动相关
		 * 
		 ***********************************************************************************************/
	

		/**获得主面板下的标签活动*/
		public function getTagActivityByMianPanel(main:int):HashMap
		{
			var tmp:ActivityVo;
			var tmpMap:HashMap = new HashMap();
			var arr: Vector.<ActivityVo> = _activtiyMap.getValue(main);
			var value:Vector.<ActivityVo>;
			for each (tmp in arr)
			{
				//				if ( tmp.childPanelType == EnumCampPanelType.SP_HEROSHOP ) 
				//					continue;
				
				value = tmpMap.getValue(tmp.childPanelType);
				if (value)
				{
					value.push(tmp);
				}
				else
				{
					value = new Vector.<ActivityVo>();
					value.push(tmp);
					tmpMap.put(tmp.childPanelType, value);
				}
			}
			
			return tmpMap;
		}
		
		/**
		 * 根据面板类型  获得活动列表
		 * @param main  主面板
		 * @param child 子面板
		 * @return 
		 * 
		 */
		public function getActivityListByPanelType(main:int, child:int = 0):Vector.<ActivityVo>
		{
			var tmp:ActivityVo;
			var arr: Vector.<ActivityVo> = _activtiyMap.getValue(main);
			var needList: Vector.<ActivityVo> = new Vector.<ActivityVo>();
			for each (tmp in arr)
			{
				if (child && tmp.childPanelType == child)
					needList.push(tmp);		
				//				else
				//					needList.push(tmp);
			}
			
			return needList;
		}
		
	
		public function getActivitysByType(type:int):Vector.<ActivityVo>
		{
			return _activtiyMap.getValue(type) as Vector.<ActivityVo>;
		}
		public function hasActivity(type:int):Boolean
		{
			return _activtiyMap.containsKey(type);
		}
		public function ToLocationData(activities:Vector.<ActivityVo>):void
		{
			var tmp:ActivityVo;
			var value:Vector.<ActivityVo>;
			_activtiyMap.clear();
			for each (tmp in activities)
			{
				
				value = _activtiyMap.getValue(tmp.mainPanelType);
				if (value)
				{
					value.push(tmp);
				}
				else
				{
					value = new Vector.<ActivityVo>();
					value.push(tmp);
					_activtiyMap.put(tmp.mainPanelType, value);
				}
			}
	
		}
		private function checkNewBtn():void
		{
			
			var btnTypes:Array=_activityBtnMap.keys();
			
			var newType:Array=_activtiyMap.keys();
			
			var needCheck:Boolean=false;
			
			if (btnTypes.length!=newType.length) 
			{
				needCheck=true;
			}
			if (!needCheck) 
			{
				//检查类型
				btnTypes.sort(Array.NUMERIC);
				newType.sort(Array.NUMERIC);
				var len:int=btnTypes.length;
				for (var i:int = 0; i < len; i++) 
				{
					if (btnTypes[i]!=newType[i]) 
					{
						needCheck=true;
						break;
					}
				}
			}
			if (!needCheck) 
			{
				return;
			}
			var newBtnHash:HashMap=new HashMap();
			var btn:ActivityIconExt;
		
			for each (var key:int in newType) 
			{
				btn=_activityBtnMap.getValue(key);
				if (!btn) 
				{
					btn=new ActivityIconExt();
				}
				btn.setActivityList(_activtiyMap.getValue(key));
				newBtnHash.put(key,btn);
			}
			_activityBtnMap=newBtnHash;
			EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY);
		}
		public function getBtn(mainType:int):ActivityIconExt
		{
			return _activityBtnMap.getValue(mainType);
		}
		public function onResActivitiesInfoMessage(msg:ResActivitiesInfoMessage):void
		{
			//全部刷新
			if (msg.mainPanelType==0) 
			{
				recActivitiesInfoMsg(msg.activities);
			}
			//
			else
			{
				recActivitiesByType(msg.mainPanelType,msg.activities);
			}
		}

		private function recActivitiesInfoMsg(activities:Vector.<ActivityInfo>):void
		{
			// TODO Auto Generated method stub
			//traceCamps(activities);
			var activitiesVos:Vector.<ActivityVo>=new Vector.<ActivityVo>();
			for each (var newInfo:ActivityInfo in activities)
			{
				var nowInfo:ActivityVo = new ActivityVo(); 
				nowInfo.setInfo( newInfo );
				activitiesVos.push(nowInfo);	
			}
			ToLocationData(activitiesVos);
			//			topBtnPanel.updateActivityBtns( _activtiyMap.values() );
			checkNewBtn();
			EventManager.dispatchEvent(OpenActivityEvent.GET_DATA,0);
		}
		private function recActivitiesByType(type:int,infos:Vector.<ActivityInfo>):void
		{
			var list:Vector.<ActivityVo>=new Vector.<ActivityVo>();
			var len:int=infos.length;
			for (var i:int = 0; i < len; i++) 
			{
				var vo:ActivityVo=new ActivityVo();
				vo.setInfo(infos[i]);
				list.push(vo);
			}
			_activtiyMap.put(type,list);
			EventManager.dispatchEvent(OpenActivityEvent.GET_DATA,type);
		}
		public function onSCSuperVipHandler(msg:SCSuperVipMessage):void
		{
			// TODO Auto Generated method stub
			_superVIP_girlQQ=msg.qq;
			_superVIP_girlImageURL=msg.img;
		}
		public function recActivityInfoChange(info:ActivityInfo):void
		{
			var vo:ActivityVo=new ActivityVo();
			vo.setInfo(info);
			var oldList:Vector.<ActivityVo>=_activtiyMap.getValue(vo.mainPanelType);
			if (!oldList) 
			{
				oldList=new Vector.<ActivityVo>;
				_activtiyMap.put(vo.mainPanelType,oldList);
				oldList.push(vo);
			}
			else
			{
				var len:int=oldList.length;
				var tmp:ActivityVo;
				for (var i:int = 0; i < len; i++) 
				{
					tmp=oldList[i];
					if (tmp.activityId==vo.activityId) 
					{
						oldList[i]=vo;
						break;
					}
				}
			}
			EventManager.dispatchEvent(OpenActivityEvent.GET_DATA,vo.mainPanelType);
		}
		/**
		 * 领奖返回
		 * */
		public function resActivitiesGetRewardInfoMsg(msg:ResActivitiesGetRewardInfoMessage):void
		{
			recActivityInfoChange(msg.info);
		}
		
		/**活动刷新广播*/
		public function resActivitiesRefreshMsg(msg:ResActivitiesRefreshMessage):void
		{
			var time:int = Math.random() * 10;
			time = time * 1000;
			
			setTimeout(reqActivitiesInfoMsg, time);
			//			
			//			if (Mgr.uiMgr.isPanelShowByType(SignMainExt)) 
			//			{
			//				Mgr.signMgr.reqOnlineRewardPanelInfo();
			//			}
		}
		
		/**请求活动信息*/
		public function reqActivitiesInfoMsg(type:int=0):void
		{
			OpenActivitySender.reqActivitiesInfoMsg(type);
		}
		
		/**请求领取奖励*/
		public function reqActivitiesGetRewardMsg(id:int, times:int = 1):void
		{
			OpenActivitySender.reqActivitiesGetRewardMsg(id,times);
		}
		
		
		
		
		
		private function traceCamps(activities:Vector.<ActivityInfo>):void
		{
			var str:String = "活动";
			for (var i:int = 0; i < activities.length; i++)
			{
				str += " " + activities[i].activityType.toString() + ':' + activities[i].activityId.toString() + ", ";
			}
			
		}
		
		
		
		public function get timeActivityHash():HashMap
		{
			return _timeActivityHash;
		}
		
		
		
		public function getActivityPanelKey(activityBtn:ActivityIconExt):String
		{
			// TODO Auto Generated method stub
			var type:String;
			switch ( activityBtn.topType )
			{
					case EnumCampPanelType.M_BUG:
						type=AppConstant.ACT_BUG;
						break;
					case EnumCampPanelType.M_SUPER_VIP_37:
						type=AppConstant.ACT_37_SUPER_VIP;
						break;
					case EnumCampPanelType.M_PLATFORM_37:
						type=AppConstant.ACT_37_PLATFORM;
						break;
					case EnumCampPanelType.M_PHONE_37:
						type=AppConstant.ACT_37_PHONE;
						break;
			}
			return type;
		}

	}
}