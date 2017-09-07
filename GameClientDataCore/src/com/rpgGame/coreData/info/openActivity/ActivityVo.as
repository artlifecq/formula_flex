package  com.rpgGame.coreData.info.openActivity
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.ActivityUtil;
	import com.rpgGame.netData.activities.bean.ActivityInfo;
	
	import flash.utils.getTimer;
	
	public class ActivityVo
	{
		//活动id
		private var _activityId: int;
		
		//活动类型
		private var _activityType: int;
		
		//活动名称
		private var _activityName: String;
		
		//活动标题
		private var _activityTitle: String;
		
		//活动奖励(num|content)
		private var _activityReward: String;
		
		//是否领取，0已经领取，1可领取， 2不可领取
		private var _status: int;
		
		//已经领取次数
		private var _rewardTimes: int;
		
		//总共可重复领取次数
		private var _repeatTimes: int;
		
		//活动结束剩余时间(秒)
		private var _overTime: int;
		// 活动时间字符串
		private var _durTimeStr:String;
		//活动内容介绍
		private var _info: String;
		
		//活动ICON
		private var _resflag: String;
		
		// 活动标志
		protected var _flags:HashMap = null;
		
		//活动顺序（1表示默认在第一排显示，相同的则按照活动ID顺序表示）
		private var _top: int;
		
		//是否独立入口（0或者不填，在充值面板内。1,icon名字，1表示有独立入口，以及ICON的名字，调用面板ID) 奖励领取完后，面板消失。
		private var _icon: String;
		
		//活动所在的分页标签
		private var _fenye: String;
		
		//完成进度分子（助力活动显示数量也用这个）
		private var _numerator: int;
		
		//完成进度分母
		private var _denominator: int;
		
		//系统需求
		private var _xitong: String;
		
		/**入口icon资源*/
		private var _entranceIcon:String;
		private var _titleUrl:String;
		/**grid  icon 资源池*/
		private var _gridIcon:String;
		
		/**倒计时开始时间*/
		private var _startTime:int;
		/**主面板类型*/
		private var _mainPanelType:int;
		/**子面板类型*/
		private var _childPanelType:int;
		
		
		/**活动标签小图标资源名*/
		private var _activityImgName:String;
		/**活动标签资源名*/
		private var _activityTabName:String;
		
		
		
		
		//兑换条件
		private var _exchange: String;
		
		private var _activityStartTime:int;
		private var _activityEndTime:int;
		private var _activityGroupType:int;
		
		//其他信息显示(目前用于排行活动中显示首位达成条件的玩家名字)
		private var _other: String;
		
		public function get activityEndTime():int
		{
			return _activityEndTime;
		}
		
		public function get activityStartTime():int
		{
			return _activityStartTime;
		}
		private var _data:ActivityInfo;
		public function setInfo(info:ActivityInfo):void
		{
			_data=info;
			_startTime = getTimer()/1000;
			
			_activityId = info.activityId;
			//活动类型
			_activityType = info.activityType;
			
			//			_activityTitle = info.activityTitle;
			
			//活动名称
			_activityName = info.activityName;
			
			//活动奖励(num|content)
			_activityReward = info.activityReward;
			
			//是否领取，0已经领取，1可领取， 2不可领取
			_status = info.status;
			
			//已经领取次数
			_rewardTimes = info.rewardTimes;
			
			//总共可重复领取次数
			_repeatTimes = info.repeatTimes;
			
			//活动结束剩余时间(秒)
			_overTime = info.overTime;
			
			//活动内容介绍
			_info = info.info;
			
			//活动ICON
			_resflag = info.resflag;
			
			//活动顺序（1表示默认在第一排显示，相同的则按照活动ID顺序表示）
			_top = info.top;
			
			_icon = info.icon;
			
			//活动所在的分页标签
			_fenye = info.fenye;
			
			//完成进度分子
			_numerator = info.numerator;
			
			//完成进度分母
			_denominator = info.denominator;
			
			_mainPanelType = info.mainPanelType;
			_childPanelType = info.subPanelType;
		
		
			
			_activityStartTime = info.startTime;
			
			_activityEndTime = info.endTime;
			
			
			
			_other=info.other;
			//			_xitong = info.xitong;
			
			var arr:Array;
			arr = ActivityUtil.splitStr(_icon, 2);
			if ( arr[0] == "" || arr[0] == null )
				_titleUrl = "";
			else
				_titleUrl = "other/openfun/tittle/" + arr[0];
			if ( arr[1] == "" || arr[1] == null )
				_entranceIcon = "";
			else
				_entranceIcon = "other/openfun/topbtn/" + arr[1];
			
			if ( arr.length > 2 )
				_activityGroupType = arr[2];
			
			if( _fenye )
			{
				arr = ActivityUtil.splitStr(_fenye, 2);
				
				_activityImgName = arr[0];
				_activityTabName = arr[1];
				
			}
			
			//			_gridIcon = "/image/other/chengzhangzhilu/image/" + _resflag;
			
			
			
			
			
			_exchange = info.exchange;
		}
		
		protected function setFlag(sign:String):void
		{
			if (sign==null) 
			{
				return;
			}
			try
			{
				var arr:Array = sign.split("###");
				if (arr != null && arr.length > 0)
				{
					for each(var value:String in arr)
					{
						var o:Object = ActivityUtil.parseCampsResData(value);
						if (o != null)
						{
							for (var k:String in o)
							{
								_flags.put(k, o[k]);
							}
						}
					}
				}
			}
			catch(err:Error)
			{
				GameLog.addError("解析活动标志错误 id:" + _activityId);
			}
			
		}
		
		/**
		 * 获取活动标志值
		 * @param flag
		 * @return 
		 * 
		 */
		public function getFlagValue(flag:String):*
		{
			var arr:Array = flags.keys();
			for (var i:int = 0; i < arr.length; i++)
			{
				if (arr[i] == flag)
				{
					return flags.get(arr[i]);
				}
			}
			
			return null;
		}
		private function get flags():HashMap
		{
			if (!_flags) 
			{
				_flags=new HashMap();
				setFlag(_data.resflag);
			}
			return _flags;
		}
		/**领取检测*/
		public function IsCanGetReward():Boolean
		{
			if (_status == 1)
				return true;
			return false;
		}
		
		/**得到领取状态0已经领取，1可领取， 2不可领取**/
		public function get status():int
		{
			return _status;
		}
		
		/**活动时间显示字符串*/
		public function get durTimeStr():String
		{
			if (_durTimeStr==null) 
			{
				if ((_data.startTime == 0 || _data.endTime == 0) /*|| info.startTime < serverDatetime && info.endTime > serverDatetime*/)
				{
					_durTimeStr = "当前活动进行中";
				}
				else
				{
					_durTimeStr = ActivityUtil.getDateTimeAt(_data.startTime, 1) + " - " + ActivityUtil.getDateTimeAt(_data.endTime, 1);
				}
			}
			return _durTimeStr;
		}
		
		/**剩余时间*/
		public function getLostTime():int
		{
			if (_overTime == -1)
				return -1;
			
			var time:int = _startTime - getTimer()/1000 + _overTime;
			return time < 0 ? 0 : time; 
		}
		
		/**入口icon资源*/
		public function get entranceIcon():String
		{
			return _entranceIcon;
		}
		
		public function get titleUrl():String
		{
			return _titleUrl;
		}
		
		/**grid  icon 资源池*/
		public function get gridIcon():String
		{
			return _gridIcon;
		}
		
		public function get fenye():String
		{
			return _fenye;
		}
		
		public function get icon():String
		{
			return _icon;
		}
		
		public function get activityId():int
		{
			return _activityId;
		}
		
		public function get activityName():String
		{
			return _activityName;
		}
		
		public function get info():String
		{
			return _info;
		}
		
		public function get numerator():int
		{
			return _numerator;
		}
		
		public function get denominator():int
		{
			return _denominator;
		}
		
		public function get top():int
		{
			return _top;
		}
		
		public function set top(value:int):void
		{
			_top = value;
		}
		
		
		
		public function get activityTitle():String
		{
			return _activityTitle;
		}
		
		public function set activityTitle(value:String):void
		{
			_activityTitle = value;
		}
		
		/**主面板类型*/
		public function get mainPanelType():int
		{
			return _mainPanelType;
		}
		
		/**
		 * @private
		 */
		public function set mainPanelType(value:int):void
		{
			_mainPanelType = value;
		}
		
		/**子面板类型*/
		public function get childPanelType():int
		{
			return _childPanelType;
		}
		
		/**
		 * @private
		 */
		public function set childPanelType(value:int):void
		{
			_childPanelType = value;
		}
		
		
		
		/**活动标签名字*/
		public function get activityTabName():String
		{
			return _activityTabName;
		}
		
		/**活动分组*/
		public function get activityGroupType():int
		{
			return _activityGroupType;
		}
		
		public function get rewardTimes():int
		{
			return _rewardTimes;
		}
		
		public function get repeatTimes():int
		{
			return _repeatTimes;
		}
		
		public function get isend():Boolean
		{
			return _isend;
		}
		
		/**活动标签小图标资源名*/
		public function get activityImgName():String
		{
			return _activityImgName;
		}
		
		/**
		 *主要用来判断逻辑和面板展示无关 
		 * @return 
		 * 
		 */		
		public function get activityType():int
		{
			return _activityType;
		}
		
		public function get exchange():String
		{
			return _exchange;
		}
		
		public function get activityReward():String
		{
			return _activityReward;
		}
		
		public function get other():String
		{
			return _other;
		}
	}
}