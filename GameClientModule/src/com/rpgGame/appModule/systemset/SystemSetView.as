package com.rpgGame.appModule.systemset
{
	import com.rpgGame.app.manager.SystemSetManager;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.systemSet.xitong_Skin;
	
	public class SystemSetView extends BasePaneView
	{
		public function SystemSetView(content:SkinnableContainer)
		{
			super(content);
		}
		private var _skin:xitong_Skin;
		override public function refeashView():void
		{
			super.refeashView();
			_skin = this._content.skin as xitong_Skin;
			bindDate(_skin.chk_yinyue,SystemSetManager.SYSTEMSET_SOUND);
			bindDate(_skin.chk_yinxiao,SystemSetManager.SYSTEMSET_SOUNDEFFECT);
			bindDate(_skin.chk_jujuehaoyou,SystemSetManager.SYSTEMSET_REFUSE_FRIENDS);
			bindDate(_skin.chk_jujuesiliao,SystemSetManager.SYSTEMSET_PRIVATE_CHAT);
			bindDate(_skin.chk_jujuezudui,SystemSetManager.SYSTEMSET_REFUSING_TEAM);
			bindDate(_skin.chk_jujuebanghui,SystemSetManager.SYSTEMSET_REFUSING_GANG);
			bindDate(_skin.chk_moren,SystemSetManager.SYSTEMSET_AUOT_OPTIMIZATION);
			bindSliderAndInput(_skin.sld_yinyue,_skin.lb_yinyue,SystemSetManager.SYSTEMSET_SOUND_BG);
			bindSliderAndInput(_skin.sld_yinxiao,_skin.lb_yinxiao,SystemSetManager.SYSTEMSET_SOUND_EFFECT);
		}
	}
}