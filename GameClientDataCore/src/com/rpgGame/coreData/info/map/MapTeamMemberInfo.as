package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.role.BaseEntityData;

	/**
	 *
	 * 地图队员信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class MapTeamMemberInfo extends BaseEntityData
	{
		public var level : int;
		public var isOnlin : Boolean;
		public var job : int;
		public function MapTeamMemberInfo()
		{
		}
	}
}
