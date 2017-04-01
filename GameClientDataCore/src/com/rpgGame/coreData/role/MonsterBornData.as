package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	
	import flash.geom.Point;

	/**
	 *
	 * 场景怪物出生数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class MonsterBornData extends BaseEntityData
	{
		public var monsterType : int;
		public var level : int;
		/**
		 * 在小地图的显示方式，0：全部显示；1：全部不显示；2、只显示图标，不显示名字；3、只显示名字，不显示图标。
		 */
		public var showInSmallMapType : int;
		public var smallMapIcon : String;

		public function MonsterBornData()
		{
		}

		public function setProtocData(data : Q_monster) : void
		{
			this.id = data.q_id;
			this.name = data.q_name;
			this.monsterType = data.q_monster_type;
			this.showInSmallMapType = data.q_isminimap;
//			this.level = data.q_grade;
			var monsterPos : Point = MonsterDataManager.getMonsterPositionByCfgID(data.q_id);
			this.x = monsterPos.x;
			this.y = monsterPos.y;
			this.smallMapIcon = data.q_head;
		}
	}
}
