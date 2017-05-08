package com.rpgGame.appModule.dungeon
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.dungeon.lunjian.LunJianItemData;
	import com.rpgGame.appModule.dungeon.lunjian.LunJianItemRender;
	import com.rpgGame.appModule.dungeon.lunjian.NpcMapItemRender;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.netData.map.bean.LunJianInfo;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_Skin;
	
	import starling.events.Event;
	
	/**
	 *
	 *@author dik
	 *2017-5-3上午11:56:28
	 */
	public class LunJianUI extends ViewUI
	{
		private var _skin:LunJian_Skin; 

		private var npcDatas:ListCollection;
		private var diffMap:HashMap;
		private var mapDatas:ListCollection;

		private var mapIds:Array;
		
		public function LunJianUI()
		{
			_skin=new LunJian_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.list_map.itemRendererType = NpcMapItemRender;
//			_skin.list_map.clipContent = true;
			_skin.list_npc.itemRendererType = LunJianItemRender;
//			_skin.list_npc.clipContent = true;
			_skin.list_npc.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			
			mapDatas=new ListCollection();
			_skin.list_map.dataProvider=mapDatas;
			npcDatas=new ListCollection();
			_skin.list_npc.dataProvider=npcDatas;
			diffMap=new  HashMap(); 
			
			mapIds=LunJianCfg.mapDatas;
			mapIds=mapIds.sort(sortMaps);
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
		
		private function sortLunjian(dataA:Q_lunjian,dataB:Q_lunjian):int
		{
			if(dataA.q_level<dataB.q_level){
				return -1;
			}else if(dataA.q_level>dataB.q_level){
				return 1;
			}
			return 0;
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			
			initEvent();
			DungeonSender.reqLunJianPanelInfos();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(DungeonEvent.UPDATE_LUNJIAN_PANEL,onGetLunJianDatas);
			_skin.list_map.addEventListener(Event.CHANGE,onChangeSelectedMap);
		}
		
		private function onChangeSelectedMap(e:Event):void
		{
			updateNpcdata();
		}
		
		private function onGetLunJianDatas(datas:Vector.<LunJianInfo>):void
		{
			var num:int=datas.length;
			for(var i:int=0;i<num;i++){
				diffMap.add(datas[i].ljId,datas[i].difficut);
			}
			
			_skin.list_map.selectedIndex=0;
			updateNpcdata();
			updateMapData();
		}
		
		private function updateMapData():void
		{
			
		}
		
		private function updateNpcdata():void
		{
			var selected:SceneData=_skin.list_map.selectedItem as SceneData;			
			if(!selected){
				return ;
			}
			npcDatas.removeAll();
			var list:Vector.<Q_lunjian>=LunJianCfg.getCfgByMapId(selected.sceneId);
			list=list.sort(sortLunjian);
			var num:int=list.length;
			for(var i:int=0;i<num;i++){
				var data:LunJianItemData=new LunJianItemData();
				data.cfg=list[i];
				data.diff=diffMap.getValue(list[i].q_id);
				npcDatas.addItem(data);
			}
			npcDatas.updateAll();
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(DungeonEvent.UPDATE_LUNJIAN_PANEL,onGetLunJianDatas);
			_skin.list_map.removeEventListener(Event.CHANGE,onChangeSelectedMap);
		}			
	}
}