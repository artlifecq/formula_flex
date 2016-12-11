package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.info.fight.skill.ActiveSpellList;
	import com.rpgGame.netData.map.bean.MonsterInfo;
	import com.rpgGame.netData.map.bean.NpcInfo;
	
	import flash.geom.Point;

	/**
	 *
	 * 角色数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class RoleData extends BaseEntityData
	{
		/**
		 * 默认基础行走动作速度
		 */
		public static const DEFAULT_BASE_WALK_ACTION_SPEED : int = 400;

		private var _type : int;
		/**
		 * 换装信息
		 */
		public var avatarInfo : AvatarInfo;
		/**
		 * 全部属性=基础属性+可被洗属性
		 */
		public var totalStat : SpriteStat;
		/**
		 * 被分配属性,可以被洗掉
		 */
//		public var spriteStat : SpriteStat;

		/**总共获得的属性点 */
//		public var totalAddSpriteStatPoint : int;

		/**
		 * 额外获得的属性点(不包含升级涨的属性点)
		 */
//		public var obtainSpriteStatPoint : int;

		/** 被使用的属性点 (未使用的属性点＝升级获得的属性点+额外获得的属性点-被使用的属性点) */
//		public var usedSpriteStatPoint : int;

		/**
		 * 当前血量
		 */
//		public var hp : int;
		/**
		 * 当前魔量
		 */
//		public var mp : int;
		/**
		 * 等级
		 */
//		public var level : int = 1;

		/** 是否在镖车上 **/
		public var isInBiao : Boolean;
		/** 乘坐的战车的拥有者的人的id,0表示没有乘车 **/
		public var zhanCheOwnerID : Number = 0;

		/**
		 * 角色半径 
		 */		
		public var bodyRadius : int = 0;
		/**
		 * 战斗力
		 */
		public var fightingAmount : Number;
		/**
		 * 基础行走动作速度
		 */
		public var baseWalkActionSpeed : int = DEFAULT_BASE_WALK_ACTION_SPEED;

		/**
		 * 尺寸倍率
		 */
		public var sizeScale : Number = 1;
		/**
		 * 方向
		 */
		public var direction : int = 0;
		/**
		 *  
		 */		
		private var _fixDirection : Boolean;
		/**
		 * 拥有者ID
		 */
		public var ownerId : Number = 0;

		/** 所有学习过的技能数据 */
		public var spellList : ActiveSpellList;
		/** buff列表 **/
		public var buffList : Vector.<BuffInfo>;
		/** 坐骑槽数 **/
		public var mountSlotCount : int = 0;

		/**
		 *
		 * @param type 角色类型
		 *
		 */
		public function RoleData(type : int)
		{
			_type = type;
			_fixDirection = false;
			avatarInfo = new AvatarInfo();
			totalStat = new SpriteStat();
//			spriteStat = new SpriteStat();
		}

		/**
		 * 角色类型
		 * @return
		 *
		 */
		public function get type() : int
		{
			return _type;
		}

		public function get fixDirection() : Boolean
		{
			return _fixDirection;
		}

		public function set fixDirection(value : Boolean) : void
		{
			_fixDirection = value;
		}

		public function getActiveSpells() : Array
		{
			return spellList.getSpellList();
		}
		/**
		 * 一般通用的属性 
		 * @param data
		 * @param pos
		 * 
		 */
		public static function readGeneric(data : RoleData, pos:Point) : void
		{
			data.x = pos.x;
			data.y = -pos.y;
		}
		
		public static function readMonster(data : RoleData, info : MonsterInfo):void
		{
			data.totalStat.level = info.level;
			
			data.totalStat.hp = info.hp;
			data.totalStat.life = info.maxHp;
//			data.mp = info;
//			data.totalStat.mana = ;
			
//			data.buffList = info.buffs;
			readGeneric(data,new Point(info.position.x,info.position.y));
		}
		
		public static function readNpc(data : RoleData, info : NpcInfo):void
		{
//			data.level = info.level;
			
//			data.hp = info.hp;
			//			data.totalStat.life = info.;
			//			data.mp = info.;
			//			data.totalStat.mana = ;
			
//			data.buffList = info.buffs;
			readGeneric(data,new Point(info.x,info.y));
		}
	}
}
