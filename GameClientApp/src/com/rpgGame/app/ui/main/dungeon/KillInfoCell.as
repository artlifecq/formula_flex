package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	
	import feathers.core.FeathersControl;
	
	import org.mokylin.skin.mainui.renwu.Renwu_Item2;
	
	public class KillInfoCell extends FeathersControl
	{
		private var _skin:Renwu_Item2;
		private var _list:HashMap;
		public function KillInfoCell():void
		{
			super();
		}
		override protected function initialize():void
		{
			_skin = new Renwu_Item2();
			_skin.toSprite(this);
			this.setSize(_skin.width,_skin.height);
			_list = new HashMap();
		}
		
		
		public function updateValue(id:int,value:int):void
		{
			_list.put(id,value);
			var total:int = 0;
			var valus:Array = _list.values();
			for each(var count:int in valus)
			{
				total += count;
			}
			currentCount = total;
		}
		private var _qdailyZoneData:Q_dailyzone_monster;
		private var _monsterCfg:Q_monster;
		public function get qdailyZoneData():Q_dailyzone_monster
		{
			return _qdailyZoneData;
		}

		public function set qdailyZoneData(value:Q_dailyzone_monster):void
		{
			if(_qdailyZoneData == value)
				return 
			_qdailyZoneData = value;
			_monsterCfg = null;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}

		private var _currentCount:int;

		public function get currentCount():int
		{
			return _currentCount;
		}

		public function set currentCount(value:int):void
		{
			if(_currentCount == value)
				return ;
			_currentCount = value;
			this.invalidate(INVALIDATION_FLAG_DATA);
		}

		
		override protected function draw():void
		{
			super.draw();
			if(this.isInvalid(INVALIDATION_FLAG_DATA))
			{
				if(_monsterCfg==null)
					_monsterCfg = MonsterDataManager.getData(_qdailyZoneData.q_monsterId);
				_skin.labelDisplay.htmlText="击杀:"+_monsterCfg.q_name+"("+_currentCount+"/"+_qdailyZoneData.q_monsterNum+")";
				if(_currentCount>=_qdailyZoneData.q_monsterNum)
				{
					_skin.labelDisplay.color = 0x8b8d7b;
				}else if(_monsterCfg.q_monster_type ==3){
					_skin.labelDisplay.color = 0xff4500;
				}else{
					_skin.labelDisplay.color = 0x6bcc08;
				}
			}
		}

	}
}