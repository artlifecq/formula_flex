package com.rpgGame.coreData.cfg.task
{
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_mission_reword;
	import com.rpgGame.coreData.clientConfig.Q_mission_segment;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	
	/**
	 * 客户端 任务列表数据
	 * @author yt
	 * 
	 */	
	public class TaskMissionCfgData
	{
		private static var _dataDic : Dictionary = new Dictionary();
		private static var _rewordDic : Dictionary = new Dictionary();
		private static var _segmentDic : Dictionary = new Dictionary();
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			
			for each(var info :Q_mission_base in arr) {
				_dataDic[info.q_mission_id] = info;
			}
			
		/*	var arr2 : Array = reword.readObject();
			
			for each(var rewordObj :Q_mission_reword in arr2) {
				_rewordDic[rewordObj.q_reward_id] = rewordObj;
			}*/
			
		}
		/**奖励配置表*/
		public static function setupReword(data : ByteArray) : void {
			var arr : Array = data.readObject();
			
			for each(var info :Q_mission_reword in arr) {
				_rewordDic[info.q_reward_id] = info;
			}
		}
		/**对话配置表*/
		public static function setupSegment(data : ByteArray) : void {
			var arr : Array = data.readObject();
			
			for each(var info :Q_mission_segment in arr) {
				_segmentDic[info.q_segment_id] = info;
			}
		}
		/**根据任务ID获取任务信息*/
		public static function getTaskByID(id : uint) : Q_mission_base 
		{
			return _dataDic[id];
		}
		
		
		/**获取完成任务的条件文字，已经替换好了名字*/
		public static function getTaskDescribe(describe:String,modeid:int) :String 
		{
			var mosterName:String=MonsterDataManager.getMonsterName(modeid);
					
			return substitute(describe,mosterName);
			
			
		}
		/**根据任务ID获取奖励物品列表*/
		public static function getRewordByTaskid(id : int) :Array 
		{
			var task:Q_mission_base=getTaskByID(id);
			var reword:Q_mission_reword;
			if(task!=null)
			{
				reword=getRewordByID(task.q_reword_id);
			}
			if(reword!=null&&reword.q_reward!="")
			{
				var reObj:Array;
				var reo:Object=JSON.parse(reword.q_reward);
				if(reo!=null)
				{
					reObj=reo as Array;
				}
				return reObj;
			}
			return null;
		}
		
		/**根据章节ID统计章节总数量*/
		public static function getPartyCountByPid(pid : int) : uint 
		{
			var count:int=0;
			for each(var task :Q_mission_base in _dataDic) {
				if(task.q_party_id==pid){
					count++;
				}
			}
			
			return count;	
		}
		
		/**根据ID获取奖励信息*/
		public static function getRewordByID(id : int) : Q_mission_reword 
		{
			return _rewordDic[id];
		}
		
		/**根据任务ID获取任务对话文字*/
		public static function getSegmentTxtByTaskid(id : int) :String 
		{
			var segment:Q_mission_segment;
			var task:Q_mission_base=getTaskByID(id);
			if(task!=null)
			{
				segment=getSegmentByID(task.q_deal_mission);
			}
			if(segment!=null)
			{
				return segment.q_npcTalk_information;
			}
			return "";
		}
		/**根据ID获取任务对话文字*/
		public static function getSegmentTxtById(id : String) :String 
		{
			var segment:Q_mission_segment=getSegmentByID(id);
			
			if(segment!=null)
			{
				return segment.q_npcTalk_information;
			}
			return "";
		}
		/**根据ID获取任务对话信息*/
		public static function getSegmentByID(id :String) : Q_mission_segment 
		{
			return _segmentDic[id];
		}
		
		
		
		/**字符串替换*/		
		private static function substitute(string:String, value:String="", start:String="{", end:String="}"):String  
		{  
			if (value == null) return string;  
			var pattern:RegExp=new RegExp(start + "(.*?)" + end, "g");  
			return string.replace(pattern, function():String  
			{  
				return value;  
			});  
			
		}
		public function TaskMissionCfgData()
		{
			
		}
		
	}
}