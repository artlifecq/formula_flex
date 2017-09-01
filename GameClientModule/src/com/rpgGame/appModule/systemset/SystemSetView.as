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
//			bindDate(_skin.chk_yinyue,SystemSetManager.SYSTEMSET_SOUND);
//			bindDate(_skin.chk_yinxiao,SystemSetManager.SYSTEMSET_SOUNDEFFECT);
			bindDate(_skin.chk_huanyingxiaoguo,SystemSetManager.SYSTEMSET_HUANYING);
			bindDate(_skin.chk_hunhetongdao,SystemSetManager.SYSTEMSET_HUNHE);
			bindDate(_skin.chk_zengqiangxiaoguo,SystemSetManager.SYSTEMSET_ZENGQIANG);
			bindDate(_skin.chk_niuquxiaoguo,SystemSetManager.SYSTEMSET_NIUQU);
			bindDate(_skin.chk_faguangxiaoguo,SystemSetManager.SYSTEMSET_FAGUANG);
			bindDate(_skin.chk_yinyingpinzhi,SystemSetManager.SYSTEMSET_YINYING);
//			bindSliderAndInput(_skin.sld_xuanranbeishu,null,SystemSetManager.SYSTEMSET_XUANRAN);
//			bindSliderAndInput(_skin.sld_kangjuchi,null,SystemSetManager.SYSTEMSET_JUCHI);
//			bindSliderAndInput(_skin.sld_dengji,null,SystemSetManager.SYSTEMSET_XIANSHIDENGJI);
		}
		
		
	}
}