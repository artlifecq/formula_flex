package com.editor.data
{

	/**
	 *
	 * 角色数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class RoleData
	{
		/**
		 * 默认基础行走动作速度
		 */
		public static const DEFAULT_BASE_WALK_ACTION_SPEED : int = 400;

		private var _id : Number = 0;
		/** 名字 */
		public var name : String = "";
		/**
		 * 换装信息
		 */
		public var avatarInfo : AvatarInfo;

		/** 坐标x */
		public var x : Number = 0;
		/** 坐标y */
		public var y : Number = 0;
		/**
		 * 尺寸倍率
		 */
		public var sizeScale : Number = 1;
		public var moveSpeed : int = 0;
		public var hp : int = 0;

		/**
		 * 基础行走动作速度
		 */
		public var baseWalkActionSpeed : int = DEFAULT_BASE_WALK_ACTION_SPEED;

		/**
		 *
		 * @param type 角色类型
		 *
		 */
		public function RoleData()
		{
			avatarInfo = new AvatarInfo();
		}

		/**
		 * 标识id (也是场景唯一标识符ID)
		 * @return
		 *
		 */
		public function get id() : Number
		{
			return _id;
		}

		/**
		 * @private
		 */
		public function set id(value : Number) : void
		{
			_id = value;
		}

		protected var _avatarResources : Number = -1; //换装资源(衣服和武器直接取对应的_xxRes,其他需要判断_xxRes是否为0，为0则没有换装资源，不为0则使用换装资源)

		/**
		 * 换装资源编号
		 */
		public function get avatarResources() : Number
		{
			return _avatarResources;
		}

		/**
		 * 换装规则：衣服和武器编号从0开始,其他为0表示没有换装资源;当英雄有神兵(superWeaponRes>0)时,不加载武器资源
		 */
		public function set avatarResources(value : Number) : void
		{
			_avatarResources = value;
		}
	}
}
