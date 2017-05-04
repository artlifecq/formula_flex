package com.rpgGame.appModule.dungeon.sword
{
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_NameItem;
	
	/**
	 *npc所在地图渲染器
	 *@author dik
	 *2017-5-2下午7:32:40
	 */
	public class NpcMapItemRender extends DefaultListItemRenderer
	{
		private var _skin:LunJian_NameItem;
		
		public function NpcMapItemRender()
		{
			super();
		}
		
		override public function get height():Number
		{
			if(_skin){
				return _skin.height;
			}
			return 0;
		}
			
		
		override protected function initialize():void
		{
			_skin=new LunJian_NameItem();
			_skin.toSprite(this);
		}
		
		override protected function commitData():void
		{
		}
	}
}