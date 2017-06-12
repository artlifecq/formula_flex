package com.rpgGame.appModule.activety.boss
{
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.activety.shijieboss.ShangHai_Item;
	
	/**
	 *伤害渲染元素 
	 * @author dik
	 * 
	 */
	public class BossHurtItemRender extends DefaultListItemRenderer
	{
		private var _skin:ShangHai_Item
		
		public function BossHurtItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new ShangHai_Item();
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
		
		override protected function commitData():void
		{
			
		}
	}
}