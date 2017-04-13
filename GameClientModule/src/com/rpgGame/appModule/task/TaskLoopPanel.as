package com.rpgGame.appModule.task
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.mainui.renwu.Huanshi_Renwu;

	public class TaskLoopPanel  extends SkinUIPanel
	{
		protected var _skin :Huanshi_Renwu;
		public function TaskLoopPanel()
		{
			_skin=new Huanshi_Renwu();
			super(_skin);
		}
	}
}