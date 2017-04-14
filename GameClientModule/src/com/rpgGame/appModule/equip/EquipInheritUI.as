package com.rpgGame.appModule.equip
{
	import com.rpgGame.appModule.common.ViewUI;
	
	import org.mokylin.skin.app.zhuangbei.jicheng.Jicheng_Skin;
	
	/**
	 *装备继承
	 *@author dik
	 *2017-4-11下午7:56:56
	 */
	public class EquipInheritUI extends ViewUI
	{
		private var _skin:Jicheng_Skin;
		
		public function EquipInheritUI()
		{
			_skin=new Jicheng_Skin();
			super(_skin);
		}
	}
}