package  com.rpgGame.app.manager
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.ui.main.openActivity.ActivityIconExt;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.netData.activities.bean.ActivityInfo;
	import com.rpgGame.netData.activities.message.ResActivitiesGetRewardInfoMessage;
	import com.rpgGame.netData.activities.message.ResActivitiesRefreshMessage;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.setTimeout;
	
	import org.client.mainCore.manager.EventManager;

	public class ActivityPanelMgr extends EventDispatcher
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
		
		//所有活动列表
		private var _activities: Vector.<ActivityVo> = new Vector.<ActivityVo>();
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
	
		
		/**获得活动icon*/
		public function getActivityIcons():HashMap
		{
			var tmp:ActivityVo;
			var tmpMap:HashMap = new HashMap();
			var value:Vector.<ActivityVo>;
			for each (tmp in _activities)
			{
				value = tmpMap.getValue(tmp.entranceIcon);
				if (value)
				{
					value.push(tmp);
				}
				else
				{
					value = new Vector.<ActivityVo>();
					value.push(tmp);
					tmpMap.put(tmp.entranceIcon, value);
				}
			}
			
			return tmpMap;
		}
		
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
		
		/**根据活动id  获得活动*/
		public function getActivityByID(id:int):ActivityVo
		{
			var tmp:ActivityVo;
			for each (tmp in _activities)
			{
				if (tmp.activityId == id)
				{
					return tmp;
				}
			}
			
			return null;
		}
		public function getActivitysByType(type:int):Vector.<ActivityVo>
		{
			return _activtiyMap.getValue(type) as Vector.<ActivityVo>;
		}
		public function hasActivity(type:int):Boolean
		{
			return _activtiyMap.containsKey(type);
		}
		public function ToLocationData():void
		{
			var tmp:ActivityVo;
			var value:Vector.<ActivityVo>;
			_activtiyMap.clear();
			for each (tmp in _activities)
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
		/**
		 * 收到活动信息
		 * */
		
		private var _isFirstLogin:Boolean=true;
		public function recActivitiesInfoMsg(activities:Vector.<ActivityInfo>):void
		{
			// TODO Auto Generated method stub
			traceCamps(activities);
			
			_activities.splice(0, _activities.length);
			for each (var newInfo:ActivityInfo in activities)
			{
				var nowInfo:ActivityVo = new ActivityVo(); 
				nowInfo.setInfo( newInfo );
				_activities.push(nowInfo);	
			}
			ToLocationData();
			//			topBtnPanel.updateActivityBtns( _activtiyMap.values() );
			
			this.dispatchEvent(new Event(EVENT_GET));
		}
		
		
		/**
		 * 领奖返回
		 * */
		public function resActivitiesGetRewardInfoMsg(msg:ResActivitiesGetRewardInfoMessage):void
		{
			reqActivitiesInfoMsg();
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
		public function reqActivitiesInfoMsg():void
		{
//			var msg:ReqActivitiesInfoMessage = new ReqActivitiesInfoMessage();
//			Mgr.messageMgr.send(msg);
		}
		
		/**请求领取奖励*/
		public function reqActivitiesGetRewardMsg(id:int, times:int = 1):void
		{
//			var msg:ReqActivitiesGetRewardMessage = new ReqActivitiesGetRewardMessage();
//			msg.activityId = id;
//			msg.times = times;
//			Mgr.messageMgr.send(msg);
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
//				case EnumCampPanelType.M_FIRST_BUY:
//					type=FirstPayPanelExt;
//					break;
//				case EnumCampPanelType.M_SUPER_VIP_37:
//					type=Platform37SuperVIPExt;
//					break;
//				case EnumCampPanelType.M_SEVEN_DAY:
//					type=SevenDayLoginPanelExt;
//					break;
//				case EnumCampPanelType.M_FIRST_BUY_EVERYDAY:
//					type=FirstPayEveryDayPanelExt;
//					break;
//				case EnumCampPanelType.M_GONGCE_YUANBAO:
//					type=LinQuGongCeGoldPanelExt;
//					break;
//				default:
//					type=GeneralActivityPanel;
			}
			return type;
		}

	}
}