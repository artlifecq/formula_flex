package com.rpgGame.appModule.dungeon
{
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.dungeon.sword.NpcMapItemRender;
	import com.rpgGame.appModule.dungeon.sword.SwordItemRender;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_Skin;
	
	/**
	 *
	 *@author dik
	 *2017-5-3上午11:56:28
	 */
	public class SwordUI extends ViewUI
	{
		private var _skin:LunJian_Skin; 
		
		public function SwordUI()
		{
			_skin=new LunJian_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.list_map.itemRendererType = NpcMapItemRender;
			_skin.list_map.clipContent = true;
			_skin.list_npc.itemRendererType = SwordItemRender;
			_skin.list_npc.clipContent = true;
			_skin.list_npc.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			
			_skin.list_map.dataProvider=new ListCollection([1,2,3,4,5,6]);
			_skin.list_npc.dataProvider=new ListCollection([1,2,3,4,5,6]);			
		}
	}
}