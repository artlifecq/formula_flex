package com.rpgGame.coreData.cfg.task
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_mission_reword;
	import com.rpgGame.coreData.clientConfig.Q_mission_section;
	import com.rpgGame.coreData.clientConfig.Q_mission_segment;
	import com.rpgGame.coreData.clientConfig.Q_suggest;
	import com.rpgGame.coreData.enum.JobEnum;
	
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
		private static var _sectionDic : Dictionary = new Dictionary();
		private static var _suggestVec :Vector.<Q_suggest>=new Vector.<Q_suggest>();
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
		/**环式任务表*/
		public static function setupSection(data : ByteArray) : void {
			var arr : Array = data.readObject();
			
			for each(var info :Q_mission_section in arr) {
				_sectionDic[info.q_mission_lvsec] = info;
			}
		}
		/**挂机点表*/
		public static function setupSuggest(data : ByteArray) : void {
			var arr : Array = data.readObject();
			for each(var info :Q_suggest in arr) {
				_suggestVec.push(info);
			}
		}
		
		/**根据等级获取挂机数据*/
		public static function getSuggestByLevel(level: int) : Q_suggest 
		{
			var sug:Q_suggest;
			for each(var info :Q_suggest in _suggestVec) {
				if(level>=info.q_level)
				{
					if(!sug)
					{
						sug=info;
					}
					else if(sug.q_level<info.q_level)
					{
						sug=info;
					}
				}
			}
			return sug;
		}
		/**根据等级获取挂机点*/
		public static function getSuggestPotByLevel(level: int) : Array
		{
			var sug:Q_suggest;
			for each(var info :Q_suggest in _suggestVec) {
				if(level>=info.q_level)
				{
					if(!sug)
					{
						sug=info;
					}
					else if(sug.q_level<info.q_level)
					{
						sug=info;
					}
				}
			}
			return [sug.q_map_id,sug.q_move_x,sug.q_move_y];
		}
		
		/**根据任务ID获取任务信息*/
		public static function getTaskByID(id : uint) : Q_mission_base 
		{
			return _dataDic[id];
		}
		
		
		/**获取完成任务的条件文字，已经替换好了名字*/
		public static function getTaskDescribe(type:int,describe:String,modeid:int) :String 
		{
			var mosterName:String;
			if(type==1||type==2||type==3||type==4)
			{
				mosterName=MonsterDataManager.getMonsterName(modeid);
			}
			else if(type==5)
			{
				mosterName=ItemConfig.getItemName(modeid);
			}
					
			return substitute(describe,mosterName);
			
			
		}
		/**根据任务ID获取奖励物品列表*/
		public static function getRewordById(id : int,job:int) :Array 
		{
			/*var task:Q_mission_base=getTaskByID(id);
			var reword:Q_mission_reword;
			if(task!=null)
			{
				reword=getRewordByID(task.q_reword_id);
			}*/
			
			var reword:Q_mission_reword=getRewordByID(id);
			if(reword!=null)
			{
				var reObj:Array;
				var reo:Object;
				if(job==JobEnum.ROLE_1_TYPE&&reword.q_reward!="")
				{
					reo=JSONUtil.decode(reword.q_reward);
					if(reo!=null)
					{
						reObj=reo as Array;
						return reObj;
					}
				}
				else if((job==JobEnum.ROLE_2_TYPE||job==JobEnum.ROLE_3_TYPE)&&reword.q_reward_2!="")
				{
					reo=JSONUtil.decode(reword.q_reward_2);
					if(reo!=null)
					{
						reObj=reo as Array;
						return reObj;
					}
				}
				else if(job==JobEnum.ROLE_4_TYPE&&reword.q_reward_1!="")
				{
					reo=JSONUtil.decode(reword.q_reward_1);
					if(reo!=null)
					{
						reObj=reo as Array;
						return reObj;
					}
				}
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
		
		
		/**根据ID获取任务奖励信息*/
		public static function getSectionByID(id :String) : Q_mission_section 
		{
			return _sectionDic[id];
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