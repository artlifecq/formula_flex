package com.rpgGame.appModule.dungeon.lunjian
{
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.common.PageContainerUI;
	import com.rpgGame.appModule.common.ViewUI;
	import com.rpgGame.appModule.dungeon.lunjian.LunJianItemData;
	import com.rpgGame.appModule.dungeon.lunjian.LunJianItemRender;
	import com.rpgGame.appModule.dungeon.lunjian.NpcMapItemData;
	import com.rpgGame.appModule.dungeon.lunjian.NpcMapItemRender;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.netData.lunjian.bean.LunJianInfo;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.jianghu.lunjian.LunJian_Skin;
	
	import starling.display.DisplayObject;
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
		private var pageContainer:PageContainerUI;
		
		public function LunJianUI()
		{
			_skin=new LunJian_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.list_map.itemRendererType = NpcMapItemRender;
			pageContainer=new PageContainerUI(3,_skin.btnP,_skin.btnN);
			pageContainer.itemRendererType=LunJianItemRender;
			pageContainer.x=_skin.list_map.x+_skin.list_map.width+5;
			pageContainer.y=_skin.list_map.y;
			
			var index:int=_skin.container.getChildIndex(_skin.btnP);
			_skin.container.addChildAt(pageContainer,index);
			
			npcDatas=new ListCollection();
			diffMap=new  HashMap(); 
			pageContainer.dataProvider=npcDatas;
			
			var mapIds:Array=LunJianCfg.mapDatas;
			mapIds=mapIds.sort(sortMaps);
			
			var num:int=mapIds.length;
			var mapList:Array=[];
			for(var i:int=0;i<num;i++){
				var info:NpcMapItemData=new NpcMapItemData();
				info.sceneData=mapIds[i];
				info.leftNum=0;
				mapList.push(info);
			}
			
			mapDatas=new ListCollection(mapList);
			_skin.list_map.dataProvider=mapDatas;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
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
				diffMap.add(datas[i].type,datas[i].difficut);
			}
			
			updateMapData();
			updateNpcdata();
		}
		
		private function updateMapData():void
		{
			var datas:Array=mapDatas.data as Array;
			var num:int=datas.length;
			for(var i:int=0;i<num;i++){
				var info:NpcMapItemData=datas[i];
				info.leftNum=getLeftNum(info.sceneData);
			}
			_skin.list_map.selectedIndex=0;
			_skin.list_map.dataProvider.updateItemAt(0);
		}
		
		private function getLeftNum(sceneData:SceneData):int
		{
			var list:Vector.<Q_lunjian>=LunJianCfg.getCfgByMapId(sceneData.sceneId);
			var num:int=list.length;
			var leftNum:int=0;
			var diff:int;
			for(var i:int=0;i<num;i++){
				diff=diffMap.getValue(list[i].q_type); 
				leftNum+=(3-diff);
			}
			return leftNum;
		}
		
		private function updateNpcdata():void
		{
			var selected:NpcMapItemData=_skin.list_map.selectedItem as NpcMapItemData;			
			if(!selected){
				return ;
			}
			npcDatas.removeAll();
			var list:Vector.<Q_lunjian>=LunJianCfg.getCfgByMapId(selected.sceneData.sceneId);
			list=list.sort(sortLunjian);
			var num:int=list.length;
			for(var i:int=0;i<num;i++){
				var data:LunJianItemData=new LunJianItemData();
				data.diff=diffMap.getValue(list[i].q_type);
				if(data.diff<3){
					data.cfg=LunJianCfg.getCfgByInfo(selected.sceneData.sceneId,list[i].q_type,data.diff+1);
				}else{
					data.cfg=list[i];
				}
				npcDatas.addItem(data);
			}
			npcDatas.updateAll();
			pageContainer.currentPage=1;
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(DungeonEvent.UPDATE_LUNJIAN_PANEL,onGetLunJianDatas);
			_skin.list_map.removeEventListener(Event.CHANGE,onChangeSelectedMap);
		}			
	}
}