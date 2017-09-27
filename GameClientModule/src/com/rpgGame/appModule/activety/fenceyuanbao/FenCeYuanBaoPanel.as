package com.rpgGame.appModule.activety.fenceyuanbao
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.fengcehuodong.FengCe_YuanBao;
	
	public class FenCeYuanBaoPanel extends SkinUIPanel
	{
		private var _skin:FengCe_YuanBao;
		public function FenCeYuanBaoPanel()
		{
			_skin=new FengCe_YuanBao();
			super(_skin);
		}
	}
}