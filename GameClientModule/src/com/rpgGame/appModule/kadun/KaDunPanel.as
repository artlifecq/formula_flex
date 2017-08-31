package com.rpgGame.appModule.kadun
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.kadun.KaDun_Skin;
	
	/**
	 *卡顿解决面板
	 * @author dik
	 * 2017
	 */
	public class KaDunPanel extends SkinUIPanel
	{
		private var _skin:KaDun_Skin;
		
		public function KaDunPanel()
		{
			_skin=new KaDun_Skin();
			super(_skin);
		}
	}
}