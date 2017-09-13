package com.rpgGame.appModule.pet
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.meiren.Meiren_Item2;
	
	public class MeirenAttItemView extends SkinUI
	{
		private var _skin:Meiren_Item2;
		public function MeirenAttItemView()
		{
			_skin=new Meiren_Item2();
			super(_skin);
			MCUtil.removeSelf(_skin.uiUp);
			MCUtil.removeSelf(_skin.lbAdd);
		}
		
		public function setDate(type:int,view:int):void
		{
			_skin.uiName.styleName=CharAttributeType.getAttrNameUrl(type);
			_skin.lbNum.text=view.toString();
		}
	}
}