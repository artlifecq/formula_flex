package com.rpgGame.coreData.info
{
	import com.rpgGame.coreData.role.RoleData;

	/**
	 *
	 * 查询角色数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-10 上午10:05:12
	 *
	 */
	public class SearchRoleData
	{
		/**
		 * 查询id
		 */
		public var searchId : Number = 0;
		/**
		 * 查询类型
		 */
		public var searchType : int = 0;
		/**
		 * 目标角色数据
		 */
		public var targetData : RoleData = null;

		public function SearchRoleData()
		{
		}
	}
}
