package com.rpgGame.coreData.role
{
	

	/**
	 *
	 * 基础实体数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class BaseEntityData
	{
		private var _id : int = 0;
		/** 名字 */
		public var name : String = "";

		private var _x : Number = 0;
		private var _y : Number = 0;

		/**
		 * 所属国家，怪物也有，如国战的圣兽
		 */
		public var countryId : int;

		public function BaseEntityData()
		{
		}

		/** 坐标y */
		public function get y():Number
		{
			return _y;
		}

		/**
		 * @private
		 */
		public function set y(value:Number):void
		{
			_y = value;
		}

		/** 坐标x */
		public function get x():Number
		{
			return _x;
		}

		/**
		 * @private
		 */
		public function set x(value:Number):void
		{
			_x = value;
		}

		/**
		 * 标识id (也是场景唯一标识符ID)
		 * @return
		 *
		 */
		public function get id() : int
		{
			return _id;
		}

		/**
		 * @private
		 */
		public function set id(value : int) : void
		{
			_id = value;
		}
	}
}
