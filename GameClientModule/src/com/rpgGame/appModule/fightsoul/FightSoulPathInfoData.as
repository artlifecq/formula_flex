package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
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
			_newFunc = NewFuncCfgData.getdataById(path.q_winId);
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
			_count = _path.q_total-FightSoulManager.instance().getActivityByType(_path.q_id);
		}
		
		public function isOpen():Boolean
		{
			return FunctionOpenManager.functionIsOpen(_newFunc.q_id.toString());
		}
		
		public function get count():int
		{
			return _count;
		}
		
		public function get isOver():Boolean
		{
			return _count<=0;
		}
	}
}