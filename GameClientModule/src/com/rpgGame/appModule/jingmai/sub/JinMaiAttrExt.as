package com.rpgGame.appModule.jingmai.sub
{
	import com.rpgGame.core.interfaces.IAttrShow;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.type.CharAttributeType;
	
	import org.mokylin.skin.app.beibao.jingmai.Shuxing_Item;
	
	public class JinMaiAttrExt extends SkinUI implements IAttrShow
	{
		private var _skin:Shuxing_Item;
		public function JinMaiAttrExt()
		{
			_skin=new Shuxing_Item()
			super(_skin);
		}
		
		public function setData(attrType:int,attrValue:int):void
		{
			_skin.imgAttr.styleName=CharAttributeType.getAttrNameUrl(attrType);
			_skin.imgIco.styleName=CharAttributeType.getAttrIconUrl(attrType);
			_skin.labAttr.text=attrValue+"";
		}
	}
}