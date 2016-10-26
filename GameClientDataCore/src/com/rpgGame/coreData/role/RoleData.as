package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.info.fight.skill.ActiveSpellList;

	import org.game.netCore.net.ByteBuffer;

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
		public var spriteStat : SpriteStat;

		/**总共获得的属性点 */
		public var totalAddSpriteStatPoint : int;

		/**
		 * 额外获得的属性点(不包含升级涨的属性点)
		 */
		public var obtainSpriteStatPoint : int;

		/** 被使用的属性点 (未使用的属性点＝升级获得的属性点+额外获得的属性点-被使用的属性点) */
		public var usedSpriteStatPoint : int;

		/**
		 * 当前血量
		 */
		public var hp : int;
		/**
		 * 当前魔量
		 */
		public var mp : int;
		/**
		 * 等级
		 */
		public var level : int = 1;

		/** 是否在镖车上 **/
		public var isInBiao : Boolean;
		/** 乘坐的战车的拥有者的人的id,0表示没有乘车 **/
		public var zhanCheOwnerID : Number = 0;

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
			spriteStat = new SpriteStat();
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

		public static function readGeneric(data : RoleData, buffer : ByteBuffer) : void
		{
			data.x = buffer.readVarint32();
			data.y = buffer.readVarint32();
			data.hp = buffer.readVarint64();
			data.totalStat.life = buffer.readVarint64();
			data.mp = buffer.readVarint64();
			data.totalStat.mana = buffer.readVarint64();

			data.buffList = new Vector.<BuffInfo>();
			while (buffer.bytesAvailable > 0)
			{
				var buffInfo : BuffInfo = new BuffInfo(data.id);
				buffInfo.cfgId = buffer.readVarint32();
				buffInfo.curtStackCount = buffer.readVarint32();
				buffInfo.disappearTime = buffer.readVarint64();
				data.buffList.push(buffInfo);
			}
		}

//		/**
//		 * 全部属性=基础属性+可被洗属性
//		 */
//		public var totalStat : SpriteStat;
//		/**
//		 * 被分配属性,可以被洗掉
//		 */
//		public var spriteStat : SpriteStat;
//		
//		/**总共获得的属性点 */
//		public var totalAddSpriteStatPoint : int;
//		
//		/**
//		 * 额外获得的属性点(不包含升级涨的属性点)
//		 */
//		public var obtainSpriteStatPoint : int;
//		
//		/** 被使用的属性点 (未使用的属性点＝升级获得的属性点+额外获得的属性点-被使用的属性点) */
//		public var usedSpriteStatPoint : int;
//
//		public function setAddSpriteStateModelObj(proto:AddSpriteStatModuleObjProto):void
//		{
//			
//		}

	}
}
