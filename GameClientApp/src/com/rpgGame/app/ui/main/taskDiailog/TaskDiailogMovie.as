package com.rpgGame.app.ui.main.taskDiailog
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.taskDiailog.TaskDiailogMovieSkin;

	/**
	 * 电影模式
	 * @author luguozheng
	 * 
	 */	
	public class TaskDiailogMovie extends SkinUI
	{
		
		private var _taskSkin:TaskDiailogMovieSkin;
		
		public function TaskDiailogMovie()
		{
			_taskSkin = new TaskDiailogMovieSkin();
			super(_taskSkin)
		}
	}
}