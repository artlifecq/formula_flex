package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObjectContainer;

	public class TargetTrack
	{
		private var _content:DisplayObjectContainer;
		private var _dailyZoneId:int;
		private var _offx:int;
		private var _offy:int;
		private var _listCell:HashMap;
		private var _allList:Array;
		public function TargetTrack(content:DisplayObjectContainer,id:int,offx:int = 0,offy:int=0):void
		{
			_content = content;
			_dailyZoneId = id;
			_offx = offx;
			_offy = offy;
			initView();
		}
		private function initView():void
		{
			_allList = DailyZoneMonsterCfgData.getTypeList(_dailyZoneId);
			_listCell = new HashMap();
			var index:int = 0;
			for each(var md:Q_dailyzone_monster in _allList)
			{
				var cell:KillInfoCell = new KillInfoCell();
				cell.qdailyZoneData = md;
				_content.addChild(cell);
				cell.x = _offx;
				cell.y = _offy+20*index;
				index++;
				_listCell.add(md.q_id,cell);
			}
			EventManager.addEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
		}
		private function updateWaveInfoHandler(currentWaveId:int,killerCount:int):void
		{		
			var cell:KillInfoCell = _listCell.getValue(currentWaveId);
			if(cell==null)
				return ;
			cell.updateValue(currentWaveId,killerCount);
		}
		
		
		public function onHide():void
		{
			EventManager.removeEvent(DungeonEvent.UPDATA_WAVE_INFO,updateWaveInfoHandler);
			_listCell = null;
		}
	}
}