package com.rpgGame.app.manager.task
{
	import com.adobe.serialization.json.JSON;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.TaskMissionCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_mission_section;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.netData.task.bean.TaskInfo;
	import com.rpgGame.netData.task.bean.TaskSubRateInfo;
	
	import app.message.BoolArrayProto;
	
	import org.game.netCore.data.long;

	public class TaskMissionManager
	{
		/**最后完成主线任务id*/
		private static var _taskModelId: int;
		/**当天已经完成日常任务的次数*/
		private static var _dailyTaskTimes: int;
		/**当前主线任务服务器信息*/
		private static var _mainTaskInfo : TaskInfo;
		private static var _mainTaskData : Q_mission_base;
		//private static var _currentMainTaskIsfinish:Boolean
		
		/**当前支线任务服务器信息*/
		private static var _dailyTaskInfo : TaskInfo;
		private static var _dailyTaskData : Q_mission_base;
		/**当前环式任务服务器信息*/
		private static var _treasuerTaskInfo : TaskInfo;
		private static var _treasuerTaskData : Q_mission_base;
	
		/**当前环式任务客户端信息*/
		public static function get treasuerTaskData():Q_mission_base
		{
			return _treasuerTaskData;
		}
		
		/**
		 * @private
		 */
		public static function set treasuerTaskData(value:Q_mission_base):void
		{
			_treasuerTaskData = value;
		}

		
		/**当前支线任务客户端信息*/
		public static function get dailyTaskData():Q_mission_base
		{
			return _dailyTaskData;
		}

		/**
		 * @private
		 */
		public static function set dailyTaskData(value:Q_mission_base):void
		{
			_dailyTaskData = value;
		}

		/**当前主线任务配置信息*/
		public static function get mainTaskData():Q_mission_base
		{
			return _mainTaskData;
		}

		/**
		 * @private
		 */
		public static function set mainTaskData(value:Q_mission_base):void
		{
			_mainTaskData = value;
		}
		
		public static function setCurrentTaskInfo(value: Vector.<TaskInfo>) : void
		{
			if(value!=null&&value.length>0)
			{
				for each(var task:TaskInfo in value)
				{
					setTaskInfo(task);
				}
			}
			
		}
		
		public static function setTaskInfo(task:TaskInfo) : void
		{
			var taskData:Q_mission_base;
			if(task!=null)
			{
				taskData=TaskMissionCfgData.getTaskByID(task.taskModelId);
			}
			
			if(taskData!=null)
			{
				if(taskData.q_mission_mainType==TaskType.MAINTYPE_MAINTASK)
				{
					setMainTaskInfo(task,taskData);
				}
				else if(taskData.q_mission_mainType==TaskType.MAINTYPE_DAILYTASK)
				{
					//currentMainTaskInfo(task);
					setDailyTaskInfo(task,taskData);
					
				}
				else if(taskData.q_mission_mainType==TaskType.MAINTYPE_TREASUREBOX)
				{
					setTreasuerTaskInfo(task,taskData);
					
					//currentMainTaskInfo(task);
				}
			}
			
		}
		public static function removeTaskInfo(type:int) : void
		{
			
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				_mainTaskInfo=null;
				_mainTaskInfo=null;
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				_dailyTaskInfo=null;
				_dailyTaskInfo=null;
				
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				_treasuerTaskInfo=null;
				_treasuerTaskInfo=null;
			}
			
		}
		
		public static function getTaskInfoType(taskid:long) : int
		{
			if(mainTaskInfo!=null&&taskid.ToGID()==mainTaskInfo.taskId.ToGID())
			{
				return TaskType.MAINTYPE_MAINTASK;
			}
			else if(dailyTaskInfo!=null&&taskid.ToGID()==dailyTaskInfo.taskId.ToGID())
			{
				return TaskType.MAINTYPE_DAILYTASK;
			}
			else if(treasuerTaskInfo!=null&&taskid.ToGID()==treasuerTaskInfo.taskId.ToGID())
			{
				return TaskType.MAINTYPE_TREASUREBOX;
			}
			return 0;
			
		}
		
		/**
		 * 根据类型获取获寻路点
		 * 返回数组，0：地图id,1:x,2:y
		 * 
		 * */
		public static function getPathingByType(type:int,num:int):Array
		{
			var post:Array=new Array();
			var taskdata:Q_mission_base;
			if(type==TaskType.MAINTYPE_MAINTASK)
			{
				taskdata=mainTaskData;
			}
			else if(type==TaskType.MAINTYPE_DAILYTASK)
			{
				taskdata=dailyTaskData;
				
			}
			else if(type==TaskType.MAINTYPE_TREASUREBOX)
			{
				taskdata=treasuerTaskData;
			}
			
			if(taskdata!=null)
			{
				var path:String=taskdata.q_pathing;
				var pashArr:Array=path.split(";");
				if(pashArr.length>num)
				{
					path=pashArr[num];
					if(path!=null&&path!="")
					{
						pashArr=path.split(",");
						if(pashArr.length==3)
						{
							post.push(int(pashArr[0]));
							post.push(int(pashArr[1]));
							post.push(int(pashArr[2]));
							return post;
						}
					}
				}
				
			}
			
			
			return null;
		}
		
		/**判断主线任务是否完成*/
		public static function getMainTaskIsFinish():Boolean
		{
			return getTaskIsFinish(mainTaskInfo,mainTaskData);;
		}
		
		/**判断主线任务是否有回复npc*/
		public static function getMainTaskHaveNpc():Boolean
		{
			if(mainTaskData.q_finish_npc>0)
			{
				return true;
			}
			return false;
		}
		
		/**返回主线任务回复npc刷新表id*/
		public static function getMainTaskNpcAreaId():int
		{
			return mainTaskData.q_finish_npc;
			
		}
		/**返回主线任务回复npc模型id*/
		public static function getMainTaskNpcModeId():int
		{
			if(mainTaskData!=null)
			{
				return MonsterDataManager.getMonsterModeidByAreaid(mainTaskData.q_finish_npc);
			}
			return 0;
		}
		/**当前是否只有主线任务*/
		public static function get isOnlyDailyTask() :Boolean
		{
			if(_mainTaskInfo!=null&&_dailyTaskInfo==null&&_treasuerTaskInfo==null)
			{
				return true;
			}
			
			return false;
		}
		
		
		
		/**当前支线任务信息*/
		public static function get dailyTaskInfo() : TaskInfo
		{
			
			return _dailyTaskInfo;
		}
		
		/**当前是否有支线任务*/
		public static function get haveDailyTask() :Boolean
		{
			if(_dailyTaskInfo!=null)
			{
				return true;
			}
			return false;
		}
		
		/**设置支线任务信息*/
		public static function setDailyTaskInfo(value : TaskInfo,taskData:Q_mission_base) : void
		{
			_dailyTaskInfo = value;
			_dailyTaskData=taskData;
		}
		
		/**判断支线任务是否完成*/
		public static function getDailyTaskIsFinish():Boolean
		{
			
			return getTaskIsFinish(dailyTaskInfo,dailyTaskData);
		}
		
		/**判断任务是否完成*/
		public static function getTaskIsFinish(info:TaskInfo,data:Q_mission_base):Boolean
		{
			if(info!=null&&data!=null)
			{
				if(data.q_mission_type==TaskType.SUB_CONVERSATION)
				{
					return true;
				}
				else
				{
					
					var i:int,length:int;
					var information:String=data.q_finish_information_str;
					var informationList:Array=information.split(";");
					for(i=0;i<informationList.length;i++)
					{
						if(informationList[i]!=null&&informationList[i]!="")
						{
							if(!getTaskOneIsFinish(informationList[i],info.taskSubRateInfolist[i]))
							{
								return false;
							}
						}
						
					}
					return true;
					
				}
			}
			
			
			return false;
		}
		
		
		/**判断任务单个条件是否完成*/
		public static function getTaskOneIsFinish(info:String,sub:TaskSubRateInfo):Boolean
		{
			if(info!="")
			{
				var i:int;
				var text:String="";
				var modeid:int=0;
				var count:int=0,finish:int;
				var modeArr:Array=info.split(",");
				if(modeArr.length==2)
				{
					modeid=int(modeArr[0]);
					finish=int(modeArr[1]);
				}
				count=sub.num;
				/*for(i=0;i<sub.length;i++)
				{
					if(modeid==sub[i].modelId)
					{
						count=sub[i].num;
						break;
					}
				}*/
				if(count>=finish)
				{
					return true;
				}
			}
			
			return false;
		}
		
		
		
		/**当前环式任务信息*/
		public static function get treasuerTaskInfo() : TaskInfo
		{
			
			return _treasuerTaskInfo;
		}
		
		/**当前是否有环式任务*/
		public static function get haveTreasuerTask() :Boolean
		{
			if(_treasuerTaskInfo!=null)
			{
				return true;
			}
			return false;
		}
		
		/**设置环式任务信息*/
		public static function setTreasuerTaskInfo(value : TaskInfo,taskData:Q_mission_base) : void
		{

			_treasuerTaskInfo=value;
			_treasuerTaskData=taskData;
		}
		/**判断环式任务是否完成*/
		public static function getTreasuerTaskIsFinish():Boolean
		{
			return getTaskIsFinish(treasuerTaskInfo,treasuerTaskData);;
		}
		
		/**获取环式任务总环数*/
		public static function getTreasuerAllNum():int
		{
			var exId:String=treasuerTaskInfo.loopRewardId;
			var taskSection:Q_mission_section=TaskMissionCfgData.getSectionByID(exId);
			if(taskSection!=null)
			{
				var rewards:String=taskSection.q_mission_randomid;
				var reObj:Object=JSONUtil.decode(rewards);
				var reArr:Array=reObj as Array;
				return reArr.length;
				
			}
			return 0;
		}
		
		/**获取环式任务奖励信息*/
		public static function getTreasuerTaskReward():Array
		{
			var exId:String=treasuerTaskInfo.loopRewardId;
			var taskSection:Q_mission_section=TaskMissionCfgData.getSectionByID(exId);
			if(taskSection!=null)
			{
				var rewards:String=taskSection.q_single_reward;
				var reObj:Object=JSONUtil.decode(rewards);
				var reArr:Array=reObj as Array;
				return reArr;
				
			}
			return null;
		}
		/**获取环式任务额外奖励信息ID*/
		public static function getTreasuerTaskExtraReward():Object
		{
			var exId:String=treasuerTaskInfo.loopRewardId;
			var nowTrea:int=treasuerTaskInfo.loopNumber;//当前环数
			var taskSection:Q_mission_section=TaskMissionCfgData.getSectionByID(exId);
			if(taskSection!=null)
			{
				var rewards:String=taskSection.q_sec_rewards;
				var reObj:Object=JSONUtil.decode(rewards);
				var reArr:Array=reObj as Array;
				var i:int;
				for(i=0;i<reArr.length;i++)
				{
					if(reArr[i].l>=nowTrea)
					{
						return reArr[i];
					}
				}
				
			}
			return null;
		}
		
		/**获取环式任务额外奖励信息ID*/
		public static function getTreasuerTaskFinishStr():String
		{
			var exId:String=treasuerTaskInfo.loopRewardId;
			var nowTrea:int=treasuerTaskInfo.loopNumber;//当前环数
			var taskSection:Q_mission_section=TaskMissionCfgData.getSectionByID(exId);
			if(taskSection!=null)
			{
				var rewards:String=taskSection.q_sec_rewards;
				var reObj:Object=JSONUtil.decode(rewards);
				var reArr:Array=reObj as Array;
				var i:int;
				for(i=0;i<reArr.length;i++)
				{
					if(reArr[i].l>=nowTrea)
					{
						return reArr[i];
					}
				}
				
			}
			return "";
		}
		
		/**根据下标获取环式任务怪物ID*/
		public static function getTreasuerMonsterId(num:int):int
		{
			if(treasuerTaskInfo!=null&&treasuerTaskInfo.taskSubRateInfolist!=null&&treasuerTaskInfo.taskSubRateInfolist.length>num)
			{
				var sub:TaskSubRateInfo=treasuerTaskInfo.taskSubRateInfolist[num];
				if(sub!=null)
				{
					return sub.modelId;
				}
			}
			return 0;
		}
		
		
		
		
		
		/**当前主线任务信息*/
		public static function get mainTaskInfo() : TaskInfo
		{
			return _mainTaskInfo;
		}

		/**
		 * 设置当前任务信息
		 */
		public static function setMainTaskInfo(value : TaskInfo,taskData:Q_mission_base) : void
		{
			if (_mainTaskInfo&&value&&_mainTaskInfo.taskId != value.taskId)
			{
				//currentMainTaskIsfinish=false;
			}
			_mainTaskInfo = value;
			_mainTaskData=taskData;
		}
		
		
		
		/**
		 * 检测npc是否是主线任务回复npc
		 * @param id
		 * @return
		 *
		 */
		public static function checkHasReplyNpcInStoryTask(npcId : int) : Boolean
		{
			if (_mainTaskData)
			{
				if (getMainTaskNpcModeId() == npcId)
				{
					return true;
				}
			}
			return false;
		}
		
		
		
		
		
		/**最后完成主线任务id*/
		public static function get taskModelId():int
		{
			return _taskModelId;
		}
		/**最后完成主线任务id*/
		public static function set taskModelId(value:int):void
		{
			_taskModelId = value;
		}
		
		/**当天已经完成日常任务的次数*/
		public static function get dailyTaskTimes():int
		{
			return _dailyTaskTimes;
		}
		/**当天已经完成日常任务的次数*/
		public static function set dailyTaskTimes(value:int):void
		{
			_dailyTaskTimes = value;
		}
		
		public function TaskMissionManager()
		{
		}
	}
}