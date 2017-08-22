package com.rpgGame.appModule.huanying
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import org.mokylin.skin.app.huanying.HuanYing_Skin;
	import com.game.engine3D.display.InterObject3D;
	
	/**
	 *欢迎界面 
	 * @author dik
	 * 
	 */
	public class WelcomePanel extends SkinUIPanel
	{
		private var _skin:HuanYing_Skin;
		private var eft:InterObject3D;
		public function WelcomePanel()
		{
			_skin=new HuanYing_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			eft=this.playInter3DAt(ClientConfig.getEffect("ui_jixurenwu"),_skin.closeBtn.x+_skin.closeBtn.width/2,_skin.closeBtn.y+_skin.closeBtn.height/2,0);		
		}
		
		override public function hide():void
		{
			super.hide();
			eft.stop();
			eft.dispose();
			eft=null;
		}
	}
}