package com.rpgGame.app.manager.fightsoul
{
	import com.rpgGame.app.manager.RollManager;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.FightsoulData;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	import com.rpgGame.netData.fightsoul.bean.FightSoulInfo;
	import com.rpgGame.netData.fightsoul.bean.TypeValue;
	import com.rpgGame.netData.fightsoul.message.CSFightSoulLevelUpMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;

	public class FightSoulManager
	{
		public static const FightSoul_Level:int = UNIQUEID.NEXT;
		public static const FightSoul_Exp:int = UNIQUEID.NEXT;
		public static const FightSoul_Vitality:int = UNIQUEID.NEXT;
		public static const FightSoul_ModeLevel:int = UNIQUEID.NEXT;
		public static const FightSoul_TypeValue:int = UNIQUEID.NEXT;
		/**
		 * 战魂数据
		 */
		private var _fightSoulInfo: FightSoulInfo;
		public function get fightSoulInfo(): FightSoulInfo{
			return _fightSoulInfo;
		}
		public function set fightSoulInfo(value: FightSoulInfo): void{
			this._fightSoulInfo = value;
		}
		
		
		public function updata(level:int,exp:int):void
		{
			this._fightSoulInfo.level = level;
			this._fightSoulInfo.exp = exp;
			EventManager.dispatchEvent(FightSoul_Level);
			EventManager.dispatchEvent(FightSoul_Exp);
		}
		
		public function updataExp(exp:int,vitality: int):void
		{
			this.fightSoulInfo.exp = exp;
			this.fightSoulInfo.vitality = vitality;
			EventManager.dispatchEvent(FightSoul_Exp);
			EventManager.dispatchEvent(FightSoul_Vitality);
		}
		
		public function get  currentLeveldata():Q_fightsoul
		{
			return FightsoulData.getInfobyId(_fightSoulInfo.level);
		}
		
		public function updataCount(type:int,count:int):void
		{
			for each(var date:TypeValue in fightSoulInfo.values)
			{
				if(date.type == type)
				{
					date.count = count;
					break;
				}
			}
			EventManager.dispatchEvent(FightSoul_TypeValue);
		}
		
		public function updateMode(level:int):void
		{
			fightSoulInfo.curModelLv = level;
			EventManager.dispatchEvent(FightSoul_ModeLevel);
		}
		
		public function get currentMode():Q_fightsoul
		{
			return FightsoulData.getInfobyId(Math.max(_fightSoulInfo.curModelLv,1));
		}
		
		public function FightSoulLevelUp():void
		{
			SocketConnection.send(new CSFightSoulLevelUpMessage());
		}
		
		public function chageModeLevel(level:int):void
		{
			
		}
		
		public function getActivityByType(type:int):int
		{
			for each(var typevalue:TypeValue in fightSoulInfo.values)
			{
				if(typevalue.type == type)
					return typevalue.count;
			}
			return 0;
		}
		
		private static var _instance:FightSoulManager;
		public static function instance():FightSoulManager
		{
			if(_instance==null)
			{
				_instance = new FightSoulManager();
			}
			return _instance;
		}
	}
}