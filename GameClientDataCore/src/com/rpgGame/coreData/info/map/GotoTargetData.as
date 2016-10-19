package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.role.BaseEntityData;

	/**
	 * 走向目标数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-02 下午3:05:12
	 */
	public class GotoTargetData
	{
		private var _targetMapId : uint = 0;
		private var _targetX : int = 0;
		private var _targetY : int = 0;
		private var _targetRoleData : BaseEntityData = null;

		public function GotoTargetData()
		{
		}

		public function setData(targetMapId : uint = 0, targetX : int = 0, targetY : int = 0, targetRoleData : BaseEntityData = null) : void
		{
			_targetMapId = targetMapId;
			_targetX = targetX;
			_targetY = targetY;
			_targetRoleData = targetRoleData;
		}

		public function get targetMapId() : uint
		{
			return _targetMapId;
		}

		public function get targetX() : int
		{
			return _targetX;
		}

		public function get targetY() : int
		{
			return _targetY;
		}

		public function get targetRoleData() : BaseEntityData
		{
			return _targetRoleData;
		}
	}
}
