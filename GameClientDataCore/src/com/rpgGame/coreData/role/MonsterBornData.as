package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;

	import flash.geom.Point;

	import app.message.MonsterDataProto;

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

		public function setProtocData(data : MonsterDataProto) : void
		{
			this.id = data.id;
			this.name = data.name;
			this.monsterType = data.monsterType;
			this.showInSmallMapType = data.showInSmallMapType;
			this.level = data.level;
			var monsterPos : Point = MonsterDataManager.getMonsterPosition(data);
			this.x = monsterPos.x;
			this.y = monsterPos.y;
			this.smallMapIcon = data.smallMapIcon;
		}
	}
}
