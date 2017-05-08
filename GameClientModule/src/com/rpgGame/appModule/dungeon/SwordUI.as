package com.rpgGame.appModule.dungeon
{
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.dungeon.sword.NpcMapItemRender;
	import com.rpgGame.appModule.dungeon.sword.SwordItemData;
	import com.rpgGame.appModule.dungeon.sword.SwordItemRender;
	import com.rpgGame.coreData.cfg.SwordCfg;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.info.map.SceneData;
	
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

		private var npcDatas:ListCollection;
		
		public function SwordUI()
		{
			_skin=new LunJian_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.list_map.itemRendererType = NpcMapItemRender;
//			_skin.list_map.clipContent = true;
			_skin.list_npc.itemRendererType = SwordItemRender;
//			_skin.list_npc.clipContent = true;
			_skin.list_npc.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			var datas:Array=SwordCfg.mapDatas;
			datas=datas.sort(sortMaps);
			_skin.list_map.dataProvider=new ListCollection(datas);
			npcDatas=new ListCollection();
			_skin.list_npc.dataProvider=npcDatas;
			_skin.list_map.selectedIndex=0;
			updateNpcdata();
		}
		
		private function sortMaps(dataA:SceneData,dataB:SceneData):int
		{
			if(dataA.requiredLevel<dataB.requiredLevel){
				return -1;
			}else if(dataA.requiredLevel>dataB.requiredLevel){
				return 1;
			}
			return 0;
		}
		
		private function updateNpcdata():void
		{
			var selected:SceneData=_skin.list_map.selectedItem as SceneData;
			if(!selected){
				return ;
			}
			npcDatas.removeAll();
			var list:Vector.<Q_lunjian>=SwordCfg.getCfgByMapId(selected.sceneId);
			list=list.sort(sortLunjian);
			var num:int=list.length;
			for(var i:int=0;i<num;i++){
				var data:SwordItemData=new SwordItemData();
				data.basicCfg=list[i];
				npcDatas.addItem(data);
			}
			npcDatas.updateAll();
		}
		
		private function sortLunjian(dataA:Q_lunjian,dataB:Q_lunjian):int
		{
			if(dataA.q_level<dataB.q_level){
				return -1;
			}else if(dataA.q_level>dataB.q_level){
				return 1;
			}
			return 0;
		}
	}
}