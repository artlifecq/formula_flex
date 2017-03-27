package com.rpgGame.appModule.systemset
{
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.systemSet.ListItem_Skin;
	
	public class ComboBoxItemList extends DefaultListItemRenderer
	{
		public function ComboBoxItemList():void
		{
			super();
			this.styleClass = ListItem_Skin;
		}
		override protected  function initialize():void
		{
			
		}
	}
}