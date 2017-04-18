package com.rpgGame.coreData.cfg.task
{
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_notify;
	
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
		
		public static function setup(data : ByteArray) : void {
			var arr : Array = data.readObject();
			
			for each(var info :Q_mission_base in arr) {
				_dataDic[info.q_mission_id] = info;
			}
			
		}
		/**根据任务ID获取任务信息*/
		public static function getTaskByID(id : uint) : Q_mission_base 
		{
			return _dataDic[id];
		}
		
		
		/**获取完成任务的条件文字，已经替换好了名字*/
		public static function getTaskDescribe(describe:String,mode:String) :String 
		{
			var str:String="";
			var modeArr:Array=mode.split(",");
			if(modeArr.length!=2)
			{
				return "";
			}
			var modeStr:int=(modeArr[0]);
			var mosterName:String=MonsterDataManager.getMonsterName(modeStr);
			
			
			str=substitute(describe,mosterName);
			
			
			return str;
			
			
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