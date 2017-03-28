package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.systemSet.pingbiset_Skin;
	
	public class HideSetView extends BasePaneView
	{
		public function HideSetView(content:SkinnableContainer)
		{
			super(content);
		}
		private var _skin:pingbiset_Skin;
		override public function refeashView():void
		{
			super.refeashView();
			_skin = this._content.skin as pingbiset_Skin;
			bindDate(_skin.chk_zidong,SystemSetManager.SYSTEMSET_AUOT_OPTIMIZATION);
			bindDate(_skin.chk_hideOther,SystemSetManager.SYSTEMSET_HIDE_PLAYERS);
			bindDate(_skin.chk_hideBoss,SystemSetManager.SYSTEMSET_HIDE_GANG_ENEMYS);
			bindDate(_skin.chk_hideBanghui,SystemSetManager.SYSTEMSET_HIDE_GANG_PLAYERS);
			bindDate(_skin.chk_hideShanghai,SystemSetManager.SYSTEMSET_HIDE_DAMAGE_NUMBER);
			bindDate(_skin.chk_hideOtherEffect,SystemSetManager.SYSTEMSET_HIDE_OTHER_SPELL_EFFECTS);
			bindDate(_skin.chk_hideAllEffect,SystemSetManager.SYSTEMSET_HIDE_SPELL_EFFECTS);
			bindDate(_skin.chk_hideChangjing,SystemSetManager.SYSTEMSET_HIDE_EFFECTS);
			bindDate(_skin.chk_hideYinying,SystemSetManager.SYSTEMSET_HIDE_SHADOW_EFFECTS);
			bindDate(_skin.chk_hideTianqi,SystemSetManager.SYSTEMSET_HIDE_WEATHER_EFFECTS);
			bindDate(_skin.chk_hideZhendong,SystemSetManager.SYSTEMSET_HIDE_SCREEN_SHOCK);
			bindDate(_skin.chk_hideShanping,SystemSetManager.SYSTEMSET_HIDE_SWTSITL);
		}
	}
}