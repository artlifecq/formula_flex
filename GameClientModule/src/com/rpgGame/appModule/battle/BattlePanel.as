package com.rpgGame.appModule.battle
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.zhanhun.Zhanhun_Skin;
	
	public class BattlePanel extends SkinUIPanel
	{
		private var _skin:Zhanhun_Skin;
		public function BattlePanel():void
		{
			_skin=new Zhanhun_Skin();
			super(_skin);
		}
	}
}