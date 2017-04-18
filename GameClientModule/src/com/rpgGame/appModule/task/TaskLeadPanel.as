package com.rpgGame.appModule.task
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import org.mokylin.skin.mainui.renwu.Zhuxian_Renwu;
	
	public class TaskLeadPanel  extends SkinUIPanel
	{
		protected var _skin :Zhuxian_Renwu;
		public function TaskLeadPanel()
		{
			_skin=new Zhuxian_Renwu();
			super(_skin);
			init()
		}
		private function init():void
		{
			
		}
	}
}