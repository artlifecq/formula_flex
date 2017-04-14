package com.rpgGame.appModule.equip
{
	import com.rpgGame.appModule.common.ViewUI;
	
	import org.mokylin.skin.app.zhuangbei.hecheng.HeCheng_Skin;
	
	/**
	 *装备合成
	 *@author dik
	 *2017-4-11下午8:05:55
	 */
	public class EquipComboUI extends ViewUI
	{
		private var _skin:HeCheng_Skin;
		public function EquipComboUI()
		{
			_skin=new HeCheng_Skin();
			super(_skin);
		}
	}
}