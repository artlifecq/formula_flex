package com.rpgGame.coreData.info.bazhentu
{
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	
	import app.message.MonsterDataProto.MonsterType;
	
	import org.game.netCore.net.ByteBuffer;

	public class BaZhenTuDungeonInfo
	{
		public function BaZhenTuDungeonInfo()
		{
		}
		public var playerID:int;
		public var name:String;
		public var reliveTime : int;
		public var killCount:int;
		public var killBossCount:int;
		public var killElite : int;
		/**
		 *
		 *  *      varint64 成员id
         *      utf 成员名字
         *
         *      varint32 复活次数
         *
         *      varint32 击杀怪物数量
         *      for(i->击杀怪物数量){
         *          varint32 怪物配置id
         *          varint32 击杀数量
         *      } 
		 * @param bytes
		 * 
		 */		
		public function setup(bytes:ByteBuffer):void
		{
			bytes.readVarint64();
			name = bytes.readUTF();
			reliveTime = bytes.readVarint32();
			killCount = 0;
			killBossCount = 0;
			killElite = 0;
			var killNum : int = bytes.readVarint32();
			for(var i : int = 0 ; i < killNum ; i ++)
			{
				var monsterId : int = bytes.readVarint32();
				var monsterNum : int = bytes.readVarint32();
				var monsterType : int = MonsterDataManager.getMonsterType(monsterId);
				switch(monsterType)
				{
					case MonsterType.NORMAL:
						killCount+=monsterNum;
						break;
					case MonsterType.ELITE:
						killElite+=monsterNum;
						break;
					case MonsterType.BOSS:
						killBossCount+=monsterNum;
				}
			}
		}
		
	}
}