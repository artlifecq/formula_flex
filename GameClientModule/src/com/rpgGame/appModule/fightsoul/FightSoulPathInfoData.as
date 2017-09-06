package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_path;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;

	public class FightSoulPathInfoData
	{
		private var _path:Q_fightsoul_path;
		private var _newFunc:Q_newfunc;
		private var _count:int;
		public function FightSoulPathInfoData(path:Q_fightsoul_path):void
		{
			_path = path;
			_newFunc = NewFuncCfgData.getFuncCfg(path.q_arg);
			refeash();
		}
		
		public function get path():Q_fightsoul_path
		{
			return _path;
		}
		
		public function get newFunc():Q_newfunc
		{
			return _newFunc;
		}
		
		public function refeash():void
		{
			_count = FightSoulManager.instance().getActivityByType(_path.q_id);
		}
		
		public function isOpen():Boolean
		{
			if(path.q_type==2){
				if(path.q_id==1)
					return TaskMissionManager.haveTreasuerTask;
				if(path.q_id==2)
					return TaskMissionManager.haveGuildTask;
				else
					return false;
			}else{
				if(_newFunc){
					return FunctionOpenManager.functionIsOpen(_newFunc.q_id);
				}else{
					return false;
				}
			}
		}
		
		public function get count():int
		{
			return _count;
		}
		
		public function get isOver():Boolean
		{
			return _count==_path.q_total;
		}
	}
}