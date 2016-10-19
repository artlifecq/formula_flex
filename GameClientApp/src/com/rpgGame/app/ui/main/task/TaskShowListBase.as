package com.rpgGame.app.ui.main.task
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.mainui.task.TaskShowListSkin;
	
	import starling.display.DisplayObject;
	
	public class TaskShowListBase extends SkinUI
	{
		private var _taskSkin:TaskShowListSkin;
		
		private var _isShowTask:Boolean;
		
		public function TaskShowListBase()
		{
			_taskSkin = new TaskShowListSkin();
			super(_taskSkin);
			
			isShowTask = true; 
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			switch( target )
			{
/*				case _taskSkin.btnBig:
					isShowTask = true;
					break;
				
				case _taskSkin.btnSamll:
					isShowTask = false;
					break;*/
				
			}
			
		}

		public function get isShowTask():Boolean
		{
			return _isShowTask;
		}

		public function set isShowTask(value:Boolean):void
		{
			_isShowTask = value;
			
/*			_taskSkin.btnBig.visible = !_isShowTask;
			_taskSkin.btnSamll.visible = _isShowTask;*/
//			_taskSkin.imgBg.visible = _isShowTask;
		}
		
		
		
		
		
		
		
		
		
	}
}