package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	
	import app.message.MonsterDataProto.MonsterType;
	
	import org.game.netCore.net_protobuff.BytesUtil;

	/**
	 *
	 * 怪物数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class MonsterData extends RoleData
	{
		public var baGuaType : int;
		public var isJihuo : Boolean = false;
		public var spellId : int = 0;
		protected var _modelID : uint;
		private var _monsterData : Q_monster;
		/** 远离视野是否可见 **/
		public var needInViewDist:Boolean;

		/**模版ID**/
		public function get modelID() : uint
		{
			return _modelID;
		}

		public function set modelID(value : uint) : void
		{
			_modelID = value;
		}
		/**怪物颜色类别 (攻击色怪 1)(防御色怪2)(暴击色怪3)闪避色怪(4)(血厚色怪5)(金钱色怪6)*/
		public var colorList : Array = [];
		/**攻击怪物方式 */
		public var atkType : int = -1;
		public var immuneDeadBeat : Boolean = false;
		public var ownerName : String = "";

		public function MonsterData(type : int) : void
		{
			super(type);
		}

		public function get monsterData() : Q_monster
		{
			if (!_monsterData)
				_monsterData = MonsterDataManager.getData(_modelID);
			return _monsterData;
		}

		public function get farDistance() : int
		{
//			if (monsterData && monsterData.npc)
//				return monsterData.npc.farDistance;
			return 300;
		}

		override public function get fixDirection() : Boolean
		{
			if (monsterData)
				return monsterData.q_is_direction_fixed;
			return false;
		}

		/**
		 * 普通怪
		 * @return
		 *
		 */
		public function get isNormal() : Boolean
		{
			if (monsterData)
				return monsterData.q_monster_type == MonsterType.NORMAL;
			return false;
		}

		/**
		 * 精英怪
		 * @return
		 *
		 */
		public function get isElite() : Boolean
		{
			if (monsterData)
				return monsterData.q_monster_type == MonsterType.ELITE;
			return false;
		}

		/**
		 * Boss怪
		 * @return
		 *
		 */
		public function get isBoss() : Boolean
		{
			if (monsterData)
				return monsterData.q_monster_type == MonsterType.BOSS;
			return false;
		}

		public function get dialog() : String
		{
//			if (monsterData && monsterData.npc)
//				return BytesUtil.bytes2UTF(monsterData.npc.dialog);
			return "";
		}
	}
}
