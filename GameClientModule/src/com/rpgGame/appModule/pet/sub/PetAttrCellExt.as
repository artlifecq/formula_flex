package com.rpgGame.appModule.pet.sub
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.meiren.MeiRen_Item;
	
	public class PetAttrCellExt extends SkinUI
	{
		private var _skin:MeiRen_Item;
		private var _diff:int;
		public function PetAttrCellExt()
		{
			_skin=new MeiRen_Item();
			super(_skin);
		}
		public function setData(attrType:int,attrValue:int,attrNext:int):void
		{
			_diff=attrNext-attrValue;
			_skin.lbNum.text=attrValue+"";
			if (_diff>0) 
			{
				_skin.uiUp.styleName="ui/common/tubiao/jobup.png";
				_skin.lbAdd.color=GameColorUtil.COLOR_GREEN;
				_skin.lbAdd.text=_diff.toString();
				
			}
			else if (_diff<0) 
			{
				_skin.uiUp.styleName="ui/common/tubiao/jobdown.png";
				_skin.lbAdd.color=GameColorUtil.COLOR_RED;
				_skin.lbAdd.text=_diff.toString();
			}
			_skin.uiName.styleName=CharAttributeType.getAttrNameUrl(attrType);
			_skin.uiUp.visible=false;
			_skin.lbAdd.visible=false;
		}
		public function showAdd(bool:Boolean):void
		{
			if (_diff==0) 
			{
				return;
			}
			_skin.uiUp.visible=bool;
			_skin.lbAdd.visible=bool;
		}
	}
}