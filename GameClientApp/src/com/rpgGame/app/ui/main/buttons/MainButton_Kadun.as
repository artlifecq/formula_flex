package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	
	import org.mokylin.skin.app.kadun.button.ButtonJiejuekadun;

	/**
	 *卡顿按钮
	 * @author dik
	 * 2017
	 */
	public class MainButton_Kadun extends IconButton
	{
		public function MainButton_Kadun()
		{
			super();
			this.styleClass=ButtonJiejuekadun;
			this.width=this.height=75;
		}
		
		override protected function trigger():void
		{
			AppManager.showApp(AppConstant.KADUN_PANEL);
		}
	}
}