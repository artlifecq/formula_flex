package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	
	import app.message.MonsterDataProto;
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
		private var _monsterDataProto : MonsterDataProto;
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

		public function get monsterDataProto() : MonsterDataProto
		{
			if (!_monsterDataProto)
				_monsterDataProto = MonsterDataManager.getData(_modelID);
			return _monsterDataProto;
		}

		public function get farDistance() : int
		{
			if (monsterDataProto && monsterDataProto.npc)
				return monsterDataProto.npc.farDistance;
			return 300;
		}

		override public function get fixDirection() : Boolean
		{
			if (monsterDataProto)
				return monsterDataProto.fixDirection;
			return false;
		}

		/**
		 * 普通怪
		 * @return
		 *
		 */
		public function get isNormal() : Boolean
		{
			if (monsterDataProto)
				return monsterDataProto.monsterType == MonsterType.NORMAL;
			return false;
		}

		/**
		 * 精英怪
		 * @return
		 *
		 */
		public function get isElite() : Boolean
		{
			if (monsterDataProto)
				return monsterDataProto.monsterType == MonsterType.ELITE;
			return false;
		}

		/**
		 * Boss怪
		 * @return
		 *
		 */
		public function get isBoss() : Boolean
		{
			if (monsterDataProto)
				return monsterDataProto.monsterType == MonsterType.BOSS;
			return false;
		}

		public function get dialog() : String
		{
			if (monsterDataProto && monsterDataProto.npc)
				return BytesUtil.bytes2UTF(monsterDataProto.npc.dialog);
			return "";
		}
	}
}
