package com.rpgGame.appModule.dungeon.sword
{
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_TiaoZhanItem;
	
	/**
	 *论剑元素渲染器
	 *@author dik
	 *2017-5-2下午7:36:11
	 */
	public class SwordItemRender extends DefaultListItemRenderer
	{
		private var _skin:LunJian_TiaoZhanItem;
		
		public function SwordItemRender()
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin=new LunJian_TiaoZhanItem();
			_skin.toSprite(this);
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
		
		override protected function commitData():void
		{
			
		}
	}
}