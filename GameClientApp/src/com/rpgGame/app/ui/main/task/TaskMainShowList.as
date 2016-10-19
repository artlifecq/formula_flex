package com.rpgGame.app.ui.main.task
{
	public class TaskMainShowList extends TaskShowListBase
	{
		private var _taskList:TaskMainLineList;
		
		public function TaskMainShowList()
		{
			init();
		}
		
		private function init():void
		{
			_taskList = new TaskMainLineList();
			addChild( _taskList );
			
			_taskList.y = 0;
			_taskList.x = 0;
		}
	}
}